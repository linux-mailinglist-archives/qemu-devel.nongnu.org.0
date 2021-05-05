Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CFB3748B2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:26:35 +0200 (CEST)
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNAI-0004fM-89
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN6D-0001Nc-3i
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:22:21 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:39800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1leN66-0007Nv-2d
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:22:20 -0400
Received: from fwd31.aul.t-online.de (fwd31.aul.t-online.de [172.20.26.136])
 by mailout03.t-online.de (Postfix) with SMTP id 1E17F768ED;
 Wed,  5 May 2021 21:21:42 +0200 (CEST)
Received: from linpower.localnet
 (bLoL1EZH8hmnKoG6SJ9nwQnAogGTWmTcLcdaBQcmfRR8237eKSIKzesVuWKbuuRwgG@[46.86.52.8])
 by fwd31.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1leN5V-15ljIu0; Wed, 5 May 2021 21:21:37 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id EA01E2000A0; Wed,  5 May 2021 21:21:33 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 02/10] ps2: don't raise an interrupt if queue is full
Date: Wed,  5 May 2021 21:21:25 +0200
Message-Id: <20210505192133.7480-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bLoL1EZH8hmnKoG6SJ9nwQnAogGTWmTcLcdaBQcmfRR8237eKSIKzesVuWKbuuRwgG
X-TOI-EXPURGATEID: 150726::1620242497-000102A7-2E3D6D30/0/0 CLEAN NORMAL
X-TOI-MSGID: 66b35438-0035-47d4-8fd0-498c6f5ed0a9
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

ps2_queue() behaves differently than the very similar functions
ps2_queue_2() to ps2_queue_4(). The first one calls update_irq()
even if the queue is full, the others don't. Change ps2_queue()
to be consistent with the others.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index d9f79e8260..55a81a0c51 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -212,6 +212,10 @@ void ps2_raise_irq(PS2State *s)
 
 void ps2_queue(PS2State *s, int b)
 {
+    if (PS2_QUEUE_SIZE - s->queue.count < 1) {
+        return;
+    }
+
     ps2_queue_noirq(s, b);
     s->update_irq(s->update_arg, 1);
 }
-- 
2.26.2


