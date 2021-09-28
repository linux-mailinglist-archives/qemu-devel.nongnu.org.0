Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D611341AFED
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:20:19 +0200 (CEST)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD1t-000426-ND
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaD-0006XZ-3k
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:44 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0001Ph-N9
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id y35so31709359ede.3
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3G4/DFX1r/a1570OxD1emO3ZLWAbs3gE4VJKE7B8FXM=;
 b=OlJPvTlGzFow/ErpIDaXiGn3ai3d2IqMfYGW/cPxXBvol9Cvs5bZsN2NpfhU51gM7j
 O+TuUvRrzV+EDwh6+s+T3RS6Qh1rXsvgrVrtZlmEzZ9/hlvWo/ElqnqdW7ymqxmNPa2e
 K4NspEB709x3cZLqkWnOfKGRx73pOs29xrdzrkitqf+HseFDZKthlSZ9+Ukuqy7ArYK4
 rUug6W4jv7siFnZ8cAuf+aE4LYmnw1UbUfoRRV6b5YfprtzMnzzcGlB0bi3xkrIavQcX
 pvuXVnqn4lhk5W0YI5mn9Ld4UPfFbJ7J14ljW12bMq3OO0/0gAvP92W+qu+S4w8scBK2
 3Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3G4/DFX1r/a1570OxD1emO3ZLWAbs3gE4VJKE7B8FXM=;
 b=xdk3ZqvYu4ru75/sigFrIqWuSH0TZFKByQVCj6gStZDT/1xxf5KD00PLd4P7/T9CBV
 aebqqEKRtrP17kZpEUrTKt3UDPoxfNgILH1kp0enzXeNy6FXuTePu88es9OgE6/7FSMY
 KOVJikf2RarF3oI/u4iNTYngIWhOmVj+vaSVBcMFUlKUGjcw5Uju80KJvK5MJSyuq4pN
 56pcTq1EzMD7GBbPlQFMkM3G2t0LeCH2UqNZKTKa5d9AITSr0G1qepUv62BfgBbQhtZE
 E6xvxQ2HU+Po3w/0x31/bgfYDnNxkC8b7WId9NwhMyrLAmsUmDvAKqTxDbraPaxv2D36
 AepQ==
X-Gm-Message-State: AOAM5306mm7v2fOz6CM8Nqgcx3gbJdZGE4EcPERcV9iKR2XsQIlxr4rg
 VsAfjdXycDkvdZKltJfsIAV3rFT0dv4=
X-Google-Smtp-Source: ABdhPJx54QsB06wqbf4Y1B26ZxIb+/LyAXL70xuWivOaJn8vhG05aTEpfki9FZGOKK1XLBSBNhNAFQ==
X-Received: by 2002:a17:906:2613:: with SMTP id
 h19mr6746684ejc.66.1632833487520; 
 Tue, 28 Sep 2021 05:51:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] i386: Add get/set/migrate support for SGX_LEPUBKEYHASH
 MSRs
Date: Tue, 28 Sep 2021 14:50:54 +0200
Message-Id: <20210928125116.183620-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Kai Huang <kai.huang@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
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
Message-Id: <20210719112136.57018-11-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c     | 16 +++++++++++++++-
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 22 ++++++++++++++++++++++
 target/i386/machine.c | 20 ++++++++++++++++++++
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e9ecbf59e5..af6cd73eed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5700,6 +5700,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     }
 }
 
+static void x86_cpu_set_sgxlepubkeyhash(CPUX86State *env)
+{
+#ifndef CONFIG_USER_ONLY
+    /* Those default values are defined in Skylake HW */
+    env->msr_ia32_sgxlepubkeyhash[0] = 0xa6053e051270b7acULL;
+    env->msr_ia32_sgxlepubkeyhash[1] = 0x6cfbe8ba8b3b413dULL;
+    env->msr_ia32_sgxlepubkeyhash[2] = 0xc4916d99f2b3735dULL;
+    env->msr_ia32_sgxlepubkeyhash[3] = 0xd4f8c05909f9bb3bULL;
+#endif
+}
+
 static void x86_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -5832,6 +5843,8 @@ static void x86_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arch_reset_vcpu(cpu);
     }
+
+    x86_cpu_set_sgxlepubkeyhash(env);
 #endif
 }
 
@@ -6214,6 +6227,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
            & CPUID_EXT2_AMD_ALIASES);
     }
 
+    x86_cpu_set_sgxlepubkeyhash(env);
+
     /*
      * note: the call to the framework needs to happen after feature expansion,
      * but before the checks/modifications to ucode_rev, mwait, phys_bits.
@@ -6901,7 +6916,6 @@ static const TypeInfo x86_cpu_type_info = {
     .class_init = x86_cpu_common_class_init,
 };
 
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 85a9eeeb2b..29552dc2a7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1516,6 +1516,7 @@ typedef struct CPUX86State {
     uint64_t mcg_status;
     uint64_t msr_ia32_misc_enable;
     uint64_t msr_ia32_feature_control;
+    uint64_t msr_ia32_sgxlepubkeyhash[4];
 
     uint64_t msr_fixed_ctr_ctrl;
     uint64_t msr_global_ctrl;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 500d2e0e68..11551648f9 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3107,6 +3107,17 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
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
@@ -3446,6 +3457,13 @@ static int kvm_get_msrs(X86CPU *cpu)
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
@@ -3735,6 +3753,10 @@ static int kvm_get_msrs(X86CPU *cpu)
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
index b0943118d1..4367931623 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1415,6 +1415,25 @@ static const VMStateDescription vmstate_msr_tsx_ctrl = {
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
@@ -1551,6 +1570,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_nested_state,
 #endif
         &vmstate_msr_tsx_ctrl,
+        &vmstate_msr_intel_sgx,
         NULL
     }
 };
-- 
2.31.1



