// Flutter imports:

import 'package:demo_video_conference/const.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

// Project imports:

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;

  const VideoConferencePage({
    super.key,
    required this.conferenceID,
  });

  @override
  State<StatefulWidget> createState() => VideoConferencePageState();
}

class VideoConferencePageState extends State<VideoConferencePage> {
  final controller = ZegoUIKitPrebuiltVideoConferenceController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
          appID: 1080864601,
          appSign:
              "9e3ba169e7b61d512d13b9d6fe63efceac69545a3aec980e446abfe38c8b4534",
          conferenceID: widget.conferenceID,
          userID: localUserID,
          userName: "user_$localUserID",
          config: ZegoUIKitPrebuiltVideoConferenceConfig(
            turnOnCameraWhenJoining: false,
            audioVideoViewConfig:
                ZegoPrebuiltAudioVideoViewConfig(showCameraStateOnView: false),
            topMenuBarConfig: ZegoTopMenuBarConfig(
              buttons: [ZegoMenuBarButtonName.showMemberListButton],
            ),
            bottomMenuBarConfig: ZegoBottomMenuBarConfig(
              buttons: [
                ZegoMenuBarButtonName.toggleMicrophoneButton,
                ZegoMenuBarButtonName.leaveButton,
                ZegoMenuBarButtonName.switchAudioOutputButton,
              ],
            ),
            avatarBuilder: (BuildContext context, Size size,
                ZegoUIKitUser? user, Map extraInfo) {
              return user != null
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://media.istockphoto.com/id/1302783988/vector/the-embarrassed-man.jpg?s=612x612&w=0&k=20&c=bIPvdEHEGAP0RnSH5n45dvHfsqvZKv8NwG5qjRWCNTg=',
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          )),
    );
  }
}
