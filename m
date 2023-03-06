Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C76AB6A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jH-0007W0-LY; Mon, 06 Mar 2023 01:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jB-0007Js-G8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4j9-0000fg-Mk
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dh8U8ZI9KBza+k43IZOFEFVeIbZ12o7LeRarBtaovhY=;
 b=io0ODfOzinwnuTuyJDGis5K2jo9XD0DPnbLuUvE1fNfx+JYb0k/GduRQw5HlkybrCdnUMi
 NNA9KFZPnoxSwPzQTHZ9jAZh1Z3vWqZeCW0mwIvGZBuLMUPuJ79QsnFHPGPiv1rcpeCGqW
 f3XNWXDWM6KYR5CnbJ9P34AeqlUUn9c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-S_t4StiCMdqGdLNl85vrnw-1; Mon, 06 Mar 2023 01:53:39 -0500
X-MC-Unique: S_t4StiCMdqGdLNl85vrnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02A7C1C05153;
 Mon,  6 Mar 2023 06:53:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F44E140EBF4;
 Mon,  6 Mar 2023 06:53:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 21/27] audio: make playback packet length calculation exact
Date: Mon,  6 Mar 2023 10:51:56 +0400
Message-Id: <20230306065202.2160066-22-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
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
Message-Id: <20230224190555.7409-9-vr_qemu@t-online.de>
---
 audio/mixeng.h |  1 +
 audio/audio.c  | 43 ++++++++++++++++++-------------------------
 audio/mixeng.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 25 deletions(-)

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
-- 
2.39.2


