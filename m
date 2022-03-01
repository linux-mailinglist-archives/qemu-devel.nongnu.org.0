Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CC4C9442
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:30:03 +0100 (CET)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8CA-0003I1-C8
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wD-0005K0-Ga
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:33 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:49750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wB-0001ql-Je
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:33 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout11.t-online.de (Postfix) with SMTP id 63A161BD2A;
 Tue,  1 Mar 2022 20:13:30 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7wA-3rGCMD0; Tue, 1 Mar 2022 20:13:30 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 0757F200620; Tue,  1 Mar 2022 20:13:12 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 08/15] audio: add pcm_ops function table for capture backend
Date: Tue,  1 Mar 2022 20:13:04 +0100
Message-Id: <20220301191311.26695-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646162010-0001606D-C90EF5B6/0/0 CLEAN NORMAL
X-TOI-MSGID: 802c0b4e-9290-491a-ac6c-61be075da08d
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
2.34.1


