Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89326A221D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdPE-0004Dt-R7; Fri, 24 Feb 2023 14:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdPC-00041W-Mm
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:54 -0500
Received: from mailout10.t-online.de ([194.25.134.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdPB-0004kQ-0v
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:54 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout10.t-online.de (Postfix) with SMTP id DA7D346373;
 Fri, 24 Feb 2023 20:06:32 +0100 (CET)
Received: from linpower.localnet ([84.175.228.75]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdOl-0Lrf730; Fri, 24 Feb 2023 20:06:27 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id AF3C5335532; Fri, 24 Feb 2023 20:05:55 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] audio/audio_template: substitute sw->hw with hw
Date: Fri, 24 Feb 2023 20:05:54 +0100
Message-Id: <20230224190555.7409-14-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
References: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265587-EAD5337F-6FC8B9BB/2/51138760147 SUSPECT
 URL-COUNT
X-TOI-MSGID: 852d9505-2b14-4c8e-9a01-7333ec391855
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
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

Substitute sw->hw with hw in the audio_pcm_sw_alloc_resources_*
functions.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


