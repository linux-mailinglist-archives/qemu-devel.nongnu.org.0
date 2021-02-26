Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22204325B85
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:15:37 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSfI-0003cq-5R
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZX-0005tC-00
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:39 -0500
Received: from mga14.intel.com ([192.55.52.115]:7370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1lFSZV-0002bP-4L
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 21:09:38 -0500
IronPort-SDR: KysJvGRAiZUiWTEexJNI34YvrJkI854C3QHBWdzI+ywlhqdL4QWPfPJXW8FRIDNS+2m5pcbci0
 RSq+Lo4kZ4jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="185057298"
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="185057298"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2021 18:09:35 -0800
IronPort-SDR: JDHpce75e1uFfvdHv/L9hyXSWvhZ3ObaTrnDgG90MBW4X34CoWaT1C2iYeQcv8QdMlp4vR/Dw+
 Zk84rCAswIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,207,1610438400"; d="scan'208";a="404680085"
Received: from unknown (HELO local-michael-cet-test.sh.intel.com)
 ([10.239.159.166])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2021 18:09:33 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 mtosatti@redhat.com, sean.j.christopherson@intel.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v7 4/6] target/i386: Add user-space MSR access interface for
 CET
Date: Fri, 26 Feb 2021 10:20:56 +0800
Message-Id: <20210226022058.24562-5-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210226022058.24562-1-weijiang.yang@intel.com>
References: <20210226022058.24562-1-weijiang.yang@intel.com>
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=weijiang.yang@intel.com; helo=mga14.intel.com
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CET states are divided into user-mode and supervisor-mode states,
MSR_KVM_GUEST_SSP holds current SHSTK pointer in use, MSR_IA32_U_CET and
MSR_IA32_PL3_SSP are for user-mode states, others are for supervisor-mode
states. Expose access according to current CET supported bits in CPUID
and XSS.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.h | 18 ++++++++++++
 target/i386/kvm.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index a43fb6d597..83628e823c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -484,6 +484,15 @@ typedef enum X86Seg {
 #define MSR_IA32_VMX_TRUE_ENTRY_CTLS     0x00000490
 #define MSR_IA32_VMX_VMFUNC             0x00000491
 
+#define MSR_IA32_U_CET                  0x000006a0
+#define MSR_IA32_S_CET                  0x000006a2
+#define MSR_IA32_PL0_SSP                0x000006a4
+#define MSR_IA32_PL1_SSP                0x000006a5
+#define MSR_IA32_PL2_SSP                0x000006a6
+#define MSR_IA32_PL3_SSP                0x000006a7
+#define MSR_IA32_SSP_TBL                0x000006a8
+#define MSR_KVM_GUEST_SSP               0x4b564d08
+
 #define XSTATE_FP_BIT                   0
 #define XSTATE_SSE_BIT                  1
 #define XSTATE_YMM_BIT                  2
@@ -1584,6 +1593,15 @@ typedef struct CPUX86State {
 
     uintptr_t retaddr;
 
+    uint64_t u_cet;
+    uint64_t s_cet;
+    uint64_t pl0_ssp;
+    uint64_t pl1_ssp;
+    uint64_t pl2_ssp;
+    uint64_t pl3_ssp;
+    uint64_t ssp_tbl;
+    uint64_t guest_ssp;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index a2934dda02..67d5203d19 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -2992,6 +2992,30 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
         }
     }
 
+    if (((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) ||
+        (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_CET_IBT)) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_U_MASK)) {
+        kvm_msr_entry_add(cpu, MSR_IA32_U_CET, env->u_cet);
+        kvm_msr_entry_add(cpu, MSR_IA32_PL3_SSP, env->pl3_ssp);
+    }
+
+    if (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_S_MASK) {
+        if (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) {
+            kvm_msr_entry_add(cpu, MSR_IA32_PL0_SSP, env->pl0_ssp);
+            kvm_msr_entry_add(cpu, MSR_IA32_PL1_SSP, env->pl1_ssp);
+            kvm_msr_entry_add(cpu, MSR_IA32_PL2_SSP, env->pl2_ssp);
+            kvm_msr_entry_add(cpu, MSR_IA32_SSP_TBL, env->ssp_tbl);
+        }
+
+        kvm_msr_entry_add(cpu, MSR_IA32_S_CET, env->s_cet);
+    }
+
+    if ((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & (XSTATE_CET_U_MASK |
+        XSTATE_CET_S_MASK))) {
+        kvm_msr_entry_add(cpu, MSR_KVM_GUEST_SSP, env->guest_ssp);
+    }
+
     return kvm_buf_set_msrs(cpu);
 }
 
@@ -3311,6 +3335,30 @@ static int kvm_get_msrs(X86CPU *cpu)
         }
     }
 
+    if (((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) ||
+        (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_CET_IBT)) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_U_MASK)) {
+        kvm_msr_entry_add(cpu, MSR_IA32_U_CET, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_PL3_SSP, 0);
+    }
+
+    if (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_S_MASK) {
+        if (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) {
+            kvm_msr_entry_add(cpu, MSR_IA32_PL0_SSP, 0);
+            kvm_msr_entry_add(cpu, MSR_IA32_PL1_SSP, 0);
+            kvm_msr_entry_add(cpu, MSR_IA32_PL2_SSP, 0);
+            kvm_msr_entry_add(cpu, MSR_IA32_SSP_TBL, 0);
+        }
+
+        kvm_msr_entry_add(cpu, MSR_IA32_S_CET, 0);
+    }
+
+    if ((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & (XSTATE_CET_U_MASK |
+        XSTATE_CET_S_MASK))) {
+        kvm_msr_entry_add(cpu, MSR_KVM_GUEST_SSP, 0);
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
         return ret;
@@ -3597,6 +3645,30 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_RTIT_ADDR0_A ... MSR_IA32_RTIT_ADDR3_B:
             env->msr_rtit_addrs[index - MSR_IA32_RTIT_ADDR0_A] = msrs[i].data;
             break;
+        case MSR_IA32_U_CET:
+            env->u_cet = msrs[i].data;
+            break;
+        case MSR_IA32_S_CET:
+            env->s_cet = msrs[i].data;
+            break;
+        case MSR_IA32_PL0_SSP:
+            env->pl0_ssp = msrs[i].data;
+            break;
+        case MSR_IA32_PL1_SSP:
+            env->pl1_ssp = msrs[i].data;
+            break;
+        case MSR_IA32_PL2_SSP:
+            env->pl2_ssp = msrs[i].data;
+            break;
+        case MSR_IA32_PL3_SSP:
+            env->pl3_ssp = msrs[i].data;
+            break;
+        case MSR_IA32_SSP_TBL:
+            env->ssp_tbl = msrs[i].data;
+            break;
+        case MSR_KVM_GUEST_SSP:
+            env->guest_ssp = msrs[i].data;
+            break;
         }
     }
 
-- 
2.26.2


