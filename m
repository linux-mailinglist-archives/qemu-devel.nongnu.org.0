Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5B66B12F
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 14:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2oR-0003z7-VQ; Sun, 15 Jan 2023 08:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oN-0003yR-SW
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:36 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oL-00058l-Rd
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:35 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id 16C71CB9F;
 Sun, 15 Jan 2023 14:12:32 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH2oE-1wRQ810; Sun, 15 Jan 2023 14:12:27 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 55913200624; Sun, 15 Jan 2023 14:12:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 02/17] audio: change type and name of the resample buffer
Date: Sun, 15 Jan 2023 14:12:09 +0100
Message-Id: <20230115131224.30751-2-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: 6ec5ab77-e123-4d9f-a299-965e08d05aad
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Volker Rümelin <vr_qemu@t-online.de>

Change the type of the resample buffer from struct st_sample *
to STSampleBuffer. Also change the name from buf to resample_buf
for better readability.

The new variables resample_buf.size and resample_buf.pos will be
used after the next patches. There is no functional change.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          | 15 ++++++++-------
 audio/audio_int.h      |  4 ++--
 audio/audio_template.h | 10 ++++++----
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 6a17b3bb2f..22ec7d3093 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -553,7 +553,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
 {
     HWVoiceIn *hw = sw->hw;
     size_t samples, live, ret = 0, swlim, isamp, osamp, rpos, total = 0;
-    struct st_sample *src, *dst = sw->buf;
+    struct st_sample *src, *dst = sw->resample_buf.buffer;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -593,10 +593,10 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     }
 
     if (!hw->pcm_ops->volume_in) {
-        mixeng_volume (sw->buf, ret, &sw->vol);
+        mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
     }
 
-    sw->clip (buf, sw->buf, ret);
+    sw->clip(buf, sw->resample_buf.buffer, ret);
     sw->total_hw_samples_acquired += total;
     return ret * sw->info.bytes_per_frame;
 }
@@ -704,10 +704,10 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     samples = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
     samples = MIN(samples, size / sw->info.bytes_per_frame);
     if (samples) {
-        sw->conv(sw->buf, buf, samples);
+        sw->conv(sw->resample_buf.buffer, buf, samples);
 
         if (!sw->hw->pcm_ops->volume_out) {
-            mixeng_volume(sw->buf, samples, &sw->vol);
+            mixeng_volume(sw->resample_buf.buffer, samples, &sw->vol);
         }
     }
 
@@ -722,7 +722,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         osamp = blck;
         st_rate_flow_mix (
             sw->rate,
-            sw->buf + pos,
+            sw->resample_buf.buffer + pos,
             sw->hw->mix_buf.buffer + wpos,
             &isamp,
             &osamp
@@ -1059,7 +1059,8 @@ static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
                 size_t bytes = to_write * hw->info.bytes_per_frame;
                 size_t written;
 
-                sw->buf = hw->mix_buf.buffer + rpos2;
+                sw->resample_buf.buffer = hw->mix_buf.buffer + rpos2;
+                sw->resample_buf.size = to_write;
                 written = audio_pcm_sw_write (sw, NULL, bytes);
                 if (written - bytes) {
                     dolog("Could not mix %zu bytes into a capture "
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 900b0a6255..f4ec5dcf11 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -109,7 +109,7 @@ struct SWVoiceOut {
     struct audio_pcm_info info;
     t_sample *conv;
     int64_t ratio;
-    struct st_sample *buf;
+    STSampleBuffer resample_buf;
     void *rate;
     size_t total_hw_samples_mixed;
     int active;
@@ -129,7 +129,7 @@ struct SWVoiceIn {
     int64_t ratio;
     void *rate;
     size_t total_hw_samples_acquired;
-    struct st_sample *buf;
+    STSampleBuffer resample_buf;
     f_sample *clip;
     HWVoiceIn *hw;
     char *name;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 9283f00e9e..07c14e7821 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -95,13 +95,13 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
 
 static void glue (audio_pcm_sw_free_resources_, TYPE) (SW *sw)
 {
-    g_free (sw->buf);
+    g_free(sw->resample_buf.buffer);
+    sw->resample_buf.buffer = NULL;
+    sw->resample_buf.size = 0;
 
     if (sw->rate) {
         st_rate_stop (sw->rate);
     }
-
-    sw->buf = NULL;
     sw->rate = NULL;
 }
 
@@ -132,7 +132,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return -1;
     }
 
-    sw->buf = g_new0(st_sample, samples);
+    sw->resample_buf.buffer = g_new0(st_sample, samples);
+    sw->resample_buf.size = samples;
+    sw->resample_buf.pos = 0;
 
 #ifdef DAC
     sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
-- 
2.35.3


