Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B046F01B9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prw2A-00055Z-ED; Thu, 27 Apr 2023 03:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1prw1t-00050z-Qf
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:27:01 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1prw1p-0007cc-Kr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:27:01 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxvOq8I0pk93cBAA--.2405S3;
 Thu, 27 Apr 2023 15:26:52 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axy7K1I0pk9Ec+AA--.18880S10; 
 Thu, 27 Apr 2023 15:26:52 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, philmd@linaro.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH RFC v2 8/9] target/loongarch: Implement set vcpu intr for kvm
Date: Thu, 27 Apr 2023 15:26:44 +0800
Message-Id: <20230427072645.3368102-9-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axy7K1I0pk9Ec+AA--.18880S10
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFyUZr1rZF15WF4DAF1DZFb_yoWrWryxpr
 ZruF98Kr4xJrZrJ3Z3Z3Z8Xrn8X3yfCrnF9aySk34xCr47XryUXF1vq3srXF13G3y8WryI
 qr1Fyw15WF18Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv
 6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
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

Implement loongarch kvm set vcpu interrupt interface,
when a irq is set in vcpu, we use the KVM_INTERRUPT
ioctl to set intr into kvm.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 target/loongarch/cpu.c           | 18 +++++++++++++-----
 target/loongarch/kvm-stub.c      | 11 +++++++++++
 target/loongarch/kvm.c           | 16 ++++++++++++++++
 target/loongarch/kvm_loongarch.h | 13 +++++++++++++
 target/loongarch/trace-events    |  1 +
 5 files changed, 54 insertions(+), 5 deletions(-)
 create mode 100644 target/loongarch/kvm-stub.c
 create mode 100644 target/loongarch/kvm_loongarch.h

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 600c00bbf2..d0b8f652a1 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,6 +18,11 @@
 #include "cpu-csr.h"
 #include "sysemu/reset.h"
 #include "tcg/tcg.h"
+#include "sysemu/kvm.h"
+#include "kvm_loongarch.h"
+#ifdef CONFIG_KVM
+#include <linux/kvm.h>
+#endif
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -104,12 +109,15 @@ void loongarch_cpu_set_irq(void *opaque, int irq, int level)
         return;
     }
 
-    env->CSR_ESTAT = deposit64(env->CSR_ESTAT, irq, 1, level != 0);
-
-    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    if (kvm_enabled()) {
+        kvm_loongarch_set_interrupt(cpu, irq, level);
     } else {
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        env->CSR_ESTAT = deposit64(env->CSR_ESTAT, irq, 1, level != 0);
+        if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
     }
 }
 
diff --git a/target/loongarch/kvm-stub.c b/target/loongarch/kvm-stub.c
new file mode 100644
index 0000000000..9965c1f119
--- /dev/null
+++ b/target/loongarch/kvm-stub.c
@@ -0,0 +1,11 @@
+/*
+ * QEMU KVM LoongArch specific function stubs
+ *
+ * Copyright (c) 2023 Loongson Technology Corporation Limited
+ */
+#include "cpu.h"
+
+void kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int level)
+{
+   g_assert_not_reached();
+}
diff --git a/target/loongarch/kvm.c b/target/loongarch/kvm.c
index bd994926d9..e80ca8b37f 100644
--- a/target/loongarch/kvm.c
+++ b/target/loongarch/kvm.c
@@ -519,6 +519,22 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     return ret;
 }
 
+int kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int level)
+{
+    struct kvm_loongarch_interrupt intr;
+    CPUState *cs = CPU(cpu);
+
+    intr.cpu = cs->cpu_index;
+    if (level) {
+        intr.irq = irq;
+    } else {
+        intr.irq = -irq;
+    }
+
+    trace_kvm_set_intr(irq, level);
+    return kvm_vcpu_ioctl(cs, KVM_INTERRUPT, &intr);
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
diff --git a/target/loongarch/kvm_loongarch.h b/target/loongarch/kvm_loongarch.h
new file mode 100644
index 0000000000..cdef980eec
--- /dev/null
+++ b/target/loongarch/kvm_loongarch.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch kvm interface
+ *
+ * Copyright (c) 2023 Loongson Technology Corporation Limited
+ */
+
+#ifndef QEMU_KVM_LOONGARCH_H
+#define QEMU_KVM_LOONGARCH_H
+
+int  kvm_loongarch_set_interrupt(LoongArchCPU *cpu, int irq, int level);
+
+#endif
diff --git a/target/loongarch/trace-events b/target/loongarch/trace-events
index c79e01663a..2673e43bfd 100644
--- a/target/loongarch/trace-events
+++ b/target/loongarch/trace-events
@@ -12,3 +12,4 @@ kvm_failed_put_mpstate(const char *msg) "Failed to put mp_state into KVM: %s"
 kvm_failed_get_counter(const char *msg) "Failed to get counter from KVM: %s"
 kvm_failed_put_counter(const char *msg) "Failed to put counter into KVM: %s"
 kvm_arch_handle_exit(int num) "kvm arch handle exit, the reason number: %d"
+kvm_set_intr(int irq, int level) "kvm set interrupt, irq num: %d, level: %d"
-- 
2.31.1


