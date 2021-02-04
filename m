Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4198530EE00
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:08:04 +0100 (CET)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZgJ-0001X2-Aq
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeN-00004v-Ik
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:03 -0500
Received: from mga05.intel.com ([192.55.52.43]:43412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeL-0007VQ-Fi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:06:03 -0500
IronPort-SDR: Kk1bJEqdLwxCwEw72WNn1Ziugp7BaBPX+aZJdZkSTNjhDm7UE9ej61/9CERyRgu+DDl6VTvJGh
 K50IYUFCLHTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="266025486"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="266025486"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:45 -0800
IronPort-SDR: hNxORws1avm9T/7bsPJBVsp80ZyqY8GN1bwNRTYriO1hqnnnZzwDTwwsBHnr5qPjI05ST2qcY6
 AfbpF+TGXofQ==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372302438"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH 3/4] hw/i386: declare ACPI mother board resource for MMCONFIG
 region
Date: Thu,  4 Feb 2021 00:04:10 -0800
Message-Id: <052f8372cd04dcab1940c2fbf530d06fd8c85cc4.1612424814.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612424814.git.isaku.yamahata@intel.com>
References: <cover.1612424814.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612424814.git.isaku.yamahata@intel.com>
References: <cover.1612424814.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Declare PNP0C01 device to reserve MMCONFIG region to conform to the
spec better and play nice with guest BIOSes/OSes.

According to PCI Firmware Specification, MMCONFIG region must be
reserved by declaring a motherboard resource. It's optional to reserve
the region in memory map by Int 15 E820h or EFIGetMemoryMap.
If guest BIOS doesn't reserve the region in memory map without the
reservation by mother board resource, guest linux abandons to use
MMCFG.

TDVF [0] [1] doesn't reserve MMCONFIG the region in memory map.
On the other hand OVMF reserves it in memory map without declaring a
motherboard resource. With memory map reservation, linux guest uses
MMCONFIG region. However it doesn't comply to PCI Firmware
specification.

[0] TDX: Intel Trust Domain Extension
    https://software.intel.com/content/www/us/en/develop/articles/intel-trust-domain-extensions.html
[1] TDX Virtual Firmware
    https://github.com/tianocore/edk2-staging/tree/TDVF

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Acked-by: Jiewen Yao <Jiewen.yao@intel.com>
---
 hw/i386/acpi-build.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 005bcc2886..6e38f67120 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1062,6 +1062,177 @@ static void build_q35_pci0_int(Aml *table)
     aml_append(table, sb_scope);
 }
 
