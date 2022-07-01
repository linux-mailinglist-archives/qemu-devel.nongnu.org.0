Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E613563082
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:46:29 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DEK-0005Cq-A0
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D2v-0002Gr-4j
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39422 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D2l-0003Fu-Fz
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:37 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S13; 
 Fri, 01 Jul 2022 17:34:11 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 11/11] hw/intc/loongarch_ipi: Fix mail send and any send
 function
Date: Fri,  1 Jul 2022 17:34:07 +0800
Message-Id: <20220701093407.2150607-12-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S13
X-Coremail-Antispam: 1UD129KBjvJXoWxXryfXw47ury7CrW3Zr18Zrb_yoW5AFWUpr
 9xZr4avr48JFW3XayDJ34UZF1DJF97WayUCFsxK34F9w1kur9F934qg39YqF1qy348WF4Y
 yr4kAw4FvF1UXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

By the document of ipi mailsend device, byte is written only when the mask bit
is 0. The original code discards mask bit and overwrite the data always, this
patch fixes the issue.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_ipi.c | 45 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 553e88703d..e4b1fb5366 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -50,35 +50,40 @@ static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
     return ret;
 }
 
-static int get_ipi_data(target_ulong val)
+static void send_ipi_data(CPULoongArchState *env, target_ulong val, target_ulong addr)
 {
     int i, mask, data;
 
-    data = val >> 32;
-    mask = (val >> 27) & 0xf;
-
+    data = address_space_ldl(&env->address_space_iocsr, addr,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+    mask  = 0;
     for (i = 0; i < 4; i++) {
-        if ((mask >> i) & 1) {
-            data &= ~(0xff << (i * 8));
+        /* bit 27 - 30 is mask for byte write */
+        if (val & (0x1UL << (27 + i))) {
+            mask |= 0xff << (i * 8);
         }
     }
-    return data;
+
+    data &= mask;
+    data |= (val >> 32) & ~mask;
+    address_space_stl(&env->address_space_iocsr, addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static void ipi_send(uint64_t val)
 {
     int cpuid, data;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     /* IPI status vector */
     data = 1 << (val & 0x1f);
-    qemu_mutex_lock_iothread();
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
-    qemu_mutex_unlock_iothread();
     address_space_stl(&env->address_space_iocsr, 0x1008,
                       data, MEMTXATTRS_UNSPECIFIED, NULL);
 
@@ -86,23 +91,23 @@ static void ipi_send(uint64_t val)
 
 static void mail_send(uint64_t val)
 {
-    int cpuid, data;
+    int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     addr = 0x1020 + (val & 0x1c);
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    data = get_ipi_data(val);
-    address_space_stl(&env->address_space_iocsr, addr,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+    send_ipi_data(env, val, addr);
 }
 
 static void any_send(uint64_t val)
 {
-    int cpuid, data;
+    int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
 
@@ -111,9 +116,7 @@ static void any_send(uint64_t val)
     CPUState *cs = qemu_get_cpu(cpuid);
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    data = get_ipi_data(val);
-    address_space_stl(&env->address_space_iocsr, addr,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+    send_ipi_data(env, val, addr);
 }
 
 static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
-- 
2.31.1


