Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4B6A2212
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdPD-0003xU-1P; Fri, 24 Feb 2023 14:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdP6-0003eN-As
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:48 -0500
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdP4-0004jW-GA
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:48 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout01.t-online.de (Postfix) with SMTP id 76D8ED4AB;
 Fri, 24 Feb 2023 20:06:22 +0100 (CET)
Received: from linpower.localnet ([84.175.228.75]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdOg-1bTqzZ0; Fri, 24 Feb 2023 20:06:22 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id A9A77335530; Fri, 24 Feb 2023 20:05:55 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: [PATCH v3 12/15] audio: make recording packet length calculation exact
Date: Fri, 24 Feb 2023 20:05:52 +0100
Message-Id: <20230224190555.7409-12-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
References: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265582-D5F1C046-69EB792A/0/0 CLEAN NORMAL
X-TOI-MSGID: ae0f8922-1d0e-4199-b814-dc122626b5f6
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

Introduce the new function st_rate_frames_out() to calculate the
exact number of audio output frames the resampling code can
generate from a given number of audio input frames. When upsampling,
this function returns the maximum number of output frames.

This new function replaces the audio_frontend_frames_in()
function, which calculated the average number of output frames
rounded down to the nearest integer. The audio_frontend_frames_in()
function was additionally used to limit the number of output frames
to the resample buffer size. In audio_pcm_sw_read() the variable
resample_buf.size replaces the open coded audio_frontend_frames_in()
function. In audio_run_in() an additional MIN() function is
necessary.

After this patch the audio packet length calculation for audio
recording is exact.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c  | 29 ++++++++---------------------
 audio/mixeng.c | 41 +++++++++++++++++++++++++++++++++++++++++
 audio/mixeng.h |  1 +
 3 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 22c36d6660..dad17e59b8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -579,7 +579,7 @@ static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
 static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len)
 {
     HWVoiceIn *hw = sw->hw;
-    size_t live, frames_out_max, swlim, total_in, total_out;
+    size_t live, frames_out_max, total_in, total_out;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -590,12 +590,10 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len)
         return 0;
     }
 
-    frames_out_max = buf_len / sw->info.bytes_per_frame;
+    frames_out_max = MIN(buf_len / sw->info.bytes_per_frame,
+                         sw->resample_buf.size);
 
-    swlim = (live * sw->ratio) >> 32;
-    swlim = MIN(swlim, frames_out_max);
-
-    audio_pcm_sw_resample_in(sw, live, swlim, &total_in, &total_out);
+    audio_pcm_sw_resample_in(sw, live, frames_out_max, &total_in, &total_out);
 
     if (!hw->pcm_ops->volume_in) {
         mixeng_volume(sw->resample_buf.buffer, total_out, &sw->vol);
@@ -979,18 +977,6 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
     }
 }
 
-/**
- * audio_frontend_frames_in() - returns the number of frames the resampling
- * code generates from frames_in frames
- *
- * @sw: audio recording frontend
- * @frames_in: number of frames
- */
-static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
-{
-    return (int64_t)frames_in * sw->ratio >> 32;
-}
-
 static size_t audio_get_avail (SWVoiceIn *sw)
 {
     size_t live;
@@ -1007,9 +993,9 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     ldebug (
-        "%s: get_avail live %zu frontend frames %zu\n",
+        "%s: get_avail live %zu frontend frames %u\n",
         SW_NAME (sw),
-        live, audio_frontend_frames_in(sw, live)
+        live, st_rate_frames_out(sw->rate, live)
         );
 
     return live;
@@ -1314,8 +1300,9 @@ static void audio_run_in (AudioState *s)
                 size_t sw_avail = audio_get_avail(sw);
                 size_t avail;
 
-                avail = audio_frontend_frames_in(sw, sw_avail);
+                avail = st_rate_frames_out(sw->rate, sw_avail);
                 if (avail > 0) {
+                    avail = MIN(avail, sw->resample_buf.size);
                     sw->callback.fn(sw->callback.opaque,
                                     avail * sw->info.bytes_per_frame);
                 }
diff --git a/audio/mixeng.c b/audio/mixeng.c
index a24c8c45a7..69f6549224 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -440,6 +440,47 @@ void st_rate_stop (void *opaque)
     g_free (opaque);
 }
 
+/**
+ * st_rate_frames_out() - returns the number of frames the resampling code
+ * generates from frames_in frames
+ *
+ * @opaque: pointer to struct rate
+ * @frames_in: number of frames
+ *
+ * When upsampling, there may be more than one correct result. In this case,
+ * the function returns the maximum number of output frames the resampling
+ * code can generate.
+ */
+uint32_t st_rate_frames_out(void *opaque, uint32_t frames_in)
+{
+    struct rate *rate = opaque;
+    uint64_t opos_end, opos_delta;
+    uint32_t ipos_end;
+    uint32_t frames_out;
+
+    if (rate->opos_inc == 1ULL << 32) {
+        return frames_in;
+    }
+
+    /* no output frame without at least one input frame */
+    if (!frames_in) {
+        return 0;
+    }
+
+    /* last frame read was at rate->ipos - 1 */
+    ipos_end = rate->ipos - 1 + frames_in;
+    opos_end = (uint64_t)ipos_end << 32;
+
+    /* last frame written was at rate->opos - rate->opos_inc */
+    if (opos_end + rate->opos_inc <= rate->opos) {
+        return 0;
+    }
+    opos_delta = opos_end - rate->opos + rate->opos_inc;
+    frames_out = opos_delta / rate->opos_inc;
+
+    return opos_delta % rate->opos_inc ? frames_out : frames_out - 1;
+}
+
 /**
  * st_rate_frames_in() - returns the number of frames needed to
  * get frames_out frames after resampling
diff --git a/audio/mixeng.h b/audio/mixeng.h
index 64c1e231cc..f9de7cffeb 100644
--- a/audio/mixeng.h
+++ b/audio/mixeng.h
@@ -52,6 +52,7 @@ void st_rate_flow(void *opaque, st_sample *ibuf, st_sample *obuf,
 void st_rate_flow_mix(void *opaque, st_sample *ibuf, st_sample *obuf,
                       size_t *isamp, size_t *osamp);
 void st_rate_stop (void *opaque);
+uint32_t st_rate_frames_out(void *opaque, uint32_t frames_in);
 uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out);
 void mixeng_clear (struct st_sample *buf, int len);
 void mixeng_volume (struct st_sample *buf, int len, struct mixeng_volume *vol);
-- 
2.35.3


