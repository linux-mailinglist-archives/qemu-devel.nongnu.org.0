Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4566B12B
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 14:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2og-00049G-7d; Sun, 15 Jan 2023 08:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2od-00045u-Pw
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:51 -0500
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oc-0005BX-4W
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:51 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout01.t-online.de (Postfix) with SMTP id 85F8A16B21;
 Sun, 15 Jan 2023 14:12:48 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH2oZ-1TIEi10; Sun, 15 Jan 2023 14:12:47 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 6C3BC2006C1; Sun, 15 Jan 2023 14:12:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 11/17] audio: replace the resampling loop in
 audio_pcm_sw_read()
Date: Sun, 15 Jan 2023 14:12:18 +0100
Message-Id: <20230115131224.30751-11-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: 6e23ab49-bdc3-4820-acf2-2d1c3cca5264
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
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

Replace the resampling loop in audio_pcm_sw_read() with the new
function audio_pcm_sw_resample_in(). Unlike the old resample
loop the new function will try to consume input frames even if
the output buffer is full. This is necessary when downsampling
to avoid reading less audio frames than calculated in advance.
The loop was unrolled to avoid complicated loop control conditions
in this case.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 59 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 3d3b5e5b91..83bac97fa4 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -541,11 +541,43 @@ static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
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
+    frames_in = MIN(live, hw->conv_buf.size - rpos);
+    dst = sw->resample_buf.buffer;
+    frames_out = frames_out_max;
+    st_rate_flow(sw->rate, src, dst, &frames_in, &frames_out);
+    rpos += frames_in;
+    *total_in = frames_in;
+    *total_out = frames_out;
+
+    /* resample conv_buf from start of buffer if there are input frames left */
+    if (live - frames_in && rpos == hw->conv_buf.size) {
+        src = hw->conv_buf.buffer;
+        frames_in = live - frames_in;
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
@@ -556,33 +588,12 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
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
2.35.3


