Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CA4C946D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:37:07 +0100 (CET)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8J0-00014s-8c
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:37:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7w0-00051K-Ts
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:21 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:49692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7vz-0001o2-5O
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:20 -0500
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout11.t-online.de (Postfix) with SMTP id B66A01BD2F;
 Tue,  1 Mar 2022 20:13:17 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7vx-2ADn5F0; Tue, 1 Mar 2022 20:13:17 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id ECC0620060E; Tue,  1 Mar 2022 20:13:11 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 03/15] audio: add function audio_pcm_hw_conv_in()
Date: Tue,  1 Mar 2022 20:12:59 +0100
Message-Id: <20220301191311.26695-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646161997-0000BD0E-03FE81DB/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f4836a2-4d24-4c8b-adfb-771c54b42c29
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.34.1


