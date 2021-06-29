Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D13B6C9B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 04:42:36 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly3hq-0003SR-Vp
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 22:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ly3gw-0002nZ-7k
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 22:41:38 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ly3gu-0008Vp-Ck
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 22:41:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b5so2540730plg.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 19:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lUoWFS86V9RhnIFGblmTfHSboADrx5kxDl6FLpj2rQ=;
 b=NAN9XMqTqa4Fk35CE+8Q/EXHAWsVWo5d9NDo4ZMiLDavFghP7L90+idenL8o1qVjfo
 YjyqYNFPR35axIpEDUzqexXnKUkaUOPKC6rZCQvwt3iZ+0CyLUo8QWjXVi7wrgRQdlp9
 eCvqJr/8+p4x8egrMAlsxzkvW4OWvrKqwIxMHz1ywRfXEb+aTxhdy8K4EsEtQno7Paza
 9fidvrPtq75kjmrSQOVv93ermHABE/fw9urVTn7C1VKSSQSO1eJSneWNgKRPrNE+CC24
 FuNpJ+xg0KRnvgiSa4PaBZ1AnFNho0GiDa+ory0N2PCI9lcK9f4wSMyxOf77+kuobbwx
 5JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lUoWFS86V9RhnIFGblmTfHSboADrx5kxDl6FLpj2rQ=;
 b=VNEiARXdEuQTRUoNLZrAm2suZF4n/O2PoZ5Tixh1V93TuyL1SkXfegDOcZF6ZLXYMD
 LRUzbuJnjfoWrV2iQcXVaOSeKSN7aYHbiC4lAVR/M+c3VHM47U69xq2SGUmM2wvw0Eyo
 440/0KakAf2r7dxm0j8heRDl+ecpDgNJ+pBGLD3RnaLgUfrPATJfZ1tUGXdSv3kl9xR8
 hr22LnlRu8DmBCk23Eqs+5ww520zrmpFeiWw+aiFy5ZhGzZJ3VZcYzFQ5stbiz1QH9Dd
 u77QsUkPL/lTU03re+fc0ssCMeywKA2lBwcT4+xYwvAkR+/aLaKti97kvTffKSEaMi4l
 Y7kQ==
X-Gm-Message-State: AOAM531sgIvhP7QVk1nj+yZXFSszpcoG/nnJPsN2lfjxzlb5QJTJ0Trc
 J+U7nCMAMre02eiwprBzlU7CrtcYpLibkw==
X-Google-Smtp-Source: ABdhPJwAwP6bhpMLRad6/N4nhKeJ9SFVP5psbQTmuelXFLpPCsvJ/75l7FqIbkjfGoSZ8QQb6BGGhQ==
X-Received: by 2002:a17:90a:db16:: with SMTP id
 g22mr31341513pjv.111.1624934494471; 
 Mon, 28 Jun 2021 19:41:34 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:f905:f19:e2a8:1bb6])
 by smtp.gmail.com with ESMTPSA id m10sm11364310pff.215.2021.06.28.19.41.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Jun 2021 19:41:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] coreaudio: Commit the result of init in the end
Date: Tue, 29 Jun 2021 11:41:26 +0900
Message-Id: <20210629024126.23887-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 audio/coreaudio.c | 47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e507..eb29be71d18 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -356,7 +356,10 @@ static OSStatus audioDeviceIOProc(
 static OSStatus init_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
+    AudioDeviceID deviceID;
     AudioValueRange frameRange;
+    UInt32 audioDevicePropertyBufferFrameSize;
+    AudioDeviceIOProcID ioprocid;
 
     AudioStreamBasicDescription streamBasicDescription = {
         .mBitsPerChannel = core->hw.info.bits,
@@ -369,20 +372,19 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
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
@@ -393,31 +395,31 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
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
@@ -426,11 +428,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
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
@@ -438,7 +438,6 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
         coreaudio_playback_logerr (status,
                                    "Could not set samplerate %lf\n",
                                    streamBasicDescription.mSampleRate);
-        core->outputDeviceID = kAudioDeviceUnknown;
         return status;
     }
 
@@ -452,20 +451,24 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
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
 
@@ -551,7 +554,7 @@ static OSStatus handle_voice_change(
     }
 
     status = init_out_device(core);
-    if (!status) {
+    if (core->outputDeviceID) {
         update_device_playback_state(core);
     }
 
-- 
2.30.1 (Apple Git-130)


