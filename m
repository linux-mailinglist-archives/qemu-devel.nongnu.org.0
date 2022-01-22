Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2907496C73
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:07:22 +0100 (CET)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBG6z-0003KC-6U
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:07:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy5-0007hO-GO
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:09 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:43180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy4-000551-0o
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:09 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout01.t-online.de (Postfix) with SMTP id A697311C8;
 Sat, 22 Jan 2022 13:58:06 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFy2-2kMLa50; Sat, 22 Jan 2022 13:58:06 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id DB7CF20063B; Sat, 22 Jan 2022 13:57:45 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 09/15] Revert "audio: fix wavcapture segfault"
Date: Sat, 22 Jan 2022 13:57:39 +0100
Message-Id: <20220122125745.5037-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642856286-00010BFA-92F3C4D3/0/0 CLEAN NORMAL
X-TOI-MSGID: 0937df05-0550-4d0d-b7da-010341f2e922
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

This reverts commit cbaf25d1f59ee13fc7542a06ea70784f2e000c04.

Since previous commit every audio backend has a pcm_ops function
table. It's no longer necessary to test if the table is available.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 55f885f8e9..c420a8bd1c 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -612,7 +612,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
         total += isamp;
     }
 
-    if (hw->pcm_ops && !hw->pcm_ops->volume_in) {
+    if (!hw->pcm_ops->volume_in) {
         mixeng_volume (sw->buf, ret, &sw->vol);
     }
 
@@ -718,7 +718,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     if (swlim) {
         sw->conv (sw->buf, buf, swlim);
 
-        if (sw->hw->pcm_ops && !sw->hw->pcm_ops->volume_out) {
+        if (!sw->hw->pcm_ops->volume_out) {
             mixeng_volume (sw->buf, swlim, &sw->vol);
         }
     }
-- 
2.31.1


