Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30B5F0593
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 09:17:01 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAGZ-0003SH-Nj
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 03:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oeAAw-0005Yc-RV
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:11:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60424 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oeAAt-0002sX-Ql
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:11:10 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxrmt1ljZjthYkAA--.54493S3; 
 Fri, 30 Sep 2022 15:10:46 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 1/2] hw/intc: Fix LoongArch extioi function
Date: Fri, 30 Sep 2022 15:10:44 +0800
Message-Id: <20220930071045.848674-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220930071045.848674-1-yangxiaojuan@loongson.cn>
References: <20220930071045.848674-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxrmt1ljZjthYkAA--.54493S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4kAF43Cw4ruw1rZFy7ZFb_yoW3Xw48pr
 yxursI9r1Uta1fG3Z0g3WDXF1kGws3Wa429FWI934Skw1DAr1S9ryqqw1SyF4UCaykJ3yU
 ta93ur42vF4jvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
current cpu number. Using MemTxAttrs' requester_type and id
to get the cpu index.
2.Remove the unused extioi system memory region and we only
support the extioi iocsr memory region now.

Based-on: <20220927141504.3886314-1-alex.bennee@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_extioi.c      | 51 +++++++++++++++++++--------------
 hw/intc/trace-events            |  2 +-
 target/loongarch/iocsr_helper.c | 16 +++++------
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 22803969bc..e94bc91565 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -17,7 +17,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-
 static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
 {
     int ipnum, cpu, found, irq_index, irq_mask;
@@ -68,44 +67,49 @@ static void extioi_setirq(void *opaque, int irq, int level)
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
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
-        ret = s->coreisr[cpu][index];
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        /* using attrs to get current cpu index */
+        if (attrs.requester_type != MTRT_CPU) {
+            return MEMTX_ACCESS_ERROR;
+        }
+        cpu = attrs.requester_id;
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
@@ -127,8 +131,9 @@ static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
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
@@ -183,8 +188,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
         s->bounce[index] = val;
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        /* using attrs to get current cpu index */
+        if (attrs.requester_type != MTRT_CPU) {
+            return MEMTX_ACCESS_ERROR;
+        }
+        cpu = attrs.requester_id;
         old_data = s->coreisr[cpu][index];
         s->coreisr[cpu][index] = old_data & ~val;
         /* write 1 to clear interrrupt */
@@ -231,11 +240,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
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
@@ -284,9 +294,6 @@ static void loongarch_extioi_instance_init(Object *obj)
             qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
         }
     }
-    memory_region_init_io(&s->extioi_system_mem, OBJECT(s), &extioi_ops,
-                          s, "extioi_system_mem", 0x900);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_system_mem);
 }
 
 static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 0a90c1cdec..e505d8a2b8 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -306,6 +306,6 @@ loongarch_msi_set_irq(int irq_num) "set msi irq %d"
 
 # loongarch_extioi.c
 loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
-loongarch_extioi_readw(uint64_t addr, uint32_t val) "addr: 0x%"PRIx64 "val: 0x%x"
+loongarch_extioi_readw(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
 loongarch_extioi_writew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
 
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index 0e9c537dc7..d3aac362ff 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -17,51 +17,51 @@
 uint64_t helper_iocsrrd_b(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldub(&env->address_space_iocsr, r_addr,
-                              MEMTXATTRS_UNSPECIFIED, NULL);
+                              MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 uint64_t helper_iocsrrd_h(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_lduw(&env->address_space_iocsr, r_addr,
-                              MEMTXATTRS_UNSPECIFIED, NULL);
+                              MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 uint64_t helper_iocsrrd_w(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldl(&env->address_space_iocsr, r_addr,
-                             MEMTXATTRS_UNSPECIFIED, NULL);
+                             MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 uint64_t helper_iocsrrd_d(CPULoongArchState *env, target_ulong r_addr)
 {
     return address_space_ldq(&env->address_space_iocsr, r_addr,
-                             MEMTXATTRS_UNSPECIFIED, NULL);
+                             MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_b(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stb(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_h(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stw(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_w(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stl(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
 
 void helper_iocsrwr_d(CPULoongArchState *env, target_ulong w_addr,
                       target_ulong val)
 {
     address_space_stq(&env->address_space_iocsr, w_addr,
-                      val, MEMTXATTRS_UNSPECIFIED, NULL);
+                      val, MEMTXATTRS_CPU(env_cpu(env)), NULL);
 }
-- 
2.31.1


