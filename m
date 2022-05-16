Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DDA5292C1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:19:52 +0200 (CEST)
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi85-00027z-Ay
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgw-0005nE-7C
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgu-0006SP-1l
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H23EAUntgXVeM3X4MSLXydnZRueTmUKM5/6vSfYaORs=;
 b=BhiBhhGkBLri+YzD5IByXsl6IlN5k4QSm3xdjHghpwitQrHBSVbSbOs5OiIHStRGvavKDP
 4QTcyTpUrJTDQ4CBT8C/KSj0SZXfukKswLIK7/E6oqLG1tlbIhjGsz37gy6wZ3PGywijRB
 07pGgDYaTmmysybcnuH0p8IubpQ2oec=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-31khmwBMN12NG4gwWlH86g-1; Mon, 16 May 2022 16:51:41 -0400
X-MC-Unique: 31khmwBMN12NG4gwWlH86g-1
Received: by mail-ej1-f69.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso6370132ejs.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=H23EAUntgXVeM3X4MSLXydnZRueTmUKM5/6vSfYaORs=;
 b=7Ds7c759OvJioG9p28wysLwx/or+/BSgULCg/EwFeL2sJmdccWq3D1kCcIacaP/Z4B
 YyUt3gwHNwfjTNUOqCqs/71a/4q+8RPHelkOxHxFkrT/FGTepUuY984VLYXS1/T9RCXS
 Krz9YZIP7U13SlHlsZP3X29F6WXBP9prPU/GSL2tb5VAUJQqLiOh/ujK0DoO79fLCcM9
 bF7TeYkB22Ph3SLfwTBKDe6XiM6yRlWAde0frFFnwMj+zmIZQzVtqZOvTUNqDB4TyY4U
 IiyHl/clREit32yxVvfd4fFI5raSgjFELVElOzIC7agmuiO1NaBJlL/wiX1yz1axozKD
 WFZQ==
X-Gm-Message-State: AOAM533G38nIh4YjWmbxEDMcNm1OuA7t2FIbVVOiElniubNpCEFi7jgN
 J/vvpleM4ghEPen3C8WbCjYMXeYDxo+BXcSv/ApAZS0KtgTFE9webYlOuzq1TWQThvDL8WFcLu8
 u8Ba0T8FAg9GO+64sSiL3nwHoLmqV+GzM/1gf6OITJ0e+isuwrv2BwUT2/Ryw
X-Received: by 2002:a17:907:1c8e:b0:6f4:e24f:20e0 with SMTP id
 nb14-20020a1709071c8e00b006f4e24f20e0mr16451976ejc.227.1652734299551; 
 Mon, 16 May 2022 13:51:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNXpNaNmUO+qA1rx88Vw1H7IWpGC8z6O4UqiL4csouuk45CCCvPHSdTlzMqcVvjnPs5yHDlQ==
X-Received: by 2002:a17:907:1c8e:b0:6f4:e24f:20e0 with SMTP id
 nb14-20020a1709071c8e00b006f4e24f20e0mr16451934ejc.227.1652734299123; 
 Mon, 16 May 2022 13:51:39 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 el8-20020a170907284800b006f3ef214e4esm149973ejc.180.2022.05.16.13.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:38 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 25/86] hw/cxl/component: Implement host bridge MMIO (8.2.5, 
 table 142)
Message-ID: <20220516204913.542894-26-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ben Widawsky <ben.widawsky@intel.com>

CXL host bridges themselves may have MMIO. Since host bridges don't have
a BAR they are treated as special for MMIO.  This patch includes
i386/pc support.
Also hook up the device reset now that we have have the MMIO
space in which the results are visible.

Note that we duplicate the PCI express case for the aml_build but
the implementations will diverge when the CXL specific _OSC is
introduced.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-24-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h                | 14 ++++++
 hw/i386/acpi-build.c                | 25 ++++++++++-
 hw/i386/pc.c                        | 27 +++++++++++-
 hw/pci-bridge/pci_expander_bridge.c | 66 ++++++++++++++++++++++++++---
 4 files changed, 122 insertions(+), 10 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 31af92fd5e..8d1a7245d0 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -10,6 +10,7 @@
 #ifndef CXL_H
 #define CXL_H
 
+#include "hw/pci/pci_host.h"
 #include "cxl_pci.h"
 #include "cxl_component.h"
 #include "cxl_device.h"
@@ -17,8 +18,21 @@
 #define CXL_COMPONENT_REG_BAR_IDX 0
 #define CXL_DEVICE_REG_BAR_IDX 2
 
+#define CXL_WINDOW_MAX 10
+
 typedef struct CXLState {
     bool is_enabled;
+    MemoryRegion host_mr;
+    unsigned int next_mr_idx;
 } CXLState;
 
+struct CXLHost {
+    PCIHostState parent_obj;
+
+    CXLComponentState cxl_cstate;
+};
+
+#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
+OBJECT_DECLARE_SIMPLE_TYPE(CXLHost, PXB_CXL_HOST)
+
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dcf6ece3d0..2d81b0f40c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -28,6 +28,7 @@
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 #include "hw/pci/pci.h"
+#include "hw/cxl/cxl.h"
 #include "hw/core/cpu.h"
 #include "target/i386/cpu.h"
 #include "hw/misc/pvpanic.h"
@@ -1572,10 +1573,21 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             }
 
             scope = aml_scope("\\_SB");
