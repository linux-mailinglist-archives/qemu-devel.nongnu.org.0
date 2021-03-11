Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D453378A9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:02:24 +0100 (CET)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNlX-0007TZ-Lj
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN2G-0003N5-Qh
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:15:36 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN2E-0001Sm-J8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:15:36 -0500
Received: by mail-pg1-x52a.google.com with SMTP id t26so13865240pgv.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asBR0bpNmjMs/IsTcbtrudJ5e+yviIyUB7a0tx6uDJA=;
 b=LwBBTPcCWc0y/N23OwOoILpnkSvtMHABW5EvWwRIQ54N9uSs860yGow4nepaXDF3a3
 eTSA3V0iPP8GaYHOfMmW8wfBs29odCfB3x2h7odm7ks0gsupEKtVLsFUA91G1460c5us
 65cttgMb6nlBGwJNNyBZeOr9ec1xS5nhCxe8JTk4w16R07K0NpgirdPsFlRxIf0yP0Mi
 a8dDOTQE0ntwL/TwiVfz+svsTcFdbw1Cau/OCxM8qFv0Dg/T0NYi8Jn+SuSpCkPMCACA
 NBM5k/b1SXLxfYcLIn8DrobMbykBWZi3rN9I6G0yelYP1QybFdcg4m8pyyKPTeY+2VQj
 LF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asBR0bpNmjMs/IsTcbtrudJ5e+yviIyUB7a0tx6uDJA=;
 b=i9Pb1iWUmQNAAqmdP0wsjecbY4L8wxnG1MzfF63dusCNfzz/Kynm12I5me/2AQF58Y
 oKvsLIn8Vo0w60ViF4cRVBP+UsPddUHWgOgRhvik4gFLHsA7CHsaxcG5yNfLMW141sSW
 diw+nmUaswL/Ld4dh4u1Xu3LBJMOegjm2La+3oIuLd732Xldf/0X7RU9pbvQe+n6J3Jp
 W8dYRUGApBRvD1Ggzz5GWvqcpK60y+yoyY6+dFR+vsAl4gIlZ23MGrnu4rQBHuoMPb6r
 8qzzTXgxDM/VY0oOQxayz/vj0IgCXxlLZccwaugbGmaGGpCIoO4BMGIshwwVnHvwKi9e
 1f2g==
X-Gm-Message-State: AOAM531En/9iW6UoxzRMDfkg6MusnIxbdHQxjgmNmRMqF1OX8sC3mdhL
 +KnUJxRioFEpS4mU6nV44MTPmc0QHRKLyA==
X-Google-Smtp-Source: ABdhPJxRqOv2BiiJbcI68U3c1bO43ejh5Cfe8jSF1yK5lHYcUwgCqi4O96za4+SGH60jySvsUC3hIQ==
X-Received: by 2002:a63:c10:: with SMTP id b16mr7932891pgl.326.1615475732927; 
 Thu, 11 Mar 2021 07:15:32 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:a00f:6b19:eaae:a18e])
 by smtp.gmail.com with ESMTPSA id j3sm2716732pjf.36.2021.03.11.07.15.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:15:32 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 3/3] coreaudio: Handle output device change
Date: Fri, 12 Mar 2021 00:15:12 +0900
Message-Id: <20210311151512.22096-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210311151512.22096-1-akihiko.odaki@gmail.com>
References: <20210311151512.22096-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52a.google.com
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

An output device change can occur when plugging or unplugging an
earphone.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 206 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 164 insertions(+), 42 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index ab43cdcac19..578ec9b8b2e 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -41,19 +41,21 @@ typedef struct coreaudioVoiceOut {
     UInt32 audioDevicePropertyBufferFrameSize;
     AudioStreamBasicDescription outputStreamBasicDescription;
     AudioDeviceIOProcID ioprocid;
+    bool enabled;
 } coreaudioVoiceOut;
 
