/*
 * Audacity: A Digital Audio Editor
 */
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import Muse.Ui
import Muse.UiComponents

import Audacity.ProjectScene

Rectangle {
    id: effectsPanel

    property int selectedTrackIndex: -1

    color: ui.theme.backgroundPrimaryColor

    onSelectedTrackIndexChanged: {
        trackEffectsLoader.sourceComponent = trackEffectsComp
        const selectedTrackItem = view.itemAtIndex(selectedTrackIndex)
        trackEffectsLoader.item.trackName = selectedTrackItem.item.title
    }

    Component {
        id: trackEffectsComp
        ColumnLayout {
            id: trackEffects
            spacing: 0
            property alias trackName: trackEffectsHeader.trackName
            Layout.fillWidth: true

            SeparatorLine {
                id: trackEffectsTop
                width: effectsSectionWidth
            }

            RowLayout {
                id: trackEffectsHeader
                property alias trackName: trackNameLabel.text

                spacing: 12

                Layout.fillWidth: true
                Layout.preferredHeight: 40

                FlatButton {
                    id: trackEffectsPowerButton

                    Layout.margins: 4
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

                    width: 28
                    height: width

                    icon: IconCode.BYPASS
                    iconFont: ui.theme.toolbarIconsFont

                    accentButton: true

                    onClicked: {
                        accentButton = !accentButton
                    }
                }

                StyledTextLabel {
                    id: trackNameLabel
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    horizontalAlignment: Text.AlignLeft
                }
            }

            SeparatorLine {
                id: trackEffectsBottom
                width: effectsSectionWidth
            }

            // TODO: add StyledListView for effects of current track
        }
    }

    Loader {
        id: trackEffectsLoader
    }
}
