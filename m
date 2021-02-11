Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EE31857A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 07:59:00 +0100 (CET)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5wI-00082Z-Fx
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 01:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mQ-0002Bi-5N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:46 -0500
Received: from mga11.intel.com ([192.55.52.93]:48349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mK-00085A-FL
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:45 -0500
IronPort-SDR: 1NmmyQTYFVEUqBnkc8DFPrOkgQNjf04aKH2xZQtd/U7m0D8DemymXFOAp6ngvOmyNIsP46fXx/
 er4q8UaiHqdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178692964"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="178692964"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:24 -0800
IronPort-SDR: C19OSWzX1fuVKdC/y2kXbi4FpIoh19xHonMRpvaUHLO/TUXdo2ppf3hkFd2j1SJ4kqhriKHuK4
 Ru5KTxgEybUw==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="588716280"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:24 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v3 07/10] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Date: Wed, 10 Feb 2021 22:46:43 -0800
Message-Id: <ea43ecd8e920088a783f81a7b2aeee8715657dc6.1613025709.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declare PNP0C01 device to reserve MMCONFIG region to conform to the
spec better and play nice with guest BIOSes/OSes.

According to PCI Firmware Specification[0], MMCONFIG region must be
reserved by declaring a motherboard resource. It's optional to reserve
the region in memory map by Int 15 E820h or EFIGetMemoryMap.
Guest Linux checks if the MMCFG region is reserved by bios memory map
or ACPI resource. If it's not reserved, Linux falls back to legacy PCI
configuration access.

TDVF [1] [2] doesn't reserve MMCONFIG the region in memory map.
On the other hand OVMF reserves it in memory map without declaring a
motherboard resource. With memory map reservation, linux guest uses
MMCONFIG region. However it doesn't comply to PCI Firmware
specification.

[0] PCI Firmware specification Revision 3.2
  4.1.2 MCFG Table Description table 4-2 NOTE 2
  If the operating system does not natively comprehend reserving the
  MMCFG region, The MMCFG region must e reserved by firmware. ...
  For most systems, the mortheroard resource would appear at the root
  of the ACPI namespace (under \_SB)...
  The resource can optionally be returned in Int15 E820h or
  EFIGetMemoryMap as reserved memory but must always be reported
  through ACPI as a motherboard resource

[1] TDX: Intel Trust Domain Extension
    https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html
[2] TDX Virtual Firmware
    https://github.com/tianocore/edk2-staging/tree/TDVF

The change to DSDT is as follows.
@@ -68,32 +68,51 @@

                     If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

                     CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
                 }

                 Return (Arg3)
             }
         }
+
+        Device (DRAC)
+        {
+            Name (_HID, "PNP0C01" /* System Board */)  // _HID: Hardware ID
+            Name (RBUF, ResourceTemplate ()
+            {
+                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x0000000000000000, // Granularity
+                    0x00000000B0000000, // Range Minimum
+                    0x00000000BFFFFFFF, // Range Maximum
+                    0x0000000000000000, // Translation Offset
+                    0x0000000010000000, // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+            })
+            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
+            {
+                Return (RBUF) /* \_SB_.DRAC.RBUF */
+            }
+        }
     }

     Scope (_SB)
     {
         Device (HPET)
         {
             Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
             OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
             Field (HPTM, DWordAcc, Lock, Preserve)
             {
                 VEND,   32,
                 PRD,    32
             }

             Method (_STA, 0, NotSerialized)  // _STA: Status

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/acpi-build.c | 46 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 00cc119362..e369908b1a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
     aml_append(table, sb_scope);
 }
 
+static Aml *build_q35_dram_controller(void)
+{
+    AcpiMcfgInfo mcfg;
+    Aml *dev;
+    Aml *rbuf;
+    Aml *resource_template;
+    Aml *rbuf_name;
+    Aml *crs;
+
+    if (!acpi_get_mcfg(&mcfg)) {
+        return NULL;
+    }
+
+    /* DRAM controller */
+    dev = aml_device("DRAC");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
+
+    resource_template = aml_resource_template();
+    aml_append(resource_template,
+               aml_qword_memory(AML_POS_DECODE,
+                                AML_MIN_FIXED,
+                                AML_MAX_FIXED,
+                                AML_NON_CACHEABLE,
+                                AML_READ_WRITE,
+                                0x0000000000000000,
+                                mcfg.base,
+                                mcfg.base + mcfg.size - 1,
+                                0x0000000000000000,
+                                mcfg.size));
+    rbuf = aml_name_decl("RBUF", resource_template);
+    aml_append(dev, rbuf);
+
+    crs = aml_method("_CRS", 0, AML_SERIALIZED);
+    rbuf_name = aml_name("RBUF");
+    aml_append(crs, aml_return(rbuf_name));
+    aml_append(dev, crs);
+
+    return dev;
+}
+
 static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
@@ -1212,7 +1252,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
            Range *pci_hole, Range *pci_hole64, MachineState *machine)
 {
     CrsRangeEntry *entry;
-    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
+    Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs, *drac;
     CrsRangeSet crs_range_set;
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
@@ -1256,6 +1296,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
+        drac = build_q35_dram_controller();
+        if (drac) {
+            aml_append(sb_scope, drac);
+        }
 
         if (pm->smi_on_cpuhp) {
             /* reserve SMI block resources, IO ports 0xB2, 0xB3 */
-- 
2.17.1


