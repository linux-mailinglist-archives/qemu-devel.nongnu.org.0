Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01C830B486
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:17:34 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6kJx-0007fu-Pe
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3f-000050-0S
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:43 -0500
Received: from mga18.intel.com ([134.134.136.126]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3c-0001oo-9e
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:42 -0500
IronPort-SDR: clkptAjWh/dotHQGGS07WVcCbttpst25HP9paxfz1IN936YMIdwOdpZngXE3+LCjCzeoKQQkco
 t2aS7c1swUaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457103"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457103"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:07 -0800
IronPort-SDR: 55TZ0ovYLRe5Qef1wyRQSM8qlunqtTzUIbMUttc0SZJ0amwZRlJdbHAJCl36WcG2WDZ4Dqs+TK
 Up1ujQQ1yXfw==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764166"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:06 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 14/31] acpi/pci: Consolidate host bridge setup
Date: Mon,  1 Feb 2021 16:59:31 -0800
Message-Id: <20210202005948.241655-15-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This cleanup will make it easier to add support for CXL to the mix.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/i386/acpi-build.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f56d699c7f..cf6eb54c22 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1194,6 +1194,20 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     aml_append(table, scope);
 }
 
+enum { PCI, PCIE };
+static void init_pci_acpi(Aml *dev, int uid, int type)
+{
+    if (type == PCI) {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
+        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+    } else {
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+        aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+        aml_append(dev, build_q35_osc_method());
+    }
+}
+
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
@@ -1222,9 +1236,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (misc->is_piix4) {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
-        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
+        init_pci_acpi(dev, 0, PCI);
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1238,11 +1251,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     } else {
         sb_scope = aml_scope("_SB");
         dev = aml_device("PCI0");
-        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-        aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+        init_pci_acpi(dev, 0, PCIE);
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-        aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
 
         if (pm->smi_on_cpuhp) {
@@ -1345,15 +1355,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             scope = aml_scope("\\_SB");
             dev = aml_device("PC%.02X", bus_num);
-            aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            if (pci_bus_is_express(bus)) {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-                aml_append(dev, build_q35_osc_method());
-            } else {
-                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
-            }
+            init_pci_acpi(dev, bus_num, pci_bus_is_express(bus) ? PCIE : PCI);
 
             if (numa_node != NUMA_NODE_UNASSIGNED) {
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
-- 
2.30.0


