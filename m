Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34324DAA09
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 06:45:56 +0100 (CET)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMTr-0007jI-Bu
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 01:45:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUMNV-0006id-Os
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:39:22 -0400
Received: from [2607:f8b0:4864:20::42e] (port=36359
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUMNR-0003cY-E1
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:39:18 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z16so2508737pfh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/COp+mU9lQatQbhqH0jkfJ6GiDvAS7Z+UMBTSFqsepQ=;
 b=Zi/wte5L6ioUUF8CtGxrvHYheCGYhLHvGzVEfbK75ozrFvo4g39VUwLVkoAkD5RG6n
 4PGhdH0MQSZJzW6fwpoQ7eO/OGqOSbNv27w86BDzWJg209QxlSI9Fda1L5Xovx0dePqt
 Z6IbOEDftQnPcm2pw1ygcdajzsxpgxdA1FUdGycvj5r8Uknk4iY0xRdXEKcxgEbOB6d0
 qnxkdENNXbW5eiYOwWf63aZV9q8SAoWla5CtJEYKYlNiEOBpOdF6hznew23DP22WrD6Z
 +RGLQbwJx7q46bsLHYz1QhDnles8+7O6Ctw5+K4f5V3OoiRqekeOqODn7dDhKVUs6gEo
 9cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/COp+mU9lQatQbhqH0jkfJ6GiDvAS7Z+UMBTSFqsepQ=;
 b=mbOxrlEQ8e3xPTD3xDbkYGbvnUD2rSQ7cBlJR49sdvAQq047D4Pa9K+XcbaEmpdGah
 kYPxPsG3yshPWQWUmVWB9djmBx4Idek0O5GsQt12X6IOn8gnmyD5TLWjbgx5NPv7mB6g
 8LxG7ZZupgaivpBRk/EhuBX1dmQ8El9F+bxdyFX1oj321yFUnRqtxFDd0gUA7BPlUhI5
 QiXXJOxp5ANWLJjv2L3CQGKnRDdopSlsezT1F1wPkvaVn1iS0t5oz7R3Ph2rT5lmSQZL
 C+eb6FCEeTN2l0MTGywxHGTDIH8WzUU4WKPB5RN/v3YxunFtmwS5AcD00XCOhwnosbo9
 EV7Q==
X-Gm-Message-State: AOAM531Ac9mizk8u/NddZriFVIb6yDxi4k4s95odu42M8JWDBaaccrXx
 O7bnlu5LOTuML6jUZmCI3iyRxug2pt8=
X-Google-Smtp-Source: ABdhPJyyePVS2z5thZgHmGeTg13GIMpJZNysfKCznF1dlUzKTmlydsp1BOu7Q9f1AzeLSuVZp+oeeA==
X-Received: by 2002:a05:6a00:198c:b0:4f7:7e0f:bfc2 with SMTP id
 d12-20020a056a00198c00b004f77e0fbfc2mr28892266pfl.44.1647409154868; 
 Tue, 15 Mar 2022 22:39:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:dd81:833a:94c3:358a])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a637011000000b0037d5eac87e3sm1119314pgc.18.2022.03.15.22.39.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 22:39:14 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] coreaudio: Commit the result of init in the end
Date: Wed, 16 Mar 2022 14:39:08 +0900
Message-Id: <20220316053908.15695-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

init_out_device may only commit some part of the result and leave the
state inconsistent when it encounters an error. Commit the result in
the end of the function so that it commits the result iif it sees no
error.

With this change, handle_voice_change can rely on core->outputDeviceID
to know whether the output device is initialized after calling
init_out_device.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.m | 49 ++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/audio/coreaudio.m b/audio/coreaudio.m
index 3186b68474d..127a368ac23 100644
--- a/audio/coreaudio.m
+++ b/audio/coreaudio.m
@@ -360,7 +360,10 @@ static OSStatus audioDeviceIOProc(
 static OSStatus init_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
+    AudioDeviceID deviceID;
     AudioValueRange frameRange;
+    UInt32 audioDevicePropertyBufferFrameSize;
+    AudioDeviceIOProcID ioprocid;
 
     AudioStreamBasicDescription streamBasicDescription = {
         .mBitsPerChannel = core->hw.info.bits,
@@ -373,20 +376,19 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
         .mSampleRate = core->hw.info.freq
     };
 
-    status = coreaudio_get_voice(&core->outputDeviceID);
+    status = coreaudio_get_voice(&deviceID);
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                    "Could not get default output Device\n");
         return status;
     }
