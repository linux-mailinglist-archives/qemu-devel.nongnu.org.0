Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B56AB698
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4ii-0004fO-Dg; Mon, 06 Mar 2023 01:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4ib-0004TK-T7
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iZ-0000ad-9b
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXVhEI3VV9QdaCsWCNydqkF5yjII5yuFrvj0HQWqhyQ=;
 b=DGXiFG7iJtpnq+zzEO/KO5dvgOytx6mJd7oz7X0tL/OF3JdBFdIYy3BxUIohojAyxa08KK
 rva3EGXFXNVAaXo/kij0UKPJniYtu/nspJA0okJ/ByqSQYTW92J3k/LN0xfrYZIWuljrK2
 uJt8OyqH9+mYv9zGRUPmeOkRS9lRDoE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-eKXjPZNwOoulrx6cVT4_Og-1; Mon, 06 Mar 2023 01:53:03 -0500
X-MC-Unique: eKXjPZNwOoulrx6cVT4_Og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D29BC101A55E;
 Mon,  6 Mar 2023 06:53:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21E68C1602A;
 Mon,  6 Mar 2023 06:53:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 13/27] audio: change type of mix_buf and conv_buf
Date: Mon,  6 Mar 2023 10:51:48 +0400
Message-Id: <20230306065202.2160066-14-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Change the type of mix_buf in struct HWVoiceOut and conv_buf
in struct HWVoiceIn from STSampleBuffer * to STSampleBuffer.
However, a buffer pointer is still needed. For this reason in
struct STSampleBuffer samples[] is changed to *buffer.

This is a preparation for the next patch. The next patch will
add this line, which is not possible with the current struct
STSampleBuffer definition.

+        sw->resample_buf.buffer = hw->mix_buf.buffer + rpos2;

There are no functional changes.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-1-vr_qemu@t-online.de>
---
 audio/audio_int.h      |   6 +--
 audio/audio_template.h |  19 ++++----
 audio/audio.c          | 106 ++++++++++++++++++++---------------------
 3 files changed, 67 insertions(+), 64 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 5028f2354a..061845dcc2 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -58,7 +58,7 @@ typedef struct SWVoiceCap SWVoiceCap;
 
 typedef struct STSampleBuffer {
     size_t pos, size;
-    st_sample samples[];
+    st_sample *buffer;
 } STSampleBuffer;
 
 typedef struct HWVoiceOut {
@@ -71,7 +71,7 @@ typedef struct HWVoiceOut {
     f_sample *clip;
     uint64_t ts_helper;
 
-    STSampleBuffer *mix_buf;
+    STSampleBuffer mix_buf;
     void *buf_emul;
     size_t pos_emul, pending_emul, size_emul;
 
@@ -93,7 +93,7 @@ typedef struct HWVoiceIn {
     size_t total_samples_captured;
     uint64_t ts_helper;
 
-    STSampleBuffer *conv_buf;
+    STSampleBuffer conv_buf;
     void *buf_emul;
     size_t pos_emul, pending_emul, size_emul;
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 980e1f4bd0..dd87170cbd 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -71,8 +71,9 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
 static void glue (audio_pcm_hw_free_resources_, TYPE) (HW *hw)
 {
     g_free(hw->buf_emul);
-    g_free (HWBUF);
-    HWBUF = NULL;
+    g_free(HWBUF.buffer);
+    HWBUF.buffer = NULL;
+    HWBUF.size = 0;
 }
 
 static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
@@ -83,10 +84,12 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
             dolog("Attempted to allocate empty buffer\n");
         }
 
-        HWBUF = g_malloc0(sizeof(STSampleBuffer) + sizeof(st_sample) * samples);
-        HWBUF->size = samples;
+        HWBUF.buffer = g_new0(st_sample, samples);
+        HWBUF.size = samples;
+        HWBUF.pos = 0;
     } else {
-        HWBUF = NULL;
+        HWBUF.buffer = NULL;
+        HWBUF.size = 0;
     }
 }
 
@@ -111,9 +114,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     }
 
 #ifdef DAC
-    samples = ((int64_t) sw->HWBUF->size << 32) / sw->ratio;
+    samples = ((int64_t)sw->HWBUF.size << 32) / sw->ratio;
 #else
