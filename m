Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B28068C63D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6cF-0005eB-Ub; Mon, 06 Feb 2023 13:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6cD-0005ak-Nq
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:21 -0500
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c8-0005XG-KH
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:21 -0500
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout02.t-online.de (Postfix) with SMTP id 39E2D2A35C;
 Mon,  6 Feb 2023 19:53:15 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd83.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6c5-3ZIWHZ0; Mon, 6 Feb 2023 19:53:13 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9A3F82006CE; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 16/17] audio/audio_template: substitute sw->hw with hw
Date: Mon,  6 Feb 2023 19:52:36 +0100
Message-Id: <20230206185237.8358-16-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709593-432C3378-768373ED/0/0 CLEAN NORMAL
X-TOI-MSGID: 3eac6bbd-7d12-43bc-8dd2-76cb3f4b2236
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_NONE=0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Substitute sw->hw with hw in the audio_pcm_sw_alloc_resources_*
functions.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_template.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 0d8aab6fad..7e116426c7 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -107,6 +107,7 @@ static void glue (audio_pcm_sw_free_resources_, TYPE) (SW *sw)
 
 static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 {
+    HW *hw = sw->hw;
     int samples;
 
     if (!glue(audio_get_pdo_, TYPE)(sw->s->dev)->mixing_engine) {
@@ -125,7 +126,6 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     }
 
     if (samples == 0) {
-        HW *hw = sw->hw;
         size_t f_fe_min;
 
         /* f_fe_min = ceil(1 [frames] * f_be [Hz] / size_be [frames]) */
@@ -149,9 +149,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     sw->resample_buf.pos = 0;
 
 #ifdef DAC
-    sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
+    sw->rate = st_rate_start(sw->info.freq, hw->info.freq);
 #else
-    sw->rate = st_rate_start (sw->hw->info.freq, sw->info.freq);
+    sw->rate = st_rate_start(hw->info.freq, sw->info.freq);
 #endif
 
     return 0;
-- 
2.35.3


