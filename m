Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA54C64B5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:17:58 +0100 (CET)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObED-0003Ty-LG
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb2B-0008IW-0X
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:50047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb26-0005Ys-CB
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035526; x=1677571526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OQjh7ARD/M4Uovx3W7j4YOwC+/p7z5IRQZ4IkDQ6QU=;
 b=Uix21Ek2pXH7N1mQuQjVox4t4RnnkGF7lp36Lia3MjGbmo68O6h4B6cH
 Nt6u6UTXpj9SwWFQ3eOVqO86CdhNZmm0dPAf1xmfExo/de+4rk4cLhLwv
 hV0WqGk8BC2HOSA25lbX+jERdOkNC4Pl+3YIdIoifO4AfsPxF7i6UNy4f
 fMz7n/nSW9o38aMA0r94/k6MnEAxOCMtDZoGMXKTT0L9JHL+uLMQS2wN3
 ZCrHCpcAoc97wcxzlPxpyiWPB6pX1AFNW4ZDvvSDFjC6j+I339QdU6B6l
 2W478KgS54Uv/qSbL6l/Tz2IwwEJcpfkpNBgHrWyN0bWQhyhlEhSwAShc g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021638"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021638"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014581"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:16 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] x86: Grant AMX permission for guest
Date: Mon, 28 Feb 2022 00:05:10 -0800
Message-Id: <20220228080515.42357-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228080515.42357-1-yang.zhong@intel.com>
References: <20220228080515.42357-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
get host side supported_xcr0 and Qemu can decide if it can request
dynamically enabled XSAVE features permission.
https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Signed-off-by: Jing Liu <jing2.liu@intel.com>
---
 target/i386/cpu.h          |  4 +++
 target/i386/kvm/kvm_i386.h |  1 +
 target/i386/cpu.c          |  7 +++++
 target/i386/kvm/kvm-cpu.c  | 12 ++++----
 target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 3ff1b49d29..9630f4712a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -551,6 +551,10 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
+#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
+
+#define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
 
 #define ESA_FEATURE_ALIGN64_BIT         1
 
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index a978509d50..4124912c20 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -52,5 +52,6 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 
 bool kvm_enable_sgx_provisioning(KVMState *s);
+void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
 
 #endif
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ec35dd1717..505ee289bc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6007,6 +6007,7 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
     CPUX86State *env = &cpu->env;
     int i;
     uint64_t mask;
+    static bool request_perm;
 
     if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
         env->features[FEAT_XSAVE_COMP_LO] = 0;
@@ -6022,6 +6023,12 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         }
     }
 
+    /* Only request permission for first vcpu */
+    if (kvm_enabled() && !request_perm) {
+        kvm_request_xsave_components(cpu, mask);
+        request_perm = true;
+    }
+
     env->features[FEAT_XSAVE_COMP_LO] = mask;
     env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
 }
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index ce27d3b1df..a35a1bf9fe 100644
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
@@ -100,11 +100,11 @@ static void kvm_cpu_xsave_init(void)
         ExtSaveArea *esa = &x86_ext_save_areas[i];
 
         if (esa->size) {
-            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
-            if (sz != 0) {
-                assert(esa->size == sz);
-                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
-                esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
+            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
+            if (eax != 0) {
+                assert(esa->size == eax);
+                esa->offset = ebx;
+                esa->ecx = ecx;
             }
         }
     }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..742f0eac4a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include <sys/ioctl.h>
 #include <sys/utsname.h>
+#include <sys/syscall.h>
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
@@ -348,6 +349,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
     struct kvm_cpuid2 *cpuid;
     uint32_t ret = 0;
     uint32_t cpuid_1_edx;
+    uint64_t bitmask;
 
     cpuid = get_supported_cpuid(s);
 
@@ -405,6 +407,25 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (!has_msr_arch_capabs) {
             ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
         }
+    } else if (function == 0xd && index == 0 &&
+               (reg == R_EAX || reg == R_EDX)) {
+        struct kvm_device_attr attr = {
+            .group = 0,
+            .attr = KVM_X86_XCOMP_GUEST_SUPP,
+            .addr = (unsigned long) &bitmask
+        };
+
+        bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
+        if (!sys_attr) {
+            warn_report("cannot get sys attribute capabilities %d", sys_attr);
+        }
+
+        int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
+        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
+            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
+                        "error: %d", rc);
+        }
+        ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
     } else if (function == 0x80000001 && reg == R_ECX) {
         /*
          * It's safe to enable TOPOEXT even if it's not returned by
@@ -5148,3 +5169,39 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return !sev_es_enabled();
 }
+
+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
+
+void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
+{
+    KVMState *s = kvm_state;
+    uint64_t supported;
+
+    mask &= XSTATE_DYNAMIC_MASK;
+    if (!mask) {
+        return;
+    }
+    /*
+     * Just ignore bits that are not in CPUID[EAX=0xD,ECX=0].
+     * ARCH_REQ_XCOMP_GUEST_PERM would fail, and QEMU has warned
+     * about them already because they are not supported features.
+     */
+    supported = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
+    supported |= (uint64_t)kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EDX) << 32;
+    mask &= supported;
+
+    while (mask) {
+        int bit = ctz64(mask);
+        int rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, bit);
+        if (rc) {
+            /*
+             * Older kernel version (<5.17) do not support
+             * ARCH_REQ_XCOMP_GUEST_PERM, but also do not return
+             * any dynamic feature from kvm_arch_get_supported_cpuid.
+             */
+            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
+                        "for feature bit %d", bit);
+        }
+        mask &= ~BIT_ULL(bit);
+    }
+}

