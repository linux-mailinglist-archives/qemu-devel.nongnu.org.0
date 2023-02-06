Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1368C644
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bs-0004zt-FM; Mon, 06 Feb 2023 13:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bp-0004za-Hp
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:57 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bo-0005Up-1M
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:57 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout11.t-online.de (Postfix) with SMTP id A4B0314A18;
 Mon,  6 Feb 2023 19:52:54 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6bm-396CO10; Mon, 6 Feb 2023 19:52:54 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 842FE20063C; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 08/17] audio: remove unused noop_conv() function
Date: Mon,  6 Feb 2023 19:52:28 +0100
Message-Id: <20230206185237.8358-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709574-D671D046-DAC71AB9/0/0 CLEAN NORMAL
X-TOI-MSGID: cb995642-b983-42f5-a80a-626e679a12e5
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

The function audio_capture_mix_and_clear() no longer uses
audio_pcm_sw_write() to resample audio frames from one internal
buffer to another. For this reason, the noop_conv() function is
now unused. Remove it.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 44eb7b63b4..556696b095 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -381,13 +381,6 @@ void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len)
 /*
  * Capture
  */
-static void noop_conv (struct st_sample *dst, const void *src, int samples)
-{
-    (void) src;
-    (void) dst;
-    (void) samples;
-}
-
 static CaptureVoiceOut *audio_pcm_capture_find_specific(AudioState *s,
                                                         struct audsettings *as)
 {
@@ -485,7 +478,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
         sw->info = hw->info;
         sw->empty = 1;
         sw->active = hw->enabled;
-        sw->conv = noop_conv;
         sw->ratio = ((int64_t) hw_cap->info.freq << 32) / sw->info.freq;
         sw->vol = nominal_volume;
         sw->rate = st_rate_start (sw->info.freq, hw_cap->info.freq);
-- 
2.35.3


