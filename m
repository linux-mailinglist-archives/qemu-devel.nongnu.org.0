Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73E94882D1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:29:23 +0100 (CET)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n682M-0007sY-TP
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 04:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n67tb-0005az-2M
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:20:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40642 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n67tN-0001Vi-St
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:20:10 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMrrVdlhvLMAAA--.1341S18; 
 Sat, 08 Jan 2022 17:14:42 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 16/30] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
Date: Sat,  8 Jan 2022 04:14:05 -0500
Message-Id: <20220108091419.2027710-17-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxKMrrVdlhvLMAAA--.1341S18
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4ftrW8ZF1UKr1rAr1DZFb_yoW8KFW3pr
 y3ur13XF4UJFnxXws8J345Xr15Crn3GwsFvF4IyryxuF9rAwn8Ww18JFykAFyDC348XFWU
 XFyrGw1UW3WUGrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
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
 hw/loongarch/loongson3.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 3e72c1666c..6e796c2c08 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -70,6 +70,29 @@ static const MemoryRegionOps loongarch_qemu_ops = {
     },
 };
 
+static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
+{
+    LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    if (irq < 0 || irq > N_IRQS) {
+        return;
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
+}
+
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -94,6 +117,7 @@ static void loongarch_init(MachineState *machine)
     /* Init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
         la_cpu = LOONGARCH_CPU(cpu_create(machine->cpu_type));
+        qdev_init_gpio_in(DEVICE(la_cpu), loongarch_cpu_set_irq, N_IRQS);
 
         qemu_register_reset(loongarch_cpu_reset, la_cpu);
 
-- 
2.27.0