+static Aml *build_q35_dram_controller(void)
+{
+    /*
+     * DSDT is created with revision 1 which means 32bit integer.
+     * When the method of _CRS is called to determine MMCONFIG region,
+     * only port io is allowed to access PCI configuration space.
+     * It means qword access isn't allowed.
+     *
+     * Device(DRAC)
+     * {
+     *     Name(_HID, EisaId("PNP0C01"))
+     *     OperationRegion(DRR0, PCI_Config, 0x0000000000000060, 0x8)
+     *     Field(DRR0, DWordAcc, Lock, Preserve)
+     *     {
+     *         PEBL, 4,
+     *         PEBH, 4
+     *     }
+     *     Name(RBUF, ResourceTemplate()
+     *     {
+     *         QWordMemory(ResourceConsumer,
+     *                     PosDecode,
+     *                     MinFixed,
+     *                     MaxFixed,
+     *                     NonCacheable,
+     *                     ReadWrite,
+     *                     0x0000000000000000, // Granularity
+     *                     0x0000000000000000, // Range Minimum
+     *                     0x0000000000000000, // Range Maxium
+     *                     0x0000000000000000, // Translation Offset,
+     *                     0x0000000000000000, // Length,
+     *                     ,,
+     *                     _MCF,
+     *                     AddressRangeMemory,
+     *                     TypeStatic
+     *                     )
+     *     })
+     *     Method(_CRS, 0x0, NotSerialized)
+     *     {
+     *         CreateDWordField(RBUF, DRAC._MCF._MIN, MINL)
+     *         CreateDWordField(RBUF, DRAC._MCF._MIN + 4, MINH)
+     *         CreateDWordField(RBUF, DRAC._MCF._MAX, MAXL)
+     *         CreateDWordField(RBUF, DRAC._MCF._MAX + 4, MAXH)
+     *         CreateQWordField(RBUF, DRAC._MCF._LEN, _LEN)
+     *
+     *         Local0 = PEBL
+     *         Local1 = Local0 & 0x1  // PCIEXBAR PCIEBAREN
+     *         Local2 = Local0 & 0x6  // PCIEXBAR LENGTH
+     *         Local3 = Local0 & ~0x7 // PCIEXBAR base address low 32bit
+     *         Local4 = PEBH          // PCIEXBAR base address high 32bit
+     *         If (Local1 == 1) {
+     *             MINL = Local3
+     *             MINH = Local4
+     *             MAXL = Local3
+     *             MAXH = Local4
+     *
+     *             If (Local2 == 0) {
+     *                 _LEN = 256 * 1024 * 1024
+     *             }
+     *             If (Local2 == 0x2) {
+     *                 _LEN = 128 * 1024 * 1024
+     *             }
+     *             If (Local2 == 0x4) {
+     *                 _LEN = 64 * 1024 * 1024
+     *             }
+     *         }
+     *         return (RBUF)
+     *     }
+     * }
+     */
+
+    Aml *dev;
+    Aml *field;
+    Aml *rbuf;
+    Aml *resource_template;
+    Aml *crs;
+
+    /* DRAM controller */
+    dev = aml_device("DRAC");
+
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C01")));
+    /* 5.1.6 PCIEXBAR: Bus 0:Device 0:Function 0:offset 0x60 */
+    aml_append(dev, aml_operation_region("DRR0", AML_PCI_CONFIG,
+                                         aml_int(0x0000000000000060), 0x8));
+    field = aml_field("DRR0", AML_DWORD_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("PEBL", 32));
+    aml_append(field, aml_named_field("PEBH", 32));
+    aml_append(dev, field);
+
+    resource_template = aml_resource_template();
+    aml_append(resource_template, aml_qword_memory(AML_POS_DECODE,
+                                                   AML_MIN_FIXED,
+                                                   AML_MAX_FIXED,
+                                                   AML_NON_CACHEABLE,
+                                                   AML_READ_WRITE,
+                                                   0x0000000000000000,
+                                                   0x0000000000000000,
+                                                   0x0000000000000000,
+                                                   0x0000000000000000,
+                                                   0x0000000000000000));
+    rbuf = aml_name_decl("RBUF", resource_template);
+    aml_append(dev, rbuf);
+
+    crs = aml_method("_CRS", 0, AML_SERIALIZED);
+    {
+        Aml *rbuf_name;
+        Aml *local0;
+        Aml *local1;
+        Aml *local2;
+        Aml *local3;
+        Aml *local4;
+        Aml *ifc;
+
+        rbuf_name = aml_name("RBUF");
+        aml_append(crs, aml_create_dword_field(rbuf_name,
+                                               aml_int(14), "MINL"));
+        aml_append(crs, aml_create_dword_field(rbuf_name,
+                                               aml_int(14 + 4), "MINH"));
+        aml_append(crs, aml_create_dword_field(rbuf_name,
+                                               aml_int(22), "MAXL"));
+        aml_append(crs, aml_create_dword_field(rbuf_name,
+                                               aml_int(22 + 4), "MAXH"));
+        aml_append(crs, aml_create_qword_field(rbuf_name,
+                                               aml_int(38), "_LEN"));
+
+        local0 = aml_local(0);
+        aml_append(crs, aml_store(aml_name("PEBL"), local0));
+        local1 = aml_local(1);
+        aml_append(crs, aml_and(local0, aml_int(0x1), local1));
+        local2 = aml_local(2);
+        aml_append(crs, aml_and(local0, aml_int(0x6), local2));
+        local3 = aml_local(3);
+        aml_append(crs, aml_and(local0, aml_int((uint32_t)~0x7), local3));
+        local4 = aml_local(4);
+        aml_append(crs, aml_store(aml_name("PEBH"), local4));
+
+        ifc = aml_if(aml_equal(local1, aml_int(0x1)));
+        {
+            Aml *_len;
+            Aml *ifc0;
+            Aml *ifc2;
+            Aml *ifc4;
+
+            aml_append(ifc, aml_store(local3, aml_name("MINL")));
+            aml_append(ifc, aml_store(local4, aml_name("MINH")));
+            aml_append(ifc, aml_store(local3, aml_name("MAXL")));
+            aml_append(ifc, aml_store(local4, aml_name("MAXH")));
+
+            _len = aml_name("_LEN");
+            ifc0 = aml_if(aml_equal(local2, aml_int(0x0)));
+            aml_append(ifc0,
+                       aml_store(aml_int(256 * 1024 * 1024), _len));
+            aml_append(ifc, ifc0);
+
+            ifc2 = aml_if(aml_equal(local2, aml_int(0x2)));
+            aml_append(ifc2,
+                       aml_store(aml_int(128 * 1024 * 1024), _len));
+            aml_append(ifc, ifc2);
+
+            ifc4 = aml_if(aml_equal(local2, aml_int(0x4)));
+            aml_append(ifc4,
+                       aml_store(aml_int(64 * 1024 * 1024), _len));
+            aml_append(ifc, ifc4);
+        }
+        aml_append(crs, ifc);
+        aml_append(crs, aml_return(rbuf_name));
+    }
+    aml_append(dev, crs);
+
+    return dev;
+}
+
 static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
@@ -1246,6 +1417,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(0)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
+        aml_append(sb_scope, build_q35_dram_controller());
 
         if (pm->smi_on_cpuhp) {
             /* reserve SMI block resources, IO ports 0xB2, 0xB3 */
-- 
2.17.1


