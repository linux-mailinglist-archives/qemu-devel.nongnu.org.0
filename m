Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124175BE2F6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:21:26 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaaNV-00028R-PC
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaZuj-0000PQ-7C
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33990 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaZuc-0005Tt-Us
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmsCjSljVJ8eAA--.35099S6; 
 Tue, 20 Sep 2022 17:51:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v2 4/9] hw/loongarch: Add platform bus support
Date: Tue, 20 Sep 2022 17:50:53 +0800
Message-Id: <20220920095058.4124145-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxnmsCjSljVJ8eAA--.35099S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5WF43WFW8tryfCr17ZFb_yoWrCw1kpF
 WUuFn3WF4xWF47Gr93Z34fury5Awn7G3y7WF1xArn2kF1DKryDZrykC3yqyFyUJ3y8Ja4F
 qryvq34xWF4UXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add platform bus support and add the bus information such as address,
size, irq number to FDT table.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-5-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
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
index 68b59a6c9f..5fd3834c0a 100644
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
@@ -345,6 +347,31 @@ static DeviceState *create_acpi_ged(DeviceState *pch_pic, LoongArchMachineState
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
@@ -420,6 +447,8 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     memory_region_add_subregion(get_system_memory(), PM_BASE, pm_mem);
     /* acpi ged */
     lams->acpi_ged = create_acpi_ged(pch_pic, lams);
+    /* platform bus */
+    lams->platform_bus_dev = create_platform_bus(pch_pic);
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
@@ -725,6 +754,10 @@ static void loongarch_init(MachineState *machine)
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


