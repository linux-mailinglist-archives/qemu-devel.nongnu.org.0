Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC16EA483
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:18:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppl1F-0007v8-V3; Fri, 21 Apr 2023 03:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ppl0z-0007qI-1e
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:17:10 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ppl0x-0004aZ-79
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682061423; x=1713597423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q49+U447u2dX8OZEmGwYu4+4pk7aWYQAaNivI2RgVRk=;
 b=EEkEPL3TA3/bc/6voSVwrrITgBqMGXCPa5MnWE8UO5/CE+7Se6bKaa+w
 iWTLRvw7OWRBZlEbKIRS9asUmEsZC+tNOzcMY6cl0y319qwgHkKo7Vxi8
 eVd9hSwisFCyxcIizMDN96+vMhXWYwNasbO0i4F13Wu/IIxKeMpUL11ah
 ANPDF6ak6ZHJBg16ft1Z2WUWhteh2hYfC5Lz7RcABHkBnscyRFzMWX0JY
 wkNkuTdfldSJ9aFPgpsyRbr25GcjI5itpGnuYuyIZPOSjCnQxXjs04SNC
 dcpqL7U5zrj/7NqxqkQbd/79WjE1X5ws8qmMTyYTy5x5Ccu72Ek276hWS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326260546"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="326260546"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938385326"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938385326"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:16:39 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	weijiang.yang@intel.com
Subject: [PATCH 2/4] target/i386: Add CET MSRs access interfaces
Date: Fri, 21 Apr 2023 00:12:25 -0400
Message-Id: <20230421041227.90915-3-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230421041227.90915-1-weijiang.yang@intel.com>
References: <20230421041227.90915-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add access interfaces for supported CET MSRs.
These CET MSRs include:
MSR_IA32_U_CET - store user mode CET control bits.
MSR_IA32_S_CET - store supervisor mode CET control bits.
MSR_IA32_PL3_SSP - strore user mode shadow stack pointer.
MSR_KVM_GUEST_SSP - store current shadow stack pointer.

Other MSRs, i.e., MSR_IA32_PL{0,1,2}_SSP and MSR_IA32_INTR_SSP_TBL
are for non-supported supervisor mode shadow stack, are ignored now.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.h     | 10 ++++++++++
 target/i386/kvm/kvm.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6526a03206..b78ce8e5c4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -545,6 +545,11 @@ typedef enum X86Seg {
 #define MSR_IA32_VMX_TRUE_ENTRY_CTLS     0x00000490
 #define MSR_IA32_VMX_VMFUNC             0x00000491
 
+#define MSR_IA32_U_CET                  0x000006a0
+#define MSR_IA32_S_CET                  0x000006a2
+#define MSR_IA32_PL3_SSP                0x000006a7
+#define MSR_KVM_GUEST_SSP               0x4b564d09
+
 #define XSTATE_FP_BIT                   0
 #define XSTATE_SSE_BIT                  1
 #define XSTATE_YMM_BIT                  2
@@ -1756,6 +1761,11 @@ typedef struct CPUArchState {
 
     uintptr_t retaddr;
 
+    uint64_t u_cet;
+    uint64_t s_cet;
+    uint64_t pl3_ssp;
+    uint64_t guest_ssp;
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index de531842f6..13fae898ce 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3646,6 +3646,22 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
         }
     }
 
+    if (((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) ||
+        (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_CET_IBT)) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_U_MASK)) {
+        kvm_msr_entry_add(cpu, MSR_IA32_U_CET, env->u_cet);
+        kvm_msr_entry_add(cpu, MSR_IA32_PL3_SSP, env->pl3_ssp);
+    }
+
+    if ((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_U_MASK)) {
+        kvm_msr_entry_add(cpu, MSR_KVM_GUEST_SSP, env->guest_ssp);
+    }
+
+    if (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_CET_IBT) {
+        kvm_msr_entry_add(cpu, MSR_IA32_S_CET, env->s_cet);
+    }
+
     return kvm_buf_set_msrs(cpu);
 }
 
@@ -4024,6 +4040,22 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH3, 0);
     }
 
+    if (((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) ||
+        (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_CET_IBT)) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_U_MASK)) {
+        kvm_msr_entry_add(cpu, MSR_IA32_U_CET, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_PL3_SSP, 0);
+    }
+
+    if ((env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_CET_SHSTK) &&
+        (env->features[FEAT_XSAVE_XSS_LO] & XSTATE_CET_U_MASK)) {
+        kvm_msr_entry_add(cpu, MSR_KVM_GUEST_SSP, 0);
+    }
+
+    if (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_CET_IBT) {
+        kvm_msr_entry_add(cpu, MSR_IA32_S_CET, 0);
+    }
+
     if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
         kvm_msr_entry_add(cpu, MSR_IA32_XFD, 0);
         kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR, 0);
@@ -4346,6 +4378,18 @@ static int kvm_get_msrs(X86CPU *cpu)
             env->msr_ia32_sgxlepubkeyhash[index - MSR_IA32_SGXLEPUBKEYHASH0] =
                            msrs[i].data;
             break;
+        case MSR_IA32_U_CET:
+            env->u_cet = msrs[i].data;
+            break;
+        case MSR_IA32_S_CET:
+            env->s_cet = msrs[i].data;
+            break;
+        case MSR_IA32_PL3_SSP:
+            env->pl3_ssp = msrs[i].data;
+            break;
+        case MSR_KVM_GUEST_SSP:
+            env->guest_ssp = msrs[i].data;
+            break;
         case MSR_IA32_XFD:
             env->msr_xfd = msrs[i].data;
             break;
-- 
2.27.0


