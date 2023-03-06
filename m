Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7026AB6A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:54:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jJ-0007jo-4a; Mon, 06 Mar 2023 01:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jG-0007Rm-3X
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jE-0000iK-J8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tf6vk0J2A9SG+DdZ+7X7ukWjXXOcBJkt01MctJforQo=;
 b=Mp1mI9Oi4SZRfYPyEztXXApxVLFgW0D2F0RL9uQHkqaPxpywAgNhUTkledGEpVTnO8hIZx
 vvuM48ok++ORRtbbEV9kA5pufixZwt3fMJqJD6kWTxJAOXIs7GGZ+H6N5HPqoZhPELWJEe
 EPZsHDPK+BLbtne/mshpnNf+2RVps9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-VLTiCfzNMGq7t6AJwMF_uw-1; Mon, 06 Mar 2023 01:53:44 -0500
X-MC-Unique: VLTiCfzNMGq7t6AJwMF_uw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB538588E3;
 Mon,  6 Mar 2023 06:53:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5AF9492C14;
 Mon,  6 Mar 2023 06:53:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 22/27] audio: replace the resampling loop in audio_pcm_sw_read()
Date: Mon,  6 Mar 2023 10:51:57 +0400
Message-Id: <20230306065202.2160066-23-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Replace the resampling loop in audio_pcm_sw_read() with the new
function audio_pcm_sw_resample_in(). Unlike the old resample
loop the new function will try to consume input frames even if
the output buffer is full. This is necessary when downsampling
to avoid reading less audio frames than calculated in advance.
The loop was unrolled to avoid complicated loop control conditions
in this case.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-10-vr_qemu@t-online.de>
---
 audio/audio.c | 59 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index e18b5e98c5..9e9c03a42e 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -543,11 +543,43 @@ static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
 /*
  * Soft voice (capture)
  */
+static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
+    size_t frames_in_max, size_t frames_out_max,
+    size_t *total_in, size_t *total_out)
+{
+    HWVoiceIn *hw = sw->hw;
+    struct st_sample *src, *dst;
+    size_t live, rpos, frames_in, frames_out;
+
+    live = hw->total_samples_captured - sw->total_hw_samples_acquired;
+    rpos = audio_ring_posb(hw->conv_buf.pos, live, hw->conv_buf.size);
+
+    /* resample conv_buf from rpos to end of buffer */
+    src = hw->conv_buf.buffer + rpos;
+    frames_in = MIN(frames_in_max, hw->conv_buf.size - rpos);
+    dst = sw->resample_buf.buffer;
+    frames_out = frames_out_max;
+    st_rate_flow(sw->rate, src, dst, &frames_in, &frames_out);
+    rpos += frames_in;
+    *total_in = frames_in;
+    *total_out = frames_out;
+
+    /* resample conv_buf from start of buffer if there are input frames left */
+    if (frames_in_max - frames_in && rpos == hw->conv_buf.size) {
+        src = hw->conv_buf.buffer;
+        frames_in = frames_in_max - frames_in;
+        dst += frames_out;
+        frames_out = frames_out_max - frames_out;
+        st_rate_flow(sw->rate, src, dst, &frames_in, &frames_out);
+        *total_in += frames_in;
+        *total_out += frames_out;
+    }
+}
+
 static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
 {
     HWVoiceIn *hw = sw->hw;
-    size_t samples, live, ret = 0, swlim, isamp, osamp, rpos, total = 0;
-    struct st_sample *src, *dst = sw->resample_buf.buffer;
+    size_t samples, live, ret, swlim, total;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -558,33 +590,12 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
         return 0;
     }
 
-    rpos = audio_ring_posb(hw->conv_buf.pos, live, hw->conv_buf.size);
-
     samples = size / sw->info.bytes_per_frame;
 
     swlim = (live * sw->ratio) >> 32;
     swlim = MIN (swlim, samples);
 
-    while (swlim) {
-        src = hw->conv_buf.buffer + rpos;
-        if (hw->conv_buf.pos > rpos) {
-            isamp = hw->conv_buf.pos - rpos;
-        } else {
-            isamp = hw->conv_buf.size - rpos;
-        }
-
-        if (!isamp) {
-            break;
-        }
-        osamp = swlim;
-
-        st_rate_flow (sw->rate, src, dst, &isamp, &osamp);
-        swlim -= osamp;
-        rpos = (rpos + isamp) % hw->conv_buf.size;
-        dst += osamp;
-        ret += osamp;
-        total += isamp;
-    }
+    audio_pcm_sw_resample_in(sw, live, swlim, &total, &ret);
 
     if (!hw->pcm_ops->volume_in) {
         mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
-- 
2.39.2


