Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C05E81E5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:41:34 +0200 (CEST)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obncD-0000N9-4e
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXr-0002mR-3d
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:11 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXp-0005Fh-B8
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:02 -0400
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout04.t-online.de (Postfix) with SMTP id DB69F8D2;
 Fri, 23 Sep 2022 20:36:59 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXn-0XlAHZ0; Fri, 23 Sep 2022 20:36:59 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id AA29520061E; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 09/12] audio: rename audio_sw_bytes_free()
Date: Fri, 23 Sep 2022 20:36:37 +0200
Message-Id: <20220923183640.8314-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958219-01449CE0-45CBAFF7/0/0 CLEAN NORMAL
X-TOI-MSGID: 20505b15-7dc6-4c9e-9f53-7355ce333c46
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename and refactor audio_sw_bytes_free(). This function is not
limited to calculate the free audio buffer size. The renamed
function returns the number of frames instead of bytes.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 233a86c440..dd66b745e5 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1010,9 +1010,16 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     return (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame;
 }
 
-static size_t audio_sw_bytes_free(SWVoiceOut *sw, size_t free)
+/**
+ * audio_frontend_frames_out() - returns the number of frames needed to
+ * get frames_out frames after resampling
+ *
+ * @sw: audio playback frontend
+ * @frames_out: number of frames
+ */
+static size_t audio_frontend_frames_out(SWVoiceOut *sw, size_t frames_out)
 {
-    return (((int64_t)free << 32) / sw->ratio) * sw->info.bytes_per_frame;
+    return ((int64_t)frames_out << 32) / sw->ratio;
 }
 
 static size_t audio_get_free(SWVoiceOut *sw)
@@ -1034,8 +1041,8 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf->size - live;
 
 #ifdef DEBUG_OUT
-    dolog("%s: get_free live %zu dead %zu sw_bytes %zu\n",
-          SW_NAME(sw), live, dead, audio_sw_bytes_free(sw, dead));
+    dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
+          SW_NAME(sw), live, dead, audio_frontend_frames_out(sw, dead));
 #endif
 
     return dead;
@@ -1156,13 +1163,14 @@ static void audio_run_out (AudioState *s)
                 size_t free;
 
                 if (hw_free > sw->total_hw_samples_mixed) {
-                    free = audio_sw_bytes_free(sw,
+                    free = audio_frontend_frames_out(sw,
                         MIN(sw_free, hw_free - sw->total_hw_samples_mixed));
                 } else {
                     free = 0;
                 }
                 if (free > 0) {
-                    sw->callback.fn(sw->callback.opaque, free);
+                    sw->callback.fn(sw->callback.opaque,
+                                    free * sw->info.bytes_per_frame);
                 }
             }
         }
-- 
2.35.3


