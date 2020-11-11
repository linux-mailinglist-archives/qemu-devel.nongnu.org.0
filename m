Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B998A2AE88E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:59:02 +0100 (CET)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj9p-0004DD-MX
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcizq-0005zR-GJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:60768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kcizk-0008O5-E5
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:48:41 -0500
IronPort-SDR: 4j9U3OnixxUqS7i1qWUQwhOS4iHx5JxXgQ0sV4stQHNh4F6bwA8vUGkXzMS55qM0MyMxrUS/Io
 Xo+KPikJIcWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314692"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:40 -0800
IronPort-SDR: Z4GW1+ZoFDaeCCfH7dth0EZV9sUFkNlkXOeu1qWA4KtB3WSVJdGFg3XQ4aGyINxVtn1Pox6NHU
 yg8cn+LmJbGg==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710494"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:40 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/25] acpi/cxl: Introduce a compat-driver UUID for CXL
 _OSC
Date: Tue, 10 Nov 2020 21:47:20 -0800
Message-Id: <20201111054724.794888-22-ben.widawsky@intel.com>
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vishal Verma <vishal.l.verma@intel.com>

Introduce a new UUID for CXL _OSC that only sets CXL related 'Support'
and Control' Dwords, independent of PCI/PCIe Dwords. This is a proposal
and an example AML implementation to demonstrate what such a compat UUID
would look like.

