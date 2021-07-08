Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D33BF35C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:14:18 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IcK-0006R1-VK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0001zH-9r
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKm-0007ML-3s
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534896"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534896"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770031"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 13/44] i386/tdx: Frame in tdx_get_supported_cpuid with
 KVM_TDX_CAPABILITIES
Date: Wed,  7 Jul 2021 17:54:43 -0700
Message-Id: <64a6aff39a1f5d96fcddff8923bfba5728fcfa8c.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add support for grabbing KVM_TDX_CAPABILITIES and use the new
kvm_get_supported_cpuid() hook to adjust the supported XCR0 bits.

Add TODOs for the remaining work.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/kvm.c |  2 ++
 target/i386/kvm/tdx.c | 79 ++++++++++++++++++++++++++++++++++++++++---
 target/i386/kvm/tdx.h |  2 ++
 3 files changed, 78 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5742fa4806..25dcecd60c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -448,6 +448,8 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         ret |= 1U << KVM_HINTS_REALTIME;
     }
 
+    tdx_get_supported_cpuid(s, function, index, reg, &ret);
+
     return ret;
 }
 
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index f8c7560fc8..b1e4f27c9a 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -21,6 +21,7 @@
 #include "hw/boards.h"
 #include "qapi/error.h"
 #include "qom/object_interfaces.h"
+#include "standard-headers/asm-x86/kvm_para.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
@@ -49,7 +50,11 @@ static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
     tdx_cmd.metadata = metadata;
     tdx_cmd.data = (__u64)(unsigned long)data;
 
-    r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+    if (ioctl_no == KVM_TDX_CAPABILITIES) {
+        r = kvm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+    } else {
+        r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+    }
     if (r) {
         error_report("%s failed: %s", ioctl_name, strerror(-r));
         exit(1);
@@ -67,6 +72,18 @@ static Notifier tdx_machine_done_late_notify = {
     .notify = tdx_finalize_vm,
 };
 
+#define TDX1_MAX_NR_CPUID_CONFIGS 6
+
+static struct {
+    struct kvm_tdx_capabilities __caps;
+    struct kvm_tdx_cpuid_config __cpuid_configs[TDX1_MAX_NR_CPUID_CONFIGS];
+} __tdx_caps;
+
+static struct kvm_tdx_capabilities *tdx_caps = (void *)&__tdx_caps;
+
+#define XCR0_MASK (MAKE_64BIT_MASK(0, 8) | BIT_ULL(9))
+#define XSS_MASK (~XCR0_MASK)
+
 int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(cgs),
@@ -75,10 +92,65 @@ int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         return 0;
     }
 
+    QEMU_BUILD_BUG_ON(sizeof(__tdx_caps) !=
+                      sizeof(struct kvm_tdx_capabilities) +
+                      sizeof(struct kvm_tdx_cpuid_config) *
+                      TDX1_MAX_NR_CPUID_CONFIGS);
+
+    tdx_caps->nr_cpuid_configs = TDX1_MAX_NR_CPUID_CONFIGS;
+    tdx_ioctl(KVM_TDX_CAPABILITIES, 0, tdx_caps);
+
     qemu_add_machine_init_done_late_notifier(&tdx_machine_done_late_notify);
+
     return 0;
 }
 
+void tdx_get_supported_cpuid(KVMState *s, uint32_t function,
+                             uint32_t index, int reg, uint32_t *ret)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
+                                                    TYPE_TDX_GUEST);
+
+    if (!tdx) {
+        return;
+    }
+
+    switch (function) {
+    case 1:
+        if (reg == R_ECX) {
+            *ret &= ~CPUID_EXT_VMX;
+        }
+        break;
+    case 0xd:
+        if (index == 0) {
+            if (reg == R_EAX) {
+                *ret &= (uint32_t)tdx_caps->xfam_fixed0 & XCR0_MASK;
+                *ret |= (uint32_t)tdx_caps->xfam_fixed1 & XCR0_MASK;
+            } else if (reg == R_EDX) {
+                *ret &= (tdx_caps->xfam_fixed0 & XCR0_MASK) >> 32;
+                *ret |= (tdx_caps->xfam_fixed1 & XCR0_MASK) >> 32;
+            }
+        } else if (index == 1) {
+            /* TODO: Adjust XSS when it's supported. */
+        }
+        break;
+    case KVM_CPUID_FEATURES:
+        if (reg == R_EAX) {
+            *ret &= ~((1ULL << KVM_FEATURE_CLOCKSOURCE) |
+                      (1ULL << KVM_FEATURE_CLOCKSOURCE2) |
+                      (1ULL << KVM_FEATURE_CLOCKSOURCE_STABLE_BIT) |
+                      (1ULL << KVM_FEATURE_ASYNC_PF) |
+                      (1ULL << KVM_FEATURE_ASYNC_PF_VMEXIT) |
+                      (1ULL << KVM_FEATURE_ASYNC_PF_INT));
+        }
+        break;
+    default:
+        /* TODO: Use tdx_caps to adjust CPUID leafs. */
+        break;
+    }
+}
+
 void tdx_pre_create_vcpu(CPUState *cpu)
 {
     struct {
@@ -105,10 +177,7 @@ void tdx_pre_create_vcpu(CPUState *cpu)
         return;
     }
 
-    /* HACK: Remove MPX support, which is not allowed by TDX. */
-    env->features[FEAT_XSAVE_COMP_LO] &= ~(XSTATE_BNDREGS_MASK |
-                                           XSTATE_BNDCSR_MASK);
-
+    /* TODO: Use tdx_caps to validate the config. */
     if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
         error_report("TDX VM must support XSAVE features");
         exit(1);
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index e15657d272..844d24aade 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -23,5 +23,7 @@ typedef struct TdxGuest {
 } TdxGuest;
 
 int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
+void tdx_get_supported_cpuid(KVMState *s, uint32_t function,
+                             uint32_t index, int reg, uint32_t *ret);
 
 #endif
-- 
2.25.1


