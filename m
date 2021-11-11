Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70644CF3D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:48:27 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzCV-0007si-4u
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:48:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0b-0005r4-JF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:09 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54136 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0Z-0001oi-EE
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:09 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S19; 
 Thu, 11 Nov 2021 09:35:52 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 17/30] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
Date: Thu, 11 Nov 2021 09:35:15 +0800
Message-Id: <1636594528-8175-18-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S19
X-Coremail-Antispam: 1UD129KBjvJXoWxWw48AFWkGF13AF45tr4xWFg_yoWrCw1fpr
 y3ur13tF48Gr13X398t345XFn8Jrn3Wr12vF1SkryIkrZrAr15uw1vyrykZFyUt3yrJFZY
 gr95K3W7WF4UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Loongson-3A5000 support 14 interrupts from 64 - 77(Timer->75 IPI->76)
Loongson-3A5000 and ls7a form a legacy model and extended model irq
hierarchy.Tcg mode emulate a simplified extended model which
has no Legacy I/O Interrupt Controller(LIOINTC) and LPC.
e.g:

 |    +-----+    +---------+     +-------+             |
 |    | IPI |--> | CPUINTC | <-- | Timer |             |
 |    +-----+    +---------+     +-------+             |
 |                    ^                                |
 |                    |                                |
 |               +---------+
 |               | EIOINTC |
 |               +---------+
 |                ^       ^                            |
 |                |       |                            |
 |         +---------+ +---------+                     |
 |         | PCH-PIC | | PCH-MSI |                     |
 |         +---------+ +---------+                     |
 |           ^     ^           ^                       |
 |           |     |           |                       |
 |   +---------+ +---------+ +---------+               |
 |   | UARTs | | Devices | | Devices |                 |
 |   +---------+ +---------+ +---------+               |
 |        ^                                            |

The following series patch will realize the interrupt
controller in this model.

More detailed info can be found at the kernel doc or manual
1.https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/
linux-loongson.git/tree/Documentation/loongarch?h=loongarch-next
2.https://github.com/loongson/LoongArch-Documentation

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongarch_int.c     | 59 ++++++++++++++++++++++++++++++++
 hw/loongarch/ls3a5000_virt.c     |  2 ++
 hw/loongarch/meson.build         |  1 +
 include/hw/loongarch/loongarch.h |  2 ++
 4 files changed, 64 insertions(+)
 create mode 100644 hw/loongarch/loongarch_int.c

diff --git a/hw/loongarch/loongarch_int.c b/hw/loongarch/loongarch_int.c
new file mode 100644
index 0000000000..2502d056ac
--- /dev/null
+++ b/hw/loongarch/loongarch_int.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LOONGARCH interrupt support
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "hw/irq.h"
+#include "hw/loongarch/loongarch.h"
+#include "cpu.h"
+
+static void cpu_loongarch_irq_request(void *opaque, int irq, int level)
+{
+    LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    bool locked = false;
+
+    if (irq < 0 || irq > N_IRQS) {
+        return;
+    }
+
+    /* Make sure locking works even if BQL is already held by the caller */
+    if (!qemu_mutex_iothread_locked()) {
+        locked = true;
+        qemu_mutex_lock_iothread();
+    }
+
+    if (level) {
+        env->CSR_ESTAT |= 1 << irq;
+    } else {
+        env->CSR_ESTAT &= ~(1 << irq);
+    }
+
+    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+
+    if (locked) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
+void cpu_loongarch_init_irq(LoongArchCPU *cpu)
+{
+    CPULoongArchState *env = &cpu->env;
+    qemu_irq *qi;
+    int i;
+
+    qi = qemu_allocate_irqs(cpu_loongarch_irq_request, cpu, N_IRQS);
+    for (i = 0; i < N_IRQS; i++) {
+        env->irq[i] = qi[i];
+    }
+    g_free(qi);
+}
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 7c88d64795..37d6b1ec88 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -150,6 +150,8 @@ static void ls3a5000_virt_init(MachineState *machine)
         env = &cpu->env;
         cpu_states[i] = env;
 
+        /* Init CPU internal devices */
+        cpu_loongarch_init_irq(cpu);
         cpu_loongarch_clock_init(cpu);
         qemu_register_reset(main_cpu_reset, cpu);
     }
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index 1e743cadb8..a972210680 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,4 +1,5 @@
 loongarch_ss = ss.source_set()
+loongarch_ss.add(files('loongarch_int.c'))
 loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index edab069f76..8538697e5f 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -43,4 +43,6 @@ typedef struct LoongArchMachineState {
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
 DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
                          TYPE_LOONGARCH_MACHINE)
+
+void cpu_loongarch_init_irq(LoongArchCPU *cpu);
 #endif
-- 
2.27.0