+static const AudioObjectPropertyAddress voice_addr = {
+    kAudioHardwarePropertyDefaultOutputDevice,
+    kAudioObjectPropertyScopeGlobal,
+    kAudioObjectPropertyElementMaster
+};
+
 static OSStatus coreaudio_get_voice(AudioDeviceID *id)
 {
     UInt32 size = sizeof(*id);
-    AudioObjectPropertyAddress addr = {
-        kAudioHardwarePropertyDefaultOutputDevice,
-        kAudioObjectPropertyScopeGlobal,
-        kAudioObjectPropertyElementMaster
-    };
 
     return AudioObjectGetPropertyData(kAudioObjectSystemObject,
-                                      &addr,
+                                      &voice_addr,
                                       0,
                                       NULL,
                                       &size,
@@ -258,18 +260,6 @@ static void GCC_FMT_ATTR (3, 4) coreaudio_logerr2 (
 #define coreaudio_playback_logerr(status, ...) \
     coreaudio_logerr2(status, "playback", __VA_ARGS__)
 
-static inline UInt32 isPlaying (AudioDeviceID outputDeviceID)
-{
-    OSStatus status;
-    UInt32 result = 0;
-    status = coreaudio_get_isrunning(outputDeviceID, &result);
-    if (status != kAudioHardwareNoError) {
-        coreaudio_logerr(status,
-                         "Could not determine whether Device is playing\n");
-    }
-    return result;
-}
-
 static int coreaudio_lock (coreaudioVoiceOut *core, const char *fn_name)
 {
     int err;
@@ -341,6 +331,11 @@ static OSStatus audioDeviceIOProc(
         return 0;
     }
 
+    if (inDevice != core->outputDeviceID) {
+        coreaudio_unlock (core, "audioDeviceIOProc(old device)");
+        return 0;
+    }
+
     frameCount = core->audioDevicePropertyBufferFrameSize;
     pending_frames = hw->pending_emul / hw->info.bytes_per_frame;
 
@@ -392,6 +387,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     /* get minimum and maximum buffer frame sizes */
     status = coreaudio_get_framesizerange(core->outputDeviceID,
                                           &frameRange);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                     "Could not get device buffer frame range\n");
@@ -411,6 +409,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     /* set Buffer Frame Size */
     status = coreaudio_set_framesize(core->outputDeviceID,
                                      &core->audioDevicePropertyBufferFrameSize);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                     "Could not set device buffer frame size %" PRIu32 "\n",
@@ -421,6 +422,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     /* get Buffer Frame Size */
     status = coreaudio_get_framesize(core->outputDeviceID,
                                      &core->audioDevicePropertyBufferFrameSize);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                     "Could not get device buffer frame size\n");
@@ -431,6 +435,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     /* get StreamFormat */
     status = coreaudio_get_streamformat(core->outputDeviceID,
                                         &core->outputStreamBasicDescription);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                     "Could not get Device Stream properties\n");
@@ -441,6 +448,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     /* set Samplerate */
     status = coreaudio_set_streamformat(core->outputDeviceID,
                                         &core->outputStreamBasicDescription);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                    "Could not set samplerate %lf\n",
@@ -455,6 +465,9 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
                                        audioDeviceIOProc,
                                        &core->hw,
                                        &core->ioprocid);
+    if (status == kAudioHardwareBadDeviceError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError || core->ioprocid == NULL) {
         coreaudio_playback_logerr (status, "Could not set IOProc\n");
         core->outputDeviceID = kAudioDeviceUnknown;
@@ -467,24 +480,94 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
 static void fini_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
+    UInt32 isrunning;
 
     /* stop playback */
-    if (isPlaying(core->outputDeviceID)) {
-        status = AudioDeviceStop(core->outputDeviceID, core->ioprocid);
+    status = coreaudio_get_isrunning(core->outputDeviceID, &isrunning);
+    if (status != kAudioHardwareBadObjectError) {
         if (status != kAudioHardwareNoError) {
-            coreaudio_logerr(status, "Could not stop playback\n");
+            coreaudio_logerr(status,
+                             "Could not determine whether Device is playing\n");
+        }
+
+        if (isrunning) {
+            status = AudioDeviceStop(core->outputDeviceID, core->ioprocid);
+            if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
+                coreaudio_logerr(status, "Could not stop playback\n");
+            }
         }
     }
 
     /* remove callback */
     status = AudioDeviceDestroyIOProcID(core->outputDeviceID,
                                         core->ioprocid);
-    if (status != kAudioHardwareNoError) {
+    if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
         coreaudio_logerr(status, "Could not remove IOProc\n");
     }
     core->outputDeviceID = kAudioDeviceUnknown;
 }
 
