Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F2496CA0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:39:36 +0100 (CET)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGcB-0004pg-FQ
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy8-0007id-MI
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:13 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:43200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy6-00055K-9B
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:12 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout01.t-online.de (Postfix) with SMTP id 3F4CF11C7;
 Sat, 22 Jan 2022 13:58:09 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFy4-3WAvqr0; Sat, 22 Jan 2022 13:58:09 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id DE02420063C; Sat, 22 Jan 2022 13:57:45 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 10/15] audio: restore mixing-engine playback buffer size
Date: Sat, 22 Jan 2022 13:57:40 +0100
Message-Id: <20220122125745.5037-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642856289-0000F5B3-E54C09D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 95f3a6d5-3f9f-4612-88d1-cad48f1adc14
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit ff095e5231 "audio: api for mixeng code free backends"
introduced another FIFO for the audio subsystem with exactly the
same size as the mixing-engine FIFO. Most audio backends use
this generic FIFO. The generic FIFO used together with the
mixing-engine FIFO doubles the audio FIFO size, because that's
just two independent FIFOs connected together in series.

For audio playback this nearly doubles the playback latency.

This patch restores the effective mixing-engine playback buffer
size to a pre v4.2.0 size by only accepting the amount of
samples for the mixing-engine queue which the downstream queue
accepts.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c |  1 +
 audio/audio.c     | 69 +++++++++++++++++++++++++++++++++++------------
 audio/audio_int.h |  7 ++++-
 audio/coreaudio.c |  3 +++
 audio/jackaudio.c |  1 +
 audio/noaudio.c   |  1 +
 audio/ossaudio.c  | 12 +++++++++
 audio/sdlaudio.c  |  3 +++
 audio/wavaudio.c  |  1 +
 9 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 2b9789e647..b04716a6cc 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -916,6 +916,7 @@ static struct audio_pcm_ops alsa_pcm_ops = {
     .init_out = alsa_init_out,
     .fini_out = alsa_fini_out,
     .write    = alsa_write,
+    .buffer_get_free = audio_generic_buffer_get_free,
     .run_buffer_out = audio_generic_run_buffer_out,
     .enable_out = alsa_enable_out,
 
diff --git a/audio/audio.c b/audio/audio.c
index c420a8bd1c..a88572e713 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -663,6 +663,12 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
     return 0;
 }
 
