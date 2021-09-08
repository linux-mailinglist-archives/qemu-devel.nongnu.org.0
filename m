Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FBB4037BA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:19:47 +0200 (CEST)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNugE-0004Gu-FH
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRr-0006cK-0y
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRm-00030t-AM
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id z4so2396099wrr.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KsTDG3drOXvBLLkYlqfRd7XNSkXLpWqNjlUf+cUrs8=;
 b=m0I2r2Jtt1wT1V2HHRqBazUOzmjIb2WxtvUdfE3iQ/jer+I9OAMdBjZSLWfOCFUtbB
 XIohRqCacqORuEdya9rHWsw3i2aPqzjxiaWuNMTO0/QyK5tWPFfg2lnR1UvMV+iAqpD7
 SRO2tqrgIBSBZ4/wjoKiLDfIMQJVEsynn1BdSRfAUjmDkXU32kTy8lG3yXETVm78Ksrn
 x5klKD4TCizaDNrPZnwbAEZBt2caL+4KW3SCzj5At+gNtNfWWJ5tJ/EH0rkKOU/iBMud
 1GHJrw09P3dsvY4DpDBbrIet5cIrahfrhNzcU2cT4c/ZlMY0xzuluNdA+SR0izvuA3ZL
 I6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7KsTDG3drOXvBLLkYlqfRd7XNSkXLpWqNjlUf+cUrs8=;
 b=x3bgeSYi1QeAqVSUYd82KW5dp7kOi4ckI9Njw2u8kQUp9Qcp6uxaK5z842eKoNfg0h
 RYeRvGysa9A1HvCydQPv95Xm3GsFkKbjTGuB9c3sbkEUY0ENXuiLvjEqwQDShNnNq9zu
 BOESnATctJLF1Dd2PkPvRi9Rjy7GZINq03Jwt7izOkVNKWoAc5OeIZRAcdSSYc0/VaKj
 slxfTyHJ37npu2BsRYD30ckoPmlh7B0ZlB/mo97c7n54/Knjb9+/+V9C2+/39n6/YTsc
 ECFqroKO6HQ3rUJxul7if261xCcvU/rPaLNKHmUcxI4Ob6/aL41y4DQc94YGF3+yubuc
 kWlg==
X-Gm-Message-State: AOAM531OBp8b4iP/4DMExAKjo1bjCtt/YHzfusJUIFW/8m72WGT6203r
 ix2BoO12Jbw2nu1i1dz67I2k+F6eTyQ=
X-Google-Smtp-Source: ABdhPJzkWQH2GoJBg5+soPgPhuO3EwLs4BrAQM4qKxGTkN0F1uHeOKyfWyStSN7xkVseCWaNO2KeHg==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr2999199wrq.361.1631095488988; 
 Wed, 08 Sep 2021 03:04:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 18/43] i386: Add get/set/migrate support for
 SGX_LEPUBKEYHASH MSRs
Date: Wed,  8 Sep 2021 12:04:01 +0200
Message-Id: <20210908100426.264356-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 target/i386/cpu.c     | 17 ++++++++++++++++-
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 22 ++++++++++++++++++++++
 target/i386/machine.c | 20 ++++++++++++++++++++
 4 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e9ecbf59e5..59cb2c2d03 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5700,6 +5700,16 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
@@ -5832,6 +5842,8 @@ static void x86_cpu_reset(DeviceState *dev)
     if (kvm_enabled()) {
         kvm_arch_reset_vcpu(cpu);
     }
+
+    x86_cpu_set_sgxlepubkeyhash(env);
 #endif
 }
 
@@ -6214,6 +6226,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
            & CPUID_EXT2_AMD_ALIASES);
     }
 
+#ifndef CONFIG_USER_ONLY
+    x86_cpu_set_sgxlepubkeyhash(env);
+#endif
+
     /*
      * note: the call to the framework needs to happen after feature expansion,
      * but before the checks/modifications to ucode_rev, mwait, phys_bits.
@@ -6901,7 +6917,6 @@ static const TypeInfo x86_cpu_type_info = {
     .class_init = x86_cpu_common_class_init,
 };
 
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e18cceb851..07daf1d811 100644
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



