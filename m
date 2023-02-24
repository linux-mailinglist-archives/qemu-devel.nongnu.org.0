Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5726A221A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:07:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdOe-00025Q-Jb; Fri, 24 Feb 2023 14:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdOc-00024o-IV
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:18 -0500
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdOa-0004HT-Kr
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:18 -0500
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout12.t-online.de (Postfix) with SMTP id 5E151B7DE;
 Fri, 24 Feb 2023 20:06:15 +0100 (CET)
Received: from linpower.localnet ([84.175.228.75]) by fwd81.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdOZ-1oA1on0; Fri, 24 Feb 2023 20:06:15 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id A17EB33552D; Fri, 24 Feb 2023 20:05:55 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] audio: make playback packet length calculation exact
Date: Fri, 24 Feb 2023 20:05:49 +0100
Message-Id: <20230224190555.7409-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
References: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265575-19FF5D98-78F29437/0/0 CLEAN NORMAL
X-TOI-MSGID: 077444d4-36ff-47f1-b21e-e91a05abc19d
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Introduce the new function st_rate_frames_in() to calculate the
exact number of audio input frames needed to get a given number
of audio output frames. The exact number of frames depends only
on the difference of opos - ipos and the number of output frames.
When downsampling, this function returns the maximum number of
input frames needed.

This new function replaces the audio_frontend_frames_out() function,
which calculated the average number of input frames rounded down
to the nearest integer. Because audio_frontend_frames_out() also
limited the number of input frames to the size of the resample
buffer, st_rate_frames_in() is not a direct replacement and two
additional MIN() functions are needed. One to prevent resample
buffer overflows and one to limit the available bytes for the audio
frontends.

