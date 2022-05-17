Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7E52A160
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 14:22:18 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwDR-0005gW-S3
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 08:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nqvQC-0004SZ-74
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:31:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52142 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nqvQ6-0001we-Qr
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:31:23 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxcNpPh4Ni4sEZAA--.25635S37; 
 Tue, 17 May 2022 19:31:04 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca
Subject: [PATCH v4 35/43] hw/loongarch: Add irq hierarchy for the system
Date: Tue, 17 May 2022 19:30:15 +0800
Message-Id: <20220517113023.3051143-36-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxcNpPh4Ni4sEZAA--.25635S37
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUJw1rJw1UCF43ZryxKrg_yoWrZr1kpr
 y3Cr4fKr4UJF43Xws3K3WUWrn8Gws5C3W29a4akrySkr1UAryUZayvk3yktFyUJ3ykXr15
 XFy5AF1Ig3WDAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

This patch add the irq hierarchy for the virt board.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/loongson3.c | 104 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 7df32f777e..7a5c61e2df 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -16,8 +16,110 @@
 #include "sysemu/rtc.h"
 #include "hw/loongarch/virt.h"
 #include "exec/address-spaces.h"
+#include "hw/intc/loongarch_ipi.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/intc/loongarch_pch_msi.h"
+#include "hw/pci-host/ls7a.h"
+
 #include "target/loongarch/cpu.h"
 
+static void loongarch_irq_init(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    DeviceState *pch_pic, *pch_msi, *cpudev;
+    DeviceState *ipi, *extioi;
+    SysBusDevice *d;
+    LoongArchCPU *lacpu;
+    CPULoongArchState *env;
+    CPUState *cpu_state;
+    int cpu, pin, i;
+
+    ipi = qdev_new(TYPE_LOONGARCH_IPI);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
+
+    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(extioi), &error_fatal);
+
+    /*
+     * The connection of interrupts:
+     *   +-----+    +---------+     +-------+
+     *   | IPI |--> | CPUINTC | <-- | Timer |
+     *   +-----+    +---------+     +-------+
+     *                  ^
+     *                  |
+     *            +---------+
+     *            | EIOINTC |
+     *            +---------+
+     *             ^       ^
+     *             |       |
+     *      +---------+ +---------+
+     *      | PCH-PIC | | PCH-MSI |
+     *      +---------+ +---------+
+     *        ^      ^          ^
+     *        |      |          |
+     * +--------+ +---------+ +---------+
+     * | UARTs  | | Devices | | Devices |
+     * +--------+ +---------+ +---------+
+     */
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        cpu_state = qemu_get_cpu(cpu);
+        cpudev = DEVICE(cpu_state);
+        lacpu = LOONGARCH_CPU(cpu_state);
+        env = &(lacpu->env);
+
+        /* connect ipi irq to cpu irq */
+        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
+        /* IPI iocsr memory region */
+        memory_region_add_subregion(&env->system_iocsr, SMP_IPI_MAILBOX,
+                                    sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
+                                    cpu));
+        /* extioi iocsr memory region */
+        memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
+                                cpu));
+    }
+
+    /*
+     * connect ext irq to the cpu irq
+     * cpu_pin[9:2] <= intc_pin[7:0]
+     */
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        cpudev = DEVICE(qemu_get_cpu(cpu));
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
+                                  qdev_get_gpio_in(cpudev, pin + 2));
+        }
+    }
+
+    pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
+    d = SYS_BUS_DEVICE(pch_pic);
+    sysbus_realize_and_unref(d, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), LS7A_IOAPIC_REG_BASE,
+                            sysbus_mmio_get_region(d, 0));
+    memory_region_add_subregion(get_system_memory(),
+                            LS7A_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
+                            sysbus_mmio_get_region(d, 1));
+    memory_region_add_subregion(get_system_memory(),
+                            LS7A_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
+                            sysbus_mmio_get_region(d, 2));
+
+    /* Connect 64 pch_pic irqs to extioi */
+    for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
+        qdev_connect_gpio_out(DEVICE(d), i, qdev_get_gpio_in(extioi, i));
+    }
+
+    pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
+    d = SYS_BUS_DEVICE(pch_msi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
+    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
+        /* Connect 192 pch_msi irqs to extioi */
+        qdev_connect_gpio_out(DEVICE(d), i,
+                              qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
+    }
+}
+
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -63,6 +165,8 @@ static void loongarch_init(MachineState *machine)
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* Initialize the IO interrupt subsystem */
+    loongarch_irq_init(lams);
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


