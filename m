Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CAC68C639
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:56:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6cC-0005Wu-Jl; Mon, 06 Feb 2023 13:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c9-0005M2-E3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:17 -0500
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c4-0005Wi-ED
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:17 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout03.t-online.de (Postfix) with SMTP id 22891177BB;
 Mon,  6 Feb 2023 19:53:09 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6c0-22PXxR0; Mon, 6 Feb 2023 19:53:08 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 94BE22006C8; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 14/17] audio: wire up st_rate_frames_out()
Date: Mon,  6 Feb 2023 19:52:34 +0100
Message-Id: <20230206185237.8358-14-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709588-437ECC4D-00173077/0/0 CLEAN NORMAL
X-TOI-MSGID: d6d7aca6-1e01-4365-93ee-3c806e7db691
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Wire up the st_rate_frames_out() function and replace
audio_frontend_frames_in() to make audio packet length
calculation exact.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 22c36d6660..dad17e59b8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -579,7 +579,7 @@ static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
 static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len)
 {
     HWVoiceIn *hw = sw->hw;
-    size_t live, frames_out_max, swlim, total_in, total_out;
+    size_t live, frames_out_max, total_in, total_out;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -590,12 +590,10 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len)
         return 0;
     }
 
-    frames_out_max = buf_len / sw->info.bytes_per_frame;
+    frames_out_max = MIN(buf_len / sw->info.bytes_per_frame,
+                         sw->resample_buf.size);
 
-    swlim = (live * sw->ratio) >> 32;
-    swlim = MIN(swlim, frames_out_max);
-
-    audio_pcm_sw_resample_in(sw, live, swlim, &total_in, &total_out);
+    audio_pcm_sw_resample_in(sw, live, frames_out_max, &total_in, &total_out);
 
     if (!hw->pcm_ops->volume_in) {
         mixeng_volume(sw->resample_buf.buffer, total_out, &sw->vol);
@@ -979,18 +977,6 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
     }
 }
 
-/**
- * audio_frontend_frames_in() - returns the number of frames the resampling
- * code generates from frames_in frames
- *
- * @sw: audio recording frontend
- * @frames_in: number of frames
- */
-static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
-{
-    return (int64_t)frames_in * sw->ratio >> 32;
-}
-
 static size_t audio_get_avail (SWVoiceIn *sw)
 {
     size_t live;
@@ -1007,9 +993,9 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     ldebug (
-        "%s: get_avail live %zu frontend frames %zu\n",
+        "%s: get_avail live %zu frontend frames %u\n",
         SW_NAME (sw),
-        live, audio_frontend_frames_in(sw, live)
+        live, st_rate_frames_out(sw->rate, live)
         );
 
     return live;
@@ -1314,8 +1300,9 @@ static void audio_run_in (AudioState *s)
                 size_t sw_avail = audio_get_avail(sw);
                 size_t avail;
 
-                avail = audio_frontend_frames_in(sw, sw_avail);
+                avail = st_rate_frames_out(sw->rate, sw_avail);
                 if (avail > 0) {
+                    avail = MIN(avail, sw->resample_buf.size);
                     sw->callback.fn(sw->callback.opaque,
                                     avail * sw->info.bytes_per_frame);
                 }
-- 
2.35.3


