Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E120E3FEA8B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:21:28 +0200 (CEST)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLhyS-0001HV-05
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mLhsR-0001oG-9H; Thu, 02 Sep 2021 04:15:15 -0400
Received: from m12-16.163.com ([220.181.12.16]:53078)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mLhsJ-0002mw-5x; Thu, 02 Sep 2021 04:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=t0eqM
 +VjeNRK3yuIBq2YaS6dv/za6U8pHx3UcchABys=; b=MTHbYOvoaJK27J9g3oNNF
 CIrv5ex26TY59uaVrbLvi7Xkgn6cNzeKHnXJxB9xyAK6WNuTa+oH8TXRB4K5+iIk
 xzdEEXdQfFVf0rCV9UhLe9iMMQbflBtsRkmdlIbuqFIGKKRAJQLzM1FjBQKV8kPQ
 VzgHt17QtPjd6THHZYoMeg=
Received: from lcm-VirtualBox.verisilicon.com (unknown [182.148.13.201])
 by smtp12 (Coremail) with SMTP id EMCowABXMRDmhzBhan7BAQ--.86S8;
 Thu, 02 Sep 2021 16:14:45 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v6 4/4] hw/arm/virt: Add PL330 DMA controller and connect with
 SMMU v3
Date: Thu,  2 Sep 2021 16:14:29 +0800
Message-Id: <20210902081429.140293-5-chunming_li1234@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210902081429.140293-1-chunming_li1234@163.com>
References: <20210902081429.140293-1-chunming_li1234@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABXMRDmhzBhan7BAQ--.86S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw4ftw4xCF45tw4UCrW7Arb_yoWxGw1kpF
 WrCFs8Wr4ftr1SqrZI9F1FkF1rAw1vk3WDGr4I9w4Sk3W8WryrXr48tasrKrWUW34kZ3W5
 Xa1DWF9Fgw1xWr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bYzuZUUUUU=
X-Originating-IP: [182.148.13.201]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/1tbiNRUCdlrPdKxYFwAAsW
Received-SPF: pass client-ip=220.181.12.16;
 envelope-from=chunming_li1234@163.com; helo=m12-16.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: chunming <chunming.li@verisilicon.com>

  . Store SMMU v3 device in virtual machine then non PCI/PCIe can get its memory region later
  . Add PL330 DMA controller to test SMMU v3 connection and function
  . The default SID for PL330 is 1 but we test other values, it works well

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/virt.c         | 96 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  2 +
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9373d20e9..564b0a109 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -143,6 +143,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
     [VIRT_UART] =               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
+    [VIRT_DMA] =                { 0x09011000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
@@ -188,6 +189,7 @@ static const int a15irqmap[] = {
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
     [VIRT_ACPI_GED] = 9,
+    [VIRT_DMA] = 10,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -205,6 +207,7 @@ static const char *valid_cpus[] = {
 };
 
 static const uint16_t smmuv3_peri_sidmap[] = {
+    [VIRT_DMA] = 1,
 };
 
 static bool cpu_type_valid(const char *cpu)
@@ -792,6 +795,93 @@ static void create_uart(const VirtMachineState *vms, int uart,
     g_free(nodename);
 }
 
+static void create_dma(const VirtMachineState *vms)
+{
+    int i;
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_DMA].base;
+    hwaddr size = vms->memmap[VIRT_DMA].size;
+    int irq = vms->irqmap[VIRT_DMA];
+    int sid = vms->peri_sidmap[VIRT_DMA];
+    const char compat[] = "arm,pl330\0arm,primecell";
+    const char irq_names[] = "abort\0dma0\0dma1\0dma2\0dma3\0dma4\0dma5\0dma6\0dma7";
+    DeviceState *dev;
+    MachineState *ms = MACHINE(vms);
+    SysBusDevice *busdev;
+    DeviceState *smmuv3_dev;
+    SMMUState *smmuv3_sys;
+    Object *smmuv3_memory;
+
+    dev = qdev_new("pl330");
+
+    if (vms->iommu == VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
+        smmuv3_dev = vms->smmuv3;
+        smmuv3_sys = ARM_SMMU(smmuv3_dev);
+        g_autofree char *memname = g_strdup_printf("%s-peri-%d[0]",
+                                                   smmuv3_sys->mrtypename,
+                                                   sid);
+
+        smmuv3_memory = object_property_get_link(OBJECT(smmuv3_dev),
+                                memname, &error_abort);
+
+        object_property_set_link(OBJECT(dev), "memory",
+                                 OBJECT(smmuv3_memory),
+                                 &error_fatal);
+    } else {
+        object_property_set_link(OBJECT(dev), "memory",
+                                 OBJECT(get_system_memory()),
+                                 &error_fatal);
+    }
+
+    qdev_prop_set_uint8(dev, "num_chnls",  8);
+    qdev_prop_set_uint8(dev, "num_periph_req",  4);
+    qdev_prop_set_uint8(dev, "num_events",  16);
+    qdev_prop_set_uint8(dev, "data_width",  64);
+    qdev_prop_set_uint8(dev, "wr_cap",  8);
+    qdev_prop_set_uint8(dev, "wr_q_dep",  16);
+    qdev_prop_set_uint8(dev, "rd_cap",  8);
+    qdev_prop_set_uint8(dev, "rd_q_dep",  16);
+    qdev_prop_set_uint16(dev, "data_buffer_dep",  256);
+
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, base);
+
+    for (i = 0; i < 9; ++i) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(vms->gic, irq + i));
+    }
+
+    nodename = g_strdup_printf("/pl330@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                    GIC_FDT_IRQ_TYPE_SPI, irq, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 4, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 5, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 6, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 7, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 8, GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
+
+    if (vms->iommu == VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "iommus",
+                               vms->iommu_phandle, sid);
+        qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    }
+
+    g_free(nodename);
+}
+
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -1226,7 +1316,7 @@ static void create_pcie_irq_map(const MachineState *ms,
                            0x7           /* PCI irq */);
 }
 
-static void create_smmu(const VirtMachineState *vms,
+static void create_smmu(VirtMachineState *vms,
                         PCIBus *bus)
 {
     char *node;
@@ -1248,6 +1338,8 @@ static void create_smmu(const VirtMachineState *vms,
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
 
+    vms->smmuv3 = dev;
+
     qdev_prop_set_uint32(dev, "len-peri-sid-map",
                          ARRAY_SIZE(smmuv3_peri_sidmap));
 
@@ -2079,6 +2171,8 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms);
 
+    create_dma(vms);
+
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index fb00118b3..09a56d95b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -72,6 +72,7 @@ enum {
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
+    VIRT_DMA,
     VIRT_FW_CFG,
     VIRT_PCIE,
     VIRT_PCIE_MMIO,
@@ -168,6 +169,7 @@ struct VirtMachineState {
     char *oem_id;
     char *oem_table_id;
     const uint16_t *peri_sidmap;
+    DeviceState *smmuv3;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.30.2



