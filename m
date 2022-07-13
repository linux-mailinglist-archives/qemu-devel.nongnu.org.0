Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A720573391
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 11:54:55 +0200 (CEST)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZ54-0000OQ-Iv
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 05:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBZ1V-0003Ho-Fe
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:13 -0400
Received: from [114.242.206.163] (port=38470 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBZ1T-0005J1-3i
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 05:51:13 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx39Bslc5iXkcbAA--.18694S4; 
 Wed, 13 Jul 2022 17:50:37 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 2/5] hw/intc/loongarch_pch_pic: Fix coverity errors in update
 irq
Date: Wed, 13 Jul 2022 17:50:33 +0800
Message-Id: <20220713095036.705102-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx39Bslc5iXkcbAA--.18694S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1xtrW7JF15KF43WryrtFb_yoW8ArW8pF
 W7u3Z8Kr4rtry3Z3s5GayrWr4fZF1DZr17XFZxt3s7GrsxAF1rCw4kWr9xXFW8W395JFyj
 vFWrWw45Z3WDGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.242.206.163 (deferred)
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
'unsigned long' type, so we change the 'size' to unsigned
long type when use the function.
2. In expression 1ULL << irq, left shifting by more than
63 bits has undefined behavior. And out-of-bounds access
error occured when 'irq' >= 64. So we add a condition to
avoid this.
3. Use 'MAKE_64BIT_MASK(irq, 1)' to replace '1ULL << shift'.

Fix coverity CID: 1489761 1489764 1489765

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_pch_pic.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
index 3c9814a3b4..040b89861c 100644
--- a/hw/intc/loongarch_pch_pic.c
+++ b/hw/intc/loongarch_pch_pic.c
@@ -15,22 +15,27 @@
 
 static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
 {
-    unsigned long val;
+    unsigned long val, max_irq;
     int irq;
 
+    max_irq = 64;
     if (level) {
         val = mask & s->intirr & ~s->int_mask;
         if (val) {
-            irq = find_first_bit(&val, 64);
-            s->intisr |= 0x1ULL << irq;
-            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
+            irq = find_first_bit(&val, max_irq);
+            if (irq < max_irq) {
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
+            irq = find_first_bit(&val, max_irq);
+            if (irq < max_irq) {
+                s->intisr &= ~(MAKE_64BIT_MASK(irq, 1));
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
+            }
         }
     }
 }
-- 
2.31.1


