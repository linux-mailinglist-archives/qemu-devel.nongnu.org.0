Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2E486681
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:08:31 +0100 (CET)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UNT-0005lu-26
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:08:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P2I-00062W-Cr
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:26:18 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:55158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P2G-00074a-RN
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:26:18 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout08.t-online.de (Postfix) with SMTP id 550AD14532;
 Thu,  6 Jan 2022 10:26:02 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5Ozi-44Nb1d0; Thu, 6 Jan 2022 10:23:38 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id D3D4D200621; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 03/15] audio: add function audio_pcm_hw_conv_in()
Date: Thu,  6 Jan 2022 10:23:20 +0100
Message-Id: <20220106092332.7223-3-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461018-0001606D-116FBED2/0/0 CLEAN NORMAL
X-TOI-MSGID: cbcdfea4-d84e-4208-8d05-b0e46116deb0
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:05:01 -0500
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Add a function audio_pcm_hw_conv_in() similar to the existing
counterpart function audio_pcm_hw_clip_out(). This function reduces
the number of calls to the pcm_ops functions get_buffer_in() and
put_buffer_in(). That's one less call to get_buffer_in() and
put_buffer_in() every time the conv_buffer wraps around.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index dfd32912da..f28e91853f 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -548,6 +548,24 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     return live;
 }
 
+static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
+{
+    size_t conv = 0;
+    STSampleBuffer *conv_buf = hw->conv_buf;
+
+    while (samples) {
+        uint8_t *src = advance(pcm_buf, conv * hw->info.bytes_per_frame);
+        size_t proc = MIN(samples, conv_buf->size - conv_buf->pos);
+
+        hw->conv(conv_buf->samples + conv_buf->pos, src, proc);
+        conv_buf->pos = (conv_buf->pos + proc) % conv_buf->size;
+        samples -= proc;
+        conv += proc;
+    }
+
+    return conv;
+}
+
 /*
  * Soft voice (capture)
  */
@@ -1219,7 +1237,6 @@ static void audio_run_out (AudioState *s)
 static size_t audio_pcm_hw_run_in(HWVoiceIn *hw, size_t samples)
 {
     size_t conv = 0;
-    STSampleBuffer *conv_buf = hw->conv_buf;
 
     if (hw->pcm_ops->run_buffer_in) {
         hw->pcm_ops->run_buffer_in(hw);
@@ -1235,11 +1252,7 @@ static size_t audio_pcm_hw_run_in(HWVoiceIn *hw, size_t samples)
             break;
         }
 
-        proc = MIN(size / hw->info.bytes_per_frame,
-                   conv_buf->size - conv_buf->pos);
-
-        hw->conv(conv_buf->samples + conv_buf->pos, buf, proc);
-        conv_buf->pos = (conv_buf->pos + proc) % conv_buf->size;
+        proc = audio_pcm_hw_conv_in(hw, buf, size / hw->info.bytes_per_frame);
 
         samples -= proc;
         conv += proc;
-- 
2.31.1


