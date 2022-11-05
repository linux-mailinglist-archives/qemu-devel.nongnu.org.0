Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A84A61A756
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 04:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or9vV-0007f2-Ex; Fri, 04 Nov 2022 23:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1or9rl-0004H7-B8
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:29:05 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1or9ri-0006TM-Rx
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 23:29:04 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axjrd72GVjp5oEAA--.10598S3;
 Sat, 05 Nov 2022 11:28:59 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxtuN52GVjeKENAA--.38334S7; 
 Sat, 05 Nov 2022 11:28:59 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v3 5/7] hw/loongarch: Add TPM device for LoongArch virt machine
Date: Sat,  5 Nov 2022 11:28:55 +0800
Message-Id: <20221105032857.3789472-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221105032857.3789472-1-gaosong@loongson.cn>
References: <20221105032857.3789472-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtuN52GVjeKENAA--.38334S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGry8WF15Wr4rCrykGF1kAFb_yoWrWrykpa
 y7uFZayrWrWFnrW3sxJ3sYgFn8Jr4kA342vF4Ikrs2kF9rKr1kXw48K3sFyFy7A3yktFWU
 uryvqa4xuF4rXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCF
 FI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv
 8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add TPM device for LoongArch virt machine, including
establish TPM acpi info and add TYPE_TPM_TIS_SYSBUS
to dynamic_sysbus_devices list.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20221028014007.2718352-4-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/acpi-build.c | 51 ++++++++++++++++++++++++++++++++++++++-
 hw/loongarch/virt.c       |  4 +++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 378a6d9d38..68dfb9f88a 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -31,6 +31,9 @@
 
 #include "hw/acpi/generic_event_device.h"
 #include "hw/pci-host/gpex.h"
+#include "sysemu/tpm.h"
+#include "hw/platform-bus.h"
+#include "hw/acpi/aml-build.h"
 
 #define ACPI_BUILD_ALIGN_SIZE             0x1000
 #define ACPI_BUILD_TABLE_SIZE             0x20000
@@ -275,6 +278,41 @@ static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
     acpi_dsdt_add_gpex(scope, &cfg);
 }
 
+#ifdef CONFIG_TPM
+static void acpi_dsdt_add_tpm(Aml *scope, LoongArchMachineState *vms)
+{
+    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
+    hwaddr pbus_base = VIRT_PLATFORM_BUS_BASEADDRESS;
+    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpm_find());
+    MemoryRegion *sbdev_mr;
+    hwaddr tpm_base;
+
+    if (!sbdev) {
+        return;
+    }
+
+    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    assert(tpm_base != -1);
+
+    tpm_base += pbus_base;
+
+    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
+
+    Aml *dev = aml_device("TPM0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs,
+               aml_memory32_fixed(tpm_base,
+                                  (uint32_t)memory_region_size(sbdev_mr),
+                                  AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+#endif
+
 /* build DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
@@ -289,7 +327,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_uart_device_aml(dsdt);
     build_pci_device_aml(dsdt, lams);
     build_la_ged_aml(dsdt, machine);
-
+#ifdef CONFIG_TPM
+    acpi_dsdt_add_tpm(dsdt, lams);
+#endif
     /* System State Package */
     scope = aml_scope("\\");
     pkg = aml_package(4);
@@ -359,6 +399,15 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                    lams->oem_table_id);
     }
 
+#ifdef CONFIG_TPM
+    /* TPM info */
+    if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_tpm2(tables_blob, tables->linker,
+                   tables->tcpalog, lams->oem_id,
+                   lams->oem_table_id);
+    }
+#endif
     /* Add tables supplied by user (if any) */
     for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
         unsigned len = acpi_table_len(u);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index afc1c8ac77..5e4c2790bf 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -41,6 +41,7 @@
 #include "hw/platform-bus.h"
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
+#include "sysemu/tpm.h"
 
 static void fdt_add_rtc_node(LoongArchMachineState *lams)
 {
@@ -960,6 +961,9 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "acpi",
         "Enable ACPI");
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+#ifdef CONFIG_TPM
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
 }
 
 static const TypeInfo loongarch_machine_types[] = {
-- 
2.31.1


