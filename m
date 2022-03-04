Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1A4CD6F8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:59:58 +0100 (CET)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9PR-0004y7-Sf
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:59:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8qO-0004HA-Gb
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8qL-0000UJ-Qk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6b57T3LPzo27SGRnrAK7g8DDPQK5CvyyGhlbIQ2i89E=;
 b=QAO3rYBMuDuRuwrxwsgvUz9k+7+IxLUas5HYNpWb02Oba4Ch/G0MbWltzsU1vNGA2gzkS4
 xAGye2FjvoNy3ivzDFbFo3hzHIrEVU8nWAmoiBooUV5Q8g6bzK14elyce6UkTAJiu76F5s
 rr4xjr+h8xd0WXE/+8Ym0pS2r1BmFlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-ePe8unDWNIiIkPLRZzj-TA-1; Fri, 04 Mar 2022 09:23:38 -0500
X-MC-Unique: ePe8unDWNIiIkPLRZzj-TA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0926801AFE;
 Fri,  4 Mar 2022 14:23:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FA802ED75;
 Fri,  4 Mar 2022 14:23:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C15CB18009AB; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/35] audio: restore mixing-engine playback buffer size
Date: Fri,  4 Mar 2022 15:21:05 +0100
Message-Id: <20220304142123.956171-18-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

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
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220301191311.26695-10-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h |  7 ++++-
 audio/alsaaudio.c |  1 +
 audio/audio.c     | 69 +++++++++++++++++++++++++++++++++++------------
 audio/coreaudio.c |  3 +++
 audio/jackaudio.c |  1 +
 audio/noaudio.c   |  1 +
 audio/ossaudio.c  | 12 +++++++++
 audio/sdlaudio.c  |  3 +++
 audio/wavaudio.c  |  1 +
 9 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 71be162271b5..2a6914d2aa65 100644
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
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 2b9789e64771..b04716a6cc21 100644
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
index c420a8bd1c4a..a88572e71388 100644
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
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 1fdd1d4b14f6..91ea6ae975e5 100644
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
index 26246c3a8b43..bf757250b597 100644
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
index aac87dbc93fb..84a6bfbb1c87 100644
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
index 60eff66424b9..1bd680084065 100644
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
index d6f3aa1a9ac5..e605c787baf3 100644
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
index 20e6853f8586..ac666335c783 100644
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
2.35.1


