Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289466B136
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 14:15:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2ov-0004iL-Mj; Sun, 15 Jan 2023 08:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2os-0004Ux-IZ
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:13:06 -0500
Received: from mailout10.t-online.de ([194.25.134.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oq-0005Dz-LG
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:13:06 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout10.t-online.de (Postfix) with SMTP id 154C524B34;
 Sun, 15 Jan 2023 14:13:02 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH2on-0gcIwz0; Sun, 15 Jan 2023 14:13:01 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 7BEC72006C9; Sun, 15 Jan 2023 14:12:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 17/17] audio: remove sw->ratio
Date: Sun, 15 Jan 2023 14:12:24 +0100
Message-Id: <20230115131224.30751-17-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: 9eaa5b86-7b91-45d1-828e-0936903caca1
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          | 1 -
 audio/audio_int.h      | 2 --
 audio/audio_template.h | 9 +--------
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index b846b89a27..b68ed4eb68 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -476,7 +476,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
         sw->info = hw->info;
         sw->empty = 1;
         sw->active = hw->enabled;
-        sw->ratio = ((int64_t) hw_cap->info.freq << 32) / sw->info.freq;
         sw->vol = nominal_volume;
         sw->rate = st_rate_start (sw->info.freq, hw_cap->info.freq);
         QLIST_INSERT_HEAD (&hw_cap->sw_head, sw, entries);
diff --git a/audio/audio_int.h b/audio/audio_int.h
index f4ec5dcf11..3cd3539bd4 100644
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
index 0cdf57760e..c053792da3 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -114,11 +114,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return 0;
     }
 
-#ifdef DAC
-    samples = ((int64_t)sw->HWBUF.size << 32) / sw->ratio;
-#else
-    samples = (int64_t)sw->HWBUF.size * sw->ratio >> 32;
-#endif
+    samples = muldiv64(HWBUF.size, sw->info.freq, hw->info.freq);
     if (samples == 0) {
         size_t f_fe_min;
 
@@ -159,11 +155,8 @@ static int glue (audio_pcm_sw_init_, TYPE) (
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
-- 
2.35.3


