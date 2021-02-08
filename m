Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A564731446A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:00:10 +0100 (CET)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GRt-0001dB-P0
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYw-0006qw-D1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:19 -0500
Received: from mga02.intel.com ([134.134.136.20]:59480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYu-0005DL-9R
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:18 -0500
IronPort-SDR: HTXVzKdyeA2nCT/MvcctWL0wANQdolDPUV9n0+OVzir7MBPwNufUG2+XP4u/WXarqnwlOuAcD8
 4WksXC1/XlLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168911429"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168911429"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
IronPort-SDR: i7rp+8hcjmQmpxjEzPiX1+cUCy7vZ17vgtCOQv4dTghBRiULCLckt0nRnQ2IigQoP7sBvIiYAh
 ZzxRVaUjM4Mg==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487608593"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 7/9] i386: acpi: Don't build HPET ACPI entry if HPET is
 disabled
Date: Mon,  8 Feb 2021 13:57:26 -0800
Message-Id: <4d380b7f97149f82da91f967a419ff3f3a2bc1a4.1612821109.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=isaku.yamahata@intel.com; helo=mga02.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Omit HPET AML if the HPET is disabled, QEMU is not emulating it and the
guest may get confused by seeing HPET in the ACPI tables without a
"physical" device present.

The change of DSDT when -no-hpet is as follows.

@@ -141,47 +141,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
         }
     }

-    Scope (_SB)
-    {
-        Device (HPET)
-        {
-            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
-            Name (_UID, Zero)  // _UID: Unique ID
-            OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
-            Field (HPTM, DWordAcc, Lock, Preserve)
-            {
-                VEND,   32,
-                PRD,    32
-            }
-
-            Method (_STA, 0, NotSerialized)  // _STA: Status
-            {
-                Local0 = VEND /* \_SB_.HPET.VEND */
-                Local1 = PRD /* \_SB_.HPET.PRD_ */
-                Local0 >>= 0x10
-                If (((Local0 == Zero) || (Local0 == 0xFFFF)))
-                {
-                    Return (Zero)
-                }
-
-                If (((Local1 == Zero) || (Local1 > 0x05F5E100)))
-                {
-                    Return (Zero)
-                }
-
-                Return (0x0F)
-            }
-
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadOnly,
-                    0xFED00000,         // Address Base
-                    0x00000400,         // Address Length
-                    )
-            })
-        }
-    }
-
     Scope (_SB.PCI0)
     {
         Device (ISA)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 hw/i386/acpi-build.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index bcb1f65c1d..73ec0b6d32 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1405,7 +1405,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
@@ -1450,7 +1452,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_q35_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         build_q35_pci0_int(dsdt);
-- 
2.17.1


