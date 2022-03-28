Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACDD4E97E0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:18:26 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpGL-0004ne-Uy
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:18:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nYoxH-00036o-J1
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34968 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nYoxC-0001Rp-RR
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:58:43 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxbxPOsEFih08RAA--.17957S17; 
 Mon, 28 Mar 2022 20:58:26 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v7 15/29] hw/loongarch: Add LoongArch cpu interrupt
 support(CPUINTC)
Date: Mon, 28 Mar 2022 20:57:35 +0800
Message-Id: <20220328125749.2918087-16-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxbxPOsEFih08RAA--.17957S17
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4ftrW8ZF1UKr1rAr1DZFb_yoW5Jr1fpr
 y3uw13WF4UJFnxXw4rt343Xrn8urn3G3ZF9F4IyryxuryDAwn8uw1ktF97XFyDC34rXFWj
 qFyrtw4UW3WUGr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
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
 hw/loongarch/loongson3.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 1cb7bf057c..7b4e77a6a6 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -19,6 +19,29 @@
 
 #include "target/loongarch/cpu.h"
 
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
 static void loongarch_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -69,6 +92,8 @@ static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
     CPULoongArchState *env;
     env = &la_cpu->env;
 
+    qdev_init_gpio_in(DEVICE(la_cpu), loongarch_cpu_set_irq, N_IRQS);
+
     memory_region_init_io(&env->system_iocsr, OBJECT(la_cpu), NULL,
                       env, "iocsr", UINT64_MAX);
     address_space_init(&env->address_space_iocsr, &env->system_iocsr, "IOCSR");
-- 
2.31.1


