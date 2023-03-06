Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D256AB6A1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4ij-0004k9-GC; Mon, 06 Mar 2023 01:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4ie-0004dl-Tv
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4id-0000cT-9O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2FQpTcG1yhg6uUjwvVLwrL4wtemMxEs9MOgcxFL1hE=;
 b=Q1Viuui0xqLJu3WO1zH0em5joLveBAx9iTeLNQ4I/Stx49hH8W8HDab6tkSCGl9ZDnyFHS
 mh7jY8NpFZYpLv1RAoYV3g+/V7b/6TG9MOX9Qu2Rgx4zKwtlTL1RTfKDV7ULKTYPgA8sW/
 SHPsdSQ5qC8Up+qXY03dzEn396EfBl0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-x86T3C7QNH-5JYGz5puodA-1; Mon, 06 Mar 2023 01:53:07 -0500
X-MC-Unique: x86T3C7QNH-5JYGz5puodA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD3C885620;
 Mon,  6 Mar 2023 06:53:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99CAB492C14;
 Mon,  6 Mar 2023 06:53:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 14/27] audio: change type and name of the resample buffer
Date: Mon,  6 Mar 2023 10:51:49 +0400
Message-Id: <20230306065202.2160066-15-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Change the type of the resample buffer from struct st_sample *
to STSampleBuffer. Also change the name from buf to resample_buf
for better readability.

The new variables resample_buf.size and resample_buf.pos will be
used after the next patches. There is no functional change.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-2-vr_qemu@t-online.de>
---
 audio/audio_int.h      |  4 ++--
 audio/audio_template.h | 10 ++++++----
 audio/audio.c          | 15 ++++++++-------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 061845dcc2..8b163e1759 100644
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
index dd87170cbd..a0b653f52c 100644
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
 
@@ -138,7 +138,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return -1;
     }
 
-    sw->buf = g_new0(st_sample, samples);
+    sw->resample_buf.buffer = g_new0(st_sample, samples);
+    sw->resample_buf.size = samples;
+    sw->resample_buf.pos = 0;
 
 #ifdef DAC
     sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
diff --git a/audio/audio.c b/audio/audio.c
index a0b54e4a2e..a399147486 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -555,7 +555,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
 {
     HWVoiceIn *hw = sw->hw;
     size_t samples, live, ret = 0, swlim, isamp, osamp, rpos, total = 0;
-    struct st_sample *src, *dst = sw->buf;
+    struct st_sample *src, *dst = sw->resample_buf.buffer;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -595,10 +595,10 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
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
@@ -706,10 +706,10 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
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
 
@@ -724,7 +724,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         osamp = blck;
         st_rate_flow_mix (
             sw->rate,
-            sw->buf + pos,
+            sw->resample_buf.buffer + pos,
             sw->hw->mix_buf.buffer + wpos,
             &isamp,
             &osamp
@@ -1061,7 +1061,8 @@ static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
                 size_t bytes = to_write * hw->info.bytes_per_frame;
                 size_t written;
 
-                sw->buf = hw->mix_buf.buffer + rpos2;
+                sw->resample_buf.buffer = hw->mix_buf.buffer + rpos2;
+                sw->resample_buf.size = to_write;
                 written = audio_pcm_sw_write (sw, NULL, bytes);
                 if (written - bytes) {
                     dolog("Could not mix %zu bytes into a capture "
-- 
2.39.2


