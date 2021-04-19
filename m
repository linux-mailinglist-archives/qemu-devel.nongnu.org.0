Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2D0363FA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:34:31 +0200 (CEST)
Received: from localhost ([::1]:47334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYREc-000802-Jr
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR4B-0005J6-6I
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:24096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR47-000256-Rv
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:42 -0400
IronPort-SDR: 7wy/7/+UTd6p0HyFwxvk1FN1Lyc+LY2u2U2C1gm5JLPl2lmTsOyYiN/4JbR8moonY3FiaVLjw0
 p1nHFa8274Dg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409307"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409307"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:04 -0700
IronPort-SDR: AN643GotivLEDtuyQXR4Qhz5gQBoUuRQfl9K9K3SMoUBWT0+4zJkgb+J+3qKn1nV4MnMdGeGbO
 zixKwKopmUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947454"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:02 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/32] i386: acpi: Add SGX EPC entry to ACPI tables
Date: Mon, 19 Apr 2021 18:01:44 +0800
Message-Id: <20210419100156.53504-21-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

The ACPI Device entry for SGX EPC is essentially a hack whose primary
purpose is to provide software with a way to autoprobe SGX support,
e.g. to allow software to implement SGX support as a driver.  Details
on the individual EPC sections are not enumerated through ACPI tables,
i.e. software must enumerate the EPC sections via CPUID.  Furthermore,
software expects to see only a single EPC Device in the ACPI tables
regardless of the number of EPC sections in the system.

However, several versions of Windows do rely on the ACPI tables to
enumerate the address and size of the EPC.  So, regardless of the number
of EPC sections exposed to the guest, create exactly *one* EPC device
with a _CRS entry that spans the entirety of all EPC sections (which are
guaranteed to be contiguous in Qemu).

Note, NUMA support for EPC memory is intentionally not considered as
enumerating EPC NUMA information is not yet defined for bare metal.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/acpi-build.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index de98750aef..cbcf6ba740 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1801,6 +1801,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
     }
 
+    if (pcms->sgx_epc) {
+        uint64_t epc_base = pcms->sgx_epc->base;
+        uint64_t epc_size = pcms->sgx_epc->size;
+
+        dev = aml_device("EPC");
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("INT0E0C")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_unicode("Enclave Page Cache 1.0")));
+        crs = aml_resource_template();
+        aml_append(crs,
+                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
+                                    AML_READ_WRITE, 0, epc_base,
+                                    epc_base + epc_size - 1, 0, epc_size));
+        aml_append(dev, aml_name_decl("_CRS", crs));
+
+        method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_return(aml_int(0x0f)));
+        aml_append(dev, method);
+
+        aml_append(sb_scope, dev);
+    }
     aml_append(dsdt, sb_scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
-- 
2.29.2.334.gfaefdd61ec


