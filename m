Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8031C581
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:27:44 +0100 (CET)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq5X-0004xO-JP
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptc-0006Pl-HO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:25 -0500
Received: from mga17.intel.com ([192.55.52.151]:25635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptS-0001ZH-Bd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:22 -0500
IronPort-SDR: JkDguJz6G/kN9xYgz21tqlDx6JC/Ggtknr/fnu9YZp5QDkeU8biN/Ode/V+C4ao0cvrhD/KOoR
 Emy6qdNlv7bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558765"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558765"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
IronPort-SDR: kGolas827/4WVTeSPnU5GW5stCkB2P25hj4ZlZwiKaOW4lFIV20fjx2W4iSZjxVjuWiI7vGFBz
 Z0ogGkm0ZV3g==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705423"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:52 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 13/23] i386/tdx: Frame in tdx_get_supported_cpuid with
 KVM_TDX_CAPABILITIES
Date: Mon, 15 Feb 2021 18:13:09 -0800
Message-Id: <dd854268085b6edea4af103ddb8951ac9ac70b67.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
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
---
 target/i386/kvm/kvm.c |  2 ++
 target/i386/kvm/tdx.c | 84 ++++++++++++++++++++++++++++++++++++++-----
 target/i386/kvm/tdx.h |  2 ++
 3 files changed, 80 insertions(+), 8 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 018a757dc6..e6f7015be8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -441,6 +441,8 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         ret |= 1U << KVM_HINTS_REALTIME;
     }
 
+    tdx_get_supported_cpuid(s, function, index, reg, &ret);
+
     return ret;
 }
 
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index d8b79e975f..9d4195a705 100644
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
@@ -47,7 +48,11 @@ static void __tdx_ioctl(int ioctl_no, const char *ioctl_name,
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
@@ -65,17 +70,83 @@ static Notifier tdx_machine_done_late_notify = {
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
                                                     TYPE_TDX_GUEST);
-    if (tdx) {
-        qemu_add_machine_init_done_late_notifier(
-            &tdx_machine_done_late_notify);
+    if (!tdx) {
+        return 0;
     }
+
+    QEMU_BUILD_BUG_ON(sizeof(__tdx_caps) !=
+                      sizeof(struct kvm_tdx_capabilities) +
+                      sizeof(struct kvm_tdx_cpuid_config) *
+                      TDX1_MAX_NR_CPUID_CONFIGS);
+
+    tdx_caps->nr_cpuid_configs = TDX1_MAX_NR_CPUID_CONFIGS;
+    tdx_ioctl(KVM_TDX_CAPABILITIES, 0, tdx_caps);
+
+    qemu_add_machine_init_done_late_notifier(&tdx_machine_done_late_notify);
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
+                      (1ULL << KVM_FEATURE_ASYNC_PF_VMEXIT));
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
@@ -103,10 +174,7 @@ void tdx_pre_create_vcpu(CPUState *cpu)
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
2.17.1


