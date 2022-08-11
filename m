Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905758F652
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 05:15:00 +0200 (CEST)
Received: from localhost ([::1]:43290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLyer-0003Rj-OB
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 23:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oLyaD-0003BV-PY
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 23:10:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60644 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oLyaB-0006Bg-Ck
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 23:10:05 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxzyP9cvRi8RcNAA--.8789S6;
 Thu, 11 Aug 2022 11:09:51 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 4/6] hw/loongarch: Add platform bus support
Date: Thu, 11 Aug 2022 11:09:46 +0800
Message-Id: <20220811030948.2994206-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220811030948.2994206-1-yangxiaojuan@loongson.cn>
References: <20220811030948.2994206-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxzyP9cvRi8RcNAA--.8789S6
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWkZryfXryUCw1fXFykGrg_yoWrAr1fpF
 WUuF93GF48WF47Gr93Z34fury5Awn7G3y2gF1xArn2kFnrGryUZrykC3yqyFyUJ3ykJa4F
 qFyvq34xWF4UZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Add platform bus support and add the bus information such as address,
size, irq number to FDT table.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/Kconfig        |  1 +
 hw/loongarch/virt.c         | 33 +++++++++++++++++++++++++++++++++
 include/hw/loongarch/virt.h |  1 +
 include/hw/pci-host/ls7a.h  |  5 +++++
 4 files changed, 40 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 1deea83626..fef55c5638 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -8,6 +8,7 @@ config LOONGARCH_VIRT
     select SERIAL
     select SERIAL_ISA
     select VIRTIO_PCI
+    select PLATFORM_BUS
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 561b05d404..3976e8a058 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -37,6 +37,8 @@
 #include "hw/mem/nvdimm.h"
 #include "sysemu/device_tree.h"
 #include <libfdt.h>
+#include "hw/core/sysbus-fdt.h"
+#include "hw/platform-bus.h"
 
 static void create_fdt(LoongArchMachineState *lams)
 {
@@ -346,6 +348,31 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
     return dev;
 }
 
+static DeviceState *create_platform_bus(DeviceState *pch_pic)
+{
+    DeviceState *dev;
+    SysBusDevice *sysbus;
+    int i, irq;
+    MemoryRegion *sysmem = get_system_memory();
+
+    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", VIRT_PLATFORM_BUS_NUM_IRQS);
+    qdev_prop_set_uint32(dev, "mmio_size", VIRT_PLATFORM_BUS_SIZE);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    sysbus = SYS_BUS_DEVICE(dev);
+    for (i = 0; i < VIRT_PLATFORM_BUS_NUM_IRQS; i++) {
+        irq = VIRT_PLATFORM_BUS_IRQ - PCH_PIC_IRQ_OFFSET + i;
+        sysbus_connect_irq(sysbus, i, qdev_get_gpio_in(pch_pic, irq));
+    }
+
+    memory_region_add_subregion(sysmem,
+                                VIRT_PLATFORM_BUS_BASEADDRESS,
+                                sysbus_mmio_get_region(sysbus, 0));
+    return dev;
+}
+
 static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *lams)
 {
     DeviceState *gpex_dev;
@@ -421,6 +448,8 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     memory_region_add_subregion(get_system_memory(), PM_BASE, pm_mem);
     /* acpi ged */
     lams->acpi_ged = create_acpi_ged(pch_pic, lams);
+    /* platform bus */
+    lams->platform_bus_dev = create_platform_bus(pch_pic);
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
@@ -726,6 +755,10 @@ static void loongarch_init(MachineState *machine)
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
     fdt_add_irqchip_node(lams);
+    platform_bus_add_all_fdt_nodes(machine->fdt, "/intc",
+                                   VIRT_PLATFORM_BUS_BASEADDRESS,
+                                   VIRT_PLATFORM_BUS_SIZE,
+                                   VIRT_PLATFORM_BUS_IRQ);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
     fdt_add_pcie_node(lams);
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 92b84de1c5..64c90b80d2 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -49,6 +49,7 @@ struct LoongArchMachineState {
     char         *oem_table_id;
     DeviceState  *acpi_ged;
     int          fdt_size;
+    DeviceState *platform_bus_dev;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index cdde0af1f8..9bd875ca8b 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -42,4 +42,9 @@
 #define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)
 #define VIRT_RTC_LEN             0x100
 #define VIRT_SCI_IRQ             (PCH_PIC_IRQ_OFFSET + 4)
+
+#define VIRT_PLATFORM_BUS_BASEADDRESS   0x16000000
+#define VIRT_PLATFORM_BUS_SIZE          0x2000000
+#define VIRT_PLATFORM_BUS_NUM_IRQS      2
+#define VIRT_PLATFORM_BUS_IRQ           69
 #endif
-- 
2.31.1


