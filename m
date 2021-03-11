Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD9337898
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:58:46 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNi1-0004Bs-NP
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN2E-0003HP-FW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:15:34 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN2C-0001Qf-7D
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:15:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j6so10339977plx.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zq2ofas2Lo2xsLPCq2xe7AqeSOMcLrLc5dBPspvq3x0=;
 b=Y13KqT0C/loY+f56a1wkE6eCS9dqCmTCKUOPDNoEEOJAoP7w48tNlT2pzDq2TGo0KG
 NTsxL+yG0rI/gffwj0xT0rXBej3gbzIWOAWiwcMsWxT8G80OUp21I/k3RGLeiYUy1cQL
 zkr502TNWdeBqdgKhBVJGQCSCTqBbXfmTIM4QvLxUe/3M/FubGUzr8yFDTObgSJeki/k
 wK/ZIYJk3dz8CBE04/x/vPxm9Z1ogZ/DQ6i8um3JWvwV3PSNjybDP44WJ3wzkleNf60n
 wMZsGUS5iRjnJHuPZ49hvFYTiERQw9ou0UtemDOJySnAYRaE69p38wPpyYzr7xqbpQv9
 shtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zq2ofas2Lo2xsLPCq2xe7AqeSOMcLrLc5dBPspvq3x0=;
 b=czi5wbVk9T8crjRPKWLeO5tmHb9kFtirJNyHGk+pfiO65o/CZzQh9eNizykhZBWKxD
 p8iuJtvIe9QmyNee3ZC6oq/MURHtW/6o7pNr7NN6Y2ZEAk1BuILvmKhGtplLbEqIbA/D
 APJBauyALsZi1+MR8jQThsBkfj0abA/crcFAD6wqagVUGH4JXyGEZUiFCJ8oFs0KnNWh
 mya92PZgJFgRXktw7ehrL9B7BLLtOmsAzQ/KgsyyTJ/dI45UfnSd5DmBAPXWA66eW80y
 rZc+L3MCL+5Lr4WRfrkV1aNy16jpIaJC9MXfCHC6aYLb9iaKOh97ReuRhz3VApeFH0CI
 R3vQ==
X-Gm-Message-State: AOAM532A6OmoW3lP+zjfVcUfT4e/OiH/g6C9EegqkRNDoH/ro8y4YoHs
 dBGjnkbeHbQx7z3KUzX9Zk8XI15WfNgOyg==
X-Google-Smtp-Source: ABdhPJy6xHdaW6CWfMhSksoIThqoAcSJpqWnCVNlKcmYkw6WWK5DnC9DGBK5s5D6YciCHR4vyOi8wA==
X-Received: by 2002:a17:90a:bb95:: with SMTP id
 v21mr9136391pjr.30.1615475729929; 
 Thu, 11 Mar 2021 07:15:29 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:a00f:6b19:eaae:a18e])
 by smtp.gmail.com with ESMTPSA id j3sm2716732pjf.36.2021.03.11.07.15.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:15:29 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 2/3] coreaudio: Extract device operations
Date: Fri, 12 Mar 2021 00:15:11 +0900
Message-Id: <20210311151512.22096-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210311151512.22096-1-akihiko.odaki@gmail.com>
References: <20210311151512.22096-1-akihiko.odaki@gmail.com>
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

This change prepare to support dynamic device changes, which requires to
perform device initialization/deinitialization multiple times.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 137 +++++++++++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 57 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index c5f0b615d64..ab43cdcac19 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -36,6 +36,8 @@ typedef struct coreaudioVoiceOut {
     HWVoiceOut hw;
     pthread_mutex_t mutex;
     AudioDeviceID outputDeviceID;
+    int frameSizeSetting;
+    uint32_t bufferCount;
     UInt32 audioDevicePropertyBufferFrameSize;
     AudioStreamBasicDescription outputStreamBasicDescription;
     AudioDeviceIOProcID ioprocid;
@@ -253,6 +255,9 @@ static void GCC_FMT_ATTR (3, 4) coreaudio_logerr2 (
     coreaudio_logstatus (status);
 }
 
+#define coreaudio_playback_logerr(status, ...) \
+    coreaudio_logerr2(status, "playback", __VA_ARGS__)
+
 static inline UInt32 isPlaying (AudioDeviceID outputDeviceID)
 {
     OSStatus status;
@@ -368,126 +373,100 @@ static OSStatus audioDeviceIOProc(
     return 0;
 }
 
-static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
-                              void *drv_opaque)
+static OSStatus init_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
-    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
-    int err;
-    const char *typ = "playback";
     AudioValueRange frameRange;
-    Audiodev *dev = drv_opaque;
-    AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
-    int frames;
-    struct audsettings obt_as;
-
-    /* create mutex */
-    err = pthread_mutex_init(&core->mutex, NULL);
-    if (err) {
-        dolog("Could not create mutex\nReason: %s\n", strerror (err));
-        return -1;
-    }
-
-    obt_as = *as;
-    as = &obt_as;
-    as->fmt = AUDIO_FORMAT_F32;
-    audio_pcm_init_info (&hw->info, as);
 
     status = coreaudio_get_voice(&core->outputDeviceID);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get default output Device\n");
-        return -1;
+        coreaudio_playback_logerr (status,
+                                   "Could not get default output Device\n");
+        return status;
     }
     if (core->outputDeviceID == kAudioDeviceUnknown) {
-        dolog ("Could not initialize %s - Unknown Audiodevice\n", typ);
-        return -1;
+        dolog ("Could not initialize playback - Unknown Audiodevice\n");
+        return status;
     }
 
     /* get minimum and maximum buffer frame sizes */
     status = coreaudio_get_framesizerange(core->outputDeviceID,
                                           &frameRange);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get device buffer frame range\n");