+static size_t audio_pcm_hw_get_free(HWVoiceOut *hw)
+{
+    return (hw->pcm_ops->buffer_get_free ? hw->pcm_ops->buffer_get_free(hw) :
+            INT_MAX) / hw->info.bytes_per_frame;
+}
+
 static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
 {
     size_t clipped = 0;
@@ -687,7 +693,8 @@ static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
  */
 static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
 {
-    size_t hwsamples, samples, isamp, osamp, wpos, live, dead, left, swlim, blck;
+    size_t hwsamples, samples, isamp, osamp, wpos, live, dead, left, blck;
+    size_t hw_free;
     size_t ret = 0, pos = 0, total = 0;
 
     if (!sw) {
@@ -710,27 +717,28 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     }
 
     wpos = (sw->hw->mix_buf->pos + live) % hwsamples;
-    samples = size / sw->info.bytes_per_frame;
 
     dead = hwsamples - live;
-    swlim = ((int64_t) dead << 32) / sw->ratio;
-    swlim = MIN (swlim, samples);
-    if (swlim) {
-        sw->conv (sw->buf, buf, swlim);
+    hw_free = audio_pcm_hw_get_free(sw->hw);
+    hw_free = hw_free > live ? hw_free - live : 0;
+    samples = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
+    samples = MIN(samples, size / sw->info.bytes_per_frame);
+    if (samples) {
+        sw->conv(sw->buf, buf, samples);
 
         if (!sw->hw->pcm_ops->volume_out) {
-            mixeng_volume (sw->buf, swlim, &sw->vol);
+            mixeng_volume(sw->buf, samples, &sw->vol);
         }
     }
 
-    while (swlim) {
+    while (samples) {
         dead = hwsamples - live;
         left = hwsamples - wpos;
         blck = MIN (dead, left);
         if (!blck) {
             break;
         }
-        isamp = swlim;
+        isamp = samples;
         osamp = blck;
         st_rate_flow_mix (
             sw->rate,
@@ -740,7 +748,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
             &osamp
             );
         ret += isamp;
-        swlim -= isamp;
+        samples -= isamp;
         pos += isamp;
         live += osamp;
         wpos = (wpos + osamp) % hwsamples;
@@ -1002,6 +1010,11 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     return (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame;
 }
 
+static size_t audio_sw_bytes_free(SWVoiceOut *sw, size_t free)
+{
+    return (((int64_t)free << 32) / sw->ratio) * sw->info.bytes_per_frame;
+}
+
 static size_t audio_get_free(SWVoiceOut *sw)
 {
     size_t live, dead;
@@ -1021,13 +1034,11 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf->size - live;
 
 #ifdef DEBUG_OUT
-    dolog ("%s: get_free live %zu dead %zu ret %" PRId64 "\n",
-           SW_NAME (sw),
-           live, dead, (((int64_t) dead << 32) / sw->ratio) *
-           sw->info.bytes_per_frame);
+    dolog("%s: get_free live %zu dead %zu sw_bytes %zu\n",
+          SW_NAME(sw), live, dead, audio_sw_bytes_free(sw, dead));
 #endif
 
-    return (((int64_t) dead << 32) / sw->ratio) * sw->info.bytes_per_frame;
+    return dead;
 }
 
 static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
@@ -1131,12 +1142,21 @@ static void audio_run_out (AudioState *s)
     }
 
     while ((hw = audio_pcm_hw_find_any_enabled_out(s, hw))) {
-        size_t played, live, prev_rpos, free;
+        size_t played, live, prev_rpos;
+        size_t hw_free = audio_pcm_hw_get_free(hw);
         int nb_live;
 
         for (sw = hw->sw_head.lh_first; sw; sw = sw->entries.le_next) {
             if (sw->active) {
-                free = audio_get_free(sw);
+                size_t sw_free = audio_get_free(sw);
+                size_t free;
+
+                if (hw_free > sw->total_hw_samples_mixed) {
+                    free = audio_sw_bytes_free(sw,
+                        MIN(sw_free, hw_free - sw->total_hw_samples_mixed));
+                } else {
+                    free = 0;
+                }
                 if (free > 0) {
                     sw->callback.fn(sw->callback.opaque, free);
                 }
@@ -1398,6 +1418,15 @@ void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
     hw->pending_emul -= size;
 }
 
+size_t audio_generic_buffer_get_free(HWVoiceOut *hw)
+{
+    if (hw->buf_emul) {
+        return hw->size_emul - hw->pending_emul;
+    } else {
+        return hw->samples * hw->info.bytes_per_frame;
+    }
+}
+
 void audio_generic_run_buffer_out(HWVoiceOut *hw)
 {
     while (hw->pending_emul) {
@@ -1445,6 +1474,12 @@ size_t audio_generic_write(HWVoiceOut *hw, void *buf, size_t size)
 {
     size_t total = 0;
 
+    if (hw->pcm_ops->buffer_get_free) {
+        size_t free = hw->pcm_ops->buffer_get_free(hw);
+
+        size = MIN(size, free);
+    }
+
     while (total < size) {
         size_t dst_size = size - total;
         size_t copy_size, proc;
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 2fb459f34e..8b042739ef 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -161,10 +161,14 @@ struct audio_pcm_ops {
     void   (*fini_out)(HWVoiceOut *hw);
     size_t (*write)   (HWVoiceOut *hw, void *buf, size_t size);
     void   (*run_buffer_out)(HWVoiceOut *hw);
+    /*
+     * Get the free output buffer size. This is an upper limit. The size
+     * returned by function get_buffer_out may be smaller.
+     */
+    size_t (*buffer_get_free)(HWVoiceOut *hw);
     /*
      * get a buffer that after later can be passed to put_buffer_out; optional
      * returns the buffer, and writes it's size to size (in bytes)
-     * this is unrelated to the above buffer_size_out function
      */
     void  *(*get_buffer_out)(HWVoiceOut *hw, size_t *size);
     /*
@@ -190,6 +194,7 @@ void audio_generic_run_buffer_in(HWVoiceIn *hw);
 void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size);
 void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size);
 void audio_generic_run_buffer_out(HWVoiceOut *hw);
+size_t audio_generic_buffer_get_free(HWVoiceOut *hw);
 void *audio_generic_get_buffer_out(HWVoiceOut *hw, size_t *size);
 size_t audio_generic_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size);
 size_t audio_generic_write(HWVoiceOut *hw, void *buf, size_t size);
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 1fdd1d4b14..91ea6ae975 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -283,6 +283,7 @@ static int coreaudio_buf_unlock (coreaudioVoiceOut *core, const char *fn_name)
         coreaudio_buf_unlock(core, "coreaudio_" #name);             \
         return ret;                                             \
     }
+COREAUDIO_WRAPPER_FUNC(buffer_get_free, size_t, (HWVoiceOut *hw), (hw))
 COREAUDIO_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
                        (hw, size))
 COREAUDIO_WRAPPER_FUNC(put_buffer_out, size_t,
@@ -652,6 +653,8 @@ static struct audio_pcm_ops coreaudio_pcm_ops = {
     .fini_out = coreaudio_fini_out,
   /* wrapper for audio_generic_write */
     .write    = coreaudio_write,
+  /* wrapper for audio_generic_buffer_get_free */
+    .buffer_get_free = coreaudio_buffer_get_free,
   /* wrapper for audio_generic_get_buffer_out */
     .get_buffer_out = coreaudio_get_buffer_out,
   /* wrapper for audio_generic_put_buffer_out */
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 26246c3a8b..bf757250b5 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -652,6 +652,7 @@ static struct audio_pcm_ops jack_pcm_ops = {
     .init_out       = qjack_init_out,
     .fini_out       = qjack_fini_out,
     .write          = qjack_write,
+    .buffer_get_free = audio_generic_buffer_get_free,
     .run_buffer_out = audio_generic_run_buffer_out,
     .enable_out     = qjack_enable_out,
 
diff --git a/audio/noaudio.c b/audio/noaudio.c
index aac87dbc93..84a6bfbb1c 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -118,6 +118,7 @@ static struct audio_pcm_ops no_pcm_ops = {
     .init_out = no_init_out,
     .fini_out = no_fini_out,
     .write    = no_write,
+    .buffer_get_free = audio_generic_buffer_get_free,
     .run_buffer_out = audio_generic_run_buffer_out,
     .enable_out = no_enable_out,
 
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 60eff66424..1bd6800840 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -389,6 +389,17 @@ static void oss_run_buffer_out(HWVoiceOut *hw)
     }
 }
 
+static size_t oss_buffer_get_free(HWVoiceOut *hw)
+{
+    OSSVoiceOut *oss = (OSSVoiceOut *)hw;
+
+    if (oss->mmapped) {
+        return INT_MAX;
+    } else {
+        return audio_generic_buffer_get_free(hw);
+    }
+}
+
 static void *oss_get_buffer_out(HWVoiceOut *hw, size_t *size)
 {
     OSSVoiceOut *oss = (OSSVoiceOut *) hw;
@@ -750,6 +761,7 @@ static struct audio_pcm_ops oss_pcm_ops = {
     .init_out = oss_init_out,
     .fini_out = oss_fini_out,
     .write    = oss_write,
+    .buffer_get_free = oss_buffer_get_free,
     .run_buffer_out = oss_run_buffer_out,
     .get_buffer_out = oss_get_buffer_out,
     .put_buffer_out = oss_put_buffer_out,
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index d6f3aa1a9a..e605c787ba 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -309,6 +309,7 @@ static void sdl_callback_in(void *opaque, Uint8 *buf, int len)
         SDL_UnlockAudioDevice(sdl->devid);                     \
     }
 
+SDL_WRAPPER_FUNC(buffer_get_free, size_t, (HWVoiceOut *hw), (hw), Out)
 SDL_WRAPPER_FUNC(get_buffer_out, void *, (HWVoiceOut *hw, size_t *size),
                  (hw, size), Out)
 SDL_WRAPPER_FUNC(put_buffer_out, size_t,
@@ -471,6 +472,8 @@ static struct audio_pcm_ops sdl_pcm_ops = {
     .fini_out = sdl_fini_out,
   /* wrapper for audio_generic_write */
     .write    = sdl_write,
+  /* wrapper for audio_generic_buffer_get_free */
+    .buffer_get_free = sdl_buffer_get_free,
   /* wrapper for audio_generic_get_buffer_out */
     .get_buffer_out = sdl_get_buffer_out,
   /* wrapper for audio_generic_put_buffer_out */
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 20e6853f85..ac666335c7 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -197,6 +197,7 @@ static struct audio_pcm_ops wav_pcm_ops = {
     .init_out = wav_init_out,
     .fini_out = wav_fini_out,
     .write    = wav_write_out,
+    .buffer_get_free = audio_generic_buffer_get_free,
     .run_buffer_out = audio_generic_run_buffer_out,
     .enable_out = wav_enable_out,
 };
-- 
2.31.1


