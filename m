Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37084575B4E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:11:59 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCEYQ-0006xM-2Y
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oCEUb-0001ZI-Nc
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:08:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49868 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oCEUY-0000gL-MS
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:08:01 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9AtBNFicw8gAA--.25026S4; 
 Fri, 15 Jul 2022 14:07:48 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 2/5] hw/intc/loongarch_pch_pic: Fix bugs for update_irq
 function
Date: Fri, 15 Jul 2022 14:07:37 +0800
Message-Id: <20220715060740.1500628-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9AtBNFicw8gAA--.25026S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kuF1rAw13Jr48tFyxZrb_yoW8XF1kpF
 ZrCFn8Kr4rtrnxZ34kWrW5Wrn3Zwn7XryaqFsIya4Ikr45Arn5C3s7Xry3uFy8W395JFyj
 vFZ3W345X3ZrWaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Fix such errors:
1. We should not use 'unsigned long' type as argument when we use
find_first_bit(), and we use ctz64() to replace find_first_bit()
to fix this bug.
2. It is not standard to use '1ULL << irq' to generate a irq mask.
So, we replace it with 'MAKE_64BIT_MASK(irq, 1)'.

Fix coverity CID: 1489761 1489764 1489765

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_pch_pic.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 3c9814a3b4..8fa64d2030 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -15,22 +15,26 @@
 
 static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
 {
-    unsigned long val;
+    uint64_t val;
     int irq;
 
     if (level) {
         val = mask & s->intirr & ~s->int_mask;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr |= 0x1ULL << irq;
-            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
+            irq = ctz64(val);
+            if (irq < 64) {
+                s->intisr |= MAKE_64BIT_MASK(irq, 1);
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
+            }
         }
     } else {
         val = mask & s->intisr;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr &= ~(0x1ULL << irq);
-            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
+            irq = ctz64(val);
+            if (irq < 64) {
+                s->intisr &= ~(MAKE_64BIT_MASK(irq, 1));
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
+            }
         }
     }
 }
-- 
2.31.1


