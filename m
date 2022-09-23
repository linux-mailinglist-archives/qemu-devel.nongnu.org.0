Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221CE5E8227
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:54:31 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnok-0007BQ-63
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXw-0002md-3b
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:15 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:52396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXu-0005Gm-Bm
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:07 -0400
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout08.t-online.de (Postfix) with SMTP id 4F2FF155C4;
 Fri, 23 Sep 2022 20:37:03 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd76.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXq-2ZXwLR0; Fri, 23 Sep 2022 20:37:02 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id AD43520061F; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 10/12] audio: refactor audio_get_avail()
Date: Fri, 23 Sep 2022 20:36:38 +0200
Message-Id: <20220923183640.8314-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958222-EFFF4A26-95A8D4EE/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ff587ab-33dd-4688-bd68-325b5f33104f
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
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

Split out the code in audio_get_avail() that calculates the
buffer size that the audio frontend can read. This is similar
to the code changes in audio_get_free().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index dd66b745e5..ba0c62b120 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -986,6 +986,18 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
     }
 }
 
+/**
+ * audio_frontend_frames_in() - returns the number of frames the resampling
+ * code generates from frames_in frames
+ *
+ * @sw: audio recording frontend
+ * @frames_in: number of frames
+ */
+static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
+{
+    return ((int64_t)frames_in << 32) / sw->ratio;
+}
+
 static size_t audio_get_avail (SWVoiceIn *sw)
 {
     size_t live;
@@ -1002,12 +1014,12 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     ldebug (
-        "%s: get_avail live %zu ret %" PRId64 "\n",
+        "%s: get_avail live %zu frontend frames %zu\n",
         SW_NAME (sw),
-        live, (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame
+        live, audio_frontend_frames_in(sw, live)
         );
 
-    return (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame;
+    return live;
 }
 
 /**
@@ -1309,11 +1321,13 @@ static void audio_run_in (AudioState *s)
             sw->total_hw_samples_acquired -= min;
 
             if (sw->active) {
+                size_t sw_avail = audio_get_avail(sw);
                 size_t avail;
 
-                avail = audio_get_avail (sw);
+                avail = audio_frontend_frames_in(sw, sw_avail);
                 if (avail > 0) {
-                    sw->callback.fn (sw->callback.opaque, avail);
+                    sw->callback.fn(sw->callback.opaque,
+                                    avail * sw->info.bytes_per_frame);
                 }
             }
         }
-- 
2.35.3


