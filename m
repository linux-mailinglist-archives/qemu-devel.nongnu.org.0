Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0216349E41F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:04:07 +0100 (CET)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5Ne-000573-3A
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nD5Kk-0002ui-2y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:01:09 -0500
Received: from mga01.intel.com ([192.55.52.88]:22023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nD5Kc-0000Jg-Lz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643292058; x=1674828058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=skuvovfZA1TXMi3s/UnTIPyk2vfXk8z+1AIkn0DisUA=;
 b=jHouDD19fu50m+EB2mpDFYCBdH7BLrzBPI0cN1yEvZmWiaY/Qj25n8m7
 zPkZWTfHWQiQFv0F92EOpDKJDW7PJ+mBeaEZJyqUaPzP9t5mzzQHtpqOk
 xYk3tVU71a3+FSVK9CILss6GmT9A4HuIhY4FjGj9ELZn2FVoazOgSVhQJ
 svbZB98oxN6kPBb4ii9nfel3MUJ/ComCTMF8+vP8IpAJCUIFxoZXZmgIH
 aXY7LIhOwwGWJAm1le4pJPGE3sd14h0Qon6f+T6sb4rCY7FMLX457J5DR
 CAB8R6aEntncscUvnQ+muWMB78EuRP9R0w4x/w+6Oc6bG3bgaGk8d6Mnt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="271309121"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="271309121"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 06:00:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="696652955"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Jan 2022 06:00:43 -0800
Date: Thu, 27 Jan 2022 21:45:20 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/7] x86: Grant AMX permission for guest
Message-ID: <20220127134520.GA8954@yangzhon-Virtual>
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-4-yang.zhong@intel.com>
 <cdd1bc06-619c-cd8c-b9cf-e6da22fd8751@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdd1bc06-619c-cd8c-b9cf-e6da22fd8751@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yang.zhong@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 11:16:36AM +0100, Paolo Bonzini wrote:
> On 1/24/22 08:55, Yang Zhong wrote:
> >Kernel allocates 4K xstate buffer by default. For XSAVE features
> >which require large state component (e.g. AMX), Linux kernel
> >dynamically expands the xstate buffer only after the process has
> >acquired the necessary permissions. Those are called dynamically-
> >enabled XSAVE features (or dynamic xfeatures).
> >
> >There are separate permissions for native tasks and guests.
> >
> >Qemu should request the guest permissions for dynamic xfeatures
> >which will be exposed to the guest. This only needs to be done
> >once before the first vcpu is created.
> >
> >Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> >Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >Signed-off-by: Jing Liu <jing2.liu@intel.com>
> >Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> >---
> >  target/i386/cpu.h         |  7 +++++++
> >  target/i386/cpu.c         | 31 +++++++++++++++++++++++++++++++
> >  target/i386/kvm/kvm-cpu.c | 12 ++++++------
> >  target/i386/kvm/kvm.c     |  6 ++++++
> >  4 files changed, 50 insertions(+), 6 deletions(-)
> >
> >diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> >index 06d2d6bccf..d4ad0f56bd 100644
> >--- a/target/i386/cpu.h
> >+++ b/target/i386/cpu.h
> >@@ -549,6 +549,13 @@ typedef enum X86Seg {
> >  #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
> >  #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
> >  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
> >+#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
> >+#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
> >+#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
> >+                                         | XSTATE_XTILE_DATA_MASK)
> >+
> >+#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> >+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> >  #define ESA_FEATURE_ALIGN64_BIT         1
> >diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> >index 3390820745..29b0348c25 100644
> >--- a/target/i386/cpu.c
> >+++ b/target/i386/cpu.c
> >@@ -43,6 +43,10 @@
> >  #include "disas/capstone.h"
> >  #include "cpu-internal.h"
> >+#include <sys/syscall.h>
> >+
> >+bool request_perm;
> >+
> >  /* Helpers for building CPUID[2] descriptors: */
> >  struct CPUID2CacheDescriptorInfo {
> >@@ -6000,6 +6004,27 @@ static void x86_cpu_adjust_feat_level(X86CPU *cpu, FeatureWord w)
> >      }
> >  }
> >+static void kvm_request_xsave_components(X86CPU *cpu, uint32_t bit)
> >+{
> >+    KVMState *s = CPU(cpu)->kvm_state;
> >+
> >+    long rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> >+                      bit);
> >+    if (rc) {
> >+        /*
> >+         * The older kernel version(<5.15) can't support
> >+         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> >+         */
> >+        return;
> >+    }
> >+
> >+    rc = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
> >+    if (!(rc & XFEATURE_XTILE_MASK)) {
> >+        error_report("get cpuid failure and rc=0x%lx", rc);
> >+        exit(EXIT_FAILURE);
> >+    }
> >+}
> >+
> >  /* Calculate XSAVE components based on the configured CPU feature flags */
> >  static void x86_cpu_enable_xsave_components(X86CPU *cpu)
> >  {
> >@@ -6021,6 +6046,12 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
> >          }
> >      }
> >+    /* Only request permission from fisrt vcpu. */
> >+    if (kvm_enabled() && !request_perm) {
> >+        kvm_request_xsave_components(cpu, XSTATE_XTILE_DATA_BIT);
> >+        request_perm = true;
> >+    }
> 
> You should pass "mask" here, or "mask & XSTATE_DYNAMIC_MASK" so that
> the components are only requested if necessary.

  Thanks, I will pass "mask" here, which can make kvm_request_xsave_components()
  reused in the future.

  Yang 