-    if (core->outputDeviceID == kAudioDeviceUnknown) {
+    if (deviceID == kAudioDeviceUnknown) {
         dolog ("Could not initialize playback - Unknown Audiodevice\n");
         return status;
     }
 
     /* get minimum and maximum buffer frame sizes */
-    status = coreaudio_get_framesizerange(core->outputDeviceID,
-                                          &frameRange);
+    status = coreaudio_get_framesizerange(deviceID, &frameRange);
     if (status == kAudioHardwareBadObjectError) {
         return 0;
     }
@@ -397,31 +399,31 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     }
 
     if (frameRange.mMinimum > core->frameSizeSetting) {
-        core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMinimum;
+        audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMinimum;
         dolog ("warning: Upsizing Buffer Frames to %f\n", frameRange.mMinimum);
     } else if (frameRange.mMaximum < core->frameSizeSetting) {
-        core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMaximum;
+        audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMaximum;
         dolog ("warning: Downsizing Buffer Frames to %f\n", frameRange.mMaximum);
     } else {
-        core->audioDevicePropertyBufferFrameSize = core->frameSizeSetting;
+        audioDevicePropertyBufferFrameSize = core->frameSizeSetting;
     }
 
     /* set Buffer Frame Size */
-    status = coreaudio_set_framesize(core->outputDeviceID,
-                                     &core->audioDevicePropertyBufferFrameSize);
+    status = coreaudio_set_framesize(deviceID,
+                                     &audioDevicePropertyBufferFrameSize);
     if (status == kAudioHardwareBadObjectError) {
         return 0;
     }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                     "Could not set device buffer frame size %" PRIu32 "\n",
-                                    (uint32_t)core->audioDevicePropertyBufferFrameSize);
+                                    (uint32_t)audioDevicePropertyBufferFrameSize);
         return status;
     }
 
     /* get Buffer Frame Size */
-    status = coreaudio_get_framesize(core->outputDeviceID,
-                                     &core->audioDevicePropertyBufferFrameSize);
+    status = coreaudio_get_framesize(deviceID,
+                                     &audioDevicePropertyBufferFrameSize);
     if (status == kAudioHardwareBadObjectError) {
         return 0;
     }
@@ -430,11 +432,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
                                     "Could not get device buffer frame size\n");
         return status;
     }
-    core->hw.samples = core->bufferCount * core->audioDevicePropertyBufferFrameSize;
 
     /* set Samplerate */
-    status = coreaudio_set_streamformat(core->outputDeviceID,
-                                        &streamBasicDescription);
+    status = coreaudio_set_streamformat(deviceID, &streamBasicDescription);
     if (status == kAudioHardwareBadObjectError) {
         return 0;
     }
@@ -442,7 +442,6 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
         coreaudio_playback_logerr (status,
                                    "Could not set samplerate %lf\n",
                                    streamBasicDescription.mSampleRate);
-        core->outputDeviceID = kAudioDeviceUnknown;
         return status;
     }
 
@@ -456,20 +455,24 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
      * Therefore, the specified callback must be designed to avoid a deadlock
      * with the callers of AudioObjectGetPropertyData.
      */
-    core->ioprocid = NULL;
-    status = AudioDeviceCreateIOProcID(core->outputDeviceID,
+    ioprocid = NULL;
+    status = AudioDeviceCreateIOProcID(deviceID,
                                        audioDeviceIOProc,
                                        &core->hw,
-                                       &core->ioprocid);
+                                       &ioprocid);
     if (status == kAudioHardwareBadDeviceError) {
         return 0;
     }
-    if (status != kAudioHardwareNoError || core->ioprocid == NULL) {
+    if (status != kAudioHardwareNoError || ioprocid == NULL) {
         coreaudio_playback_logerr (status, "Could not set IOProc\n");
-        core->outputDeviceID = kAudioDeviceUnknown;
         return status;
     }
 
+    core->outputDeviceID = deviceID;
+    core->audioDevicePropertyBufferFrameSize = audioDevicePropertyBufferFrameSize;
+    core->hw.samples = core->bufferCount * core->audioDevicePropertyBufferFrameSize;
+    core->ioprocid = ioprocid;
+
     return 0;
 }
 
@@ -553,7 +556,9 @@ static OSStatus handle_voice_change(
         fini_out_device(core);
     }
 
-    if (!init_out_device(core)) {
+    init_out_device(core);
+
+    if (core->outputDeviceID) {
         update_device_playback_state(core);
     }
 
-- 
2.32.0 (Apple Git-132)


