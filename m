Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA663CD403
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:42:50 +0200 (CEST)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Rfd-0004DR-4Y
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQo-0004Ho-7A
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:30 -0400
Received: from mga09.intel.com ([134.134.136.24]:16180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQi-000613-M2
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035213"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035213"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813601"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:27:21 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/33] i386: Add get/set/migrate support for
 SGX_LEPUBKEYHASH MSRs
Date: Mon, 19 Jul 2021 19:21:13 +0800
Message-Id: <20210719112136.57018-11-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
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
index 840f825431..cea4307930 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5673,6 +5673,16 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5804,6 +5814,8 @@ static void x86_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arch_reset_vcpu(cpu);
     }
+
+    x86_cpu_set_sgxlepubkeyhash(env);
 #endif
 }
 
@@ -6186,6 +6198,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
            & CPUID_EXT2_AMD_ALIASES);
     }
 
+#ifndef CONFIG_USER_ONLY
+    x86_cpu_set_sgxlepubkeyhash(env);
+#endif
+
     /*
      * note: the call to the framework needs to happen after feature expansion,
      * but before the checks/modifications to ucode_rev, mwait, phys_bits.
@@ -6871,7 +6887,6 @@ static const TypeInfo x86_cpu_type_info = {
     .class_init = x86_cpu_common_class_init,
 };
 
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e4d46cca80..892c0dfab4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1499,6 +1499,7 @@ typedef struct CPUX86State {
     uint64_t mcg_status;
     uint64_t msr_ia32_misc_enable;
     uint64_t msr_ia32_feature_control;
+    uint64_t msr_ia32_sgxlepubkeyhash[4];
 
     uint64_t msr_fixed_ctr_ctrl;
     uint64_t msr_global_ctrl;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 59ed8327ac..d4bf054ebe 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3096,6 +3096,17 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
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
@@ -3435,6 +3446,13 @@ static int kvm_get_msrs(X86CPU *cpu)
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
@@ -3724,6 +3742,10 @@ static int kvm_get_msrs(X86CPU *cpu)
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

