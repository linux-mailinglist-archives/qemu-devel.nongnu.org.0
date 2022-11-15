Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFADD6297D1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuYl-0004sJ-ME; Tue, 15 Nov 2022 06:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ouuYi-0004qm-TW
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:56:56 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ouuYg-0001EU-8r
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:56:56 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxKdh_fnNj2z8HAA--.19836S3;
 Tue, 15 Nov 2022 19:56:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_eF+fnNjMpoTAA--.52055S2; 
 Tue, 15 Nov 2022 19:56:46 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn,
	maobibo@loongson.cn
Subject: [PATCH] hw/loongarch: Add cfi01 pflash device
Date: Tue, 15 Nov 2022 19:56:45 +0800
Message-Id: <20221115115645.3372746-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_eF+fnNjMpoTAA--.52055S2
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ww43ArW7uFykXFWrWFW5GFg_yoWfur1DpF
 y8CF4qgr18XFs3WrWfJwsxur15Awn7Ga4UuFy29r40k343Gr18WrWfK3yUtFyUZ3yDXF1q
 gF95Ja409anrXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add cfi01 pflash device for LoongArch virt machine

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/Kconfig        |   1 +
 hw/loongarch/acpi-build.c   |  39 +++++++++++
 hw/loongarch/virt.c         | 130 +++++++++++++++++++++++++++++++++---
 include/hw/loongarch/virt.h |   7 ++
 4 files changed, 168 insertions(+), 9 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 17d15b6c90..eb112af990 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -20,3 +20,4 @@ config LOONGARCH_VIRT
     select ACPI_HW_REDUCED
     select FW_CFG_DMA
     select DIMM
+    select PFLASH_CFI01
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 7d5f5a757d..7b08bd9670 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -279,6 +279,44 @@ static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
     acpi_dsdt_add_gpex(scope, &cfg);
 }
 
