Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3E66B12C
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 14:14:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2oU-0003zc-S0; Sun, 15 Jan 2023 08:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oP-0003ys-J0
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:37 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oN-00058w-Ma
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:37 -0500
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout08.t-online.de (Postfix) with SMTP id A619C29F8A;
 Sun, 15 Jan 2023 14:12:33 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd78.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH2oJ-0XixtJ0; Sun, 15 Jan 2023 14:12:31 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5A2C620062C; Sun, 15 Jan 2023 14:12:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 04/17] audio: replace the resampling loop in
 audio_pcm_sw_write()
Date: Sun, 15 Jan 2023 14:12:11 +0100
Message-Id: <20230115131224.30751-4-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: 32774ffe-89d7-483a-ad47-1d813119a757
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 63 +++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 22ec7d3093..b0a270ba85 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -671,11 +671,44 @@ static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
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
@@ -696,8 +729,6 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
         return 0;
     }
 
-    wpos = (sw->hw->mix_buf.pos + live) % hwsamples;
-
     dead = hwsamples - live;
     hw_free = audio_pcm_hw_get_free(sw->hw);
     hw_free = hw_free > live ? hw_free - live : 0;
@@ -711,29 +742,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
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
2.35.3


