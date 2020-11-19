Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83E2B89E2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 02:55:00 +0100 (CET)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfZA3-0003kh-3X
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 20:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6G-0008I7-Me
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6B-0003NH-3Y
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:04 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cc2gn32Xjz6y20;
 Thu, 19 Nov 2020 09:50:29 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 09:50:37 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v10 1/9] acpi/gpex: Extract two APIs from acpi_dsdt_add_pci
Date: Thu, 19 Nov 2020 09:48:33 +0800
Message-ID: <20201119014841.7298-2-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119014841.7298-1-cenjiahui@huawei.com>
References: <20201119014841.7298-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=cenjiahui@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 Jiahui Cen <cenjiahui@huawei.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, miaoyubo@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

Extract two APIs acpi_dsdt_add_pci_route_table and
acpi_dsdt_add_pci_osc from acpi_dsdt_add_pci. The first
API is used to specify the pci route table and the second
API is used to declare the operation system capabilities.
These two APIs would be used to specify the pxb-pcie in DSDT.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci-host/gpex-acpi.c | 112 +++++++++++---------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index dbb350a837..32a9f2796d 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -2,21 +2,11 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci-host/gpex.h"
 
-void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
+static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
-    int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
-    Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
+    Aml *method, *crs;
     int i, slot_no;
 
-    Aml *dev = aml_device("%s", "PCI0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
-    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
-    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
-    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
     /* Declare the PCI Routing Table. */
     Aml *rt_pkg = aml_varpackage(PCI_SLOT_MAX * PCI_NUM_PINS);
     for (slot_no = 0; slot_no < PCI_SLOT_MAX; slot_no++) {
@@ -34,7 +24,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
     /* Create GSI link device */
     for (i = 0; i < PCI_NUM_PINS; i++) {
-        uint32_t irqs = cfg->irq + i;
+        uint32_t irqs = irq + i;
         Aml *dev_gsi = aml_device("GSI%d", i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F")));
         aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
@@ -52,43 +42,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
         aml_append(dev_gsi, method);
         aml_append(dev, dev_gsi);
     }
+}
 
-    method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_return(aml_int(cfg->ecam.base)));
-    aml_append(dev, method);
-
-    Aml *rbuf = aml_resource_template();
-    aml_append(rbuf,
-        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
-                            nr_pcie_buses));
-    if (cfg->mmio32.size) {
-        aml_append(rbuf,
-                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio32.base,
-                                    cfg->mmio32.base + cfg->mmio32.size - 1,
-                                    0x0000,
-                                    cfg->mmio32.size));
-    }
-    if (cfg->pio.size) {
-        aml_append(rbuf,
-                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                                AML_ENTIRE_RANGE, 0x0000, 0x0000,
-                                cfg->pio.size - 1,
-                                cfg->pio.base,
-                                cfg->pio.size));
-    }
-    if (cfg->mmio64.size) {
-        aml_append(rbuf,
-                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio64.base,
-                                    cfg->mmio64.base + cfg->mmio64.size - 1,
-                                    0x0000,
-                                    cfg->mmio64.size));
-    }
-    aml_append(dev, aml_name_decl("_CRS", rbuf));
+static void acpi_dsdt_add_pci_osc(Aml *dev)
+{
+    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
 
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
@@ -160,6 +118,62 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     buf = aml_buffer(1, byte_list);
     aml_append(method, aml_return(buf));
     aml_append(dev, method);
+}
+
+void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
+{
+    int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
+    Aml *method, *crs, *dev, *rbuf;
+
+    dev = aml_device("%s", "PCI0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
+    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    acpi_dsdt_add_pci_route_table(dev, cfg->irq);
+
+    method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(cfg->ecam.base)));
+    aml_append(dev, method);
+
+    rbuf = aml_resource_template();
+    aml_append(rbuf,
+        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
+                            nr_pcie_buses));
+    if (cfg->mmio32.size) {
+        aml_append(rbuf,
+                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                    cfg->mmio32.base,
+                                    cfg->mmio32.base + cfg->mmio32.size - 1,
+                                    0x0000,
+                                    cfg->mmio32.size));
+    }
+    if (cfg->pio.size) {
+        aml_append(rbuf,
+                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                                AML_ENTIRE_RANGE, 0x0000, 0x0000,
+                                cfg->pio.size - 1,
+                                cfg->pio.base,
+                                cfg->pio.size));
+    }
+    if (cfg->mmio64.size) {
+        aml_append(rbuf,
+                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                    cfg->mmio64.base,
+                                    cfg->mmio64.base + cfg->mmio64.size - 1,
+                                    0x0000,
+                                    cfg->mmio64.size));
+    }
+    aml_append(dev, aml_name_decl("_CRS", rbuf));
+
+    acpi_dsdt_add_pci_osc(dev);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.28.0


