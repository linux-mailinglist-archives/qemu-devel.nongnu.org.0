Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E354B6AB6A9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:55:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4j1-0006m7-Dl; Mon, 06 Mar 2023 01:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iz-0006Yz-0e
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iw-0000dh-MF
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwPNwQ6pIL7uo3U78G1rhRJbhPeTDa4bhCJn1pXt4bA=;
 b=I+deaeitnznXvHkT6lRDnjCbnWkipCpa3N/b56urOsF9Vi7Q54YHmnKGXEeHjl5UBh5YGd
 1qAo/NgqQo/9/Ra2DSaSEShQ8NrMZI/jGvAQ5DdHmhRderIj4QexoGEAMAbn2eXU0nXLyP
 eSJMhpS9vnKGVNumUjGWtEVhyupl3+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-pRhmG3t8MTGFXbKl7lwKVQ-1; Mon, 06 Mar 2023 01:53:26 -0500
X-MC-Unique: pRhmG3t8MTGFXbKl7lwKVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 649E585A588;
 Mon,  6 Mar 2023 06:53:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A33A2C16029;
 Mon,  6 Mar 2023 06:53:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 18/27] audio: rename variables in audio_pcm_sw_write()
Date: Mon,  6 Mar 2023 10:51:53 +0400
Message-Id: <20230306065202.2160066-19-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

The audio_pcm_sw_write() function uses a lot of very unspecific
variable names. Rename them for better readability.

ret => total_in
total => total_out
size => buf_len
hwsamples => hw->mix_buf.size
samples => frames_in_max

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-6-vr_qemu@t-online.de>
---
 audio/audio.c | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 8f1c0e77b0..cd10f1ec10 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -706,56 +706,55 @@ static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
     }
 }
 
-static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
+static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
 {
-    size_t hwsamples, samples, live, dead;
-    size_t hw_free;
-    size_t ret, total;
-
-    hwsamples = sw->hw->mix_buf.size;
+    HWVoiceOut *hw = sw->hw;
+    size_t live, dead, hw_free;
+    size_t frames_in_max, total_in, total_out;
 
     live = sw->total_hw_samples_mixed;
-    if (audio_bug(__func__, live > hwsamples)) {
-        dolog("live=%zu hw->mix_buf.size=%zu\n", live, hwsamples);
+    if (audio_bug(__func__, live > hw->mix_buf.size)) {
+        dolog("live=%zu hw->mix_buf.size=%zu\n", live, hw->mix_buf.size);
         return 0;
     }
 
-    if (live == hwsamples) {
+    if (live == hw->mix_buf.size) {
 #ifdef DEBUG_OUT
         dolog ("%s is full %zu\n", sw->name, live);
 #endif
         return 0;
     }
 
-    dead = hwsamples - live;
-    hw_free = audio_pcm_hw_get_free(sw->hw);
+    dead = hw->mix_buf.size - live;
+    hw_free = audio_pcm_hw_get_free(hw);
     hw_free = hw_free > live ? hw_free - live : 0;
-    samples = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
-    samples = MIN(samples, size / sw->info.bytes_per_frame);
-    if (samples) {
-        sw->conv(sw->resample_buf.buffer, buf, samples);
+    frames_in_max = ((int64_t)MIN(dead, hw_free) << 32) / sw->ratio;
+    frames_in_max = MIN(frames_in_max, buf_len / sw->info.bytes_per_frame);
+    if (frames_in_max) {
+        sw->conv(sw->resample_buf.buffer, buf, frames_in_max);
 
         if (!sw->hw->pcm_ops->volume_out) {
-            mixeng_volume(sw->resample_buf.buffer, samples, &sw->vol);
+            mixeng_volume(sw->resample_buf.buffer, frames_in_max, &sw->vol);
         }
     }
 
-    audio_pcm_sw_resample_out(sw, samples, MIN(dead, hw_free), &ret, &total);
+    audio_pcm_sw_resample_out(sw, frames_in_max, MIN(dead, hw_free),
+                              &total_in, &total_out);
 
-    sw->total_hw_samples_mixed += total;
+    sw->total_hw_samples_mixed += total_out;
     sw->empty = sw->total_hw_samples_mixed == 0;
 
 #ifdef DEBUG_OUT
     dolog (
-        "%s: write size %zu ret %zu total sw %zu\n",
-        SW_NAME (sw),
-        size / sw->info.bytes_per_frame,
-        ret,
+        "%s: write size %zu written %zu total mixed %zu\n",
+        SW_NAME(sw),
+        buf_len / sw->info.bytes_per_frame,
+        total_in,
         sw->total_hw_samples_mixed
         );
 #endif
 
-    return ret * sw->info.bytes_per_frame;
+    return total_in * sw->info.bytes_per_frame;
 }
 
 #ifdef DEBUG_AUDIO
-- 
2.39.2


