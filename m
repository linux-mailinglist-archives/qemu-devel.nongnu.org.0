Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4D4B991D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:19:15 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKa8I-0006aK-5p
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKa3Y-0002Wy-H1
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:14:22 -0500
Received: from mga05.intel.com ([192.55.52.43]:56193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKa3U-0007SB-Lb
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645078456; x=1676614456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=izyQjp6lclMwHJPp2uRllZeNO6EQ/Tnv0d8E8KGqbgM=;
 b=faPhfeoUYi+gNupQOwWTgEO5C8o9UocFeirS2HSHNyawKgwbVZEFgA62
 GRgtmV9rcKRtQpKakAHLRPQELURC4PGyft4fXShE14jWplBI3c22WVuko
 vs/GqyuLDyKZHhZtYjrsRIY8Ccrz5HPzpvC/lOpFdPHxl2A/uiUdetZ58
 VcPJOgHL2kZCOZKjDY9dgLrvzAqp7+l3Po4kaWiIv7Hd9rv7YrD6+mVnE
 UFfzjcKOcqnRFiwnvbfRxcvuGf59kUPv4InlDtK41D9qDjRW5dMWFa7TZ
 /kml4qFOIipBY9zH7+Rk6bLV44LhY2GjLPgGY7L6JLvNTtlAwru4h1KYT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="337247013"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="337247013"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:14:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="681822594"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 16 Feb 2022 22:14:12 -0800
Date: Thu, 17 Feb 2022 13:58:36 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/8] x86: Grant AMX permission for guest
Message-ID: <20220217055836.GA10691@yangzhon-Virtual>
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-4-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217060434.52460-4-yang.zhong@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 10:04:29PM -0800, Yang Zhong wrote:
> Kernel allocates 4K xstate buffer by default. For XSAVE features
> which require large state component (e.g. AMX), Linux kernel
> dynamically expands the xstate buffer only after the process has
> acquired the necessary permissions. Those are called dynamically-
> enabled XSAVE features (or dynamic xfeatures).
> 
> There are separate permissions for native tasks and guests.
> 
> Qemu should request the guest permissions for dynamic xfeatures
> which will be exposed to the guest. This only needs to be done
> once before the first vcpu is created.
> 
> KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
> get host side supported_xcr0 and Qemu can decide if it can request
> dynamically enabled XSAVE features permission.
> https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> ---
>  target/i386/cpu.h         |  7 +++++++
>  target/i386/cpu.c         | 43 +++++++++++++++++++++++++++++++++++++++
>  target/i386/kvm/kvm-cpu.c | 12 +++++------
>  target/i386/kvm/kvm.c     | 20 ++++++++++++++++++
>  4 files changed, 76 insertions(+), 6 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 06d2d6bccf..d4ad0f56bd 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -549,6 +549,13 @@ typedef enum X86Seg {
>  #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
>  #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
>  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
> +#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
> +#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
> +#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
> +                                         | XSTATE_XTILE_DATA_MASK)
> +
> +#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> +#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
>  
>  #define ESA_FEATURE_ALIGN64_BIT         1
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ea7e8f9081..377d993438 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -43,6 +43,8 @@
>  #include "disas/capstone.h"
>  #include "cpu-internal.h"
>  
> +#include <sys/syscall.h>
> +
>  /* Helpers for building CPUID[2] descriptors: */
>  
>  struct CPUID2CacheDescriptorInfo {
> @@ -6000,12 +6002,47 @@ static void x86_cpu_adjust_feat_level(X86CPU *cpu, FeatureWord w)
>      }
>  }
>  
> +static void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
> +{
> +    KVMState *s = kvm_state;
> +    uint64_t bitmask;
> +    long rc;
> +
> +    if ((mask & XSTATE_XTILE_DATA_MASK) == XSTATE_XTILE_DATA_MASK) {
> +        bitmask = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
> +        if (!(bitmask & XSTATE_XTILE_DATA_MASK)) {

   Paolo, last time you suggested below changes for here:

   rc = kvm_arch_get_supported_cpuid(s, 0xd, 0,
                                  (xdata_bit < 32 ? R_EAX : R_EDX));
   if (!(rc & BIT(xdata_bit & 31)) {
      ...
   }   

  Since I used "mask" as parameter here, so I had to directly use R_EAX here.
  Please review and if need change it to like "(xdata_bit < 32 ? R_EAX : R_EDX)",
  I will change this in next version, thanks!

  Yang


> +            warn_report("no amx support from supported_xcr0, "
> +                        "bitmask:0x%lx", bitmask);
> +            return;
> +        }
> +
> +        rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> +                      XSTATE_XTILE_DATA_BIT);
> +        if (rc) {
> +            /*
> +             * The older kernel version(<5.15) can't support
> +             * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> +             */
> +            return;
> +        }
> +
> +        rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> +        if (rc) {
> +            warn_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
> +        } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
> +            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
> +                        "and bitmask=0x%lx", bitmask);
> +        }
> +    }
> +}
> +
>  /* Calculate XSAVE components based on the configured CPU feature flags */
>  static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>  {
>      CPUX86State *env = &cpu->env;
>      int i;
>      uint64_t mask;
> +    static bool request_perm;
>  
>      if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
>          env->features[FEAT_XSAVE_COMP_LO] = 0;
> @@ -6021,6 +6058,12 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>          }
>      }
>  
> +    /* Only request permission for first vcpu */
> +    if (kvm_enabled() && !request_perm) {
> +        kvm_request_xsave_components(cpu, mask);
> +        request_perm = true;
> +    }
> +
>      env->features[FEAT_XSAVE_COMP_LO] = mask;
>      env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
>  }
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index ce27d3b1df..a35a1bf9fe 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -84,7 +84,7 @@ static void kvm_cpu_max_instance_init(X86CPU *cpu)
>  static void kvm_cpu_xsave_init(void)
>  {
>      static bool first = true;
> -    KVMState *s = kvm_state;
> +    uint32_t eax, ebx, ecx, edx;
>      int i;
>  
>      if (!first) {
> @@ -100,11 +100,11 @@ static void kvm_cpu_xsave_init(void)
>          ExtSaveArea *esa = &x86_ext_save_areas[i];
>  
>          if (esa->size) {
> -            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
> -            if (sz != 0) {
> -                assert(esa->size == sz);
> -                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
> -                esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
> +            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
> +            if (eax != 0) {
> +                assert(esa->size == eax);
> +                esa->offset = ebx;
> +                esa->ecx = ecx;
>              }
>          }
>      }
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2c8feb4a6f..3bdcd724c4 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -348,6 +348,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>      struct kvm_cpuid2 *cpuid;
>      uint32_t ret = 0;
>      uint32_t cpuid_1_edx;
> +    uint64_t bitmask;
>  
>      cpuid = get_supported_cpuid(s);
>  
> @@ -405,6 +406,25 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>          if (!has_msr_arch_capabs) {
>              ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
>          }
> +    } else if (function == 0xd && index == 0 &&
> +               (reg == R_EAX || reg == R_EDX)) {
> +        struct kvm_device_attr attr = {
> +            .group = 0,
> +            .attr = KVM_X86_XCOMP_GUEST_SUPP,
> +            .addr = (unsigned long) &bitmask
> +        };
> +
> +        bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
> +        if (!sys_attr) {
> +            warn_report("cannot get sys attribute capabilities %d", sys_attr);
> +        }
> +
> +        int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
> +        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
> +            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
> +                        "error: %d", rc);
> +        }
> +        ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
>      } else if (function == 0x80000001 && reg == R_ECX) {
>          /*
>           * It's safe to enable TOPOEXT even if it's not returned by

