Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619AD488793
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 04:44:45 +0100 (CET)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6P8N-0007lB-Ti
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 22:44:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@aeryn.lan.ktmba>)
 id 1n6P73-000756-Hs
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 22:43:21 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:58560)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@aeryn.lan.ktmba>) id 1n6P71-0004h5-Nl
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 22:43:21 -0500
Received: from aeryn.lan.ktmba (office.hostfission.com [220.233.29.71])
 by mail1.hostfission.com (Postfix) with ESMTPS id 8DC12424E1;
 Sun,  9 Jan 2022 14:33:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1641699214;
 bh=Iyoq/BoYWUcF57f1LgWE1nzh9qw4I1xihVVqM7dRTrk=;
 h=From:To:Cc:Subject:Date:From;
 b=GLYHXEaRscJib9rpwjzkwwpthEgobLnf5UViaKpM6gaTPmDKX0nLwxrB3pdv22mQl
 BTKXmQCF3Q7HOlKPIpSZ8qao6T6oKwqkB2V47w2nJlqqs6FkOcBXXsFMWJcBGQ5u0g
 k1HkXRklx09+CwypZzt39KDwEd3vMbC/eb8EKWYQ=
Received: by aeryn.lan.ktmba (Postfix, from userid 1000)
 id 70E882E2363; Sun,  9 Jan 2022 14:33:34 +1100 (AEDT)
From: Geoffrey McRae <geoff@hostfission.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	Geoffrey McRae <geoff@hostfission.com>
Subject: [PATCH] audio: allow spice buffer_length to be adjusted
Date: Sun,  9 Jan 2022 14:33:32 +1100
Message-Id: <20220109033332.402609-1-geoff@hostfission.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=139.99.139.48; envelope-from=geoff@aeryn.lan.ktmba;
 helo=mail1.hostfission.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 NO_DNS_FOR_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Spice clients that are running directly on the host system have
pratcially unlimited bandwidth so to reduce latency allow the user to
configure the buffer_length to a lower value if desired.

While virt-viewer can not take advantage of this, the PureSpice [1]
library used by Looking Glass [2] is able to produce and consume audio
at these rates, combined with the merge request for spice-server [3]
this allows for latencies close to realtime.

[1] https://github.com/gnif/PureSpice
[2] https://github.com/gnif/LookingGlass
[3] https://gitlab.freedesktop.org/spice/spice/-/merge_requests/199

Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
---
 audio/spiceaudio.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index a8d370fe6f..0c44bbe836 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -76,7 +76,7 @@ static void *spice_audio_init(Audiodev *dev)
     if (!using_spice) {
         return NULL;
     }
-    return &spice_audio_init;
+    return dev;
 }
 
 static void spice_audio_fini (void *opaque)
@@ -90,6 +90,8 @@ static int line_out_init(HWVoiceOut *hw, struct audsettings *as,
                          void *drv_opaque)
 {
     SpiceVoiceOut *out = container_of (hw, SpiceVoiceOut, hw);
+    Audiodev      *dev = (Audiodev *)drv_opaque;
+
     struct audsettings settings;
 
 #if SPICE_INTERFACE_PLAYBACK_MAJOR > 1 || SPICE_INTERFACE_PLAYBACK_MINOR >= 3
@@ -102,7 +104,12 @@ static int line_out_init(HWVoiceOut *hw, struct audsettings *as,
     settings.endianness = AUDIO_HOST_ENDIANNESS;
 
     audio_pcm_init_info (&hw->info, &settings);
-    hw->samples = LINE_OUT_SAMPLES;
+    if (dev->u.none.out->has_buffer_length) {
+        hw->samples = audio_buffer_samples(dev->u.none.out, &settings, 10000);
+    } else {
+        hw->samples = LINE_OUT_SAMPLES;
+    }
+
     out->active = 0;
 
     out->sin.base.sif = &playback_sif.base;
@@ -199,6 +206,7 @@ static void line_out_volume(HWVoiceOut *hw, Volume *vol)
 static int line_in_init(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 {
     SpiceVoiceIn *in = container_of (hw, SpiceVoiceIn, hw);
+    Audiodev     *dev = (Audiodev *)drv_opaque;
     struct audsettings settings;
 
 #if SPICE_INTERFACE_RECORD_MAJOR > 2 || SPICE_INTERFACE_RECORD_MINOR >= 3
@@ -211,7 +219,12 @@ static int line_in_init(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     settings.endianness = AUDIO_HOST_ENDIANNESS;
 
     audio_pcm_init_info (&hw->info, &settings);
-    hw->samples = LINE_IN_SAMPLES;
+    if (dev->u.none.out->has_buffer_length) {
+        hw->samples = audio_buffer_samples(dev->u.none.in, &settings, 10000);
+    } else {
+        hw->samples = LINE_IN_SAMPLES;
+    }
+
     in->active = 0;
 
     in->sin.base.sif = &record_sif.base;
-- 
2.30.2