-        return -1;
+        coreaudio_playback_logerr (status,
+                                    "Could not get device buffer frame range\n");
+        return status;
     }
 
-    frames = audio_buffer_frames(
-        qapi_AudiodevCoreaudioPerDirectionOptions_base(cpdo), as, 11610);
-    if (frameRange.mMinimum > frames) {
+    if (frameRange.mMinimum > core->frameSizeSetting) {
         core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMinimum;
         dolog ("warning: Upsizing Buffer Frames to %f\n", frameRange.mMinimum);
-    } else if (frameRange.mMaximum < frames) {
+    } else if (frameRange.mMaximum < core->frameSizeSetting) {
         core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMaximum;
         dolog ("warning: Downsizing Buffer Frames to %f\n", frameRange.mMaximum);
     } else {
-        core->audioDevicePropertyBufferFrameSize = frames;
+        core->audioDevicePropertyBufferFrameSize = core->frameSizeSetting;
     }
 
     /* set Buffer Frame Size */
     status = coreaudio_set_framesize(core->outputDeviceID,
                                      &core->audioDevicePropertyBufferFrameSize);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not set device buffer frame size %" PRIu32 "\n",
-                           (uint32_t)core->audioDevicePropertyBufferFrameSize);
-        return -1;
+        coreaudio_playback_logerr (status,
+                                    "Could not set device buffer frame size %" PRIu32 "\n",
+                                    (uint32_t)core->audioDevicePropertyBufferFrameSize);
+        return status;
     }
 
     /* get Buffer Frame Size */
     status = coreaudio_get_framesize(core->outputDeviceID,
                                      &core->audioDevicePropertyBufferFrameSize);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get device buffer frame size\n");
-        return -1;
+        coreaudio_playback_logerr (status,
+                                    "Could not get device buffer frame size\n");
+        return status;
     }
-    hw->samples = (cpdo->has_buffer_count ? cpdo->buffer_count : 4) *
-        core->audioDevicePropertyBufferFrameSize;
+    core->hw.samples = core->bufferCount * core->audioDevicePropertyBufferFrameSize;
 
     /* get StreamFormat */
     status = coreaudio_get_streamformat(core->outputDeviceID,
                                         &core->outputStreamBasicDescription);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get Device Stream properties\n");
+        coreaudio_playback_logerr (status,
+                                    "Could not get Device Stream properties\n");
         core->outputDeviceID = kAudioDeviceUnknown;
-        return -1;
+        return status;
     }
 
     /* set Samplerate */
-    core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
-
     status = coreaudio_set_streamformat(core->outputDeviceID,
                                         &core->outputStreamBasicDescription);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ, "Could not set samplerate %d\n",
-                           as->freq);
+        coreaudio_playback_logerr (status,
+                                   "Could not set samplerate %lf\n",
+                                   core->outputStreamBasicDescription.mSampleRate);
         core->outputDeviceID = kAudioDeviceUnknown;
-        return -1;
+        return status;
     }
 
     /* set Callback */
     core->ioprocid = NULL;
     status = AudioDeviceCreateIOProcID(core->outputDeviceID,
                                        audioDeviceIOProc,
-                                       hw,
+                                       &core->hw,
                                        &core->ioprocid);
     if (status != kAudioHardwareNoError || core->ioprocid == NULL) {
-        coreaudio_logerr2 (status, typ, "Could not set IOProc\n");
+        coreaudio_playback_logerr (status, "Could not set IOProc\n");
         core->outputDeviceID = kAudioDeviceUnknown;
-        return -1;
+        return status;
     }
 
     return 0;
 }
 
-static void coreaudio_fini_out (HWVoiceOut *hw)
+static void fini_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
-    int err;
-    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
     /* stop playback */
     if (isPlaying(core->outputDeviceID)) {
@@ -504,6 +483,50 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
         coreaudio_logerr(status, "Could not remove IOProc\n");
     }
     core->outputDeviceID = kAudioDeviceUnknown;
+}
+
+static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
+                              void *drv_opaque)
+{
+    OSStatus status;
+    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+    int err;
+    Audiodev *dev = drv_opaque;
+    AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
+    struct audsettings obt_as;
+
+    /* create mutex */
+    err = pthread_mutex_init(&core->mutex, NULL);
+    if (err) {
+        dolog("Could not create mutex\nReason: %s\n", strerror (err));
+        return -1;
+    }
+
+    obt_as = *as;
+    as = &obt_as;
+    as->fmt = AUDIO_FORMAT_F32;
+    audio_pcm_init_info (&hw->info, as);
+
+    core->frameSizeSetting = audio_buffer_frames(
+        qapi_AudiodevCoreaudioPerDirectionOptions_base(cpdo), as, 11610);
+
+    core->bufferCount = cpdo->has_buffer_count ? cpdo->buffer_count : 4;
+    core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
+
+    if (init_out_device(core)) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static void coreaudio_fini_out (HWVoiceOut *hw)
+{
+    OSStatus status;
+    int err;
+    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+
+    fini_out_device(core);
 
     /* destroy mutex */
     err = pthread_mutex_destroy(&core->mutex);
-- 
2.24.3 (Apple Git-128)