-            dev = aml_device("PC%.02X", bus_num);
+
+            if (pci_bus_is_cxl(bus)) {
+                dev = aml_device("CL%.02X", bus_num);
+            } else {
+                dev = aml_device("PC%.02X", bus_num);
+            }
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            if (pci_bus_is_express(bus)) {
+            if (pci_bus_is_cxl(bus)) {
+                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+
+                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
+                aml_append(dev, build_q35_osc_method(true));
+            } else if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
 
@@ -1595,6 +1607,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_CRS", crs));
             aml_append(scope, dev);
             aml_append(dsdt, scope);
+
+            /* Handle the ranges for the PXB expanders */
+            if (pci_bus_is_cxl(bus)) {
+                MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
+                uint64_t base = mr->addr;
+
+                crs_range_insert(crs_range_set.mem_ranges, base,
+                                 base + memory_region_size(mr) - 1);
+            }
         }
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 45e2d6092f..03d14f6564 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -75,6 +75,7 @@
 #include "acpi-build.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/cxl/cxl.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/qapi-visit-machine.h"
@@ -816,6 +817,7 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr cxl_base;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -905,6 +907,26 @@ void pc_memory_init(PCMachineState *pcms,
                                     &machine->device_memory->mr);
     }
 
+    if (machine->cxl_devices_state->is_enabled) {
+        MemoryRegion *mr = &machine->cxl_devices_state->host_mr;
+        hwaddr cxl_size = MiB;
+
+        if (pcmc->has_reserved_memory && machine->device_memory->base) {
+            cxl_base = machine->device_memory->base;
+            if (!pcmc->broken_reserved_end) {
+                cxl_base += memory_region_size(&machine->device_memory->mr);
+            }
+        } else if (pcms->sgx_epc.size != 0) {
+            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
+        } else {
+            cxl_base = 0x100000000ULL + x86ms->above_4g_mem_size;
+        }
+
+        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
+        memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
+        memory_region_add_subregion(system_memory, cxl_base, mr);
+    }
+
     /* Initialize PC system firmware */
     pc_system_firmware_init(pcms, rom_memory);
 
@@ -965,7 +987,10 @@ uint64_t pc_pci_hole64_start(void)
     X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;
 
-    if (pcmc->has_reserved_memory && ms->device_memory->base) {
+    if (ms->cxl_devices_state->host_mr.addr) {
+        hole64_start = ms->cxl_devices_state->host_mr.addr +
+            memory_region_size(&ms->cxl_devices_state->host_mr);
+    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index f762eb4a6e..8fb4f2ea91 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -61,12 +61,6 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
                          TYPE_PXB_CXL_DEVICE)
 
-typedef struct CXLHost {
-    PCIHostState parent_obj;
-
-    CXLComponentState cxl_cstate;
-} CXLHost;
-
 struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
@@ -75,6 +69,9 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     bool bypass_iommu;
+    struct cxl_dev {
+        CXLHost *cxl_host_bridge;
+    } cxl;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -197,6 +194,52 @@ static const TypeInfo pxb_host_info = {
     .class_init    = pxb_host_class_init,
 };
 
+static void pxb_cxl_realize(DeviceState *dev, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    CXLHost *cxl = PXB_CXL_HOST(dev);
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
+    hwaddr offset;
+
+    cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
+                                      TYPE_PXB_CXL_HOST);
+    sysbus_init_mmio(sbd, mr);
+
+    offset = memory_region_size(mr) * ms->cxl_devices_state->next_mr_idx;
+    if (offset > memory_region_size(&ms->cxl_devices_state->host_mr)) {
+        error_setg(errp, "Insufficient space for pxb cxl host register space");
+        return;
+    }
+
+    memory_region_add_subregion(&ms->cxl_devices_state->host_mr, offset, mr);
+    ms->cxl_devices_state->next_mr_idx++;
+}
+
+static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(class);
+
+    hc->root_bus_path = pxb_host_root_bus_path;
+    dc->fw_name = "cxl";
+    dc->realize = pxb_cxl_realize;
+    /* Reason: Internal part of the pxb/pxb-pcie device, not usable by itself */
+    dc->user_creatable = false;
+}
+
+/*
+ * This is a device to handle the MMIO for a CXL host bridge. It does nothing
+ * else.
+ */
+static const TypeInfo cxl_host_info = {
+    .name          = TYPE_PXB_CXL_HOST,
+    .parent        = TYPE_PCI_HOST_BRIDGE,
+    .instance_size = sizeof(CXLHost),
+    .class_init    = pxb_cxl_host_class_init,
+};
+
 /*
  * Registers the PXB bus as a child of pci host root bus.
  */
@@ -245,6 +288,13 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
 
 static void pxb_dev_reset(DeviceState *dev)
 {
+    CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
+    CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
+    uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
+
+    cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
 }
 
 static gint pxb_compare(gconstpointer a, gconstpointer b)
@@ -281,12 +331,13 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
         dev_name = dev->qdev.id;
     }
 
-    ds = qdev_new(TYPE_PXB_HOST);
+    ds = qdev_new(type == CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
     } else if (type == CXL) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
         bus->flags |= PCI_BUS_CXL;
+        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge = PXB_CXL_HOST(ds);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
@@ -475,6 +526,7 @@ static void pxb_register_types(void)
     type_register_static(&pxb_pcie_bus_info);
     type_register_static(&pxb_cxl_bus_info);
     type_register_static(&pxb_host_info);
+    type_register_static(&cxl_host_info);
     type_register_static(&pxb_dev_info);
     type_register_static(&pxb_pcie_dev_info);
     type_register_static(&pxb_cxl_dev_info);
-- 
MST