+static void update_device_playback_state(coreaudioVoiceOut *core)
+{
+    OSStatus status;
+    UInt32 isrunning;
+
+    status = coreaudio_get_isrunning(core->outputDeviceID, &isrunning);
+    if (status != kAudioHardwareNoError) {
+        if (status != kAudioHardwareBadObjectError) {
+            coreaudio_logerr(status,
+                             "Could not determine whether Device is playing\n");
+        }
+
+        return;
+    }
+
+    if (core->enabled) {
+        /* start playback */
+        if (!isrunning) {
+            status = AudioDeviceStart(core->outputDeviceID, core->ioprocid);
+            if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
+                coreaudio_logerr (status, "Could not resume playback\n");
+            }
+        }
+    } else {
+        /* stop playback */
+        if (isrunning) {
+            status = AudioDeviceStop(core->outputDeviceID,
+                                     core->ioprocid);
+            if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
+                coreaudio_logerr(status, "Could not pause playback\n");
+            }
+        }
+    }
+}
+
+static OSStatus handle_voice_change(
+    AudioObjectID in_object_id,
+    UInt32 in_number_addresses,
+    const AudioObjectPropertyAddress *in_addresses,
+    void *in_client_data)
+{
+    OSStatus status;
+    coreaudioVoiceOut *core = in_client_data;
+
+    if (coreaudio_lock(core, __func__)) {
+        abort();
+    }
+
+    if (core->outputDeviceID) {
+        fini_out_device(core);
+    }
+
+    status = init_out_device(core);
+    if (!status) {
+        update_device_playback_state(core);
+    }
+
+    coreaudio_unlock (core, __func__);
+    return status;
+}
+
 static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
                               void *drv_opaque)
 {
@@ -499,7 +582,11 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     err = pthread_mutex_init(&core->mutex, NULL);
     if (err) {
         dolog("Could not create mutex\nReason: %s\n", strerror (err));
-        return -1;
+        goto mutex_error;
+    }
+
+    if (coreaudio_lock(core, __func__)) {
+        goto lock_error;
     }
 
     obt_as = *as;
@@ -513,11 +600,43 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     core->bufferCount = cpdo->has_buffer_count ? cpdo->buffer_count : 4;
     core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
 
+    status = AudioObjectAddPropertyListener(kAudioObjectSystemObject,
+                                            &voice_addr, handle_voice_change,
+                                            core);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_playback_logerr (status,
+                                   "Could not listen to voice property change\n");
+        goto listener_error;
+    }
+
     if (init_out_device(core)) {
-        return -1;
+        goto device_error;
     }
 
+    coreaudio_unlock(core, __func__);
     return 0;
+
+device_error:
+    status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
+                                               &voice_addr,
+                                               handle_voice_change,
+                                               core);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_playback_logerr(status,
+                                  "Could not remove voice property change listener\n");
+    }
+
+listener_error:
+    coreaudio_unlock(core, __func__);
+
+lock_error:
+    err = pthread_mutex_destroy(&core->mutex);
+    if (err) {
+        dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
+    }
+
+mutex_error:
+    return -1;
 }
 
 static void coreaudio_fini_out (HWVoiceOut *hw)
@@ -526,8 +645,22 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
     int err;
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
+    if (coreaudio_lock(core, __func__)) {
+        abort();
+    }
+
+    status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
+                                               &voice_addr,
+                                               handle_voice_change,
+                                               core);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_logerr(status, "Could not remove voice property change listener\n");
+    }
+
     fini_out_device(core);
 
+    coreaudio_unlock(core, __func__);
+
     /* destroy mutex */
     err = pthread_mutex_destroy(&core->mutex);
     if (err) {
@@ -537,27 +670,16 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
 
 static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
 {
-    OSStatus status;
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
-    if (enable) {
-        /* start playback */
-        if (!isPlaying(core->outputDeviceID)) {
-            status = AudioDeviceStart(core->outputDeviceID, core->ioprocid);
-            if (status != kAudioHardwareNoError) {
-                coreaudio_logerr (status, "Could not resume playback\n");
-            }
-        }
-    } else {
-        /* stop playback */
-        if (isPlaying(core->outputDeviceID)) {
-            status = AudioDeviceStop(core->outputDeviceID,
-                                     core->ioprocid);
-            if (status != kAudioHardwareNoError) {
-                coreaudio_logerr(status, "Could not pause playback\n");
-            }
-        }
+    if (coreaudio_lock(core, __func__)) {
+        abort();
     }
+
+    core->enabled = enable;
+    update_device_playback_state(core);
+
+    coreaudio_unlock(core, __func__);
 }
 
 static void *coreaudio_audio_init(Audiodev *dev)
-- 
2.24.3 (Apple Git-128)


