Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBA3908D8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:22:25 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbhA-00029l-Fl
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbZw-0002Wy-CF
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:15:01 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:46950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1llbZq-0003b8-QK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:14:56 -0400
Received: from fwd30.aul.t-online.de (fwd30.aul.t-online.de [172.20.26.135])
 by mailout08.t-online.de (Postfix) with SMTP id 525B34DFCA;
 Tue, 25 May 2021 20:14:47 +0200 (CEST)
Received: from linpower.localnet
 (bHjXY-ZCohnY7601LdzMo4djaUHNpyxGlwVy4UGDQvz5xbalabzn67Td3HHX5l1w5d@[93.236.158.49])
 by fwd30.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbZk-0Pitf60; Tue, 25 May 2021 20:14:44 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 86BB82000A0; Tue, 25 May 2021 20:14:41 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 02/12] ps2: don't raise an interrupt if queue is full
Date: Tue, 25 May 2021 20:14:31 +0200
Message-Id: <20210525181441.27768-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
References: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bHjXY-ZCohnY7601LdzMo4djaUHNpyxGlwVy4UGDQvz5xbalabzn67Td3HHX5l1w5d
X-TOI-EXPURGATEID: 150726::1621966484-0000D63F-4F97AECC/0/0 CLEAN NORMAL
X-TOI-MSGID: 8437f8b3-591a-4381-ab4f-0ac51a5ad583
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