-    samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
+    samples = (int64_t)sw->HWBUF.size * sw->ratio >> 32;
 #endif
     if (audio_bug(__func__, samples < 0)) {
         dolog("Can not allocate buffer for `%s' (%d samples)\n",
@@ -126,7 +129,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         size_t f_fe_min;
 
         /* f_fe_min = ceil(1 [frames] * f_be [Hz] / size_be [frames]) */
-        f_fe_min = (hw->info.freq + HWBUF->size - 1) / HWBUF->size;
+        f_fe_min = (hw->info.freq + HWBUF.size - 1) / HWBUF.size;
         qemu_log_mask(LOG_UNIMP,
                       AUDIO_CAP ": The guest selected a " NAME " sample rate"
                       " of %d Hz for %s. Only sample rates >= %zu Hz are"
diff --git a/audio/audio.c b/audio/audio.c
index 772c3cc320..a0b54e4a2e 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -523,8 +523,8 @@ static size_t audio_pcm_hw_find_min_in (HWVoiceIn *hw)
 static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
 {
     size_t live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
-    if (audio_bug(__func__, live > hw->conv_buf->size)) {
-        dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
+    if (audio_bug(__func__, live > hw->conv_buf.size)) {
+        dolog("live=%zu hw->conv_buf.size=%zu\n", live, hw->conv_buf.size);
         return 0;
     }
     return live;
@@ -533,13 +533,13 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
 static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
 {
     size_t conv = 0;
-    STSampleBuffer *conv_buf = hw->conv_buf;
+    STSampleBuffer *conv_buf = &hw->conv_buf;
 
     while (samples) {
         uint8_t *src = advance(pcm_buf, conv * hw->info.bytes_per_frame);
         size_t proc = MIN(samples, conv_buf->size - conv_buf->pos);
 
-        hw->conv(conv_buf->samples + conv_buf->pos, src, proc);
+        hw->conv(conv_buf->buffer + conv_buf->pos, src, proc);
         conv_buf->pos = (conv_buf->pos + proc) % conv_buf->size;
         samples -= proc;
         conv += proc;
@@ -561,12 +561,12 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     if (!live) {
         return 0;
     }
-    if (audio_bug(__func__, live > hw->conv_buf->size)) {
-        dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
+    if (audio_bug(__func__, live > hw->conv_buf.size)) {
+        dolog("live_in=%zu hw->conv_buf.size=%zu\n", live, hw->conv_buf.size);
         return 0;
     }
 
-    rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
+    rpos = audio_ring_posb(hw->conv_buf.pos, live, hw->conv_buf.size);
 
     samples = size / sw->info.bytes_per_frame;
 
@@ -574,11 +574,11 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     swlim = MIN (swlim, samples);
 
     while (swlim) {
-        src = hw->conv_buf->samples + rpos;
-        if (hw->conv_buf->pos > rpos) {
-            isamp = hw->conv_buf->pos - rpos;
+        src = hw->conv_buf.buffer + rpos;
+        if (hw->conv_buf.pos > rpos) {
+            isamp = hw->conv_buf.pos - rpos;
         } else {
-            isamp = hw->conv_buf->size - rpos;
+            isamp = hw->conv_buf.size - rpos;
         }
 
         if (!isamp) {
@@ -588,7 +588,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
 
         st_rate_flow (sw->rate, src, dst, &isamp, &osamp);
         swlim -= osamp;
-        rpos = (rpos + isamp) % hw->conv_buf->size;
+        rpos = (rpos + isamp) % hw->conv_buf.size;
         dst += osamp;
         ret += osamp;
         total += isamp;
@@ -636,8 +636,8 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
     if (nb_live1) {
         size_t live = smin;
 
-        if (audio_bug(__func__, live > hw->mix_buf->size)) {
-            dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
+        if (audio_bug(__func__, live > hw->mix_buf.size)) {
+            dolog("live=%zu hw->mix_buf.size=%zu\n", live, hw->mix_buf.size);
             return 0;
         }
         return live;
@@ -654,17 +654,17 @@ static size_t audio_pcm_hw_get_free(HWVoiceOut *hw)
 static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
 {
     size_t clipped = 0;
-    size_t pos = hw->mix_buf->pos;
+    size_t pos = hw->mix_buf.pos;
 
     while (len) {
-        st_sample *src = hw->mix_buf->samples + pos;
+        st_sample *src = hw->mix_buf.buffer + pos;
         uint8_t *dst = advance(pcm_buf, clipped * hw->info.bytes_per_frame);
-        size_t samples_till_end_of_buf = hw->mix_buf->size - pos;
+        size_t samples_till_end_of_buf = hw->mix_buf.size - pos;
         size_t samples_to_clip = MIN(len, samples_till_end_of_buf);
 
         hw->clip(dst, src, samples_to_clip);
 
-        pos = (pos + samples_to_clip) % hw->mix_buf->size;
+        pos = (pos + samples_to_clip) % hw->mix_buf.size;
         len -= samples_to_clip;
         clipped += samples_to_clip;
     }
@@ -683,11 +683,11 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         return size;
     }
 
-    hwsamples = sw->hw->mix_buf->size;
+    hwsamples = sw->hw->mix_buf.size;
 
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hwsamples)) {
-        dolog("live=%zu hw->mix_buf->size=%zu\n", live, hwsamples);
+        dolog("live=%zu hw->mix_buf.size=%zu\n", live, hwsamples);
         return 0;
     }
 
@@ -698,7 +698,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         return 0;
     }
 
-    wpos = (sw->hw->mix_buf->pos + live) % hwsamples;
+    wpos = (sw->hw->mix_buf.pos + live) % hwsamples;
 
     dead = hwsamples - live;
     hw_free = audio_pcm_hw_get_free(sw->hw);
@@ -725,7 +725,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         st_rate_flow_mix (
             sw->rate,
             sw->buf + pos,
-            sw->hw->mix_buf->samples + wpos,
+            sw->hw->mix_buf.buffer + wpos,
             &isamp,
             &osamp
             );
@@ -989,9 +989,9 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     live = sw->hw->total_samples_captured - sw->total_hw_samples_acquired;
-    if (audio_bug(__func__, live > sw->hw->conv_buf->size)) {
-        dolog("live=%zu sw->hw->conv_buf->size=%zu\n", live,
-              sw->hw->conv_buf->size);
+    if (audio_bug(__func__, live > sw->hw->conv_buf.size)) {
+        dolog("live=%zu sw->hw->conv_buf.size=%zu\n", live,
+              sw->hw->conv_buf.size);
         return 0;
     }
 
@@ -1026,13 +1026,13 @@ static size_t audio_get_free(SWVoiceOut *sw)
 
     live = sw->total_hw_samples_mixed;
 
-    if (audio_bug(__func__, live > sw->hw->mix_buf->size)) {
-        dolog("live=%zu sw->hw->mix_buf->size=%zu\n", live,
-              sw->hw->mix_buf->size);
+    if (audio_bug(__func__, live > sw->hw->mix_buf.size)) {
+        dolog("live=%zu sw->hw->mix_buf.size=%zu\n", live,
+              sw->hw->mix_buf.size);
         return 0;
     }
 
-    dead = sw->hw->mix_buf->size - live;
+    dead = sw->hw->mix_buf.size - live;
 
 #ifdef DEBUG_OUT
     dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
@@ -1056,12 +1056,12 @@ static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
 
             n = samples;
             while (n) {
-                size_t till_end_of_hw = hw->mix_buf->size - rpos2;
+                size_t till_end_of_hw = hw->mix_buf.size - rpos2;
                 size_t to_write = MIN(till_end_of_hw, n);
                 size_t bytes = to_write * hw->info.bytes_per_frame;
                 size_t written;
 
-                sw->buf = hw->mix_buf->samples + rpos2;
+                sw->buf = hw->mix_buf.buffer + rpos2;
                 written = audio_pcm_sw_write (sw, NULL, bytes);
                 if (written - bytes) {
                     dolog("Could not mix %zu bytes into a capture "
@@ -1070,14 +1070,14 @@ static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
                     break;
                 }
                 n -= to_write;
-                rpos2 = (rpos2 + to_write) % hw->mix_buf->size;
+                rpos2 = (rpos2 + to_write) % hw->mix_buf.size;
             }
         }
     }
 
-    n = MIN(samples, hw->mix_buf->size - rpos);
-    mixeng_clear(hw->mix_buf->samples + rpos, n);
-    mixeng_clear(hw->mix_buf->samples, samples - n);
+    n = MIN(samples, hw->mix_buf.size - rpos);
+    mixeng_clear(hw->mix_buf.buffer + rpos, n);
+    mixeng_clear(hw->mix_buf.buffer, samples - n);
 }
 
 static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, size_t live)
@@ -1103,7 +1103,7 @@ static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, size_t live)
 
         live -= proc;
         clipped += proc;
-        hw->mix_buf->pos = (hw->mix_buf->pos + proc) % hw->mix_buf->size;
+        hw->mix_buf.pos = (hw->mix_buf.pos + proc) % hw->mix_buf.size;
 
         if (proc == 0 || proc < decr) {
             break;
@@ -1174,8 +1174,8 @@ static void audio_run_out (AudioState *s)
             live = 0;
         }
 
-        if (audio_bug(__func__, live > hw->mix_buf->size)) {
-            dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
+        if (audio_bug(__func__, live > hw->mix_buf.size)) {
+            dolog("live=%zu hw->mix_buf.size=%zu\n", live, hw->mix_buf.size);
             continue;
         }
 
@@ -1203,13 +1203,13 @@ static void audio_run_out (AudioState *s)
             continue;
         }
 
-        prev_rpos = hw->mix_buf->pos;
+        prev_rpos = hw->mix_buf.pos;
         played = audio_pcm_hw_run_out(hw, live);
         replay_audio_out(&played);
-        if (audio_bug(__func__, hw->mix_buf->pos >= hw->mix_buf->size)) {
-            dolog("hw->mix_buf->pos=%zu hw->mix_buf->size=%zu played=%zu\n",
-                  hw->mix_buf->pos, hw->mix_buf->size, played);
-            hw->mix_buf->pos = 0;
+        if (audio_bug(__func__, hw->mix_buf.pos >= hw->mix_buf.size)) {
+            dolog("hw->mix_buf.pos=%zu hw->mix_buf.size=%zu played=%zu\n",
+                  hw->mix_buf.pos, hw->mix_buf.size, played);
+            hw->mix_buf.pos = 0;
         }
 
 #ifdef DEBUG_OUT
@@ -1290,10 +1290,10 @@ static void audio_run_in (AudioState *s)
 
         if (replay_mode != REPLAY_MODE_PLAY) {
             captured = audio_pcm_hw_run_in(
-                hw, hw->conv_buf->size - audio_pcm_hw_get_live_in(hw));
+                hw, hw->conv_buf.size - audio_pcm_hw_get_live_in(hw));
         }
-        replay_audio_in(&captured, hw->conv_buf->samples, &hw->conv_buf->pos,
-                        hw->conv_buf->size);
+        replay_audio_in(&captured, hw->conv_buf.buffer, &hw->conv_buf.pos,
+                        hw->conv_buf.size);
 
         min = audio_pcm_hw_find_min_in (hw);
         hw->total_samples_captured += captured - min;
@@ -1326,14 +1326,14 @@ static void audio_run_capture (AudioState *s)
         SWVoiceOut *sw;
 
         captured = live = audio_pcm_hw_get_live_out (hw, NULL);
-        rpos = hw->mix_buf->pos;
+        rpos = hw->mix_buf.pos;
         while (live) {
-            size_t left = hw->mix_buf->size - rpos;
+            size_t left = hw->mix_buf.size - rpos;
             size_t to_capture = MIN(live, left);
             struct st_sample *src;
             struct capture_callback *cb;
 
-            src = hw->mix_buf->samples + rpos;
+            src = hw->mix_buf.buffer + rpos;
             hw->clip (cap->buf, src, to_capture);
             mixeng_clear (src, to_capture);
 
@@ -1341,10 +1341,10 @@ static void audio_run_capture (AudioState *s)
                 cb->ops.capture (cb->opaque, cap->buf,
                                  to_capture * hw->info.bytes_per_frame);
             }
-            rpos = (rpos + to_capture) % hw->mix_buf->size;
+            rpos = (rpos + to_capture) % hw->mix_buf.size;
             live -= to_capture;
         }
-        hw->mix_buf->pos = rpos;
+        hw->mix_buf.pos = rpos;
 
         for (sw = hw->sw_head.lh_first; sw; sw = sw->entries.le_next) {
             if (!sw->active && sw->empty) {
@@ -1903,7 +1903,7 @@ CaptureVoiceOut *AUD_add_capture(
 
         audio_pcm_init_info (&hw->info, as);
 
-        cap->buf = g_malloc0_n(hw->mix_buf->size, hw->info.bytes_per_frame);
+        cap->buf = g_malloc0_n(hw->mix_buf.size, hw->info.bytes_per_frame);
 
         if (hw->info.is_float) {
             hw->clip = mixeng_clip_float[hw->info.nchannels == 2];
@@ -1955,7 +1955,7 @@ void AUD_del_capture (CaptureVoiceOut *cap, void *cb_opaque)
                     sw = sw1;
                 }
                 QLIST_REMOVE (cap, entries);
-                g_free (cap->hw.mix_buf);
+                g_free(cap->hw.mix_buf.buffer);
                 g_free (cap->buf);
                 g_free (cap);
             }
-- 
2.39.2


