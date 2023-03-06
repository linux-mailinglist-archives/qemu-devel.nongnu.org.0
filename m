Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CEF6AB6B0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jV-0001D5-WB; Mon, 06 Mar 2023 01:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jT-0000rr-8k
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jR-0000li-AI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuimzO/d8VJ2BRE0OUsGJPQw9elHxlAH19Orsoeh4xM=;
 b=ZhVZen/HcJIzZwwemFhFM0HcQ8fgH/HTGARib4A1tLHY87Rn3haeoNGCdQ4j8w2s0AJ/jn
 KQKzCN0BTKGiLbtETpiiRGbnmJoPumNZTUz2DRtJ7Q22QQrfbdbFhlKYCxnL8ST5ZhtBt0
 WCay2yrMr2BSqrFC7UG869gvw4SXXvY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-VTnorYBjNfGnapAUZ3X_cQ-1; Mon, 06 Mar 2023 01:53:57 -0500
X-MC-Unique: VTnorYBjNfGnapAUZ3X_cQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E043828884;
 Mon,  6 Mar 2023 06:53:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE33C40C10FA;
 Mon,  6 Mar 2023 06:53:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 25/27] audio: handle leftover audio frame from upsampling
Date: Mon,  6 Mar 2023 10:52:00 +0400
Message-Id: <20230306065202.2160066-26-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Upsampling may leave one remaining audio frame in the input
buffer. The emulated audio playback devices are currently
resposible to write this audio frame again in the next write
cycle. Push that task down to audio_pcm_sw_write.

This is another step towards an audio callback interface that
guarantees that when audio frontends are told they can write
n audio frames, they can actually do so.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-13-vr_qemu@t-online.de>
---
 audio/audio_template.h |  6 ++++++
 audio/audio.c          | 34 ++++++++++++++++++++++++++++------
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index a0b653f52c..0d8aab6fad 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -138,6 +138,12 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return -1;
     }
 
+    /*
+     * Allocate one additional audio frame that is needed for upsampling
+     * if the resample buffer size is small. For large buffer sizes take
+     * care of overflows.
+     */
+    samples = samples < INT_MAX ? samples + 1 : INT_MAX;
     sw->resample_buf.buffer = g_new0(st_sample, samples);
     sw->resample_buf.size = samples;
     sw->resample_buf.pos = 0;
diff --git a/audio/audio.c b/audio/audio.c
index dad17e59b8..4836ab8ca8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -731,16 +731,21 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
     hw_free = hw_free > live ? hw_free - live : 0;
     frames_out_max = MIN(dead, hw_free);
     sw_max = st_rate_frames_in(sw->rate, frames_out_max);
-    fe_max = MIN(buf_len / sw->info.bytes_per_frame, sw->resample_buf.size);
+    fe_max = MIN(buf_len / sw->info.bytes_per_frame + sw->resample_buf.pos,
+                 sw->resample_buf.size);
     frames_in_max = MIN(sw_max, fe_max);
 
     if (!frames_in_max) {
         return 0;
     }
 
-    sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
-    if (!sw->hw->pcm_ops->volume_out) {
-        mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
+    if (frames_in_max > sw->resample_buf.pos) {
+        sw->conv(sw->resample_buf.buffer + sw->resample_buf.pos,
+                 buf, frames_in_max - sw->resample_buf.pos);
+        if (!sw->hw->pcm_ops->volume_out) {
+            mixeng_volume(sw->resample_buf.buffer + sw->resample_buf.pos,
+                          frames_in_max - sw->resample_buf.pos, &sw->vol);
+        }
     }
 
     audio_pcm_sw_resample_out(sw, frames_in_max, frames_out_max,
@@ -749,6 +754,22 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
     sw->total_hw_samples_mixed += total_out;
     sw->empty = sw->total_hw_samples_mixed == 0;
 
+    /*
+     * Upsampling may leave one audio frame in the resample buffer. Decrement
+     * total_in by one if there was a leftover frame from the previous resample
+     * pass in the resample buffer. Increment total_in by one if the current
+     * resample pass left one frame in the resample buffer.
+     */
+    if (frames_in_max - total_in == 1) {
+        /* copy one leftover audio frame to the beginning of the buffer */
+        *sw->resample_buf.buffer = *(sw->resample_buf.buffer + total_in);
+        total_in += 1 - sw->resample_buf.pos;
+        sw->resample_buf.pos = 1;
+    } else if (total_in >= sw->resample_buf.pos) {
+        total_in -= sw->resample_buf.pos;
+        sw->resample_buf.pos = 0;
+    }
+
 #ifdef DEBUG_OUT
     dolog (
         "%s: write size %zu written %zu total mixed %zu\n",
@@ -1155,8 +1176,9 @@ static void audio_run_out (AudioState *s)
                 } else {
                     free = 0;
                 }
-                if (free > 0) {
-                    free = MIN(free, sw->resample_buf.size);
+                if (free > sw->resample_buf.pos) {
+                    free = MIN(free, sw->resample_buf.size)
+                           - sw->resample_buf.pos;
                     sw->callback.fn(sw->callback.opaque,
                                     free * sw->info.bytes_per_frame);
                 }
-- 
2.39.2


