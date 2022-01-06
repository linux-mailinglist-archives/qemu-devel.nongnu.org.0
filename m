Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B4486680
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:08:31 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UNQ-0005lq-Vu
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P1h-0005z0-7X
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:41 -0500
Received: from mailout10.t-online.de ([194.25.134.21]:54132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P1f-0006xO-JN
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:40 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout10.t-online.de (Postfix) with SMTP id 8DFFE79D0;
 Thu,  6 Jan 2022 10:23:54 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5Ozx-27HTer0; Thu, 6 Jan 2022 10:23:53 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E0EB420062A; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 09/15] audio: revert tests for pcm_ops table
Date: Thu,  6 Jan 2022 10:23:26 +0100
Message-Id: <20220106092332.7223-9-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461033-00001674-206ECA61/0/0 CLEAN NORMAL
X-TOI-MSGID: 51243944-2fb0-4996-af74-da88a0598ceb
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

With previous commit every audio backend has a pcm_ops function
table. It's no longer necessary to test if the table is
available. This reverts commit cbaf25d1f5: "audio: fix
wavcapture segfault"

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


