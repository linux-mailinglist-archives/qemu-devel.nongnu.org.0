Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B31C31E61A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 07:02:18 +0100 (CET)
Received: from localhost ([::1]:55414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcOH-0002ie-48
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 01:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFX-00015i-Hu
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:15 -0500
Received: from mga05.intel.com ([192.55.52.43]:7021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFV-0003hi-0Z
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:15 -0500
IronPort-SDR: GvwKM12FsqPhesWS5ZZwTrTod32LoA3jVVu6s/Aip/TQBdmkKLROijOGzut4ueZK9VgACnwG9O
 DbP9fR3HOdAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268260192"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="268260192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:01 -0800
IronPort-SDR: zT2JPyR/IkKlx716efxXq2gWO1BquPu5HIWF6ncSrro3TpfDvF1+O4Lv6q+3apjpdE900EqR1h
 xEyL1kCs9N1A==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="589940936"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:00 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v5 07/10] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Date: Wed, 17 Feb 2021 21:51:15 -0800
Message-Id: <6f686b45ce7bc43048c56dbb46e72e1fe51927e6.1613615732.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

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
@@ -68,32 +68,47 @@

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
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
+                    0x00000000,         // Granularity
+                    0xB0000000,         // Range Minimum
+                    0xBFFFFFFF,         // Range Maximum
+                    0x00000000,         // Translation Offset
+                    0x10000000,         // Length
+                    ,, , AddressRangeMemory, TypeStatic)
+            })
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
index 49aef4ebd1..96497475d1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1072,6 +1072,46 @@ static void build_q35_pci0_int(Aml *table)
     aml_append(table, sb_scope);
 }
 
+static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
+{
+    Aml *dev;
+    Aml *resource_template;
+
+    /* DRAM controller */
+    dev = aml_device("DRAC");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
+
+    resource_template = aml_resource_template();
+    if (mcfg->base + mcfg->size - 1 >= (1ULL << 32)) {
+        aml_append(resource_template,
+                   aml_qword_memory(AML_POS_DECODE,
+                                    AML_MIN_FIXED,
+                                    AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE,
+                                    AML_READ_WRITE,
+                                    0x0000000000000000,
+                                    mcfg->base,
+                                    mcfg->base + mcfg->size - 1,
+                                    0x0000000000000000,
+                                    mcfg->size));
+    } else {
+        aml_append(resource_template,
+                   aml_dword_memory(AML_POS_DECODE,
+                                    AML_MIN_FIXED,
+                                    AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE,
+                                    AML_READ_WRITE,
+                                    0x0000000000000000,
+                                    mcfg->base,
+                                    mcfg->base + mcfg->size - 1,
+                                    0x0000000000000000,
+                                    mcfg->size));
+    }
+    aml_append(dev, aml_name_decl("_CRS", resource_template));
+
+    return dev;
+}
+
 static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
@@ -1218,6 +1258,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
     AcpiMcfgInfo mcfg;
+    bool mcfg_valid = !!acpi_get_mcfg(&mcfg);
     uint32_t nr_mem = machine->ram_slots;
     int root_bus_limit = 0xFF;
     PCIBus *bus = NULL;
@@ -1256,6 +1297,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
+        if (mcfg_valid) {
+            aml_append(sb_scope, build_q35_dram_controller(&mcfg));
+        }
 
         if (pm->smi_on_cpuhp) {
             /* reserve SMI block resources, IO ports 0xB2, 0xB3 */
@@ -1386,7 +1430,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
      * the PCI0._CRS.  Add mmconfig to the set so it will be excluded
      * too.
      */
-    if (acpi_get_mcfg(&mcfg)) {
+    if (mcfg_valid) {
         crs_range_insert(crs_range_set.mem_ranges,
                          mcfg.base, mcfg.base + mcfg.size - 1);
     }
-- 
2.17.1


