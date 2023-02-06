Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E668C638
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:56:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6cB-0005R9-9i; Mon, 06 Feb 2023 13:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c8-0005Dr-1D
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:16 -0500
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c5-0005Wv-FS
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:14 -0500
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout01.t-online.de (Postfix) with SMTP id 50B73BEB3;
 Mon,  6 Feb 2023 19:53:11 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6c3-2UCJMX0; Mon, 6 Feb 2023 19:53:11 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 977BF2006C9; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 15/17] audio: handle leftover audio frame from upsampling
Date: Mon,  6 Feb 2023 19:52:35 +0100
Message-Id: <20230206185237.8358-15-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709591-81AEBD99-F64D8ECC/2/50744550798 SUSPECT
 URL-COUNT
X-TOI-MSGID: 859d53c4-4527-4f4d-824e-61cc276b1897
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Upsampling may leave one remaining audio frame in the input
buffer. The emulated audio playback devices are currently
resposible to write this audio frame again in the next write
cycle. Push that task down to audio_pcm_sw_write.

This is another step towards an audio callback interface that
guarantees that when audio frontends are told they can write
n audio frames, they can actually do so.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          | 34 ++++++++++++++++++++++++++++------
 audio/audio_template.h |  6 ++++++
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index dad17e59b8..4836ab8ca8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -731,16 +731,21 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
     hw_free = hw_free > live ? hw_free - live : 0;
     frames_out_max = MIN(dead, hw_free);
     sw_max = st_rate_frames_in(sw->rate, frames_out_max);
-    fe_max = MIN(buf_len / sw->info.bytes_per_frame, sw->resample_buf.size);
+    fe_max = MIN(buf_len / sw->info.bytes_per_frame + sw->resample_buf.pos,
+                 sw->resample_buf.size);
     frames_in_max = MIN(sw_max, fe_max);
 
     if (!frames_in_max) {
         return 0;
     }
 
-    sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
-    if (!sw->hw->pcm_ops->volume_out) {
-        mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
+    if (frames_in_max > sw->resample_buf.pos) {
+        sw->conv(sw->resample_buf.buffer + sw->resample_buf.pos,
+                 buf, frames_in_max - sw->resample_buf.pos);
+        if (!sw->hw->pcm_ops->volume_out) {
+            mixeng_volume(sw->resample_buf.buffer + sw->resample_buf.pos,
+                          frames_in_max - sw->resample_buf.pos, &sw->vol);
+        }
     }
 
     audio_pcm_sw_resample_out(sw, frames_in_max, frames_out_max,
@@ -749,6 +754,22 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
     sw->total_hw_samples_mixed += total_out;
     sw->empty = sw->total_hw_samples_mixed == 0;
 
+    /*
+     * Upsampling may leave one audio frame in the resample buffer. Decrement
+     * total_in by one if there was a leftover frame from the previous resample
+     * pass in the resample buffer. Increment total_in by one if the current
+     * resample pass left one frame in the resample buffer.
+     */
+    if (frames_in_max - total_in == 1) {
+        /* copy one leftover audio frame to the beginning of the buffer */
+        *sw->resample_buf.buffer = *(sw->resample_buf.buffer + total_in);
+        total_in += 1 - sw->resample_buf.pos;
+        sw->resample_buf.pos = 1;
+    } else if (total_in >= sw->resample_buf.pos) {
+        total_in -= sw->resample_buf.pos;
+        sw->resample_buf.pos = 0;
+    }
+
 #ifdef DEBUG_OUT
     dolog (
         "%s: write size %zu written %zu total mixed %zu\n",
@@ -1155,8 +1176,9 @@ static void audio_run_out (AudioState *s)
                 } else {
                     free = 0;
                 }
-                if (free > 0) {
-                    free = MIN(free, sw->resample_buf.size);
+                if (free > sw->resample_buf.pos) {
+                    free = MIN(free, sw->resample_buf.size)
+                           - sw->resample_buf.pos;
                     sw->callback.fn(sw->callback.opaque,
                                     free * sw->info.bytes_per_frame);
                 }
diff --git a/audio/audio_template.h b/audio/audio_template.h
index a0b653f52c..0d8aab6fad 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -138,6 +138,12 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return -1;
     }
 
+    /*
+     * Allocate one additional audio frame that is needed for upsampling
+     * if the resample buffer size is small. For large buffer sizes take
+     * care of overflows.
+     */
+    samples = samples < INT_MAX ? samples + 1 : INT_MAX;
     sw->resample_buf.buffer = g_new0(st_sample, samples);
     sw->resample_buf.size = samples;
     sw->resample_buf.pos = 0;
-- 
2.35.3


