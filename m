Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82F271643
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 19:20:19 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK30b-0005dy-Rf
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 13:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kK2y3-00040u-Eq
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 13:17:39 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:56150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kK2y1-0006Fd-Nd
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 13:17:39 -0400
Received: from fwd20.aul.t-online.de (fwd20.aul.t-online.de [172.20.26.140])
 by mailout08.t-online.de (Postfix) with SMTP id 07E2941E61DF;
 Sun, 20 Sep 2020 19:17:36 +0200 (CEST)
Received: from linpower.localnet
 (G54emqZHYhtqxL8jXYmVtop8pYMDyAFBZ-bbdLrqWFyzWCBFxEoBEQcOotHyBf6wlm@[93.236.144.216])
 by fwd20.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kK2xz-0t19hA0; Sun, 20 Sep 2020 19:17:35 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id EF210335504; Sun, 20 Sep 2020 19:17:29 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/9] audio/spiceaudio: always rate limit playback stream
Date: Sun, 20 Sep 2020 19:17:23 +0200
Message-Id: <20200920171729.15861-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <84f1c61a-8399-c75e-96c2-febfc2dd5fab@t-online.de>
References: <84f1c61a-8399-c75e-96c2-febfc2dd5fab@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: G54emqZHYhtqxL8jXYmVtop8pYMDyAFBZ-bbdLrqWFyzWCBFxEoBEQcOotHyBf6wlm
X-TOI-EXPURGATEID: 150726::1600622255-000053CC-410D1DA5/0/0 CLEAN NORMAL
X-TOI-MSGID: c27bc480-7caa-410e-a3f0-2339759c4744
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 13:17:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The playback rate with the spiceaudio backend is currently too
fast if there's no spice client connected or the spice client
can't play audio. Rate limit the audio playback stream in all
cases. To calculate the rate correctly the limiter has to know
the maximum buffer size.

Fixes: 8c198ff065 ("spiceaudio: port to the new audio backend api")
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c      |  3 ++-
 audio/spiceaudio.c | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index ad3f57b4c4..ba52259050 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1089,7 +1089,8 @@ static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, size_t live)
     size_t clipped = 0;
 
     while (live) {
-        size_t size, decr, proc;
+        size_t size = live * hw->info.bytes_per_frame;
+        size_t decr, proc;
         void *buf = hw->pcm_ops->get_buffer_out(hw, &size);
 
         if (size == 0) {
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index c8d81ba442..c062742622 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -130,13 +130,11 @@ static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
     }
 
     if (out->frame) {
-        *size = audio_rate_get_bytes(
-            &hw->info, &out->rate,
-            (out->fsize - out->fpos) * hw->info.bytes_per_frame);
-    } else {
-        audio_rate_start(&out->rate);
-        *size = LINE_OUT_SAMPLES << 2;
+        *size = MIN((out->fsize - out->fpos) << 2, *size);
     }
+
+    *size = audio_rate_get_bytes(&hw->info, &out->rate, *size);
+
     return out->frame + out->fpos;
 }
 
-- 
2.26.2


