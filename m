Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA973106B5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:32:33 +0100 (CET)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wXY-0003mJ-V3
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l7wVf-0002Oc-Ae
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:30:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:9771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l7wVd-0001sH-Nj
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:30:35 -0500
IronPort-SDR: NgtFevPMvOr6sP/8isxmn2qGnF+Cpka1guSEQqhOlXbvx6oM6+OZUKcipA56ZTwqhK4uuOVnOG
 X+OBsQ/G1VTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168518444"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="168518444"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 00:30:21 -0800
IronPort-SDR: t2NQt9CIQEixReQ30W/c1GAY/35GKiOxNJ8l7x5/Kq55kb3QyaajHw8K6aw+0BrilUNzMgigxs
 qK5wJNYxTrRw==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="393760291"
Received: from chenyi-pc.sh.intel.com ([10.239.159.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 00:30:17 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH 1/2] target/i386: Add support for save/load IA32_PKRS MSR
Date: Fri,  5 Feb 2021 16:33:24 +0800
Message-Id: <20210205083325.13880-2-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205083325.13880-1-chenyi.qiang@intel.com>
References: <20210205083325.13880-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PKS introduces MSR IA32_PKRS(0x6e1) to manage the supervisor protection
key rights. Page access and writes can be managed via the MSR update
without TLB flushes when permissions change.

Add the support to save/load IA32_PKRS MSR in guest.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/kvm/kvm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6dc1ee052d..1aa4b8ca51 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -112,6 +112,7 @@ static bool has_msr_vmx_vmfunc;
 static bool has_msr_ucode_rev;
 static bool has_msr_vmx_procbased_ctls2;
 static bool has_msr_perf_capabs;
+static bool has_msr_pkrs;
 
 static uint32_t has_architectural_pmu_version;
 static uint32_t num_architectural_pmu_gp_counters;
@@ -2086,6 +2087,9 @@ static int kvm_get_supported_msrs(KVMState *s)
             case MSR_IA32_VMX_PROCBASED_CTLS2:
                 has_msr_vmx_procbased_ctls2 = true;
                 break;
+            case MSR_IA32_PKRS:
+                has_msr_pkrs = true;
+                break;
             }
         }
     }
@@ -2794,6 +2798,9 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
     if (has_msr_smi_count) {
         kvm_msr_entry_add(cpu, MSR_SMI_COUNT, env->msr_smi_count);
     }
+    if (has_msr_pkrs) {
+        kvm_msr_entry_add(cpu, MSR_IA32_PKRS, env->pkrs);
+    }
     if (has_msr_bndcfgs) {
         kvm_msr_entry_add(cpu, MSR_IA32_BNDCFGS, env->msr_bndcfgs);
     }
@@ -3185,6 +3192,9 @@ static int kvm_get_msrs(X86CPU *cpu)
     if (has_msr_feature_control) {
         kvm_msr_entry_add(cpu, MSR_IA32_FEATURE_CONTROL, 0);
     }
+    if (has_msr_pkrs) {
+        kvm_msr_entry_add(cpu, MSR_IA32_PKRS, 0);
+    }
     if (has_msr_bndcfgs) {
         kvm_msr_entry_add(cpu, MSR_IA32_BNDCFGS, 0);
     }
@@ -3455,6 +3465,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_UMWAIT_CONTROL:
             env->umwait = msrs[i].data;
             break;
+        case MSR_IA32_PKRS:
+            env->pkrs = msrs[i].data;
+            break;
         default:
             if (msrs[i].index >= MSR_MC0_CTL &&
                 msrs[i].index < MSR_MC0_CTL + (env->mcg_cap & 0xff) * 4) {
-- 
2.17.1


