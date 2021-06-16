Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E53A9D68
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:18:39 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWNK-0005E5-He
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWMI-0004MS-Ff
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:17:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWMG-0004WA-HT
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:17:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y15so2350754pfl.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0SCR8KBnfesoBdtKPgEAuD0gw12QirqR+V8FuFWTXM=;
 b=hKxT9hicN//eOSgsfTidmQfp85pNpx6Vdgfq6u0MZMZgkhZ07UB4aJXxFODGJI0hPU
 wuypfR3Z/YNGZcKySoEvVHTNAMJRxpPaeJF+A5g+UkUFt/JtzKENQNkVNRWJHsSXL40x
 2+p8CkgSb1tcRYUeax3dzRyjLIfP060KZtLMBDMpyZR0wCMiIBfUwevdxwL842T33dMO
 /rVFXP3qDOio4JxP3kqXKESCmYkdZiMVvfx4YX2qPIu1wA75bzleXUnnBFVuv3MQUM4c
 KBfIN4TTJNpi1oL0+UR6F52lJP/mZ6Fov81ZrthtEWxLSQlE/6ydGcoRrjgrsYAqCh1t
 SmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0SCR8KBnfesoBdtKPgEAuD0gw12QirqR+V8FuFWTXM=;
 b=Zv5MbDO9fMKAPlfBJLVmOCYw6CJrepZxSAo+Anu3o2/X1MgShC4sjO7NclihZpdaVo
 xO+Ry7qO2EcDRFz6rz9inaYhU5xqyhCWEGvkAbjyYKJEzLHibZG/XfC4+FkHGLzH68oy
 W1R1d0SfZBEsKYDpjv0v3ZTwg56DdxmnHZMWuWYcv/xrXqt/7+Tc/t9Ncuf9xlvWzjdE
 VdRm8/pFrBvFK+vDiwJ4/9PD3IG+s2NS37o4/XglDm+GHmfyxdTmibezqwk7omKZjEaN
 RIYz4uKQNXQHLPj3QCBJRwmCGz9os3OA6S32h5mc9febKEVS1kZ3rR3MCLIv9xrufj0x
 0KQA==
X-Gm-Message-State: AOAM533HHr+22xL7XaqmrFOvkcl0+ea2rI+gApANa0FIkbIdsrHncZkM
 hXmhFu9VDNKHJHIskYX34GnIgQQ0aZuIug==
X-Google-Smtp-Source: ABdhPJzhTBEJlKrjd9otmiY4ZcsTHTBbldW99MbREQY+5FyF1h6QjU/IZICgP8i1QmQjnwTFwnUZxg==
X-Received: by 2002:a63:5760:: with SMTP id h32mr5167703pgm.367.1623853051018; 
 Wed, 16 Jun 2021 07:17:31 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id br14sm5678878pjb.41.2021.06.16.07.17.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:17:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] coreaudio: Fix output stream format settings
Date: Wed, 16 Jun 2021 23:17:21 +0900
Message-Id: <20210616141721.54091-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
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

Before commit 7d6948cd98cf5ad8a3458a4ce7fdbcb79bcd1212, it was coded to
retrieve the initial output stream format settings, modify the frame
rate, and set again. However, I removed a frame rate modification code by
mistake in the commit. It also assumes the initial output stream format
is consistent with what QEMU expects, but that expectation is not in the
code, which makes it harder to understand and will lead to breakage if
the initial settings change.

This change explicitly sets all of the output stream settings to solve
these problems.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 48 +++++++++++++----------------------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 578ec9b8b2e..f570e1ee60e 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -39,7 +39,6 @@ typedef struct coreaudioVoiceOut {
     int frameSizeSetting;
     uint32_t bufferCount;
     UInt32 audioDevicePropertyBufferFrameSize;
-    AudioStreamBasicDescription outputStreamBasicDescription;
     AudioDeviceIOProcID ioprocid;
     bool enabled;
 } coreaudioVoiceOut;
@@ -114,24 +113,6 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
                                       framesize);
 }
 
-static OSStatus coreaudio_get_streamformat(AudioDeviceID id,
-                                           AudioStreamBasicDescription *d)
-{
-    UInt32 size = sizeof(*d);
-    AudioObjectPropertyAddress addr = {
-        kAudioDevicePropertyStreamFormat,
-        kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
-    };
-
-    return AudioObjectGetPropertyData(id,
-                                      &addr,
-                                      0,
-                                      NULL,
-                                      &size,
-                                      d);
-}
-
 static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
                                            AudioStreamBasicDescription *d)
 {
@@ -373,6 +354,17 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     OSStatus status;
     AudioValueRange frameRange;
 
+    AudioStreamBasicDescription streamBasicDescription = {
+        .mBitsPerChannel = core->hw.info.bits,
+        .mBytesPerFrame = core->hw.info.bytes_per_frame,
+        .mBytesPerPacket = core->hw.info.bytes_per_frame,
+        .mChannelsPerFrame = core->hw.info.nchannels,
+        .mFormatFlags = kLinearPCMFormatFlagIsFloat,
+        .mFormatID = kAudioFormatLinearPCM,
+        .mFramesPerPacket = 1,
+        .mSampleRate = core->hw.info.freq
+    };
+
     status = coreaudio_get_voice(&core->outputDeviceID);
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
@@ -432,29 +424,16 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     }
     core->hw.samples = core->bufferCount * core->audioDevicePropertyBufferFrameSize;
 
-    /* get StreamFormat */
-    status = coreaudio_get_streamformat(core->outputDeviceID,
-                                        &core->outputStreamBasicDescription);
-    if (status == kAudioHardwareBadObjectError) {
-        return 0;
-    }
-    if (status != kAudioHardwareNoError) {
-        coreaudio_playback_logerr (status,
-                                    "Could not get Device Stream properties\n");
-        core->outputDeviceID = kAudioDeviceUnknown;
-        return status;
-    }
-
     /* set Samplerate */
     status = coreaudio_set_streamformat(core->outputDeviceID,
-                                        &core->outputStreamBasicDescription);
+                                        &streamBasicDescription);
     if (status == kAudioHardwareBadObjectError) {
         return 0;
     }
     if (status != kAudioHardwareNoError) {
         coreaudio_playback_logerr (status,
                                    "Could not set samplerate %lf\n",
-                                   core->outputStreamBasicDescription.mSampleRate);
+                                   streamBasicDescription.mSampleRate);
         core->outputDeviceID = kAudioDeviceUnknown;
         return status;
     }
@@ -598,7 +577,6 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
         qapi_AudiodevCoreaudioPerDirectionOptions_base(cpdo), as, 11610);
 
     core->bufferCount = cpdo->has_buffer_count ? cpdo->buffer_count : 4;
-    core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
 
     status = AudioObjectAddPropertyListener(kAudioObjectSystemObject,
                                             &voice_addr, handle_voice_change,
-- 
2.30.1 (Apple Git-130)


