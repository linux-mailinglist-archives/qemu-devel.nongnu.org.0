Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D552C3F2613
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 06:40:47 +0200 (CEST)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGwKk-0003Ep-3m
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 00:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mGuTg-0000vU-9i; Thu, 19 Aug 2021 22:41:53 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:52647
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mGuTc-000722-7E; Thu, 19 Aug 2021 22:41:51 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629426964; h=from:subject:to:date:message-id;
 bh=K8QjpdjqKACP8DnxxmIBwxnIBzAaoUUh7p+/orcGP+E=;
 b=Y5WHWKciRzEaiy4FIAiXN6CD8uLYRbErnUvqCnIeHJLtXjebejMHI35oDPZCElh6QxR/ik9oSNm
 kX3H0+NeMBpC0ismV9ZYGyg2/wJikN6njXK51UYY+DCV8zZ6u+8VxYtOSEWIwBKTBKSKAN0ex7obb
 /YfFct6xcwTS3+dYdQU=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Fri, 20 Aug 2021 10:36:03 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Topic: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
Thread-Index: AdeVbB3S+4i7nlcHTb+Dg8IlAhdEUg==
Date: Fri, 20 Aug 2021 02:36:02 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.223]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--6.225600-0.000000-31
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
X-Mailman-Approved-At: Fri, 20 Aug 2021 00:38:18 -0400
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

The current SMMU V3 device model only support PCI/PCIe devices,
so we update it to support non-PCI/PCIe devices.

    hw/arm/smmuv3:
        . Create IOMMU memory regions for non-PCI/PCIe devices based on the=
ir SID
        . Add sid-map property to store non-PCI/PCIe devices SID
        . Update implementation of CFGI commands based on device SID
    hw/arm/smmu-common:
        . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting strat=
egy
    hw/arm/virt:
        . Add PL330 DMA controller and connect with SMMUv3 for testing
        . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting

Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
---
This patch depends on PL330 memory region connection patch:
https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.=
verisilicon.com/

 hw/arm/smmuv3.c              |  75 ++++++++++++++++++------
 hw/arm/virt.c                | 110 ++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmu-common.h |  12 +++-
 include/hw/arm/smmuv3.h      |   2 +
 include/hw/arm/virt.h        |   3 +
 5 files changed, 181 insertions(+), 21 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 01b60bee4..c4da05d8b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -32,6 +32,7 @@
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
+#include "hw/qdev-properties.h"
=20
 /**
  * smmuv3_trigger_irq - pulse @irq if enabled and update
@@ -612,7 +613,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev=
, SMMUEventInfo *event)
     return cfg;
 }
=20
-static void smmuv3_flush_config(SMMUDevice *sdev)
+static void __attribute__((unused)) smmuv3_flush_config(SMMUDevice *sdev)
 {
     SMMUv3State *s =3D sdev->smmu;
     SMMUState *bc =3D &s->smmu_state;
@@ -963,22 +964,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start =3D sid;
+            sid_range.end =3D sid;
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste=
,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1005,21 +1002,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_CD_ALL:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start =3D sid;
+            sid_range.end =3D sid;
             trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste=
,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
@@ -1430,6 +1424,19 @@ static void smmu_reset(DeviceState *dev)
     smmuv3_init_regs(s);
 }
=20
+static SMMUDevice *smmu_find_peri_sdev(SMMUState *s, uint16_t sid)
+{
+    SMMUDevice *sdev;
+
+    QLIST_FOREACH(sdev, &s->peri_sdev_list, next) {
+        if (smmu_get_sid(sdev) =3D=3D sid) {
+            return sdev;
+        }
+    }
+
+    return NULL;
+}
+
 static void smmu_realize(DeviceState *d, Error **errp)
 {
     SMMUState *sys =3D ARM_SMMU(d);
@@ -1437,6 +1444,9 @@ static void smmu_realize(DeviceState *d, Error **errp=
)
     SMMUv3Class *c =3D ARM_SMMUV3_GET_CLASS(s);
     SysBusDevice *dev =3D SYS_BUS_DEVICE(d);
     Error *local_err =3D NULL;
+    SMMUDevice *sdev;
+    char *name =3D NULL;
+    uint16_t sid =3D 0;
=20
     c->parent_realize(d, &local_err);
     if (local_err) {
@@ -1454,6 +1464,28 @@ static void smmu_realize(DeviceState *d, Error **err=
p)
     sysbus_init_mmio(dev, &sys->iomem);
=20
     smmu_init_irq(s, dev);
+
+    /* Create IOMMU memory region for peripheral devices based on their SI=
D */
+    for (int i =3D 0; i < s->num_sid; i++) {
+        sid =3D s->sid_map[i];
+        sdev =3D smmu_find_peri_sdev(sys, sid);
+        if (sdev) {
+            continue;
+        }
+
+        sdev =3D g_new0(SMMUDevice, 1);
+        sdev->smmu =3D sys;
+        sdev->bus =3D NULL;
+        sdev->devfn =3D sid;
+
+        name =3D g_strdup_printf("%s-peri-%d", sys->mrtypename, sid);
+        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
+                                 sys->mrtypename,
+                                 OBJECT(sys), name, 1ULL << SMMU_MAX_VA_BI=
TS);
+
+        QLIST_INSERT_HEAD(&sys->peri_sdev_list, sdev, next);
+        g_free(name);
+    }
 }
