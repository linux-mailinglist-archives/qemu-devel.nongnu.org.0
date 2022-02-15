Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638B4B8374
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:58:18 +0100 (CET)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKG8d-0008LG-KX
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:58:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5g-0005VQ-LC
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:12 -0500
Received: from mga17.intel.com ([192.55.52.151]:19074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5e-0002n5-KJ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001710; x=1676537710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2hjc6Pok40xB2Li4GkMnvzkMlmAWKbYNYxRDyWlF/w0=;
 b=nIlztPyX1fpMy6Bg0r+Bma9rav9n84aF5YFIjJLZp6oYcaUO5tx3chJX
 N3oDgZrmHxgfq0QEuHcCHrkEoMjOw2h4eurgM2SdwPoyfLHQM6avM0sMU
 rJzddJ6OdH+fCIFrSFXtXClnNp4shinrgHwehswu9cHkac7CTtSjg2gGC
 VNsV16aXUIjNXF7Gy3q4lyKASsUUVWpfT6BvcfKO9SVoHcmnZ0zM/byfi
 POm/rOdI7HtU+EHVdNVmW99Sywx4m2VZIDgK1R8Q0pJDYXSfFrPwRY0AJ
 ikuLAumHs9w//MwsE2tRtY0z4FvEZeyE6snGW2x/cfAo+zXClWPUKU3Qe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="231182095"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="231182095"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418289"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:07 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 6/8] target/i386: Add MSR access interface for Arch LBR
Date: Tue, 15 Feb 2022 14:52:56 -0500
Message-Id: <20220215195258.29149-7-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215195258.29149-1-weijiang.yang@intel.com>
References: <20220215195258.29149-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the first generation of Arch LBR, the max support
Arch LBR depth is 32, both host and guest use the value
to set depth MSR. This can simplify the implementation
of patch given the side-effect of mismatch of host/guest
depth MSR: XRSTORS will reset all recording MSRs to 0s
if the saved depth mismatches MSR_ARCH_LBR_DEPTH.

In most of the cases Arch LBR is not in active status,
so check the control bit before save/restore the big
chunck of Arch LBR MSRs.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.h     | 10 +++++++
 target/i386/kvm/kvm.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 07b198539b..0cadd37c47 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -388,6 +388,11 @@ typedef enum X86Seg {
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
 #define MSR_IA32_PKRS                   0x6e1
+#define MSR_ARCH_LBR_CTL                0x000014ce
+#define MSR_ARCH_LBR_DEPTH              0x000014cf
+#define MSR_ARCH_LBR_FROM_0             0x00001500
+#define MSR_ARCH_LBR_TO_0               0x00001600
+#define MSR_ARCH_LBR_INFO_0             0x00001200
 
 #define FEATURE_CONTROL_LOCKED                    (1<<0)
 #define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX  (1ULL << 1)
@@ -1659,6 +1664,11 @@ typedef struct CPUX86State {
     uint64_t msr_xfd;
     uint64_t msr_xfd_err;
 
+    /* Per-VCPU Arch LBR MSRs */
+    uint64_t msr_lbr_ctl;
+    uint64_t msr_lbr_depth;
+    LBR_ENTRY lbr_records[ARCH_LBR_NR_ENTRIES];
+
     /* exception/interrupt handling */
     int error_code;
     int exception_is_int;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 764d110e0f..974ff3c0a5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3273,6 +3273,38 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                               env->msr_xfd_err);
         }
 
+        if (kvm_enabled() && cpu->enable_pmu &&
+            (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+            uint64_t depth;
+            int i, ret;
+
+            /*
+             * Only migrate Arch LBR states when: 1) Arch LBR is enabled
+             * for migrated vcpu. 2) the host Arch LBR depth equals that
+             * of source guest's, this is to avoid mismatch of guest/host
+             * config for the msr hence avoid unexpected misbehavior.
+             */
+            ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
+
+            if (ret == 1 && (env->msr_lbr_ctl & 0x1) && !!depth &&
+                depth == env->msr_lbr_depth) {
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, env->msr_lbr_ctl);
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, env->msr_lbr_depth);
+
+                for (i = 0; i < ARCH_LBR_NR_ENTRIES; i++) {
+                    if (!env->lbr_records[i].from) {
+                        continue;
+                    }
+                    kvm_msr_entry_add(cpu, MSR_ARCH_LBR_FROM_0 + i,
+                                      env->lbr_records[i].from);
+                    kvm_msr_entry_add(cpu, MSR_ARCH_LBR_TO_0 + i,
+                                      env->lbr_records[i].to);
+                    kvm_msr_entry_add(cpu, MSR_ARCH_LBR_INFO_0 + i,
+                                      env->lbr_records[i].info);
+                }
+            }
+        }
+
         /* Note: MSR_IA32_FEATURE_CONTROL is written separately, see
          *       kvm_put_msr_feature_control. */
     }
@@ -3670,6 +3702,26 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR, 0);
     }
 
+    if (kvm_enabled() && cpu->enable_pmu &&
+        (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+        uint64_t ctl, depth;
+        int i, ret2;
+
+        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_CTL, &ctl);
+        ret2 = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
+        if (ret == 1 && ret2 == 1 && (ctl & 0x1) &&
+            depth == ARCH_LBR_NR_ENTRIES) {
+            kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, 0);
+            kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, 0);
+
+            for (i = 0; i < ARCH_LBR_NR_ENTRIES; i++) {
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_FROM_0 + i, 0);
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_TO_0 + i, 0);
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_INFO_0 + i, 0);
+            }
+        }
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
         return ret;
@@ -3972,6 +4024,21 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_XFD_ERR:
             env->msr_xfd_err = msrs[i].data;
             break;
+        case MSR_ARCH_LBR_CTL:
+            env->msr_lbr_ctl = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_DEPTH:
+            env->msr_lbr_depth = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_FROM_0 ... MSR_ARCH_LBR_FROM_0 + 31:
+            env->lbr_records[index - MSR_ARCH_LBR_FROM_0].from = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_TO_0 ... MSR_ARCH_LBR_TO_0 + 31:
+            env->lbr_records[index - MSR_ARCH_LBR_TO_0].to = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_INFO_0 ... MSR_ARCH_LBR_INFO_0 + 31:
+            env->lbr_records[index - MSR_ARCH_LBR_INFO_0].info = msrs[i].data;
+            break;
         }
     }
 
-- 
2.27.0


