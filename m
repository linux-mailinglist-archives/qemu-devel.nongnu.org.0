Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7E2AE896
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 07:02:18 +0100 (CET)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcjCz-0000LY-7M
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 01:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcj01-00064o-UC
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcizz-0008P1-8e
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:52 -0500
IronPort-SDR: vHTiSzHGEUU4g96nQeGLnAYjxMgn20JiBY7rvikgQqsuIKP5LdMv4s/PCBE5A6ndbPHj1CY1zk
 gwsWRmcXI39A==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314695"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314695"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:42 -0800
IronPort-SDR: 0/H8dBqL+O6dQlEpO8rlw2bA6PFuiQPJVqe07MZvhGz/Qmr2rTgBc96lW1JxuvRiw3crh0Aozc
 zX0oGP2GZT7Q==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710503"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:41 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 23/25] Temp: acpi/cxl: Add ACPI0017 (CEDT awareness)
Date: Tue, 10 Nov 2020 21:47:22 -0800
Message-Id: <20201111054724.794888-24-ben.widawsky@intel.com>
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
index eda62dcd6a..d080e24228 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1513,6 +1513,19 @@ static void init_pci_acpi(Aml *dev, int uid, int type)
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
@@ -1529,6 +1542,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     int root_bus_limit = 0xFF;
     PCIBus *bus = NULL;
     TPMIf *tpm = tpm_find();
+    bool cxl_present = false;
     int i;
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
 
@@ -1683,6 +1697,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
             /* Handle the ranges for the PXB expanders */
             if (type == CXL) {
+                cxl_present = true;
                 uint64_t base = CXL_HOST_BASE + uid * 0x10000;
                 crs_range_insert(crs_range_set.mem_ranges, base,
                                  base + 0x10000 - 1);
@@ -1690,6 +1705,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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
2.29.2


