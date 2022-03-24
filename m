Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB874E5D7B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 04:19:52 +0100 (CET)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXE0t-00078p-1Z
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 23:19:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nXDzv-0006U5-LG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 23:18:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nXDzs-0008OE-NX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 23:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648091928; x=1679627928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/rU1uI93CBSJVQAQGW/ZcoBCvdHn8Z7Lu+IhyBlTNGw=;
 b=aM12g91mAfm1zIx4XIc3qSVp7GUA/CbhoJU8v2qtQX/HYCC/vzAF0MVw
 885MFyCzwyxpqW5asZR4p92NpwnTFS6oFV2IAPfVKe5B+1Hv9cmtbrtIh
 t+bexr/pdhPpcesWCZg7LIvi85Cn5N+ac0ixt6X1Ly6+xqNeKijVPgCnA
 1u6mME/GgMYSLCAB7pc6Vi/33Jbc+c1mYuwc8TNSrj6+TTtghFQDKJWO/
 vSb4Yw1nv7/lBuKd9UM5iTDlcP2tq9fuDskNyIfVdhI3pWVf9NiHVzYBr
 7O/spD+JWJuUbZjmE4l4MEfXhYrCEKzQX3s0oy2ZXwCQWEiBmEM8ASemX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="344709237"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="344709237"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 20:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="616635511"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2022 20:18:46 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Return right size value after dynamic xfeature
 enabled
Date: Wed, 23 Mar 2022 20:18:46 -0700
Message-Id: <20220324031846.11943-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kvm_arch_get_supported_cpuid() only call KVM_GET_SUPPORTED_CPUID one
time, so the cpuid buffer information still keep older value. Once Qemu
enable new dynamic xfeature, like XTILEDATA, the cpuid[0D,0].{EBX,ECX}
still return older value.

This patch can return right size value in kvm_init_xsave() if XTILEDATA
has been enabled by arch_prctl.

assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) <=
           env->xsave_buf_len);

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h     |  3 +++
 target/i386/kvm/kvm.c | 15 +++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5e406088a9..814ba4020b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -565,6 +565,9 @@ typedef enum X86Seg {
 #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
 #define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
+#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
+
 
 /* CPUID feature words */
 typedef enum FeatureWord {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 06901c2a43..312d4fccf8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -46,6 +46,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
+#include "target/i386/cpu.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
@@ -437,6 +438,18 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
             return ret;
         }
         ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
+    } else if (function == 0xd && index == 0 &&
+               (reg == R_EBX || reg == R_ECX)) {
+        /*
+         * The value returned by KVM_GET_SUPPORTED_CPUID does not include
+         * features that already be enabled with the arch_prctl system call.
+         */
+        int rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
+        if (rc) {
+            warn_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %d", rc);
+        } else if (bitmask & XSTATE_XTILE_DATA_MASK) {
+            ret += sizeof(XSaveXTILEDATA);
+        }
     } else if (function == 0x80000001 && reg == R_ECX) {
         /*
          * It's safe to enable TOPOEXT even if it's not returned by
@@ -5214,8 +5227,6 @@ bool kvm_arch_cpu_check_are_resettable(void)
     return !sev_es_enabled();
 }
 
-#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
-
 void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
 {
     KVMState *s = kvm_state;

