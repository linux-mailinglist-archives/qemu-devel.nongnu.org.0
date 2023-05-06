Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B96F8E08
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 04:26:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv7bG-0008Ko-LR; Fri, 05 May 2023 22:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pv7bE-0008JU-Dp
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:24:40 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pv7bB-00051q-7t
 for qemu-devel@nongnu.org; Fri, 05 May 2023 22:24:40 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxBelgulVkEYoFAA--.9183S3;
 Sat, 06 May 2023 10:24:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxOLZXulVkj9RMAA--.9112S10; 
 Sat, 06 May 2023 10:24:32 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, philmd@linaro.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH RFC v3 8/9] target/loongarch: Implement set vcpu intr for kvm
Date: Sat,  6 May 2023 10:24:21 +0800
Message-Id: <20230506022422.59442-9-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230506022422.59442-1-zhaotianrui@loongson.cn>
References: <20230506022422.59442-1-zhaotianrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxOLZXulVkj9RMAA--.9112S10
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJFyUZr1rZF15WF4DAF1DZFb_yoWrWryxpF
 ZruF98Kr48JrZrJ3Z3Z3Z8Xrs8X3yfCrsF9ayIk34xCr47XryUXF1vq3srXF15G3yUWry0
 qF1Fyr15WF18Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv
 6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
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
index f20345de34..fb4bb3ede7 100644
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
index 6554013a9d..ec6a962e18 100644
--- a/target/loongarch/kvm.c
+++ b/target/loongarch/kvm.c
@@ -525,6 +525,22 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
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


