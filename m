Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1392B2EB107
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:09:11 +0100 (CET)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwppW-0000Ex-4k
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbN-0000HJ-0x
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:35 -0500
Received: from mga18.intel.com ([134.134.136.126]:10387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbH-000195-IQ
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:32 -0500
IronPort-SDR: 84Ti8YL7uJAvCsqNLz577idqOejXHg3eRGedkJqOwNKstvfwCVKYLNXli2olAiNuGwFoMNtyR6
 tb12UdpsJVwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="164841151"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="164841151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:12 -0800
IronPort-SDR: 60KzVmDWpPTUMtpSTdWxUZ+gDvYuSz13YZv4f6iG+7aB93e7l85uphEE5QTsZKuWCxGE8Lnb3u
 x+AlnEfQ6Kvg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338092"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:07 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 29/32] Temp: acpi/cxl: Add ACPI0017 (CEDT awareness)
Date: Tue,  5 Jan 2021 08:53:20 -0800
Message-Id: <20210105165323.783725-30-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This represents Intel's proposal for how the system firmware can notify
Linux that the CEDT exists and provides a driver attach point. It is not
in the CXL 2.0 specification as of now.

CXL 2.0 specification adds an _HID, ACPI0016, for CXL capable host
bridges, with a _CID of PNP0A08 (PCIe host bridge). CXL aware software
is able to use this initiate the proper _OSC method, and get the _UID
which is referenced by the CEDT. Therefore the existence of an ACPI0016
device allows a CXL aware driver perform the necessary actions. For a
CXL capable OS, this works. For a CXL unaware OS, this works.

The motivation for ACPI0017 is to provide the possibility of having a
Linux CXL module that can work on a legacy Linux kernel.  Linux core
PCI/ACPI which won't be built as a module, will see the _CID of PNP0A08
and bind a driver to it. If we later loaded a driver for ACPI0016, Linux
won't be able to bind it to the hardware because it has already bound
the PNP0A08 driver. The ACPI0017 device is an opportunity to have an
object to bind a driver will be used by a Linux driver to walk the CXL
topology and do everything that we would have preferred to do with
ACPI0016.

There is another motivation for an ACPI0017 device which isn't
implemented here. An operating system needs an attach point for a
non-volatile region provider that understands cross-hostbridge
interleaving. Since QEMU emulation doesn't support interleaving yet,
this is more important on the OS side, for now.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/i386/acpi-build.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 49242eb8f3..470dd7ddf4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1221,6 +1221,19 @@ static void init_pci_acpi(Aml *dev, int uid, int type)
     }
 }
 
+static void build_acpi0017(Aml *table)
+{
+    Aml *dev;
+    Aml *scope;
+
+    scope =  aml_scope("_SB");
+    dev = aml_device("CXLM");
+    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0017")));
+
+    aml_append(scope, dev);
+    aml_append(table, scope);
+}
+
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
@@ -1237,6 +1250,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     int root_bus_limit = 0xFF;
     PCIBus *bus = NULL;
     TPMIf *tpm = tpm_find();
+    bool cxl_present = false;
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
 
@@ -1392,6 +1406,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             /* Handle the ranges for the PXB expanders */
             if (type == CXL) {
+                cxl_present = true;
                 uint64_t base = CXL_HOST_BASE + uid * 0x10000;
                 crs_range_insert(crs_range_set.mem_ranges, base,
                                  base + 0x10000 - 1);
@@ -1399,6 +1414,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
     }
 
+    if (cxl_present) {
+        build_acpi0017(dsdt);
+    }
+
     /*
      * At this point crs_range_set has all the ranges used by pci
      * busses *other* than PCI0.  These ranges will be excluded from
-- 
2.30.0


