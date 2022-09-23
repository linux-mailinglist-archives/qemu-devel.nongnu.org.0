Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D555E8228
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:54:32 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnom-0007Gk-3u
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXu-0002ma-1L
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:15 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:57690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXs-0005GE-26
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:05 -0400
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout01.t-online.de (Postfix) with SMTP id 110CA5E3E;
 Fri, 23 Sep 2022 20:36:50 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXb-4Ns8yP0; Fri, 23 Sep 2022 20:36:48 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9B2F2200619; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH 04/12] alsaaudio: reduce playback latency
Date: Fri, 23 Sep 2022 20:36:32 +0200
Message-Id: <20220923183640.8314-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958208-01449CE0-C5FB84A3/0/0 CLEAN NORMAL
X-TOI-MSGID: 91c864bd-03a1-4816-8257-b481ae4fc39c
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Change the buffer_get_free pcm_ops function to report the free
ALSA playback buffer. The generic buffer becomes a temporary
buffer and is empty after a call to audio_run_out().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 4a61378cd7..7a2a94cd42 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -602,6 +602,42 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     return -1;
 }
 
+static size_t alsa_buffer_get_free(HWVoiceOut *hw)
+{
+    ALSAVoiceOut *alsa = (ALSAVoiceOut *)hw;
+    snd_pcm_sframes_t avail;
+    size_t alsa_free, generic_free, generic_in_use;
+
+    avail = snd_pcm_avail_update(alsa->handle);
+    if (avail < 0) {
+        if (avail == -EPIPE) {
+            if (!alsa_recover(alsa->handle)) {
+                avail = snd_pcm_avail_update(alsa->handle);
+            }
+        }
+        if (avail < 0) {
+            alsa_logerr(avail,
+                        "Could not obtain number of available frames\n");
+            avail = 0;
+        }
+    }
+
+    alsa_free = avail * hw->info.bytes_per_frame;
+    generic_free = audio_generic_buffer_get_free(hw);
+    generic_in_use = hw->samples * hw->info.bytes_per_frame - generic_free;
+    if (generic_in_use) {
+        /*
+         * This code can only be reached in the unlikely case that
+         * snd_pcm_avail_update() returned a larger number of frames
+         * than snd_pcm_writei() could write. Make sure that all
+         * remaining bytes in the generic buffer can be written.
+         */
+        alsa_free = alsa_free > generic_in_use ? alsa_free - generic_in_use : 0;
+    }
+
+    return alsa_free;
+}
+
 static size_t alsa_write(HWVoiceOut *hw, void *buf, size_t len)
 {
     ALSAVoiceOut *alsa = (ALSAVoiceOut *) hw;
@@ -916,7 +952,7 @@ static struct audio_pcm_ops alsa_pcm_ops = {
     .init_out = alsa_init_out,
     .fini_out = alsa_fini_out,
     .write    = alsa_write,
-    .buffer_get_free = audio_generic_buffer_get_free,
+    .buffer_get_free = alsa_buffer_get_free,
     .run_buffer_out = audio_generic_run_buffer_out,
     .enable_out = alsa_enable_out,
 
-- 
2.35.3


