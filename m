Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4E5E81ED
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:44:29 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnf2-0005rV-Bg
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXh-0002hC-9T
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:54 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXf-0005Ed-NX
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:53 -0400
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout04.t-online.de (Postfix) with SMTP id 7C23F8D3;
 Fri, 23 Sep 2022 20:36:50 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXe-2OFYmH0; Fri, 23 Sep 2022 20:36:50 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9E49820061A; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 05/12] audio: add more audio rate control functions
Date: Fri, 23 Sep 2022 20:36:33 +0200
Message-Id: <20220923183640.8314-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958210-CA4B6B6F-3D2A2FE2/0/0 CLEAN NORMAL
X-TOI-MSGID: e62cfc33-cc85-45f9-a9de-260a689295ad
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

The next patch needs two new rate control functions. The first
one returns the bytes needed at call time to maintain the
selected rate. The second one adjusts the bytes actually sent.

Split the audio_rate_get_bytes() function into these two
functions and reintroduce audio_rate_get_bytes().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c     | 35 ++++++++++++++++++++++++-----------
 audio/audio_int.h |  2 ++
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 9e55834909..557538a7b7 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2250,26 +2250,39 @@ void audio_rate_start(RateCtl *rate)
     rate->start_ticks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 }
 
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
-                            size_t bytes_avail)
+size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info)
 {
     int64_t now;
     int64_t ticks;
     int64_t bytes;
-    int64_t samples;
-    size_t ret;
+    int64_t frames;
 
     now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ticks = now - rate->start_ticks;
     bytes = muldiv64(ticks, info->bytes_per_second, NANOSECONDS_PER_SECOND);
-    samples = (bytes - rate->bytes_sent) / info->bytes_per_frame;
-    if (samples < 0 || samples > 65536) {
-        AUD_log(NULL, "Resetting rate control (%" PRId64 " samples)\n", samples);
+    frames = (bytes - rate->bytes_sent) / info->bytes_per_frame;
+    if (frames < 0 || frames > 65536) {
+        AUD_log(NULL, "Resetting rate control (%" PRId64 " frames)\n", frames);
         audio_rate_start(rate);
-        samples = 0;
+        frames = 0;
     }
 
-    ret = MIN(samples * info->bytes_per_frame, bytes_avail);
-    rate->bytes_sent += ret;
-    return ret;
+    return frames * info->bytes_per_frame;
+}
+
+void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used)
+{
+    rate->bytes_sent += bytes_used;
+}
+
+size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+                            size_t bytes_avail)
+{
+    size_t bytes;
+
+    bytes = audio_rate_peek_bytes(rate, info);
+    bytes = MIN(bytes, bytes_avail);
+    audio_rate_add_bytes(rate, bytes);
+
+    return bytes;
 }
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 2a6914d2aa..97e20e8429 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -263,6 +263,8 @@ typedef struct RateCtl {
 } RateCtl;
 
 void audio_rate_start(RateCtl *rate);
+size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info);
+void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);
 size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
                             size_t bytes_avail);
 
-- 
2.35.3


