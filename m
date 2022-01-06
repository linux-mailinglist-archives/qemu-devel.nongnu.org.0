Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1C486693
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:14:00 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5USl-0000oR-NB
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5Ozy-0005bX-Pl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:23:54 -0500
Received: from mailout12.t-online.de ([194.25.134.22]:47670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5Ozx-0006RV-6T
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:23:54 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout12.t-online.de (Postfix) with SMTP id C94F4AC9E;
 Thu,  6 Jan 2022 10:23:51 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5Ozv-2Nmgdt0; Thu, 6 Jan 2022 10:23:51 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id DEE07200628; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 08/15] audio: add pcm_ops function table for capture backend
Date: Thu,  6 Jan 2022 10:23:25 +0100
Message-Id: <20220106092332.7223-8-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461031-000184BD-37AA465C/0/0 CLEAN NORMAL
X-TOI-MSGID: 4937adab-2bed-4359-944e-d01614863354
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:04:59 -0500
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

Add a pcm_ops function table for the capture backend. This avoids
additional code in the next patches to test if the pcm_ops table
is available.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 9e2d7fb209..55f885f8e9 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1804,6 +1804,7 @@ void AUD_remove_card (QEMUSoundCard *card)
     g_free (card->name);
 }
 
+static struct audio_pcm_ops capture_pcm_ops;
 
 CaptureVoiceOut *AUD_add_capture(
     AudioState *s,
@@ -1849,6 +1850,7 @@ CaptureVoiceOut *AUD_add_capture(
 
         hw = &cap->hw;
         hw->s = s;
+        hw->pcm_ops = &capture_pcm_ops;
         QLIST_INIT (&hw->sw_head);
         QLIST_INIT (&cap->cb_head);
 
-- 
2.31.1


