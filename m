Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E1379FE7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:45:18 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM8r-0006Ju-49
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLs9-00060Q-H6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:01 -0400
Received: from mga06.intel.com ([134.134.136.31]:46441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLs3-0004it-Vi
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:01 -0400
IronPort-SDR: 53CrENoEBWp3KOttI3wIvVmEVoRq0Ywu2PQETG39+uxR1xdptJZktWn4KEC7RY0b+InO7/MRpq
 80WIOctnA75A==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631505"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631505"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:48 -0700
IronPort-SDR: rt9+3LtlmXxbBUTNQ4tD45iaV5GQSN3232OfzeSzvvko+XbHAw8M5PEDuVDUIQMmO698lpHc7U
 PCnlw+q96iwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281165"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:46 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/32] i386: Add get/set/migrate support for
 SGX_LEPUBKEYHASH MSRs
Date: Tue, 11 May 2021 14:20:29 +0800
Message-Id: <20210511062051.41948-11-yang.zhong@intel.com>
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

On real hardware, on systems that supports SGX Launch Control, those
MSRs are initialized to digest of Intel's signing key; on systems that
don't support SGX Launch Control, those MSRs are not available but
hardware always uses digest of Intel's signing key in EINIT.

KVM advertises SGX LC via CPUID if and only if the MSRs are writable.
Unconditionally initialize those MSRs to digest of Intel's signing key
when CPU is realized and reset to reflect the fact. This avoids
potential bug in case kvm_arch_put_registers() is called before
kvm_arch_get_registers() is called, in which case guest's virtual
SGX_LEPUBKEYHASH MSRs will be set to 0, although KVM initializes those
to digest of Intel's signing key by default, since KVM allows those MSRs
to be updated by Qemu to support live migration.

Save/restore the SGX Launch Enclave Public Key Hash MSRs if SGX Launch
Control (LC) is exposed to the guest. Likewise, migrate the MSRs if they
are writable by the guest.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c     | 17 ++++++++++++++++-
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 22 ++++++++++++++++++++++
 target/i386/machine.c | 20 ++++++++++++++++++++
 4 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ec12e12a33..43e6fdf162 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6179,6 +6179,16 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     }
 }
 
+#ifndef CONFIG_USER_ONLY
+static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
+{
+    env->msr_ia32_sgxlepubkeyhash[0] = 0xa6053e051270b7acULL;
+    env->msr_ia32_sgxlepubkeyhash[1] = 0x6cfbe8ba8b3b413dULL;
+    env->msr_ia32_sgxlepubkeyhash[2] = 0xc4916d99f2b3735dULL;
+    env->msr_ia32_sgxlepubkeyhash[3] = 0xd4f8c05909f9bb3bULL;
+}
+#endif
+
 static void x86_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -6310,6 +6320,8 @@ static void x86_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arch_reset_vcpu(cpu);
     }
+
+    x86_cpu_set_sgxlepubkeyhash(env);
 #endif
 }
 
@@ -6922,6 +6934,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     /* Process Hyper-V enlightenments */
     x86_cpu_hyperv_realize(cpu);
 
+#ifndef CONFIG_USER_ONLY
+    x86_cpu_set_sgxlepubkeyhash(env);
+#endif
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -7559,7 +7575,6 @@ static const TypeInfo x86_cpu_type_info = {
     .class_init = x86_cpu_common_class_init,
 };
 
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b23e0a90a8..d346ea0a64 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1500,6 +1500,7 @@ typedef struct CPUX86State {
     uint64_t mcg_status;
     uint64_t msr_ia32_misc_enable;
     uint64_t msr_ia32_feature_control;
+    uint64_t msr_ia32_sgxlepubkeyhash[4];
 
     uint64_t msr_fixed_ctr_ctrl;
     uint64_t msr_global_ctrl;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7fe9f52710..4463d638c4 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3030,6 +3030,17 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
             }
         }
 
+        if (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_SGX_LC) {
+            kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH0,
+                              env->msr_ia32_sgxlepubkeyhash[0]);
+            kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH1,
+                              env->msr_ia32_sgxlepubkeyhash[1]);
+            kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH2,
+                              env->msr_ia32_sgxlepubkeyhash[2]);
+            kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH3,
+                              env->msr_ia32_sgxlepubkeyhash[3]);
+        }
+
         /* Note: MSR_IA32_FEATURE_CONTROL is written separately, see
          *       kvm_put_msr_feature_control. */
     }
@@ -3369,6 +3380,13 @@ static int kvm_get_msrs(X86CPU *cpu)
         }
     }
 
+    if (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_SGX_LC) {
+        kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH0, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH1, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH2, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH3, 0);
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
         return ret;
@@ -3658,6 +3676,10 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_RTIT_ADDR0_A ... MSR_IA32_RTIT_ADDR3_B:
             env->msr_rtit_addrs[index - MSR_IA32_RTIT_ADDR0_A] = msrs[i].data;
             break;
+        case MSR_IA32_SGXLEPUBKEYHASH0 ... MSR_IA32_SGXLEPUBKEYHASH3:
+            env->msr_ia32_sgxlepubkeyhash[index - MSR_IA32_SGXLEPUBKEYHASH0] =
+                           msrs[i].data;
+            break;
         }
     }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index f6f094f1c9..099a4c36f7 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1396,6 +1396,25 @@ static const VMStateDescription vmstate_msr_tsx_ctrl = {
     }
 };
 
+static bool intel_sgx_msrs_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_SGX_LC);
+}
+
+static const VMStateDescription vmstate_msr_intel_sgx = {
+    .name = "cpu/intel_sgx",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = intel_sgx_msrs_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.msr_ia32_sgxlepubkeyhash, X86CPU, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1531,6 +1550,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_nested_state,
 #endif
         &vmstate_msr_tsx_ctrl,
+        &vmstate_msr_intel_sgx,
         NULL
     }
 };
-- 
2.29.2.334.gfaefdd61ec