> 
> >      env->features[FEAT_XSAVE_COMP_LO] = mask;
> >      env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
> >  }
> >diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> >index 033ca011ea..5ab6a0b9d2 100644
> >--- a/target/i386/kvm/kvm-cpu.c
> >+++ b/target/i386/kvm/kvm-cpu.c
> >@@ -84,7 +84,7 @@ static void kvm_cpu_max_instance_init(X86CPU *cpu)
> >  static void kvm_cpu_xsave_init(void)
> >  {
> >      static bool first = true;
> >-    KVMState *s = kvm_state;
> >+    uint32_t eax, ebx, ecx, edx;
> >      int i;
> >      if (!first) {
> >@@ -100,13 +100,13 @@ static void kvm_cpu_xsave_init(void)
> >          ExtSaveArea *esa = &x86_ext_save_areas[i];
> >          if (esa->size) {
> >-            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
> >-            if (sz != 0) {
> >-                assert(esa->size == sz);
> >-                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
> >+            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
> >+            if (eax != 0) {
> >+                assert(esa->size == eax);
> >+                esa->offset = ebx;
> >              }
> >-            esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
> >+            esa->ecx = ecx;
> 
> I think esa->ecx should be assigned inside the "if".  This is also
> true in patch 1.

  Yes, you are right, thanks!
  
  Yang

> 
> >          }
> >      }
> >  }
> >diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >index 2c8feb4a6f..caf1388d8b 100644
> >--- a/target/i386/kvm/kvm.c
> >+++ b/target/i386/kvm/kvm.c
> >@@ -405,6 +405,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
> >          if (!has_msr_arch_capabs) {
> >              ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
> >          }
> >+    } else if (function == 0xd && index == 0 && reg == R_EAX) {
> >+        /*
> >+         * We can set the AMX XTILE DATA flag, even if KVM does not
> >+         * return it on GET_SUPPORTED_CPUID.
> >+         */
> >+        ret |= XSTATE_XTILE_DATA_MASK;
> >      } else if (function == 0x80000001 && reg == R_ECX) {
> >          /*
> >           * It's safe to enable TOPOEXT even if it's not returned by
> >
> 
> Instead of setting XSTATE_XTILE_DATA_MASK blindly, you need
> something like arch_prctl(ARCH_GET_XCOMP_GUEST_SUPP).  However, this
> arch_prctl only exists in the bare-metal version
> ARCH_GET_XCOMP_SUPP, and it would need access to the variable
> supported_xcr0 that KVM exports.  So I think it's better to
> implement it as a new KVM_CHECK_EXTENSION value instead of a prctl.
> 
  
  Thanks Paolo, from your below KVM changes:
  https://lore.kernel.org/kvm/20220126152210.3044876-3-pbonzini@redhat.com/T/#m7bf9a03c47c29d21deb78604bc290a45aa5e98f5

  So the changes in kvm_arch_get_supported_cpuid() like below? 
  +    } else if (function == 0xd && index == 0 && reg == R_EAX) {
  +	struct kvm_device_attr attr = {
  +		.group = 0,
  +		.attr = KVM_X86_XCOMP_GUEST_SUPP,
  +		.addr = (unsigned long) &bitmask
  +	};
  +
  +	kvm_fd = open_kvm_dev_path_or_exit();
  +	rc = ioctl(kvm_fd, KVM_GET_DEVICE_ATTR, &attr);
  +	close(kvm_fd);
  +     ret = bitmask;
  +   } 

  This can get supported_xcr0 from KVM side.

  So in the kvm_request_xsave_components(), we can do below steps?
 
  +    /* Check supported_xr0 firstly */ 
  +    rc = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
  +    if (!(rc & XFEATURE_XTILE_MASK)) {
  +        error_report("host xcr0 can't support AMX xdata and rc=0x%lx", rc);
  +        exit(EXIT_FAILURE);
  +    }

  +   /* request amx permission */
  +   syscall(ARCH_REQ_XCOMP_GUEST_PERM, xdata_bit);


  +   /* check amx permission */
  +   syscall(ARCH_GET_XCOMP_GUEST_PERM);
 
  Please help check those steps, thanks!

  Yang 

> Paolo

