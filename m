Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726C496C9E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:37:00 +0100 (CET)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGZf-0001iR-3F
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy4-0007h2-D4
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:08 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:43158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy2-00054r-QI
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:08 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout01.t-online.de (Postfix) with SMTP id 6057211D2;
 Sat, 22 Jan 2022 13:58:04 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFxz-2Y7Ob30; Sat, 22 Jan 2022 13:58:04 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id D97F4200635; Sat, 22 Jan 2022 13:57:45 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 08/15] audio: add pcm_ops function table for capture backend
Date: Sat, 22 Jan 2022 13:57:38 +0100
Message-Id: <20220122125745.5037-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642856284-00010BFA-4B042D0E/0/0 CLEAN NORMAL
X-TOI-MSGID: a9d4695b-7007-4054-9448-e308617791a1
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


