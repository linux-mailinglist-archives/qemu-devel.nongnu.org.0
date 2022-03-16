Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C160E4DBAA5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 23:24:30 +0100 (CET)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUc4D-0006Er-H2
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 18:24:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1nUc1q-0003vH-4U
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:22:02 -0400
Received: from [2607:f8b0:4864:20::102a] (port=36591
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1nUc1m-0006hD-LO
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:22:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 kx13-20020a17090b228d00b001c6715c9847so1554572pjb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 15:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2Vvga2pFpfs9v+rEu3MjHqLU3KItUo2pF5RrYbXGG0=;
 b=y3Fr4OzvhPqC2Wb9aZ7+PcwODCo8DBNVcd/LWKkKO6ztZOcblMQpus+aG3bEoHgEZ2
 h+i0/OGxls/hZQkPCkcoXm+57t2hBPF48XScrxab5qhSpaKZL/fcdmvkCxiXcqVO6t1k
 wYxlO4hx4MSHK5R9XQmK+6CyJtFgK7nTU0RkA1S2ahz/5sYCAf7DNmJM4RoIjofTDSAC
 JMv8gUGbblLfK8QnPCnO2dn2wPi3UiV/wDhAXFzNwSo25LKNsfuzz3w1uG0W6pw/mdDD
 k0HHVqDay00/AbRjcVvYFTjXEknthxFBcq/fpGk27mRkhvIhexmg1AgNBL+DO3iJMo3T
 FsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2Vvga2pFpfs9v+rEu3MjHqLU3KItUo2pF5RrYbXGG0=;
 b=PMFZh5bFeHvt4L1yuDBjdO/vyT0BGO8mTTDdVUon9JfZc0IGx8F7dbqgrdALwosdZ9
 iAMJobD/X2lSh9Xqr137qAnPTTS3pQOUwm2DXU182KxeSIqw/xndag4B+R+zASv0vrC0
 111IhHoSWKh1pDDcYEm3odsx/TzOHfiiCTOkdBJ4EZDybLF7zhSkdgOoXmPqAUvDOFZh
 Z1xf0eHfiaAaW717PxI3US1Co2i3hq0/abKoEuO6eWT1iwsNwek+TogJ3kheO+PlRptj
 T/dWsGlU8TH9GgwB6I3oZC0f3Rwi5wQHmiqhPLuO+uXR0BcUGesewPWlVDgCpe3ktuGw
 hRVw==
X-Gm-Message-State: AOAM533/jwjy/dLnMNeNNd02Tdt77cZqoBAOuj0L97GDSjyBgX1pNZXw
 VJxMdVEF+u2AIyERH9OjgcT5dOfr54B8IA==
X-Google-Smtp-Source: ABdhPJxAlUeJB6GOhZKKVn6PUCNyia03n8jVl4tSkLadOen52Y357WzKr8mfWqHwyZ/tvY9iVorWbg==
X-Received: by 2002:a17:902:9007:b0:14f:3680:66d1 with SMTP id
 a7-20020a170902900700b0014f368066d1mr2010803plp.91.1647469317130; 
 Wed, 16 Mar 2022 15:21:57 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm3928363pfi.61.2022.03.16.15.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 15:21:56 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/riscv: virt: Add rivos-iommu device to 'virt'
 machine.
Date: Wed, 16 Mar 2022 15:21:16 -0700
Message-Id: <20220316222116.2492777-3-tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316222116.2492777-1-tjeznach@rivosinc.com>
References: <20220316222116.2492777-1-tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable rivos-iommu device support in riscv:virt machine emulation.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 115 +++++++++++++++++++++++++++++++---------
 include/hw/riscv/virt.h |   2 +
 3 files changed, 94 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index c6cbd7b42c..3b1528e560 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -51,6 +51,7 @@ config RISCV_VIRT
     select SIFIVE_TEST
     select VIRTIO_MMIO
     select FW_CFG_DMA
+    select RIVOS_IOMMU
 
 config SIFIVE_E
     bool
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da50cbed43..13e6f03400 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -32,6 +32,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
+#include "hw/riscv/rivos_iommu.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
 #include "hw/intc/riscv_imsic.h"
@@ -948,6 +949,33 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(name);
 }
 
