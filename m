Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D533D22A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:50:00 +0100 (CET)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7Gx-0002jX-Ch
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ey-0001RG-N5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM7Ew-00007X-Ph
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615891674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uZG7+y4lE+Kg15hMyyT1iMabpnUBAcGmRBmKaPTHfo=;
 b=S9rt77Q4hiORo6boWdCf+58AWLbUJcn5Zeaq4a1dNiyxp45PLtOdgnHlDeSw49viR/TgWR
 l6KceCc84onekR9fDmIrKhUnWwugSnUNv8nj6DVPTifxSaU6QWEc9Sog2og/1M3cZvWpHF
 4NuCyNApt3a/R682OXFPrxi2iiwHqm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-8RoIRtzRMrGEUw4huzV2Aw-1; Tue, 16 Mar 2021 06:47:52 -0400
X-MC-Unique: 8RoIRtzRMrGEUw4huzV2Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2FE418460E0;
 Tue, 16 Mar 2021 10:47:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7D260C0F;
 Tue, 16 Mar 2021 10:47:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76EE6180061A; Tue, 16 Mar 2021 11:47:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] coreaudio: Extract device operations
Date: Tue, 16 Mar 2021 11:47:44 +0100
Message-Id: <20210316104745.2196286-3-kraxel@redhat.com>
In-Reply-To: <20210316104745.2196286-1-kraxel@redhat.com>
References: <20210316104745.2196286-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

This change prepare to support dynamic device changes, which requires to
perform device initialization/deinitialization multiple times.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210311151512.22096-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 137 +++++++++++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 57 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index c5f0b615d643..ab43cdcac199 100644
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
2.30.2


