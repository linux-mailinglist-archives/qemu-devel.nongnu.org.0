Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70BB5FAB92
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 06:07:50 +0200 (CEST)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi6YX-0006Zd-U6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 00:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oi6SU-0002j5-2E
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 00:01:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42372 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oi6SQ-00020T-QF
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 00:01:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPGuO6kRj06YqAA--.27267S3; 
 Tue, 11 Oct 2022 12:01:19 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org
Subject: [PATCH v5 1/3] hw/intc: Fix LoongArch extioi function
Date: Tue, 11 Oct 2022 12:01:16 +0800
Message-Id: <20221011040118.2635467-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221011040118.2635467-1-yangxiaojuan@loongson.cn>
References: <20221011040118.2635467-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGuO6kRj06YqAA--.27267S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4kWF4rCw1kKrykXF1kXwb_yoW3Jw4fpr
 yxursIgr1Uta1fGwn0g3WUJF1kGwn3Wa42vFyI934S9w1DAr1S9ryvqrySkF4UCaykJ3yj
 qFZ3Cr4YvF4jvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

When cpu read or write extioi COREISR reg, it should access
the reg belonged to itself, so the index of 's->coreisr' is
current cpu number. Using MemTxAttrs' requester_type and id
to get the cpu index.

Based-on: <20220927141504.3886314-1-alex.bennee@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_extioi.c      | 50 ++++++++++++++++++++-------------
 hw/intc/trace-events            |  5 ++--
 target/loongarch/iocsr_helper.c | 16 +++++------
 3 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index 22803969bc..a703dd30de 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -17,7 +17,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-
 static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
 {
     int ipnum, cpu, found, irq_index, irq_mask;
@@ -68,44 +67,50 @@ static void extioi_setirq(void *opaque, int irq, int level)
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
+            trace_loongarch_extioi_badreadw(addr);
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
@@ -127,8 +132,9 @@ static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
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
@@ -183,8 +189,13 @@ static void extioi_writew(void *opaque, hwaddr addr,
         s->bounce[index] = val;
         break;
     case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
-        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
-        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        index = (offset - EXTIOI_COREISR_START) >> 2;
+        /* using attrs to get current cpu index */
+        if (attrs.requester_type != MTRT_CPU) {
+            trace_loongarch_extioi_badwritew(addr, val);
+            return MEMTX_ACCESS_ERROR;
+        }
+        cpu = attrs.requester_id;
         old_data = s->coreisr[cpu][index];
         s->coreisr[cpu][index] = old_data & ~val;
         /* write 1 to clear interrrupt */
@@ -231,11 +242,12 @@ static void extioi_writew(void *opaque, hwaddr addr,
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
index 0a90c1cdec..e4392c6eab 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -306,6 +306,7 @@ loongarch_msi_set_irq(int irq_num) "set msi irq %d"
 
 # loongarch_extioi.c
 loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
-loongarch_extioi_readw(uint64_t addr, uint32_t val) "addr: 0x%"PRIx64 "val: 0x%x"
+loongarch_extioi_readw(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
+loongarch_extioi_badreadw(uint64_t addr) "addr: 0x%"PRIx64 " read error"
 loongarch_extioi_writew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
-
+loongarch_extioi_badwritew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%"PRIx64 " write error"
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


