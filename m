Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E25EBAA4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:28:56 +0200 (CEST)
Received: from localhost ([::1]:54212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od45P-0003GO-2s
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1od3pk-0001SG-8A
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40722 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1od3ph-0007Hj-Nc
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:12:43 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxT+BJlDJj4J4iAA--.64861S4; 
 Tue, 27 Sep 2022 14:12:26 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v2 2/3] hw/intc: Fix LoongArch extioi function
Date: Tue, 27 Sep 2022 14:12:24 +0800
Message-Id: <20220927061225.3566554-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxT+BJlDJj4J4iAA--.64861S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryfuFy5CFWDuryUuFyUWrg_yoW8tFW5pr
 W8uryYgrW5JF1fGwsxKa1DGr1rG39agr12vFWaka93uwnrKryF9w1vq340gFWUuaykZryj
 gaySqr1agF1jyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

1.When cpu read or write extioi COREISR reg, it should access
the reg belonged to itself, so the index of 's->coreisr' is
current cpu number.
2.Remove the unused extioi system memory region and we only
support the extioi iocsr memory region now.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_extioi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 22803969bc..b89ec2e2a6 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -17,6 +17,12 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
+static inline int get_current_cpu(void)
+{
+    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+
+    return cpu_id;
+}
 
 static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
 {
@@ -92,8 +98,8 @@ static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
         ret = s->bounce[index];
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        cpu = get_current_cpu();
         ret = s->coreisr[cpu][index];
         break;
     case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
@@ -183,8 +189,8 @@ static void extioi_writew(void *opaque, hwaddr addr,
         s->bounce[index] = val;
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        cpu = get_current_cpu();
         old_data = s->coreisr[cpu][index];
         s->coreisr[cpu][index] = old_data & ~val;
         /* write 1 to clear interrrupt */
@@ -284,9 +290,6 @@ static void loongarch_extioi_instance_init(Object *obj)
             qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
         }
     }
-    memory_region_init_io(&s->extioi_system_mem, OBJECT(s), &extioi_ops,
-                          s, "extioi_system_mem", 0x900);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_system_mem);
 }
 
 static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
-- 
2.31.1


