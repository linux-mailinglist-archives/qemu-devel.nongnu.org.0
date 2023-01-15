Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D966B127
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 14:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2oc-000450-8u; Sun, 15 Jan 2023 08:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oa-00044m-JJ
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:48 -0500
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2oY-0005Az-TJ
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:12:48 -0500
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout04.t-online.de (Postfix) with SMTP id 8639EFD46;
 Sun, 15 Jan 2023 14:12:45 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd76.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH2oX-0pLTCT0; Sun, 15 Jan 2023 14:12:45 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 69A0020063D; Sun, 15 Jan 2023 14:12:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 10/17] audio: wire up st_rate_frames_in()
Date: Sun, 15 Jan 2023 14:12:17 +0100
Message-Id: <20230115131224.30751-10-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: c3004046-2014-4013-8ddd-4673521944f3
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
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

Wire up the st_rate_frames_in() function and replace
audio_frontend_frames_out() to make audio packet length
calculation exact. When upsampling, it's still possible that
the audio frontends can't write the last audio frame. This will
be fixed later.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 9c0855fb13..3d3b5e5b91 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -699,8 +699,8 @@ static void audio_pcm_sw_resample_out(SWVoiceOut *sw,
 static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
 {
     HWVoiceOut *hw = sw->hw;
-    size_t live, dead, hw_free;
-    size_t frames_in_max, total_in, total_out;
+    size_t live, dead, hw_free, sw_max, fe_max;
+    size_t frames_in_max, frames_out_max, total_in, total_out;
 
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hw->mix_buf.size)) {
@@ -718,17 +718,21 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t buf_len)
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
@@ -998,18 +1002,6 @@ static size_t audio_get_avail (SWVoiceIn *sw)
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
@@ -1029,8 +1021,8 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf.size - live;
 
 #ifdef DEBUG_OUT
-    dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
-          SW_NAME(sw), live, dead, audio_frontend_frames_out(sw, dead));
+    dolog("%s: get_free live %zu dead %zu frontend frames %u\n",
+          SW_NAME(sw), live, dead, st_rate_frames_in(sw->rate, dead));
 #endif
 
     return dead;
@@ -1159,12 +1151,13 @@ static void audio_run_out (AudioState *s)
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
-- 
2.35.3


