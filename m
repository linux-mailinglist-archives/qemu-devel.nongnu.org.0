Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCAC4C4303
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:03:15 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNYNW-0004nN-JU
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nNYGT-0008UK-OO
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:55:57 -0500
Received: from mga07.intel.com ([134.134.136.100]:44159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nNYGR-0000Bv-4V
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645786555; x=1677322555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0/VxRniaVLfwYL8a8FZ82Y32tnlXu+1Di4YkWVhbCEk=;
 b=ipaA6eWs9pHIo3XyPl7iVLDWue4+L3ZTQg25dhA6gFqGMiXshEBwFhiC
 Tdrfc8h3sAlbkgreYW3sSdIF7zdcUYdaG8RkYCfvvHBAGLdfbKi4IUn+V
 Jk4OY27pQ2WrfyOkVIhxfruRePN2yAU17IcZ68S7E532rvWYCxSCgSEdR
 hxOqbJ1yZRhYcLf5FNp/CYtPUE6XB9xlnirmtf7Wy6LVjVJM0BnJnE0Wx
 9/DnWrQn3KBLShqOEIV0AmQuJSqEWGCy76Msg03XElR11u1O0ZKCVqJ8i
 dfQ9aOj/i3EgY9QyScOwk2l3UonOJw/Vyh/CK/kTtlzNrBaeAr8cgiOrZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="315693044"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="315693044"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 02:55:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="533535245"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 25 Feb 2022 02:55:50 -0800
Date: Fri, 25 Feb 2022 18:40:09 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/8] x86: Grant AMX permission for guest
Message-ID: <20220225104009.GC24485@yangzhon-Virtual>
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-4-yang.zhong@intel.com>
 <20220217055836.GA10691@yangzhon-Virtual>
 <9e873019-99c6-bd47-458d-1d307961882c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e873019-99c6-bd47-458d-1d307961882c@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
 jing2.liu@linux.intel.com, qemu-devel@nongnu.org, wei.w.wang@intel.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 02:44:10PM +0100, Paolo Bonzini wrote:
> On 2/17/22 06:58, Yang Zhong wrote:
> >>+
> >>+    if ((mask & XSTATE_XTILE_DATA_MASK) == XSTATE_XTILE_DATA_MASK) {
> >>+        bitmask = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
> >>+        if (!(bitmask & XSTATE_XTILE_DATA_MASK)) {
> >    Paolo, last time you suggested below changes for here:
> >
> >    rc = kvm_arch_get_supported_cpuid(s, 0xd, 0,
> >                                   (xdata_bit < 32 ? R_EAX : R_EDX));
> >    if (!(rc & BIT(xdata_bit & 31)) {
> >       ...
> >    }
> >
> >   Since I used "mask" as parameter here, so I had to directly use R_EAX here.
> >   Please review and if need change it to like "(xdata_bit < 32 ? R_EAX : R_EDX)",
> >   I will change this in next version, thanks!
> 
> I looked at this function more closely because it didn't compile on non-Linux
> systems, too.  I think it's better to write it already to plan for more
> dynamic features.  In the code below, I'm also relying on
> KVM_GET_SUPPORTED_CPUID/KVM_X86_COMP_GUEST_SUPP being executed
> before ARCH_REQ_XCOMP_GUEST_PERM, which therefore cannot fail.
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 377d993438..1d0c006077 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -43,8 +43,6 @@
>  #include "disas/capstone.h"
>  #include "cpu-internal.h"
> -#include <sys/syscall.h>
> -
>  /* Helpers for building CPUID[2] descriptors: */
>  struct CPUID2CacheDescriptorInfo {
> @@ -6002,40 +6000,6 @@ static void x86_cpu_adjust_feat_level(X86CPU *cpu, FeatureWord w)
>      }
>  }
> -static void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
> -{
> -    KVMState *s = kvm_state;
> -    uint64_t bitmask;
> -    long rc;
> -
> -    if ((mask & XSTATE_XTILE_DATA_MASK) == XSTATE_XTILE_DATA_MASK) {
> -        bitmask = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
> -        if (!(bitmask & XSTATE_XTILE_DATA_MASK)) {
> -            warn_report("no amx support from supported_xcr0, "
> -                        "bitmask:0x%lx", bitmask);
> -            return;
> -        }
> -
> -        rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> -                      XSTATE_XTILE_DATA_BIT);
> -        if (rc) {
> -            /*
> -             * The older kernel version(<5.15) can't support
> -             * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> -             */
> -            return;
> -        }
> -
> -        rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> -        if (rc) {
> -            warn_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
> -        } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
> -            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
> -                        "and bitmask=0x%lx", bitmask);
> -        }
> -    }
> -}
> -
>  /* Calculate XSAVE components based on the configured CPU feature flags */
>  static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>  {
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d4ad0f56bd..de949bd63d 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -551,11 +551,8 @@ typedef enum X86Seg {
>  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
>  #define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
>  #define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
> -#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
> -                                         | XSTATE_XTILE_DATA_MASK)
> -#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> -#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> +#define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
>  #define ESA_FEATURE_ALIGN64_BIT         1
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 3bdcd724c4..4b07778970 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -17,6 +17,7 @@
>  #include "qapi/error.h"
>  #include <sys/ioctl.h>
>  #include <sys/utsname.h>
> +#include <sys/syscall.h>
>  #include <linux/kvm.h>
>  #include "standard-headers/asm-x86/kvm_para.h"
> @@ -5168,3 +5169,39 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return !sev_es_enabled();
>  }
> +
> +#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> +
> +void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
> +{
> +    KVMState *s = kvm_state;
> +    uint64_t supported;
> +
> +    mask &= XSTATE_DYNAMIC_MASK;
> +    if (!mask) {
> +	return;
> +    }
> +    /*
> +     * Just ignore bits that are not in CPUID[EAX=0xD,ECX=0].
> +     * ARCH_REQ_XCOMP_GUEST_PERM would fail, and QEMU has warned
> +     * about them already because they are not supported features.
> +     */
> +    supported = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
> +    supported |= (uint64_t)kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EDX) << 32;
> +    mask &= ~supported;


  Paolo, thanks for your great help!
  Except changing "mask &= ~supported" to "mask &= supported", this patch work well.

  Please re-sync Linux-header since David has pulled linux header to 5.17-rc1
  https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg03763.html

  Yang


> +
> +    while (mask) {
> +        int bit = ctz64(mask);
> +        int rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, bit);
> +        if (rc) {
> +            /*
> +             * Older kernel version (<5.17) do not support
> +             * ARCH_REQ_XCOMP_GUEST_PERM, but also do not return
> +             * any dynamic feature from kvm_arch_get_supported_cpuid.
> +             */
> +            warn_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
> +                        "for feature bit %d", bit);
> +        }
> +	mask &= ~BIT_ULL(bit);
> +    }
> +}
> diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
> index a978509d50..4124912c20 100644
> --- a/target/i386/kvm/kvm_i386.h
> +++ b/target/i386/kvm/kvm_i386.h
> @@ -52,5 +52,6 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
>  uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
>  bool kvm_enable_sgx_provisioning(KVMState *s);
> +void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
>  #endif
> 
> 
> If this works, the rest of the series is good to go!
> 
> Thanks,
> 
> Paolo

