Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEA74A7476
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 16:19:15 +0100 (CET)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFHPe-0006Fb-L5
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 10:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGTs-0001qF-0N
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:19:32 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGTf-0007Wd-Bc
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:19:31 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JpkM86LRmz67vp2;
 Wed,  2 Feb 2022 22:14:28 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Wed, 2 Feb 2022 15:18:16 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 14:18:16 +0000
To: <qemu-devel@nongnu.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v5 15/43] acpi/pci: Consolidate host bridge setup
Date: Wed, 2 Feb 2022 14:10:09 +0000
Message-ID: <20220202141037.17352-16-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

This cleanup will make it easier to add support for CXL to the mix.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
v5: Make the PCI bus type a typed enum.

 hw/i386/acpi-build.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce823e8fcb..09940f6e84 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1398,6 +1398,24 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     aml_append(table, scope);
 }
 
+typedef enum { PCI, PCIE } PCIBusType;
+static void init_pci_acpi(Aml *dev, int uid, PCIBusType type,
+                          bool native_pcie_hp)
+{
+    if (type == PCI) {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
+        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+    } else {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+        aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+        /* Expander bridges do not have ACPI PCI Hot-plug enabled */
+        aml_append(dev, build_q35_osc_method(native_pcie_hp));
+    }
+}
+
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
@@ -1429,9 +1447,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (misc->is_piix4) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
-        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
-        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
+        init_pci_acpi(dev, pcmc->pci_root_uid, PCI, false);
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1447,11 +1463,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     } else {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
-        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-        aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
+        init_pci_acpi(dev, pcmc->pci_root_uid, PCIE, !pm->pcihp_bridge_en);
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
             aml_append(sb_scope, build_q35_dram_controller(&mcfg));
@@ -1562,17 +1574,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             scope = aml_scope("\\_SB");
             dev = aml_device("PC%.02X", bus_num);
-            aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            if (pci_bus_is_express(bus)) {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
 
-                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
-                aml_append(dev, build_q35_osc_method(true));
-            } else {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
-            }
+            init_pci_acpi(dev, bus_num,
+                          pci_bus_is_express(bus) ? PCIE : PCI, true);
 
             if (numa_node != NUMA_NODE_UNASSIGNED) {
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
-- 
2.32.0


