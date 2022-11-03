Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A29617CD8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZVJ-0002KO-AD; Thu, 03 Nov 2022 08:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqZV6-0002Jg-8G
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:16 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqZV0-0000ZB-H0
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:15 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxq9hotmNjPDsEAA--.14441S3;
 Thu, 03 Nov 2022 20:39:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldltmNjofgLAA--.16257S3; 
 Thu, 03 Nov 2022 20:39:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/7] hw/intc: Convert the memops to with_attrs in LoongArch
 extioi
Date: Thu,  3 Nov 2022 20:38:55 +0800
Message-Id: <20221103123901.2811990-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221103123901.2811990-1-gaosong@loongson.cn>
References: <20221103123901.2811990-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldltmNjofgLAA--.16257S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGry5Cw47tF43tF47Zr17trb_yoWrWryrpr
 Wxu3sIgr1Uta1xGrs093WUZF18Gws3XryavF4a9a4S9w1DC34F9a4vqr92yFWY934kAryq
 gayfXr1YgF1qyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Converting the MemoryRegionOps read/write handlers to
with_attrs in LoongArch extioi emulation.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221021015307.2570844-2-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/loongarch_extioi.c | 31 +++++++++++++++++--------------
 hw/intc/trace-events       |  3 +--
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 22803969bc..72f4b0cde5 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -68,44 +68,45 @@ static void extioi_setirq(void *opaque, int irq, int level)
     extioi_update_irq(s, irq, level);
 }
 
-static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
+static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
+                                unsigned size, MemTxAttrs attrs)
 {
     LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
     unsigned long offset = addr & 0xffff;
-    uint32_t index, cpu, ret = 0;
+    uint32_t index, cpu;
 
     switch (offset) {
     case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
         index = (offset - EXTIOI_NODETYPE_START) >> 2;
-        ret = s->nodetype[index];
+        *data = s->nodetype[index];
         break;
     case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
         index = (offset - EXTIOI_IPMAP_START) >> 2;
-        ret = s->ipmap[index];
+        *data = s->ipmap[index];
         break;
     case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
         index = (offset - EXTIOI_ENABLE_START) >> 2;
-        ret = s->enable[index];
+        *data = s->enable[index];
         break;
     case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
         index = (offset - EXTIOI_BOUNCE_START) >> 2;
-        ret = s->bounce[index];
+        *data = s->bounce[index];
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
         index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
         cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
-        ret = s->coreisr[cpu][index];
+        *data = s->coreisr[cpu][index];
         break;
     case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
         index = (offset - EXTIOI_COREMAP_START) >> 2;
-        ret = s->coremap[index];
+        *data = s->coremap[index];
         break;
     default:
         break;
     }
 
-    trace_loongarch_extioi_readw(addr, ret);
-    return ret;
+    trace_loongarch_extioi_readw(addr, *data);
+    return MEMTX_OK;
 }
 
 static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
@@ -127,8 +128,9 @@ static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
     }
 }
 
-static void extioi_writew(void *opaque, hwaddr addr,
-                          uint64_t val, unsigned size)
+static MemTxResult extioi_writew(void *opaque, hwaddr addr,
+                          uint64_t val, unsigned size,
+                          MemTxAttrs attrs)
 {
     LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
     int i, cpu, index, old_data, irq;
@@ -231,11 +233,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
     default:
         break;
     }
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps extioi_ops = {
-    .read = extioi_readw,
-    .write = extioi_writew,
+    .read_with_attrs = extioi_readw,
+    .write_with_attrs = extioi_writew,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
     .valid.min_access_size = 4,
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 0a90c1cdec..6fbc2045e6 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -306,6 +306,5 @@ loongarch_msi_set_irq(int irq_num) "set msi irq %d"
 
 # loongarch_extioi.c
 loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
-loongarch_extioi_readw(uint64_t addr, uint32_t val) "addr: 0x%"PRIx64 "val: 0x%x"
+loongarch_extioi_readw(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
 loongarch_extioi_writew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
-
-- 
2.31.1


