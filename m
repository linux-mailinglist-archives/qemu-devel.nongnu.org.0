Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC633D22B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:50:03 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7H0-0002qS-5Z
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ez-0001Re-Py
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ex-00007Y-0m
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615891674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Jih6FDQb6lUSb9kigVSaKbZInp2qwCLvP8TQZBTBzQ=;
 b=JFTuqr3NtvozoNe8SjI/XkAVNL9wzwBmYXFotuEPubOs5k4W3XqYJj2uLkEDsHXyIzPy9+
 sYgRMLe68Sc0PtkGVy8VP9GSgiU0JboxP3WB1q3+Ug3Ccmoyyh7bTU5Fa4Y7kRbTbj9UBn
 7+ZraoNlzqpIgAFEH6GBPd4W1pzJIZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-iHXqj6yCNRKSO-VQv1BA0A-1; Tue, 16 Mar 2021 06:47:52 -0400
X-MC-Unique: iHXqj6yCNRKSO-VQv1BA0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3315E83DD20;
 Tue, 16 Mar 2021 10:47:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB0D5C1A1;
 Tue, 16 Mar 2021 10:47:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 83D68180061B; Tue, 16 Mar 2021 11:47:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] coreaudio: Handle output device change
Date: Tue, 16 Mar 2021 11:47:45 +0100
Message-Id: <20210316104745.2196286-4-kraxel@redhat.com>
In-Reply-To: <20210316104745.2196286-1-kraxel@redhat.com>
References: <20210316104745.2196286-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

An output device change can occur when plugging or unplugging an
earphone.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210311151512.22096-3-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 206 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 164 insertions(+), 42 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index ab43cdcac199..578ec9b8b2e6 100644
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
2.30.2


