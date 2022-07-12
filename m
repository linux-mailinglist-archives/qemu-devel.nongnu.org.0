Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C8571473
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:26:15 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBDi-0003yt-6L
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBAq8-0003Nx-I0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:01:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57090 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBAq5-0001Qj-Np
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:01:52 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JdKs1i3NgYAA--.15429S4; 
 Tue, 12 Jul 2022 16:01:35 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 2/5] hw/intc/loongarch_pch_pic: Fix coverity errors in update
 irq
Date: Tue, 12 Jul 2022 16:01:30 +0800
Message-Id: <20220712080133.4176971-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9JdKs1i3NgYAA--.15429S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1xtrW7JF15Kr1DCryrCrg_yoW8XFWxpF
 WDAF13Kr4rJFsxX3s5Cay5WFyfuFnrZr17WFZIya4xCr45ArnYk3yvqrW3ZFy8WrWrJFyj
 qFZ3Wa15u3WDCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix coverity errors:
1. In find_first_bit function, the 'size' argument need
'unsigned long' type, so we add the suffix 'UL' on 'size'
argument when use the function.
2. In expression 1ULL << irq, left shifting by more than
63 bits has undefined behavior. And out-of-bounds access
error occured when 'irq' >= 64. So we add a condition to
avoid this.

Fix coverity CID: 1489761 1489764 1489765

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_pch_pic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 3c9814a3b4..779a087a03 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -21,16 +21,20 @@ static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
     if (level) {
         val = mask & s->intirr & ~s->int_mask;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr |= 0x1ULL << irq;
-            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
+            irq = find_first_bit(&val, 64UL);
+            if (irq < 64) {
+                s->intisr |= 0x1ULL << irq;
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
+            }
         }
     } else {
         val = mask & s->intisr;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr &= ~(0x1ULL << irq);
-            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
+            irq = find_first_bit(&val, 64UL);
+            if (irq < 64) {
+                s->intisr &= ~(0x1ULL << irq);
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
+            }
         }
     }
 }
-- 
2.31.1


