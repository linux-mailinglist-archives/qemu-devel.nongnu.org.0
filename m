Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51763F55CB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 04:26:46 +0200 (CEST)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIM9A-0000Jy-1C
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 22:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIM82-0007Id-2W; Mon, 23 Aug 2021 22:25:30 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:37764
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIM7z-0002hX-VN; Mon, 23 Aug 2021 22:25:29 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629771924; h=from:subject:to:date:message-id;
 bh=qi848n0X9wLAnyazpst7mFDwkTPzoTkUmk0fys2dj9Q=;
 b=BBvNtoFeLtbiIp3GH3WBa26r9wH2y7U43OItSZ858B1zT9NpGkmPu9QxNMN8odROLAmRsUTGK8t
 HdeL6KFS69WgcFLTv+LpphXTuysyWcN0vsByqv6SIbjWIQHTk6DJVouNwi7EFCV69ZgU/KGTdwR3Q
 cbz4Nt01AGX8BZFSSMo=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 10:25:24 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v3 4/4] hw/arm/virt: Add PL330 DMA controller and connect
 with SMMU v3
Thread-Topic: [PATCH v3 4/4] hw/arm/virt: Add PL330 DMA controller and
 connect with SMMU v3
Thread-Index: AQHXl/i+JBd6GcecKUmRI+fxlqaamauB7mHw
Date: Tue, 24 Aug 2021 02:25:24 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAB43@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.39]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--7.067000-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LCM <chunming.li@verisilicon.com>

Add PL330 DMA controller to test SMMU v3 connection and function.
The default SID for PL330 is 1 but we test other values, it works well.

Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
---
 hw/arm/virt.c         | 92 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c3fd30e07..8180e4a33 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -143,6 +143,7 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_GIC_REDIST] =3D         { 0x080A0000, 0x00F60000 },
     [VIRT_UART] =3D               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =3D                { 0x09010000, 0x00001000 },
+    [VIRT_DMA] =3D                { 0x09011000, 0x00001000 },
     [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
@@ -188,6 +189,7 @@ static const int a15irqmap[] =3D {
     [VIRT_GPIO] =3D 7,
     [VIRT_SECURE_UART] =3D 8,
     [VIRT_ACPI_GED] =3D 9,
+    [VIRT_DMA] =3D 10,
     [VIRT_MMIO] =3D 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] =3D 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] =3D 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -205,7 +207,7 @@ static const char *valid_cpus[] =3D {
 };
=20
 static const uint16_t smmuv3_sidmap[] =3D {
-
+    [VIRT_DMA] =3D 1,
 };
=20
 static bool cpu_type_valid(const char *cpu)
@@ -793,6 +795,92 @@ static void create_uart(const VirtMachineState *vms, i=
nt uart,
     g_free(nodename);
 }
=20
+static void create_dma(const VirtMachineState *vms)
+{
+    int i;
+    char *nodename;
+    hwaddr base =3D vms->memmap[VIRT_DMA].base;
+    hwaddr size =3D vms->memmap[VIRT_DMA].size;
+    int irq =3D vms->irqmap[VIRT_DMA];
+    int sid =3D vms->sidmap[VIRT_DMA];
+    const char compat[] =3D "arm,pl330\0arm,primecell";
+    const char irq_names[] =3D "abort\0dma0\0dma1\0dma2\0dma3\0dma4\0dma5\=
0dma6\0dma7";
+    DeviceState *dev;
+    MachineState *ms =3D MACHINE(vms);
+    SysBusDevice *busdev;
+    DeviceState *smmuv3_dev;
+    SMMUState *smmuv3_sys;
+    Object *smmuv3_memory;
+
+    dev =3D qdev_new("pl330");
+
+    if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
+        smmuv3_dev =3D vms->smmuv3;
+        smmuv3_sys =3D ARM_SMMU(smmuv3_dev);
+        g_autofree char *memname =3D g_strdup_printf("%s-peri-%d[0]",
+                                                   smmuv3_sys->mrtypename,
+                                                   sid);
+
+        smmuv3_memory =3D object_property_get_link(OBJECT(smmuv3_dev),
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
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, base);
+
+    for (i =3D 0; i < 9; ++i) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(vms->gic, irq + i))=
;
+    }
+
+    nodename =3D g_strdup_printf("/pl330@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compa=
t));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                    GIC_FDT_IRQ_TYPE_SPI, irq, GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 4, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 5, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 6, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 7, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI,
+                    GIC_FDT_IRQ_TYPE_SPI, irq + 8, GIC_FDT_IRQ_FLAGS_LEVEL=
_HI);
+
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle)=
;
+    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
+
+    if (vms->iommu =3D=3D VIRT_IOMMU_SMMUV3 && vms->iommu_phandle) {
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "iommus",
+                               vms->iommu_phandle, sid);
+        qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
+    }
+
+    g_free(nodename);
+}
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -2081,6 +2169,8 @@ static void machvirt_init(MachineState *machine)
=20
     create_pcie(vms);
=20
+    create_dma(vms);
+
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)=
) {
         vms->acpi_dev =3D create_acpi_ged(vms);
     } else {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index d3402a43d..f307b2658 100644
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
--=20


