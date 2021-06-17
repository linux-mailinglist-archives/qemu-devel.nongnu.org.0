Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69583AB441
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:05:10 +0200 (CEST)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrhl-0007cx-Q6
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrLC-0000mu-HP
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrL9-00082i-D2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9uYM9i0/zeE2zisOc3Ea/5Q8saWuNGIl4ykRgeaAd8=;
 b=iTeeFILwCIv350VLz7TVfzbu3Qk2qUK+17yVVB6ryZb0XVuic+L1h22FkHMaXJDBbqfBLV
 AIZUhGa3armh0FgrkyswSy5rR9KuBzvamoxZU8CQp31qd5ikhWu9oRo4fuMzvN2BqkgqKT
 dM5Bx+5vxpEmvx7NGXPPIWum/zzCJJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-7-vqMETOO-euAYCpToiRoQ-1; Thu, 17 Jun 2021 08:41:45 -0400
X-MC-Unique: 7-vqMETOO-euAYCpToiRoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27EAD8015DB;
 Thu, 17 Jun 2021 12:41:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBBEB100AE35;
 Thu, 17 Jun 2021 12:41:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C07E1803092; Thu, 17 Jun 2021 14:41:08 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] coreaudio: Fix output stream format settings
Date: Thu, 17 Jun 2021 14:41:07 +0200
Message-Id: <20210617124107.2386073-8-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

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
Message-Id: <20210616141721.54091-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 48 +++++++++++++----------------------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 578ec9b8b2e6..f570e1ee60ef 100644
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
2.31.1