=20
 static const VMStateDescription vmstate_smmuv3_queue =3D {
@@ -1506,6 +1538,12 @@ static void smmuv3_instance_init(Object *obj)
     /* Nothing much to do here as of now */
 }
=20
+static Property smmuv3_properties[] =3D {
+    DEFINE_PROP_ARRAY("sid-map", SMMUv3State, num_sid, sid_map,
+                      qdev_prop_uint16, uint16_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void smmuv3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -1515,6 +1553,7 @@ static void smmuv3_class_init(ObjectClass *klass, voi=
d *data)
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
     c->parent_realize =3D dc->realize;
     dc->realize =3D smmu_realize;
+    device_class_set_props(dc, smmuv3_properties);
 }
=20
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0..4879be986 100644
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
@@ -204,6 +206,10 @@ static const char *valid_cpus[] =3D {
     ARM_CPU_TYPE_NAME("max"),
 };
=20
+static const uint16_t smmuv3_sidmap[] =3D {
+    [VIRT_DMA] =3D 1,
+};
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -789,6 +795,94 @@ static void create_uart(const VirtMachineState *vms, i=
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
+    const char irq_names[] =3D
+                        "abort\0dma0\0dma1\0dma2\0dma3\0dma4\0dma5\0dma6\0=
dma7";
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
+    qdev_prop_set_uint8(dev, "num_chnls", 8);
+    qdev_prop_set_uint8(dev, "num_periph_req", 4);
+    qdev_prop_set_uint8(dev, "num_events", 16);
+    qdev_prop_set_uint8(dev, "data_width", 64);
+    qdev_prop_set_uint8(dev, "wr_cap", 8);
+    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
+    qdev_prop_set_uint8(dev, "rd_cap", 8);
+    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
+    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
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
+
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -1223,7 +1317,7 @@ static void create_pcie_irq_map(const MachineState *m=
s,
                            0x7           /* PCI irq */);
 }
=20
-static void create_smmu(const VirtMachineState *vms,
+static void create_smmu(VirtMachineState *vms,
                         PCIBus *bus)
 {
     char *node;
@@ -1244,6 +1338,16 @@ static void create_smmu(const VirtMachineState *vms,
=20
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    vms->smmuv3 =3D dev;
+
+    qdev_prop_set_uint32(dev, "len-sid-map", ARRAY_SIZE(smmuv3_sidmap));
+
+    for (i =3D 0; i < ARRAY_SIZE(smmuv3_sidmap); i++) {
+        g_autofree char *propname =3D g_strdup_printf("sid-map[%d]", i);
+        qdev_prop_set_uint16(dev, propname, smmuv3_sidmap[i]);
+    }
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i =3D 0; i < NUM_SMMU_IRQS; i++) {
@@ -2067,6 +2171,8 @@ static void machvirt_init(MachineState *machine)
=20
     create_pcie(vms);
=20
+    create_dma(vms);
+
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)=
) {
         vms->acpi_dev =3D create_acpi_ged(vms);
     } else {
@@ -2762,6 +2868,8 @@ static void virt_instance_init(Object *obj)
=20
     vms->irqmap =3D a15irqmap;
=20
+    vms->sidmap =3D smmuv3_sidmap;
+
     virt_flash_create(vms);
=20
     vms->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 706be3c6d..96cc563b5 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -117,6 +117,7 @@ struct SMMUState {
     QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
     uint8_t bus_num;
     PCIBus *primary_bus;
+    QLIST_HEAD(, SMMUDevice) peri_sdev_list;
 };
=20
 struct SMMUBaseClass {
@@ -138,7 +139,11 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_=
t bus_num);
 /* Return the stream ID of an SMMU device */
 static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 {
-    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    if (!sdev->bus) {
+        return sdev->devfn;
+    } else {
+        return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
+    }
 }
=20
 /**
@@ -154,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMU=
AccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
=20
-/* Return the iommu mr associated to @sid, or NULL if none */
+/**
+ * Return the iommu mr associated to @sid, or NULL if none
+ * Only for PCI device, check smmu_find_peri_sdev for peripheral device
+ */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
=20
 #define SMMU_IOTLB_MAX_SIZE 256
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index c641e6073..32ba84990 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -39,6 +39,8 @@ struct SMMUv3State {
     uint32_t features;
     uint8_t sid_size;
     uint8_t sid_split;
+    uint32_t num_sid;
+    uint16_t *sid_map;
=20
     uint32_t idr[6];
     uint32_t iidr;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c4669..f307b2658 100644
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
@@ -167,6 +168,8 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    DeviceState *smmuv3;
+    const uint16_t *sidmap;
 };
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--