The AML resulting from this change is:

        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            CreateDWordField (Arg3, Zero, CDW1)
            If ((((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */) || (Arg0 == ToUUID ("68f2d50b-c469-4d8a-bd3d-941a103fd3fc"))) || (
                Arg0 == ToUUID ("a4d1629d-ff52-4888-be96-e5cade548db1"))))
            {
                If ((Arg0 == ToUUID ("a4d1629d-ff52-4888-be96-e5cade548db1")))
                {
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPC = CDW2 /* \_SB_.CXL0._OSC.CDW2 */
                    CTRC = CDW3 /* \_SB_.CXL0._OSC.CDW3 */
                    CDW3 |= One
                    Return (Arg3)
                }
                Else
                {
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    Local0 = CDW3 /* \_SB_.CXL0._OSC.CDW3 */
                    CTRL &= 0x1F
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != Local0))
                    {
                        CDW1 |= 0x10
                    }

                    SUPP = CDW2 /* \_SB_.CXL0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.CXL0._OSC.CDW3 */
                    If ((Arg0 == ToUUID ("68f2d50b-c469-4d8a-bd3d-941a103fd3fc")))
                    {
                        CreateDWordField (Arg3, 0x0C, CDW4)
                        CreateDWordField (Arg3, 0x10, CDW5)
                        SUPC = CDW4 /* \_SB_.CXL0._OSC.CDW4 */
                        CTRC = CDW5 /* \_SB_.CXL0._OSC.CDW5 */
                        CDW5 |= One
                    }

                    CDW3 = Local0
                    Return (Arg3)
                }
            }

            Return (Arg3)
            Else
            {
                CDW1 |= 0x04
            }
        }

Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
---
 hw/acpi/cxl.c | 54 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 7124d5a1a3..31ceaeecc3 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -29,6 +29,7 @@
 static Aml *__build_cxl_osc_method(void)
 {
     Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
+    Aml *if_compat, *else_nocompat;
     Aml *a_ctrl = aml_local(0);
     Aml *a_cdw1 = aml_name("CDW1");
 
@@ -37,31 +38,51 @@ static Aml *__build_cxl_osc_method(void)
 
     /* 9.14.2.1.4 */
     if_uuid = aml_if(
-        aml_lor(aml_equal(aml_arg(0),
+        aml_lor(
+            aml_lor(aml_equal(aml_arg(0),
                           aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")),
-                aml_equal(aml_arg(0),
-                          aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC"))));
-    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-
-    aml_append(if_uuid, aml_store(aml_name("CDW3"), a_ctrl));
+                    aml_equal(aml_arg(0),
+                          aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC"))),
+                    aml_equal(aml_arg(0),
+                          aml_touuid("A4D1629D-FF52-4888-BE96-E5CADE548DB1"))));
+
+    if_compat = aml_if(aml_equal(aml_arg(0),
+                          aml_touuid("A4D1629D-FF52-4888-BE96-E5CADE548DB1")));
+    aml_append(if_compat,
+               aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_compat,
+               aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+    aml_append(if_compat, aml_store(aml_name("CDW2"), aml_name("SUPC")));
+    aml_append(if_compat, aml_store(aml_name("CDW3"), aml_name("CTRC")));
+    aml_append(if_compat,
+               aml_or(aml_name("CDW3"), aml_int(0x1), aml_name("CDW3")));
+    aml_append(if_compat, aml_return(aml_arg(3)));
+    aml_append(if_uuid, if_compat);
+
+    else_nocompat = aml_else();
+    aml_append(else_nocompat,
+               aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(else_nocompat,
+               aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+
+    aml_append(else_nocompat, aml_store(aml_name("CDW3"), a_ctrl));
 
     /* This is all the same as what's used for PCIe */
-    aml_append(if_uuid,
+    aml_append(else_nocompat,
                aml_and(aml_name("CTRL"), aml_int(0x1F), aml_name("CTRL")));
 
     if_arg1_not_1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
     /* Unknown revision */
     aml_append(if_arg1_not_1, aml_or(a_cdw1, aml_int(0x08), a_cdw1));
-    aml_append(if_uuid, if_arg1_not_1);
+    aml_append(else_nocompat, if_arg1_not_1);
 
     if_caps_masked = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
     /* Capability bits were masked */
     aml_append(if_caps_masked, aml_or(a_cdw1, aml_int(0x10), a_cdw1));
-    aml_append(if_uuid, if_caps_masked);
+    aml_append(else_nocompat, if_caps_masked);
 
-    aml_append(if_uuid, aml_store(aml_name("CDW2"), aml_name("SUPP")));
-    aml_append(if_uuid, aml_store(aml_name("CDW3"), aml_name("CTRL")));
+    aml_append(else_nocompat, aml_store(aml_name("CDW2"), aml_name("SUPP")));
+    aml_append(else_nocompat, aml_store(aml_name("CDW3"), aml_name("CTRL")));
 
     if_cxl = aml_if(aml_equal(
         aml_arg(0), aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC")));
@@ -75,12 +96,13 @@ static Aml *__build_cxl_osc_method(void)
     /* CXL 2.0 Port/Device Register access */
     aml_append(if_cxl,
                aml_or(aml_name("CDW5"), aml_int(0x1), aml_name("CDW5")));
-    aml_append(if_uuid, if_cxl);
+    aml_append(else_nocompat, if_cxl);
 
     /* Update DWORD3 (the return value) */
-    aml_append(if_uuid, aml_store(a_ctrl, aml_name("CDW3")));
+    aml_append(else_nocompat, aml_store(a_ctrl, aml_name("CDW3")));
 
-    aml_append(if_uuid, aml_return(aml_arg(3)));
+    aml_append(else_nocompat, aml_return(aml_arg(3)));
+    aml_append(if_uuid, else_nocompat);
     aml_append(method, if_uuid);
 
     else_uuid = aml_else();
@@ -88,7 +110,7 @@ static Aml *__build_cxl_osc_method(void)
     /* unrecognized uuid */
     aml_append(else_uuid,
                aml_or(aml_name("CDW1"), aml_int(0x4), aml_name("CDW1")));
-    aml_append(else_uuid, aml_return(aml_arg(3)));
+    aml_append(method, aml_return(aml_arg(3)));
     aml_append(method, else_uuid);
 
     return method;
-- 
2.29.2


