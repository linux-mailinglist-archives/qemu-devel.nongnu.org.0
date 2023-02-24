Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875466A2218
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdPF-0004NH-SS; Fri, 24 Feb 2023 14:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdPC-00043f-T6
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:54 -0500
Received: from mailout10.t-online.de ([194.25.134.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdPB-0004kP-0m
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:54 -0500
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout10.t-online.de (Postfix) with SMTP id A2C6C1583A;
 Fri, 24 Feb 2023 20:06:29 +0100 (CET)
Received: from linpower.localnet ([84.175.228.75]) by fwd87.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdOn-26bgDx0; Fri, 24 Feb 2023 20:06:29 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id B1D45335533; Fri, 24 Feb 2023 20:05:55 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] audio: remove sw->ratio
Date: Fri, 24 Feb 2023 20:05:55 +0100
Message-Id: <20230224190555.7409-15-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
References: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265589-9F29E0AF-2C711AB9/2/51138760147 SUSPECT
 URL-COUNT
X-TOI-MSGID: 550620b0-94f6-474e-8fa6-052d93e5e5c2
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

Simplify the resample buffer size calculation.

For audio playback we have
sw->ratio = ((int64_t)sw->hw->info.freq << 32) / sw->info.freq;
samples = ((int64_t)sw->HWBUF.size << 32) / sw->ratio;

This can be simplified to
samples = muldiv64(sw->HWBUF.size, sw->info.freq, sw->hw->info.freq);

For audio recording we have
sw->ratio = ((int64_t)sw->info.freq << 32) / sw->hw->info.freq;
samples = (int64_t)sw->HWBUF.size * sw->ratio >> 32;

This can be simplified to
samples = muldiv64(sw->HWBUF.size, sw->info.freq, sw->hw->info.freq);

With hw = sw->hw this becomes in both cases
samples = muldiv64(HWBUF.size, sw->info.freq, hw->info.freq);

Now that sw->ratio is no longer needed, remove sw->ratio.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          |  1 -
 audio/audio_int.h      |  2 --
 audio/audio_template.h | 30 +++++++++---------------------
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 4836ab8ca8..70b096713c 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -478,7 +478,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
         sw->info = hw->info;
         sw->empty = 1;
         sw->active = hw->enabled;
-        sw->ratio = ((int64_t) hw_cap->info.freq << 32) / sw->info.freq;
         sw->vol = nominal_volume;
         sw->rate = st_rate_start (sw->info.freq, hw_cap->info.freq);
         QLIST_INSERT_HEAD (&hw_cap->sw_head, sw, entries);
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 8b163e1759..d51d63f08d 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -108,7 +108,6 @@ struct SWVoiceOut {
     AudioState *s;
     struct audio_pcm_info info;
     t_sample *conv;
-    int64_t ratio;
     STSampleBuffer resample_buf;
     void *rate;
     size_t total_hw_samples_mixed;
@@ -126,7 +125,6 @@ struct SWVoiceIn {
     AudioState *s;
     int active;
     struct audio_pcm_info info;
-    int64_t ratio;
     void *rate;
     size_t total_hw_samples_acquired;
     STSampleBuffer resample_buf;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 7e116426c7..e42326c20d 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -108,32 +108,23 @@ static void glue (audio_pcm_sw_free_resources_, TYPE) (SW *sw)
 static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 {
     HW *hw = sw->hw;
-    int samples;
+    uint64_t samples;
 
     if (!glue(audio_get_pdo_, TYPE)(sw->s->dev)->mixing_engine) {
         return 0;
     }
 
-#ifdef DAC
-    samples = ((int64_t)sw->HWBUF.size << 32) / sw->ratio;
-#else
-    samples = (int64_t)sw->HWBUF.size * sw->ratio >> 32;
-#endif
-    if (audio_bug(__func__, samples < 0)) {
-        dolog("Can not allocate buffer for `%s' (%d samples)\n",
-              SW_NAME(sw), samples);
-        return -1;
-    }
-
+    samples = muldiv64(HWBUF.size, sw->info.freq, hw->info.freq);
     if (samples == 0) {
-        size_t f_fe_min;
+        uint64_t f_fe_min;
+        uint64_t f_be = (uint32_t)hw->info.freq;
 
         /* f_fe_min = ceil(1 [frames] * f_be [Hz] / size_be [frames]) */
-        f_fe_min = (hw->info.freq + HWBUF.size - 1) / HWBUF.size;
+        f_fe_min = (f_be + HWBUF.size - 1) / HWBUF.size;
         qemu_log_mask(LOG_UNIMP,
                       AUDIO_CAP ": The guest selected a " NAME " sample rate"
-                      " of %d Hz for %s. Only sample rates >= %zu Hz are"
-                      " supported.\n",
+                      " of %d Hz for %s. Only sample rates >= %" PRIu64 " Hz"
+                      " are supported.\n",
                       sw->info.freq, sw->name, f_fe_min);
         return -1;
     }
@@ -141,9 +132,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     /*
      * Allocate one additional audio frame that is needed for upsampling
      * if the resample buffer size is small. For large buffer sizes take
-     * care of overflows.
+     * care of overflows and truncation.
      */
-    samples = samples < INT_MAX ? samples + 1 : INT_MAX;
+    samples = samples < SIZE_MAX ? samples + 1 : SIZE_MAX;
     sw->resample_buf.buffer = g_new0(st_sample, samples);
     sw->resample_buf.size = samples;
     sw->resample_buf.pos = 0;
@@ -170,11 +161,8 @@ static int glue (audio_pcm_sw_init_, TYPE) (
     sw->hw = hw;
     sw->active = 0;
 #ifdef DAC
-    sw->ratio = ((int64_t) sw->hw->info.freq << 32) / sw->info.freq;
     sw->total_hw_samples_mixed = 0;
     sw->empty = 1;
-#else
-    sw->ratio = ((int64_t) sw->info.freq << 32) / sw->hw->info.freq;
 #endif
 
     if (sw->info.is_float) {
-- 
2.35.3


