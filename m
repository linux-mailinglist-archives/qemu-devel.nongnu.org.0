Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93016AB6A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jx-0003Zp-0Y; Mon, 06 Mar 2023 01:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jh-0003UQ-RK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jg-0000oY-2S
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggt8FwJW8zLOr7hMWJ5Ndtn7i62j3eDjXuDyuKvWV/k=;
 b=e3KMWvbqjZzgD7EdM+innvH/nsAFE1ANSx6Hw71o/gWCOM1be7SLuw+MQYri2f1ouYu4za
 zFcaLnS9RwdE/H7WS3qjN+LNMA8eJu1WwqYMgZuibQW25LHCx06YWdoiHqeElvQNOObt+H
 xcWEyXZN5f19S7HyN3x/ppHc/YEQyfQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-HOTDyiwWPtKpPoHkCCBHLg-1; Mon, 06 Mar 2023 01:54:10 -0500
X-MC-Unique: HOTDyiwWPtKpPoHkCCBHLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1E6A1C068C1;
 Mon,  6 Mar 2023 06:54:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E8B9175AD;
 Mon,  6 Mar 2023 06:54:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 27/27] audio: remove sw->ratio
Date: Mon,  6 Mar 2023 10:52:02 +0400
Message-Id: <20230306065202.2160066-28-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Message-Id: <20230224190555.7409-15-vr_qemu@t-online.de>
---
 audio/audio_int.h      |  2 --
 audio/audio_template.h | 30 +++++++++---------------------
 audio/audio.c          |  1 -
 3 files changed, 9 insertions(+), 24 deletions(-)

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
-- 
2.39.2


