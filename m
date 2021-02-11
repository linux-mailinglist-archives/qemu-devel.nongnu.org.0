Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE531857F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 08:01:50 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5z1-000199-OL
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 02:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mQ-0002CJ-A8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:46 -0500
Received: from mga11.intel.com ([192.55.52.93]:48359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mL-0008Dl-6v
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:46 -0500
IronPort-SDR: UtCFuFZ4bR+20x1YPs3C/5cuNtqZiYatxsricdpV4jOWn9dsR8vTSPu2PwwIPQQzybF0fDXqih
 BaDWYmafHmRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178692965"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="178692965"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:24 -0800
IronPort-SDR: SIfOttuWQhuL6dKmQujwjBe3FB9hvhqQ+tJDt+ghg9yJEPviwNwpX+iemud9C11B+VRsIIbO2Q
 e+VcDvGQPTHQ==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="588716286"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:24 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v3 08/10] i386: acpi: Don't build HPET ACPI entry if HPET is
 disabled
Date: Wed, 10 Feb 2021 22:46:44 -0800
Message-Id: <92685581110170e7db1d361e4bbde3167affd44e.1613025709.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com
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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 hw/i386/acpi-build.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e369908b1a..bfdadd7907 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1280,7 +1280,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
@@ -1328,7 +1330,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
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


