Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE255497A06
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:08:26 +0100 (CET)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuOn-00041a-So
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCK-0004aI-D7
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:32 -0500
Received: from mga07.intel.com ([134.134.136.100]:15228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCI-0001XC-5v
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010930; x=1674546930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x4+ApifKMY54HsW7RyJPiX/uz4ZTPV4uGg8nyJ++IGQ=;
 b=SgQp/yT3dOoSzvTy+2goOa9/SwFTonD4tH7s29f3DGI3dHNm6rWSo5X8
 Q7xjdMXebI8oNYfMutjSaj7tPYAhosuMiVR+N8CmUXwQVTppPpuUG2MuG
 LYNDAn53/fKmFGv0nzRmSDYfOE3J9pwFIW2+CRwpnOtD0dQXMymcMr9Hq
 VXxIXfmMhEODckMuP3Z22bqzrBYl7xax5Fw06ITe6pe6r28q5579hl0ut
 9QShzpEAjs43VEyZodlZu7ZD/UaQnCPcFzr5AvoCi2PrIDs0T4lwBq1jy
 mqK2oV93rRJJQ/Q8wlephfYynlNLd4sYiGFFENkxwyJ0hEhI+PKTV/g8n g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310865"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310865"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530982"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] x86: Grant AMX permission for guest
Date: Sun, 23 Jan 2022 23:55:19 -0800
Message-Id: <20220124075523.108875-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124075523.108875-1-yang.zhong@intel.com>
References: <20220124075523.108875-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kernel allocates 4K xstate buffer by default. For XSAVE features
which require large state component (e.g. AMX), Linux kernel
dynamically expands the xstate buffer only after the process has
acquired the necessary permissions. Those are called dynamically-
enabled XSAVE features (or dynamic xfeatures).

There are separate permissions for native tasks and guests.

Qemu should request the guest permissions for dynamic xfeatures
which will be exposed to the guest. This only needs to be done
once before the first vcpu is created.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 target/i386/cpu.h         |  7 +++++++
 target/i386/cpu.c         | 31 +++++++++++++++++++++++++++++++
 target/i386/kvm/kvm-cpu.c | 12 ++++++------
 target/i386/kvm/kvm.c     |  6 ++++++
 4 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 06d2d6bccf..d4ad0f56bd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -549,6 +549,13 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
+#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
+#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
+                                         | XSTATE_XTILE_DATA_MASK)
+
+#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
 
 #define ESA_FEATURE_ALIGN64_BIT         1
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3390820745..29b0348c25 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -43,6 +43,10 @@
 #include "disas/capstone.h"
 #include "cpu-internal.h"
 
+#include <sys/syscall.h>
+
+bool request_perm;
+
 /* Helpers for building CPUID[2] descriptors: */
 
 struct CPUID2CacheDescriptorInfo {
@@ -6000,6 +6004,27 @@ static void x86_cpu_adjust_feat_level(X86CPU *cpu, FeatureWord w)
     }
 }
 
+static void kvm_request_xsave_components(X86CPU *cpu, uint32_t bit)
+{
+    KVMState *s = CPU(cpu)->kvm_state;
+
+    long rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
+                      bit);
+    if (rc) {
+        /*
+         * The older kernel version(<5.15) can't support
+         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
+         */
+        return;
+    }
+
+    rc = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
+    if (!(rc & XFEATURE_XTILE_MASK)) {
+        error_report("get cpuid failure and rc=0x%lx", rc);
+        exit(EXIT_FAILURE);
+    }
+}
+
 /* Calculate XSAVE components based on the configured CPU feature flags */
 static void x86_cpu_enable_xsave_components(X86CPU *cpu)
 {
@@ -6021,6 +6046,12 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         }
     }
 
+    /* Only request permission from fisrt vcpu. */
+    if (kvm_enabled() && !request_perm) {
+        kvm_request_xsave_components(cpu, XSTATE_XTILE_DATA_BIT);
+        request_perm = true;
+    }
+
     env->features[FEAT_XSAVE_COMP_LO] = mask;
     env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
 }
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 033ca011ea..5ab6a0b9d2 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -84,7 +84,7 @@ static void kvm_cpu_max_instance_init(X86CPU *cpu)
 static void kvm_cpu_xsave_init(void)
 {
     static bool first = true;
-    KVMState *s = kvm_state;
+    uint32_t eax, ebx, ecx, edx;
     int i;
 
     if (!first) {
@@ -100,13 +100,13 @@ static void kvm_cpu_xsave_init(void)
         ExtSaveArea *esa = &x86_ext_save_areas[i];
 
         if (esa->size) {
-            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
-            if (sz != 0) {
-                assert(esa->size == sz);
-                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
+            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
+            if (eax != 0) {
+                assert(esa->size == eax);
+                esa->offset = ebx;
             }
 
-            esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
+            esa->ecx = ecx;
         }
     }
 }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..caf1388d8b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -405,6 +405,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (!has_msr_arch_capabs) {
             ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
         }
+    } else if (function == 0xd && index == 0 && reg == R_EAX) {
+        /*
+         * We can set the AMX XTILE DATA flag, even if KVM does not
+         * return it on GET_SUPPORTED_CPUID.
+         */
+        ret |= XSTATE_XTILE_DATA_MASK;
     } else if (function == 0x80000001 && reg == R_ECX) {
         /*
          * It's safe to enable TOPOEXT even if it's not returned by

