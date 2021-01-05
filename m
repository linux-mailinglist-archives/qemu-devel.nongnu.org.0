Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E852EB133
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:18:28 +0100 (CET)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpyV-00073Z-T9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbs-0000rh-6S
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:04 -0500
Received: from mga11.intel.com ([192.55.52.93]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbq-00012W-Dq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:03 -0500
IronPort-SDR: B7mOi5IJRPU3eI3xUb2xOmI1L/T8Bl8KLtrg5lk9l/YuxXuid8HHf+HAAoJZ6za7fXDRhy4zzY
 QWhTt902DsLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629554"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629554"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:02 -0800
IronPort-SDR: xKgrGV/5XCodHs7s9KaT9nWGGELu1yGaL15il2kcdV8mkOP0RIlHfJs16y54SPvpeoEpcAjGRn
 G/6QdxquroPw==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338041"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:01 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 21/32] acpi/pxb/cxl: Reserve host bridge MMIO
Date: Tue,  5 Jan 2021 08:53:12 -0800
Message-Id: <20210105165323.783725-22-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For all host bridges, reserve MMIO space with _CRS. The MMIO for the
host bridge lives in a magically hard coded space in the system's
physical address space. The standard mechanism to tell the OS about
regions which can't be used for host bridges is _CRS.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/i386/acpi-build.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 26e4ddd025..16cde677a0 100644
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
@@ -1194,7 +1195,7 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     aml_append(table, scope);
 }
 
-enum { PCI, PCIE };
+enum { PCI, PCIE, CXL };
 static void init_pci_acpi(Aml *dev, int uid, int type)
 {
     if (type == PCI) {
@@ -1344,20 +1345,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
             int32_t uid = pci_bus_uid(bus);
+            int type;
 
             /* look only for expander root buses */
             if (!pci_bus_is_root(bus)) {
                 continue;
             }
 
+            type = pci_bus_is_cxl(bus) ? CXL :
+                                         pci_bus_is_express(bus) ? PCIE : PCI;
+
             if (bus_num < root_bus_limit) {
                 root_bus_limit = bus_num - 1;
             }
 
             scope = aml_scope("\\_SB");
-            dev = aml_device("PC%.02X", bus_num);
+            if (type == CXL) {
+                dev = aml_device("CXL%.01X", pci_bus_uid(bus));
+            } else {
+                dev = aml_device("PC%.02X", bus_num);
+            }
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
-            init_pci_acpi(dev, uid, pci_bus_is_express(bus) ? PCIE : PCI);
+            init_pci_acpi(dev, uid, type);
 
             if (numa_node != NUMA_NODE_UNASSIGNED) {
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
@@ -1368,6 +1377,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             aml_append(dev, aml_name_decl("_CRS", crs));
             aml_append(scope, dev);
             aml_append(dsdt, scope);
+
+            /* Handle the ranges for the PXB expanders */
+            if (type == CXL) {
+                uint64_t base = CXL_HOST_BASE + uid * 0x10000;
+                crs_range_insert(crs_range_set.mem_ranges, base,
+                                 base + 0x10000 - 1);
+            }
         }
     }
 
-- 
2.30.0