After this patch the audio packet length calculation for playback is
exact. When upsampling, it's still possible that the audio frontends
can't write the last audio frame. This will be fixed later.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c  | 43 ++++++++++++++++++-------------------------
 audio/mixeng.c | 39 +++++++++++++++++++++++++++++++++++++++
 audio/mixeng.h |  1 +
 3 files changed, 58 insertions(+), 25 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 556696b095..e18b5e98c5 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -701,8 +701,8 @@ static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
 static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
 {
     HWVoiceOut *hw = sw->hw;
-    size_t live, dead, hw_free;
-    size_t frames_in_max, total_in, total_out;
+    size_t live, dead, hw_free, sw_max, fe_max;
+    size_t frames_in_max, frames_out_max, total_in, total_out;
 
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hw->mix_buf.size)) {
@@ -720,17 +720,21 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
     dead = hw->mix_buf.size - live;
     hw_free = audio_pcm_hw_get_free(hw);
     hw_free = hw_free > live ? hw_free - live : 0;
-    frames_in_max = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
-    frames_in_max = MIN(frames_in_max, buf_len / sw->info.bytes_per_frame);
-    if (frames_in_max) {
-        sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
+    frames_out_max = MIN(dead, hw_free);
+    sw_max = st_rate_frames_in(sw->rate, frames_out_max);
+    fe_max = MIN(buf_len / sw->info.bytes_per_frame, sw->resample_buf.size);
+    frames_in_max = MIN(sw_max, fe_max);
 
-        if (!sw->hw->pcm_ops->volume_out) {
-            mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
-        }
+    if (!frames_in_max) {
+        return 0;
     }
 
-    audio_pcm_sw_resample_out(sw, frames_in_max, MIN(dead, hw_free),
+    sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
+    if (!sw->hw->pcm_ops->volume_out) {
+        mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
+    }
+
+    audio_pcm_sw_resample_out(sw, frames_in_max, frames_out_max,
                               &total_in, &total_out);
 
     sw->total_hw_samples_mixed += total_out;
@@ -1000,18 +1004,6 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     return live;
 }
 
-/**
- * audio_frontend_frames_out() - returns the number of frames needed to
- * get frames_out frames after resampling
- *
- * @sw: audio playback frontend
- * @frames_out: number of frames
- */
-static size_t audio_frontend_frames_out(SWVoiceOut *sw, size_t frames_out)
-{
-    return ((int64_t)frames_out << 32) / sw->ratio;
-}
-
 static size_t audio_get_free(SWVoiceOut *sw)
 {
     size_t live, dead;
@@ -1031,8 +1023,8 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf.size - live;
 
 #ifdef DEBUG_OUT
-    dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
-          SW_NAME(sw), live, dead, audio_frontend_frames_out(sw, dead));
+    dolog("%s: get_free live %zu dead %zu frontend frames %u\n",
+          SW_NAME(sw), live, dead, st_rate_frames_in(sw->rate, dead));
 #endif
 
     return dead;
@@ -1161,12 +1153,13 @@ static void audio_run_out (AudioState *s)
                 size_t free;
 
                 if (hw_free > sw->total_hw_samples_mixed) {
-                    free = audio_frontend_frames_out(sw,
+                    free = st_rate_frames_in(sw->rate,
                         MIN(sw_free, hw_free - sw->total_hw_samples_mixed));
                 } else {
                     free = 0;
                 }
                 if (free > 0) {
+                    free = MIN(free, sw->resample_buf.size);
                     sw->callback.fn(sw->callback.opaque,
                                     free * sw->info.bytes_per_frame);
                 }
diff --git a/audio/mixeng.c b/audio/mixeng.c
index fe454e0725..a24c8c45a7 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -440,6 +440,45 @@ void st_rate_stop (void *opaque)
     g_free (opaque);
 }
 
+/**
+ * st_rate_frames_in() - returns the number of frames needed to
+ * get frames_out frames after resampling
+ *
+ * @opaque: pointer to struct rate
+ * @frames_out: number of frames
+ *
+ * When downsampling, there may be more than one correct result. In this
+ * case, the function returns the maximum number of input frames needed.
+ */
+uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out)
+{
+    struct rate *rate = opaque;
+    uint64_t opos_start, opos_end;
+    uint32_t ipos_start, ipos_end;
+
+    if (rate->opos_inc == 1ULL << 32) {
+        return frames_out;
+    }
+
+    if (frames_out) {
+        opos_start = rate->opos;
+        ipos_start = rate->ipos;
+    } else {
+        uint64_t offset;
+
+        /* add offset = ceil(opos_inc) to opos and ipos to avoid an underflow */
+        offset = (rate->opos_inc + (1ULL << 32) - 1) & ~((1ULL << 32) - 1);
+        opos_start = rate->opos + offset;
+        ipos_start = rate->ipos + (offset >> 32);
+    }
+    /* last frame written was at opos_start - rate->opos_inc */
+    opos_end = opos_start - rate->opos_inc + rate->opos_inc * frames_out;
+    ipos_end = (opos_end >> 32) + 1;
+
+    /* last frame read was at ipos_start - 1 */
+    return ipos_end + 1 > ipos_start ? ipos_end + 1 - ipos_start : 0;
+}
+
 void mixeng_clear (struct st_sample *buf, int len)
 {
     memset (buf, 0, len * sizeof (struct st_sample));
diff --git a/audio/mixeng.h b/audio/mixeng.h
index 2dcd6df245..64c1e231cc 100644
--- a/audio/mixeng.h
+++ b/audio/mixeng.h
@@ -52,6 +52,7 @@ void st_rate_flow(void *opaque, st_sample *ibuf, st_sample *obuf,
 void st_rate_flow_mix(void *opaque, st_sample *ibuf, st_sample *obuf,
                       size_t *isamp, size_t *osamp);
 void st_rate_stop (void *opaque);
+uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out);
 void mixeng_clear (struct st_sample *buf, int len);
 void mixeng_volume (struct st_sample *buf, int len, struct mixeng_volume *vol);
 
-- 
2.35.3