+static void build_flash_aml(Aml *scope, LoongArchMachineState *lams)
+{
+    Aml *dev, *crs;
+    MemoryRegion *flash_mem;
+
+    hwaddr flash0_base;
+    hwaddr flash0_size;
+
+    hwaddr flash1_base;
+    hwaddr flash1_size;
+
+    flash_mem = pflash_cfi01_get_memory(lams->flash[0]);
+    flash0_base = flash_mem->addr;
+    flash0_size = flash_mem->size;
+
+    flash_mem = pflash_cfi01_get_memory(lams->flash[1]);
+    flash1_base = flash_mem->addr;
+    flash1_size = flash_mem->size;
+
+    dev = aml_device("FLS0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(flash0_base, flash0_size, AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+
+    dev = aml_device("FLS1");
+    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0015")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+
+    crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(flash1_base, flash1_size, AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 #ifdef CONFIG_TPM
 static void acpi_dsdt_add_tpm(Aml *scope, LoongArchMachineState *vms)
 {
@@ -328,6 +366,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_uart_device_aml(dsdt);
     build_pci_device_aml(dsdt, lams);
     build_la_ged_aml(dsdt, machine);
+    build_flash_aml(dsdt, lams);
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(dsdt, lams);
 #endif
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index b59c07972a..c488637fad 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -42,6 +42,100 @@
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
 #include "sysemu/tpm.h"
+#include "sysemu/block-backend.h"
+#include "hw/block/flash.h"
+
+static PFlashCFI01 *virt_flash_create1(LoongArchMachineState *lams,
+                                       const char *name,
+                                       const char *alias_prop_name)
+{
+    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
+
+    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x89);
+    qdev_prop_set_uint16(dev, "id1", 0x18);
+    qdev_prop_set_uint16(dev, "id2", 0x00);
+    qdev_prop_set_uint16(dev, "id3", 0x00);
+    qdev_prop_set_string(dev, "name", name);
+    object_property_add_child(OBJECT(lams), name, OBJECT(dev));
+    object_property_add_alias(OBJECT(lams), alias_prop_name,
+                              OBJECT(dev), "drive");
+    return PFLASH_CFI01(dev);
+}
+
+static void virt_flash_create(LoongArchMachineState *lams)
+{
+    lams->flash[0] = virt_flash_create1(lams, "virt.flash0", "pflash0");
+    lams->flash[1] = virt_flash_create1(lams, "virt.flash1", "pflash1");
+}
+
+static void virt_flash_map1(PFlashCFI01 *flash,
+                            hwaddr base, hwaddr size,
+                            MemoryRegion *sysmem,
+                            int flash_id)
+{
+    DeviceState *dev = DEVICE(flash);
+    BlockBackend *blk;
+    hwaddr real_size = size;
+
+    blk = pflash_cfi01_get_blk(flash);
+    if (blk) {
+        real_size = blk_getlength(blk);
+        assert(real_size && real_size <= size);
+    }
+
+    assert(QEMU_IS_ALIGNED(real_size, VIRT_FLASH_SECTOR_SIZE));
+    assert(real_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
+
+    qdev_prop_set_uint32(dev, "num-blocks", real_size / VIRT_FLASH_SECTOR_SIZE);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    memory_region_add_subregion(sysmem, base,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
+                                                       0));
+}
+
+static void virt_flash_map(LoongArchMachineState *lams,
+                           MemoryRegion *sysmem)
+{
+    PFlashCFI01 *flash0 = lams->flash[0];
+    PFlashCFI01 *flash1 = lams->flash[1];
+
+    virt_flash_map1(flash0, VIRT_FLASH0_BASE, VIRT_FLASH0_SIZE, sysmem, 0);
+    virt_flash_map1(flash1, VIRT_FLASH1_BASE, VIRT_FLASH1_SIZE, sysmem, 1);
+}
+
+static void fdt_add_flash_node(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    char *nodename;
+    MemoryRegion *flash_mem;
+
+    hwaddr flash0_base;
+    hwaddr flash0_size;
+
+    hwaddr flash1_base;
+    hwaddr flash1_size;
+
+    flash_mem = pflash_cfi01_get_memory(lams->flash[0]);
+    flash0_base = flash_mem->addr;
+    flash0_size = flash_mem->size;
+
+    flash_mem = pflash_cfi01_get_memory(lams->flash[1]);
+    flash1_base = flash_mem->addr;
+    flash1_size = flash_mem->size;
+
+    nodename = g_strdup_printf("/flash@%" PRIx64, flash0_base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, flash0_base, 2, flash0_size,
+                                 2, flash1_base, 2, flash1_size);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "bank-width", 4);
+    g_free(nodename);
+}
 
 static void fdt_add_rtc_node(LoongArchMachineState *lams)
 {
@@ -593,28 +687,44 @@ static void loongarch_firmware_init(LoongArchMachineState *lams)
 {
     char *filename = MACHINE(lams)->firmware;
     char *bios_name = NULL;
-    int bios_size;
+    int bios_size, i;
+    BlockBackend *pflash_blk0;
+    MemoryRegion *mr;
 
     lams->bios_loaded = false;
+    /* Map legacy -drive if=pflash to machine properties */
+    for (i = 0; i < ARRAY_SIZE(lams->flash); i++) {
+        pflash_cfi01_legacy_drive(lams->flash[i],
+                                  drive_get(IF_PFLASH, 0, i));
+    }
+
+    virt_flash_map(lams, get_system_memory());
+
+    pflash_blk0 = pflash_cfi01_get_blk(lams->flash[0]);
+
+    if (pflash_blk0) {
+        if (filename) {
+            error_report("cannot use both '-bios' and '-drive if=pflash'"
+                         "options at once");
+            exit(1);
+        }
+        lams->bios_loaded = true;
+        return;
+    }
+
     if (filename) {
         bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
         if (!bios_name) {
             error_report("Could not find ROM image '%s'", filename);
             exit(1);
         }
-
-        bios_size = load_image_targphys(bios_name, VIRT_BIOS_BASE, VIRT_BIOS_SIZE);
+        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(lams->flash[0]), 0);
+        bios_size = load_image_mr(bios_name, mr);
         if (bios_size < 0) {
             error_report("Could not load ROM image '%s'", bios_name);
             exit(1);
         }
-
         g_free(bios_name);
-
-        memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
-                               VIRT_BIOS_SIZE, &error_fatal);
-        memory_region_set_readonly(&lams->bios, true);
-        memory_region_add_subregion(get_system_memory(), VIRT_BIOS_BASE, &lams->bios);
         lams->bios_loaded = true;
     }
 
@@ -779,6 +889,7 @@ static void loongarch_init(MachineState *machine)
             loongarch_direct_kernel_boot(lams);
         }
     }
+    fdt_add_flash_node(lams);
     /* register reset function */
     for (i = 0; i < machine->smp.cpus; i++) {
         lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
@@ -838,6 +949,7 @@ static void loongarch_machine_initfn(Object *obj)
     lams->acpi = ON_OFF_AUTO_AUTO;
     lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    virt_flash_create(lams);
 }
 
 static bool memhp_type_supported(DeviceState *dev)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 45c383f5a7..4ec4a7b4fe 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,6 +12,7 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
+#include "hw/block/flash.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -20,6 +21,11 @@
 #define VIRT_FWCFG_BASE         0x1e020000UL
 #define VIRT_BIOS_BASE          0x1c000000UL
 #define VIRT_BIOS_SIZE          (4 * MiB)
+#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
+#define VIRT_FLASH0_BASE        VIRT_BIOS_BASE
+#define VIRT_FLASH0_SIZE        (4 * MiB)
+#define VIRT_FLASH1_BASE        (VIRT_FLASH0_BASE + VIRT_FLASH0_SIZE)
+#define VIRT_FLASH1_SIZE        (4 * MiB)
 
 #define VIRT_LOWMEM_BASE        0
 #define VIRT_LOWMEM_SIZE        0x10000000
@@ -48,6 +54,7 @@ struct LoongArchMachineState {
     int          fdt_size;
     DeviceState *platform_bus_dev;
     PCIBus       *pci_bus;
+    PFlashCFI01  *flash[2];
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


