Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D367568C626
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bo-0004yi-QU; Mon, 06 Feb 2023 13:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bl-0004xX-FI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: from mailout10.t-online.de ([194.25.134.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bj-0005Ts-HR
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout10.t-online.de (Postfix) with SMTP id 0F2EE4F80;
 Mon,  6 Feb 2023 19:52:50 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd86.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6bh-0vP60X0; Mon, 6 Feb 2023 19:52:49 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 7EC24200638; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 06/17] audio: rename variables in audio_pcm_sw_write()
Date: Mon,  6 Feb 2023 19:52:26 +0100
Message-Id: <20230206185237.8358-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709569-92FEA95E-79178949/0/0 CLEAN NORMAL
X-TOI-MSGID: 0fa32990-6943-464e-91db-6154b887a500
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
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

The audio_pcm_sw_write() function uses a lot of very unspecific
variable names. Rename them for better readability.

ret => total_in
total => total_out
size => buf_len
hwsamples => hw->mix_buf.size
samples => frames_in_max

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 8f1c0e77b0..cd10f1ec10 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -706,56 +706,55 @@ static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
     }
 }
 
-static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
+static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
 {
-    size_t hwsamples, samples, live, dead;
-    size_t hw_free;
-    size_t ret, total;
-
-    hwsamples = sw->hw->mix_buf.size;
+    HWVoiceOut *hw = sw->hw;
+    size_t live, dead, hw_free;
+    size_t frames_in_max, total_in, total_out;
 
     live = sw->total_hw_samples_mixed;
-    if (audio_bug(__func__, live > hwsamples)) {
-        dolog("live=%zu hw->mix_buf.size=%zu\n", live, hwsamples);
+    if (audio_bug(__func__, live > hw->mix_buf.size)) {
+        dolog("live=%zu hw->mix_buf.size=%zu\n", live, hw->mix_buf.size);
         return 0;
     }
 
-    if (live == hwsamples) {
+    if (live == hw->mix_buf.size) {
 #ifdef DEBUG_OUT
         dolog ("%s is full %zu\n", sw->name, live);
 #endif
         return 0;
     }
 
-    dead = hwsamples - live;
-    hw_free = audio_pcm_hw_get_free(sw->hw);
+    dead = hw->mix_buf.size - live;
+    hw_free = audio_pcm_hw_get_free(hw);
     hw_free = hw_free > live ? hw_free - live : 0;
-    samples = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
-    samples = MIN(samples, size / sw->info.bytes_per_frame);
-    if (samples) {
-        sw->conv(sw->resample_buf.buffer, buf, samples);
+    frames_in_max = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
+    frames_in_max = MIN(frames_in_max, buf_len / sw->info.bytes_per_frame);
+    if (frames_in_max) {
+        sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
 
         if (!sw->hw->pcm_ops->volume_out) {
-            mixeng_volume(sw->resample_buf.buffer, samples, &sw->vol);
+            mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
         }
     }
 
-    audio_pcm_sw_resample_out(sw, samples, MIN(dead, hw_free), &ret, &total);
+    audio_pcm_sw_resample_out(sw, frames_in_max, MIN(dead, hw_free),
+                              &total_in, &total_out);
 
-    sw->total_hw_samples_mixed += total;
+    sw->total_hw_samples_mixed += total_out;
     sw->empty = sw->total_hw_samples_mixed == 0;
 
 #ifdef DEBUG_OUT
     dolog (
-        "%s: write size %zu ret %zu total sw %zu\n",
-        SW_NAME (sw),
-        size / sw->info.bytes_per_frame,
-        ret,
+        "%s: write size %zu written %zu total mixed %zu\n",
+        SW_NAME(sw),
+        buf_len / sw->info.bytes_per_frame,
+        total_in,
         sw->total_hw_samples_mixed
         );
 #endif
 
-    return ret * sw->info.bytes_per_frame;
+    return total_in * sw->info.bytes_per_frame;
 }
 
 #ifdef DEBUG_AUDIO
-- 
2.35.3


