Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEAE5A252C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:56:38 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRW4r-0002QV-UT
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oRW1I-0006Yy-78
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:52:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52020 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oRW1E-0005va-N2
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:52:55 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx72vslwhjn00KAA--.42825S4; 
 Fri, 26 Aug 2022 17:52:46 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 imammedo@redhat.com
Subject: [PATCH v1 2/2] hw/loongarch: Improve acpi dsdt table
Date: Fri, 26 Aug 2022 17:52:44 +0800
Message-Id: <20220826095244.613426-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826095244.613426-1-yangxiaojuan@loongson.cn>
References: <20220826095244.613426-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx72vslwhjn00KAA--.42825S4
X-Coremail-Antispam: 1UD129KBjvJXoW3ArW3tF4UuFW3Gr4rZFy7Jrb_yoW3AFWxp3
 ya9FWYvr15GrnFq3yfA3W5WF1UArn7G34qqasxArs2kFZFkr10qry8C393WF1Yy3s3tFWU
 XrZY934UCw4kJr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Cleanup the previous pci information in acpi dsdt table.
And using the common acpi_dsdt_add_gpex function to build
the gpex and pci information.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/acpi-build.c   | 159 +++++-------------------------------
 hw/loongarch/virt.c         |   1 +
 include/hw/loongarch/virt.h |   1 +
 3 files changed, 21 insertions(+), 140 deletions(-)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 92ee62c11a..378a6d9d38 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -30,6 +30,7 @@
 #include "qom/qom-qobject.h"
 
 #include "hw/acpi/generic_event_device.h"
+#include "hw/pci-host/gpex.h"
 
 #define ACPI_BUILD_ALIGN_SIZE             0x1000
 #define ACPI_BUILD_TABLE_SIZE             0x20000
@@ -206,108 +207,6 @@ struct AcpiBuildState {
     MemoryRegion *linker_mr;
 } AcpiBuildState;
 
-static void build_gpex_pci0_int(Aml *table)
-{
-    Aml *sb_scope = aml_scope("_SB");
-    Aml *pci0_scope = aml_scope("PCI0");
-    Aml *prt_pkg = aml_varpackage(128);
-    int slot, pin;
-
-    for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
-        for (pin = 0; pin < PCI_NUM_PINS; pin++) {
-            Aml *pkg = aml_package(4);
-            aml_append(pkg, aml_int((slot << 16) | 0xFFFF));
-            aml_append(pkg, aml_int(pin));
-            aml_append(pkg, aml_int(0));
-            aml_append(pkg, aml_int(80 + (slot + pin) % 4));
-            aml_append(prt_pkg, pkg);
-        }
-    }
-    aml_append(pci0_scope, aml_name_decl("_PRT", prt_pkg));
-    aml_append(sb_scope, pci0_scope);
-    aml_append(table, sb_scope);
-}
-
-static void build_dbg_aml(Aml *table)
-{
-    Aml *field;
-    Aml *method;
-    Aml *while_ctx;
-    Aml *scope = aml_scope("\\");
-    Aml *buf = aml_local(0);
-    Aml *len = aml_local(1);
-    Aml *idx = aml_local(2);
-
-    aml_append(scope,
-       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
-    field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("DBGB", 8));
-    aml_append(scope, field);
-
-    method = aml_method("DBUG", 1, AML_NOTSERIALIZED);
-
-    aml_append(method, aml_to_hexstring(aml_arg(0), buf));
-    aml_append(method, aml_to_buffer(buf, buf));
-    aml_append(method, aml_subtract(aml_sizeof(buf), aml_int(1), len));
-    aml_append(method, aml_store(aml_int(0), idx));
-
-    while_ctx = aml_while(aml_lless(idx, len));
-    aml_append(while_ctx,
-        aml_store(aml_derefof(aml_index(buf, idx)), aml_name("DBGB")));
-    aml_append(while_ctx, aml_increment(idx));
-    aml_append(method, while_ctx);
-    aml_append(method, aml_store(aml_int(0x0A), aml_name("DBGB")));
-    aml_append(scope, method);
-    aml_append(table, scope);
-}
-
-static Aml *build_osc_method(void)
-{
-    Aml *if_ctx;
-    Aml *if_ctx2;
-    Aml *else_ctx;
-    Aml *method;
-    Aml *a_cwd1 = aml_name("CDW1");
-    Aml *a_ctrl = aml_local(0);
-
-    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    if_ctx = aml_if(aml_equal(
-        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
-
-    /*
-     * Always allow native PME, AER (no dependencies)
-     * Allow SHPC (PCI bridges can have SHPC controller)
-     */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
-    /* Unknown revision */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
-    /* Capabilities bits were masked */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    /* Update DWORD3 in the buffer */
-    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
-    aml_append(method, if_ctx);
-
-    else_ctx = aml_else();
-    /* Unrecognized UUID */
-    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
-    aml_append(method, else_ctx);
-
-    aml_append(method, aml_return(aml_arg(3)));
-    return method;
-}
-
 static void build_uart_device_aml(Aml *table)
 {
     Aml *dev;
@@ -360,57 +259,37 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
     }
 }
 
+static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
+{
+    struct GPEXConfig cfg = {
+        .mmio64.base = VIRT_PCI_MEM_BASE,
+        .mmio64.size = VIRT_PCI_MEM_SIZE,
+        .pio.base    = VIRT_PCI_IO_BASE,
+        .pio.size    = VIRT_PCI_IO_SIZE,
+        .ecam.base   = VIRT_PCI_CFG_BASE,
+        .ecam.size   = VIRT_PCI_CFG_SIZE,
+        .irq         = PCH_PIC_IRQ_OFFSET + VIRT_DEVICE_IRQS,
+        .bus         = lams->pci_bus,
+    };
+
+    acpi_dsdt_add_gpex(scope, &cfg);
+}
+
 /* build DSDT */
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
-    Aml *dsdt, *sb_scope, *scope, *dev, *crs, *pkg;
-    int root_bus_limit = 0x7F;
+    Aml *dsdt, *scope, *pkg;
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = lams->oem_id,
                         .oem_table_id = lams->oem_table_id };
 
     acpi_table_begin(&table, table_data);
