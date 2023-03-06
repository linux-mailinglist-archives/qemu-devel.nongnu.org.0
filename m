Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5BA6AB6A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4io-0005LU-9t; Mon, 06 Mar 2023 01:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4il-00059i-W1
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4ik-0000cw-GF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6zt1uSG9X48dgL0Tay8tYwYpJZ8bknuKc0j3o61R/s=;
 b=dzFSGKChAJwod8s0pdlxXqwQdYaYRSx6SiZQxMDhzirJ8IGdXCW7Zfv48EFtzwqKjP8lcg
 2hxJJP5C9R0qx9n35cv15fbUwxYGnOAC3jc/B61XqQruke+S0uOaxkzz+j3fcTHdupzypl
 U+egsnmSVooiV2dMY0SCAydDMtdnKxY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-Cgm9DpW7OG2pQARExHyTjw-1; Mon, 06 Mar 2023 01:53:16 -0500
X-MC-Unique: Cgm9DpW7OG2pQARExHyTjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CEE6101A521;
 Mon,  6 Mar 2023 06:53:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA5A40CF8F0;
 Mon,  6 Mar 2023 06:53:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 16/27] audio: replace the resampling loop in
 audio_pcm_sw_write()
Date: Mon,  6 Mar 2023 10:51:51 +0400
Message-Id: <20230306065202.2160066-17-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Replace the resampling loop in audio_pcm_sw_write() with the new
function audio_pcm_sw_resample_out(). Unlike the old resample
loop the new function will try to consume input frames even if
the output buffer is full. This is necessary when downsampling
to avoid reading less audio frames than calculated in advance.
The loop was unrolled to avoid complicated loop control conditions
in this case.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-4-vr_qemu@t-online.de>
---
 audio/audio.c | 63 +++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index a399147486..4412b5fad8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -673,11 +673,44 @@ static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
 /*
  * Soft voice (playback)
  */
+static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
+    size_t frames_in_max, size_t frames_out_max,
+    size_t *total_in, size_t *total_out)
+{
+    HWVoiceOut *hw = sw->hw;
+    struct st_sample *src, *dst;
+    size_t live, wpos, frames_in, frames_out;
+
+    live = sw->total_hw_samples_mixed;
+    wpos = (hw->mix_buf.pos + live) % hw->mix_buf.size;
+
+    /* write to mix_buf from wpos to end of buffer */
+    src = sw->resample_buf.buffer;
+    frames_in = frames_in_max;
+    dst = hw->mix_buf.buffer + wpos;
+    frames_out = MIN(frames_out_max, hw->mix_buf.size - wpos);
+    st_rate_flow_mix(sw->rate, src, dst, &frames_in, &frames_out);
+    wpos += frames_out;
+    *total_in = frames_in;
+    *total_out = frames_out;
+
+    /* write to mix_buf from start of buffer if there are input frames left */
+    if (frames_in_max - frames_in > 0 && wpos == hw->mix_buf.size) {
+        src += frames_in;
+        frames_in = frames_in_max - frames_in;
+        dst = hw->mix_buf.buffer;
+        frames_out = frames_out_max - frames_out;
+        st_rate_flow_mix(sw->rate, src, dst, &frames_in, &frames_out);
+        *total_in += frames_in;
+        *total_out += frames_out;
+    }
+}
+
 static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
 {
-    size_t hwsamples, samples, isamp, osamp, wpos, live, dead, left, blck;
+    size_t hwsamples, samples, live, dead;
     size_t hw_free;
-    size_t ret = 0, pos = 0, total = 0;
+    size_t ret, total;
 
     if (!sw) {
         return size;
@@ -698,8 +731,6 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         return 0;
     }
 
-    wpos = (sw->hw->mix_buf.pos + live) % hwsamples;
-
     dead = hwsamples - live;
     hw_free = audio_pcm_hw_get_free(sw->hw);
     hw_free = hw_free > live ? hw_free - live : 0;
@@ -713,29 +744,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         }
     }
 
-    while (samples) {
-        dead = hwsamples - live;
-        left = hwsamples - wpos;
-        blck = MIN (dead, left);
-        if (!blck) {
-            break;
-        }
-        isamp = samples;
-        osamp = blck;
-        st_rate_flow_mix (
-            sw->rate,
-            sw->resample_buf.buffer + pos,
-            sw->hw->mix_buf.buffer + wpos,
-            &isamp,
-            &osamp
-            );
-        ret += isamp;
-        samples -= isamp;
-        pos += isamp;
-        live += osamp;
-        wpos = (wpos + osamp) % hwsamples;
-        total += osamp;
-    }
+    audio_pcm_sw_resample_out(sw, samples, MIN(dead, hw_free), &ret, &total);
 
     sw->total_hw_samples_mixed += total;
     sw->empty = sw->total_hw_samples_mixed == 0;
-- 
2.39.2