+static void create_rivos_iommu_dt_binding(RISCVVirtState *s, uint16_t bdf)
+{
+    const char compat[] = "rivos,pci-iommu";
+    MachineState *mc = MACHINE(s);
+    uint32_t iommu_phandle;
+    char *iommu_node;
+    char *pci_node;
+
+    pci_node = g_strdup_printf("/soc/pci@%lx",
+            (long) virt_memmap[VIRT_PCIE_ECAM].base);
+    iommu_node = g_strdup_printf("%s/iommu@%x", pci_node, bdf);
+
+    iommu_phandle = qemu_fdt_alloc_phandle(mc->fdt);
+    qemu_fdt_add_subnode(mc->fdt, iommu_node);
+    qemu_fdt_setprop(mc->fdt, iommu_node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(mc->fdt, iommu_node, "reg",
+            1, bdf << 8, 1, 0, 1, 0, 1, 0, 1, 0);
+    qemu_fdt_setprop_cell(mc->fdt, iommu_node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(mc->fdt, iommu_node, "phandle", iommu_phandle);
+    g_free(iommu_node);
+
+    qemu_fdt_setprop_cells(mc->fdt, pci_node, "iommu-map",
+            0x0, iommu_phandle, 0x0, bdf,
+            bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf);
+    g_free(pci_node);
+}
+
 static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
@@ -1156,6 +1184,34 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
     return aplic_m;
 }
 
+static void virt_machine_done(Notifier *notifier, void *data)
+{
+    const MemMapEntry *memmap = virt_memmap;
+    uint32_t fdt_load_addr;
+    target_ulong start_addr = memmap[VIRT_DRAM].base;
+    RISCVVirtState *s = container_of(notifier, RISCVVirtState, machine_done);
+    MachineState *machine = MACHINE(s);
+
+    /* Compute the fdt load address in dram */
+    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
+                                   machine->ram_size, machine->fdt);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
+                              virt_memmap[VIRT_MROM].base,
+                              virt_memmap[VIRT_MROM].size,
+                              s->kernel_entry,
+                              fdt_load_addr, machine->fdt);
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * So here setup kernel start address and fdt address.
+     * TODO:Support firmware loading and integrate to TCG start
+     */
+    if (kvm_enabled()) {
+        riscv_setup_direct_kernel(s->kernel_entry, fdt_load_addr);
+    }
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap = virt_memmap;
@@ -1165,8 +1221,6 @@ static void virt_machine_init(MachineState *machine)
     char *soc_name;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
-    uint32_t fdt_load_addr;
-    uint64_t kernel_entry;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
 
@@ -1328,13 +1382,13 @@ static void virt_machine_init(MachineState *machine)
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
 
-        kernel_entry = riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        s->kernel_entry = riscv_load_kernel(machine->kernel_filename,
+                                            kernel_start_addr, NULL);
 
         if (machine->initrd_filename) {
             hwaddr start;
             hwaddr end = riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_entry,
+                                           machine->ram_size, s->kernel_entry,
                                            &start);
             qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
@@ -1346,7 +1400,7 @@ static void virt_machine_init(MachineState *machine)
         * If dynamic firmware is used, it doesn't know where is the next mode
         * if kernel argument is not set.
         */
-        kernel_entry = 0;
+        s->kernel_entry = 0;
     }
 
     if (drive_get(IF_PFLASH, 0, 0)) {
@@ -1364,24 +1418,6 @@ static void virt_machine_init(MachineState *machine)
     s->fw_cfg = create_fw_cfg(machine);
     rom_set_fw(s->fw_cfg);
 
-    /* Compute the fdt load address in dram */
-    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
-    /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
-                              virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
-
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * So here setup kernel start address and fdt address.
-     * TODO:Support firmware loading and integrate to TCG start
-     */
-    if (kvm_enabled()) {
-        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
-    }
-
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
 
@@ -1417,6 +1453,29 @@ static void virt_machine_init(MachineState *machine)
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
+
+    s->machine_done.notify = virt_machine_done;
+    qemu_add_machine_init_done_notifier(&s->machine_done);
+}
+
+static void virt_machine_device_plug_cb(HotplugHandler *machine,
+                                        DeviceState *dev, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_RIVOS_IOMMU_PCI)) {
+        PCIDevice *pdev = PCI_DEVICE(dev);
+        create_rivos_iommu_dt_binding(s, pci_get_bdf(pdev));
+    }
+}
+
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
+                                                        DeviceState *dev)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_RIVOS_IOMMU_PCI)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
 }
 
 static void virt_machine_instance_init(Object *obj)
@@ -1501,6 +1560,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     char str[128];
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
@@ -1512,6 +1572,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
     mc->default_ram_id = "riscv_virt_board.ram";
+    assert(!mc->get_hotplug_handler);
+    mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    hc->plug = virt_machine_device_plug_cb;
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 
@@ -1542,6 +1605,10 @@ static const TypeInfo virt_machine_typeinfo = {
     .class_init = virt_machine_class_init,
     .instance_init = virt_machine_instance_init,
     .instance_size = sizeof(RISCVVirtState),
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
 };
 
 static void virt_machine_init_register_types(void)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 78b058ec86..daef7e88a5 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -49,7 +49,9 @@ struct RISCVVirtState {
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
     FWCfgState *fw_cfg;
+    Notifier machine_done;
 
+    uint64_t kernel_entry;
     int fdt_size;
     bool have_aclint;
     RISCVVirtAIAType aia_type;
-- 
2.25.1


