Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3B2AE88C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:57:42 +0100 (CET)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj8W-0002dF-8h
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcizM-0005DG-3v
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:60768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcizJ-0008O5-6t
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:11 -0500
IronPort-SDR: 8kupKv2HZm1AxoKU3JRXI+sYGKQxV9XSYsnur8WLEIL0rGC4zyJZ8pSMrJ1tRDD3MF/PwSxfy2
 Foutchrndd3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314682"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:36 -0800
IronPort-SDR: Jl63I7ApFNRJDzMqgslAHyuVmiTPFieKrpsLiFsqfKqDXavTBeJr/7vWw+en7WM5TF4g9/8Uc2
 7GBnk0VFNR0A==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710460"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:35 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 15/25] acpi/pxb/cxl: Reserve host bridge MMIO
Date: Tue, 10 Nov 2020 21:47:14 -0800
Message-Id: <20201111054724.794888-16-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: Ben Widawsky <ben.widawsky@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <rth@twiddle.net>
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
index aaed7da7dc..fae4fa28e1 100644
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
@@ -1486,7 +1487,7 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     aml_append(table, scope);
 }
 
-enum { PCI, PCIE };
+enum { PCI, PCIE, CXL };
 static void init_pci_acpi(Aml *dev, int uid, int type)
 {
     if (type == PCI) {
@@ -1635,20 +1636,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
@@ -1659,6 +1668,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
2.29.2


