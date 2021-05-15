Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B170B381869
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:38:27 +0200 (CEST)
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsck-0007yk-Qz
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXb-0003Rg-4z
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:07 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:47762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lhsXY-0003GS-Of
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:33:06 -0400
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout12.t-online.de (Postfix) with SMTP id 34DA55D235;
 Sat, 15 May 2021 13:33:02 +0200 (CEST)
Received: from linpower.localnet
 (XZZDzuZDghvnecW356e8qedTJZUM5w1vEPVnwDnGgrjpPFipGTzjz6wA+smHHocZp1@[79.208.18.63])
 by fwd39.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsXU-0RXdiK0; Sat, 15 May 2021 13:33:00 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A60BF200620; Sat, 15 May 2021 13:32:54 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 03/11] ps2: don't deassert irq twice if queue is empty
Date: Sat, 15 May 2021 13:32:46 +0200
Message-Id: <20210515113254.6245-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XZZDzuZDghvnecW356e8qedTJZUM5w1vEPVnwDnGgrjpPFipGTzjz6wA+smHHocZp1
X-TOI-EXPURGATEID: 150726::1621078380-00003E8E-50EA5928/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b974682-be1d-4446-8147-0a8827e9ee05
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
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

Don't deassert the irq twice if the queue is empty. While the
second deassertion doesn't do any harm, it's unnecessary.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/input/ps2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 55a81a0c51..4aee46a595 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -519,7 +519,9 @@ uint32_t ps2_read_data(PS2State *s)
         /* reading deasserts IRQ */
         s->update_irq(s->update_arg, 0);
         /* reassert IRQs if data left */
-        s->update_irq(s->update_arg, q->count != 0);
+        if (q->count) {
+            s->update_irq(s->update_arg, 1);
+        }
     }
     return val;
 }
-- 
2.26.2


