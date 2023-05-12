Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C497004AF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 12:06:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxPdl-00066B-Iq; Fri, 12 May 2023 06:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pxPdd-00064v-4C
 for qemu-devel@nongnu.org; Fri, 12 May 2023 06:04:37 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pxPdZ-00087i-8j
 for qemu-devel@nongnu.org; Fri, 12 May 2023 06:04:36 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cx+ekoD15k3RUIAA--.13792S3;
 Fri, 12 May 2023 18:04:24 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxLb8mD15k_lFXAA--.23965S5; 
 Fri, 12 May 2023 18:04:24 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH v2 3/3] hw/intc: Add NULL pointer check on LoongArch ipi device
Date: Fri, 12 May 2023 18:04:21 +0800
Message-Id: <20230512100421.1867848-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230512100421.1867848-1-gaosong@loongson.cn>
References: <20230512100421.1867848-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxLb8mD15k_lFXAA--.23965S5
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGw1kZF4DZF43XFy5Xr1xAFb_yoW5Cr1Dpr
 9F9wnIqr18tFZrXas5J34UXF15Jr4xW342yF43K34Fyr4kurykWFWrt3srZFn8C34rJFyY
 vwn7Ar4jg3W7Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When ipi mailbox is used, cpu_index is decoded from iocsr register.
cpu maybe does not exist. This patch adss NULL pointer check on
ipi device.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/loongarch_ipi.c | 40 +++++++++++++++++++++++++++++-----------
 hw/intc/trace-events    |  1 +
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 054e143842..d6ab91721e 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -77,31 +77,42 @@ static void send_ipi_data(CPULoongArchState *env, uint64_t val, hwaddr addr)
 
 static void ipi_send(uint64_t val)
 {
-    int cpuid, data;
+    uint32_t cpuid;
+    uint8_t vector;
     CPULoongArchState *env;
     CPUState *cs;
     LoongArchCPU *cpu;
 
-    cpuid = (val >> 16) & 0x3ff;
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= LOONGARCH_MAX_CPUS) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_IPI_SEND", cpuid);
+        return;
+    }
+
     /* IPI status vector */
-    data = 1 << (val & 0x1f);
+    vector = extract8(val, 0, 5);
+
     cs = qemu_get_cpu(cpuid);
     cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     address_space_stl(&env->address_space_iocsr, 0x1008,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
-
+                      BIT(vector), MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static void mail_send(uint64_t val)
 {
-    int cpuid;
+    uint32_t cpuid;
     hwaddr addr;
     CPULoongArchState *env;
     CPUState *cs;
     LoongArchCPU *cpu;
 
-    cpuid = (val >> 16) & 0x3ff;
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= LOONGARCH_MAX_CPUS) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_MAIL_SEND", cpuid);
+        return;
+    }
+
     addr = 0x1020 + (val & 0x1c);
     cs = qemu_get_cpu(cpuid);
     cpu = LOONGARCH_CPU(cs);
@@ -111,14 +122,21 @@ static void mail_send(uint64_t val)
 
 static void any_send(uint64_t val)
 {
-    int cpuid;
+    uint32_t cpuid;
     hwaddr addr;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
+
+    cpuid = extract32(val, 16, 10);
+    if (cpuid >= LOONGARCH_MAX_CPUS) {
+        trace_loongarch_ipi_unsupported_cpuid("IOCSR_ANY_SEND", cpuid);
+        return;
+    }
 
-    cpuid = (val >> 16) & 0x3ff;
     addr = val & 0xffff;
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     send_ipi_data(env, val, addr);
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 50cadfb996..5c6094c457 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -292,6 +292,7 @@ sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
 # loongarch_ipi.c
 loongarch_ipi_read(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
 loongarch_ipi_write(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
+loongarch_ipi_unsupported_cpuid(const char *s, uint32_t cpuid) "%s unsupported cpuid 0x%" PRIx32
 
 # loongarch_pch_pic.c
 loongarch_pch_pic_irq_handler(int irq, int level) "irq %d level %d"
-- 
2.39.1


