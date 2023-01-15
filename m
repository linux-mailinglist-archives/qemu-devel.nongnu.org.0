Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E583166B12A
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 14:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH2os-0004SS-Uk; Sun, 15 Jan 2023 08:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2op-0004K9-2Z
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:13:03 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pH2on-0005D0-G2
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 08:13:02 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout11.t-online.de (Postfix) with SMTP id 6CACA13D10;
 Sun, 15 Jan 2023 14:12:59 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH2ol-1rbPlp0; Sun, 15 Jan 2023 14:12:59 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 795172006C8; Sun, 15 Jan 2023 14:12:24 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 16/17] audio/audio_template: substitute sw->hw with hw
Date: Sun, 15 Jan 2023 14:12:23 +0100
Message-Id: <20230115131224.30751-16-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: 49c2125d-4c9b-4ebc-aa71-337abc4bd80c
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

From: Volker Rümelin <vr_qemu@t-online.de>

Substitute sw->hw with hw in the audio_pcm_sw_alloc_resources_*
functions.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_template.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index a9a550a3b7..0cdf57760e 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -107,6 +107,7 @@ static void glue (audio_pcm_sw_free_resources_, TYPE) (SW *sw)
 
 static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 {
+    HW *hw = sw->hw;
     int samples;
 
     if (!glue(audio_get_pdo_, TYPE)(sw->s->dev)->mixing_engine) {
@@ -119,7 +120,6 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     samples = (int64_t)sw->HWBUF.size * sw->ratio >> 32;
 #endif
     if (samples == 0) {
-        HW *hw = sw->hw;
         size_t f_fe_min;
 
         /* f_fe_min = ceil(1 [frames] * f_be [Hz] / size_be [frames]) */
@@ -138,9 +138,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
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


