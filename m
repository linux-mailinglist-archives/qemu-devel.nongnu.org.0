Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03429432FD6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:41:20 +0200 (CEST)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjkM-0001vr-Un
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfR-00020Y-Cx
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35052 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjfA-0004ZX-F3
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:12 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S17; 
 Tue, 19 Oct 2021 15:35:39 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/31] hw/loongarch: Add loongarch cpu interrupt
 support(CPUINTC)
Date: Tue, 19 Oct 2021 15:35:01 +0800
Message-Id: <1634628917-10031-16-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S17
X-Coremail-Antispam: 1UD129KBjvJXoWxWw48AFWkGF13AF45tr4xWFg_yoWrCw18pr
 y3urnxtF48GrnrXrZ8t345Xrn8Jwn7Wr12vF4SkryIkrsrAr15uw1vyrykZFyUt3yrJFZY
 gr95K3W7WF4UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
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
 hw/loongarch/loongarch_int.c     | 62 ++++++++++++++++++++++++++++++++
 hw/loongarch/ls3a5000_virt.c     |  2 ++
 hw/loongarch/meson.build         |  1 +
 include/hw/loongarch/loongarch.h |  2 ++
 4 files changed, 67 insertions(+)
 create mode 100644 hw/loongarch/loongarch_int.c

diff --git a/hw/loongarch/loongarch_int.c b/hw/loongarch/loongarch_int.c
new file mode 100644
index 0000000000..7282bc28f6
--- /dev/null
+++ b/hw/loongarch/loongarch_int.c
@@ -0,0 +1,62 @@
+/*
+ * QEMU LOONGARCH interrupt support
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
+
+
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 71ffc2b81f..222c76bc0d 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -145,6 +145,8 @@ static void ls3a5000_virt_init(MachineState *machine)
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
index 087a988c34..0edc313546 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -44,4 +44,6 @@ typedef struct LoongarchMachineState {
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
 DECLARE_INSTANCE_CHECKER(LoongarchMachineState, LOONGARCH_MACHINE,
                          TYPE_LOONGARCH_MACHINE)
+
+void cpu_loongarch_init_irq(LoongArchCPU *cpu);
 #endif
-- 
2.27.0


