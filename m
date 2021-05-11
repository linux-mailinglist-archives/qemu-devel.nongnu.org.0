Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB0379FE6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:45:07 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM8b-00062k-OO
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLsq-0006qx-Ir
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLso-0004ZR-Rf
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:44 -0400
IronPort-SDR: sYqrQdCn7eCtH4Nz+lChoJbKw/Y/n+j9RlBGa+5i5aR5IOcbOSWK+0oH9CEioOXdp3n9dv9q6h
 7kOed2QkC1Bw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631559"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631559"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:28:07 -0700
IronPort-SDR: w4HzN101bsQbqpdskf2aoXne1CYYufywIjo8UUlWVL/TmAnC19AeLvh2Djrl46NcfBguSi0Las
 6g1eGAFG/JJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281289"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:28:05 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/32] i386: acpi: Add SGX EPC entry to ACPI tables
Date: Tue, 11 May 2021 14:20:39 +0800
Message-Id: <20210511062051.41948-21-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
index bfecb0038c..0fd967e9c8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1800,6 +1800,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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


