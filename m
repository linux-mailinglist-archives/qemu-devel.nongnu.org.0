Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357468C635
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:55:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6cB-0005U7-TP; Mon, 06 Feb 2023 13:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c0-00051u-Ve
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:09 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bz-0005Vx-BI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:08 -0500
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout11.t-online.de (Postfix) with SMTP id 26EC714A1E;
 Mon,  6 Feb 2023 19:53:06 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd84.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6bw-0wOy0n0; Mon, 6 Feb 2023 19:53:04 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8F0152006C5; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 12/17] audio: rename variables in audio_pcm_sw_read()
Date: Mon,  6 Feb 2023 19:52:32 +0100
Message-Id: <20230206185237.8358-12-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709584-511B9A0B-D267D465/0/0 CLEAN NORMAL
X-TOI-MSGID: b7a288fc-e0d0-4398-9589-b873797edc75
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
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

The audio_pcm_sw_read() function uses a few very unspecific
variable names. Rename them for better readability.

ret => total_out
total => total_in
size => buf_len
samples => frames_out_max

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 9e9c03a42e..22c36d6660 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -576,10 +576,10 @@ static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
     }
 }
 
-static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
+static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len)
 {
     HWVoiceIn *hw = sw->hw;
-    size_t samples, live, ret, swlim, total;
+    size_t live, frames_out_max, swlim, total_in, total_out;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -590,20 +590,20 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
         return 0;
     }
 
-    samples = size / sw->info.bytes_per_frame;
+    frames_out_max = buf_len / sw->info.bytes_per_frame;
 
     swlim = (live * sw->ratio) >> 32;
-    swlim = MIN (swlim, samples);
+    swlim = MIN(swlim, frames_out_max);
 
-    audio_pcm_sw_resample_in(sw, live, swlim, &total, &ret);
+    audio_pcm_sw_resample_in(sw, live, swlim, &total_in, &total_out);
 
     if (!hw->pcm_ops->volume_in) {
-        mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
+        mixeng_volume(sw->resample_buf.buffer, total_out, &sw->vol);
     }
+    sw->clip(buf, sw->resample_buf.buffer, total_out);
 
-    sw->clip(buf, sw->resample_buf.buffer, ret);
-    sw->total_hw_samples_acquired += total;
-    return ret * sw->info.bytes_per_frame;
+    sw->total_hw_samples_acquired += total_in;
+    return total_out * sw->info.bytes_per_frame;
 }
 
 /*
-- 
2.35.3