-
     dsdt = init_aml_allocator();
-
-    build_dbg_aml(dsdt);
-
-    sb_scope = aml_scope("_SB");
-    dev = aml_device("PCI0");
-    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-    aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-    aml_append(dev, build_osc_method());
-    aml_append(sb_scope, dev);
-    aml_append(dsdt, sb_scope);
-
-    build_gpex_pci0_int(dsdt);
     build_uart_device_aml(dsdt);
+    build_pci_device_aml(dsdt, lams);
     build_la_ged_aml(dsdt, machine);
 
-    scope = aml_scope("\\_SB.PCI0");
-    /* Build PCI0._CRS */
-    crs = aml_resource_template();
-    aml_append(crs,
-        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                            0x0000, 0x0, root_bus_limit,
-                            0x0000, root_bus_limit + 1));
-    aml_append(crs,
-        aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
-                    AML_POS_DECODE, AML_ENTIRE_RANGE,
-                    0x0000, 0x0000, 0xFFFF, 0x18000000, 0x10000));
-    aml_append(crs,
-        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                         AML_CACHEABLE, AML_READ_WRITE,
-                         0, VIRT_PCI_MEM_BASE,
-                         VIRT_PCI_MEM_BASE + VIRT_PCI_MEM_SIZE - 1,
-                         0, VIRT_PCI_MEM_BASE));
-    aml_append(scope, aml_name_decl("_CRS", crs));
-    aml_append(dsdt, scope);
-
     /* System State Package */
     scope = aml_scope("\\");
     pkg = aml_package(4);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index a81db29384..e90f9fccf3 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -388,6 +388,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     d = SYS_BUS_DEVICE(gpex_dev);
     sysbus_realize_and_unref(d, &error_fatal);
     pci_bus = PCI_HOST_BRIDGE(gpex_dev)->bus;
+    lams->pci_bus = pci_bus;
 
     /* Map only part size_ecam bytes of ECAM space */
     ecam_alias = g_new0(MemoryRegion, 1);
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 64c90b80d2..09f1c88ee5 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -50,6 +50,7 @@ struct LoongArchMachineState {
     DeviceState  *acpi_ged;
     int          fdt_size;
     DeviceState *platform_bus_dev;
+    PCIBus       *pci_bus;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


