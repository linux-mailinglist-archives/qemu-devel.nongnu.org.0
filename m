Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB2B48669B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:17:52 +0100 (CET)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UWV-0006YB-Bt
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P15-0005ta-LB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:03 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P14-0006Xd-2B
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:03 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout05.t-online.de (Postfix) with SMTP id F1BBB1001C;
 Thu,  6 Jan 2022 10:24:08 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5P0A-3vLSOv0; Thu, 6 Jan 2022 10:24:06 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id EBAD4200630; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 14/15] paaudio: fix samples vs. frames mix-up
Date: Thu,  6 Jan 2022 10:23:31 +0100
Message-Id: <20220106092332.7223-14-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461046-00001674-F90F853F/0/0 CLEAN NORMAL
X-TOI-MSGID: 13c4796f-7bce-43dc-8326-a6b1d360bbef
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:05:00 -0500
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

Now that the mixing buffer size no longer adds to playback
latency, fix the samples vs. frames mix-up in the mixing buffer
size calculation. This change will go largely unnoticed as long
as the user doesn't use a buffer-size smaller than timer-period.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index d94f858ec7..a53ed85e0b 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -549,11 +549,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    /*
-     * This is wrong. hw->samples counts in frames. hw->samples will be
-     * number of channels times larger than expected.
-     */
-    hw->samples = audio_buffer_samples(
+    /* hw->samples counts in frames */
+    hw->samples = audio_buffer_frames(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
@@ -601,11 +598,8 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    /*
-     * This is wrong. hw->samples counts in frames. hw->samples will be
-     * number of channels times larger than expected.
-     */
-    hw->samples = audio_buffer_samples(
+    /* hw->samples counts in frames */
+    hw->samples = audio_buffer_frames(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
-- 
2.31.1


