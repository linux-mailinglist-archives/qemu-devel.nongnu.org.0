Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61949513427
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:47:59 +0200 (CEST)
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3Ys-0006mJ-G7
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nk3Sg-0000nE-98
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:41:34 -0400
Received: from mga04.intel.com ([192.55.52.120]:50615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nk3Se-0007e3-DL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651149692; x=1682685692;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=jDaoso8XSbsD6Q5i89/pk/Xi3K1DdLaMWFukTg8hKeQ=;
 b=ml/d73a4ulwRowu6R43m9WFs8GefAXbjaTGLVqE+f36iAZerMLpoOVcp
 ANGqc9D4HSC6fZvquszxaEx9skFtRk7l9vNFgwl4Zw+hV+bYjQgOTKHiu
 L1RKsmjQmkLhN78CGhYzUG2ksUQGCZ+tAb6mLVEEz8ucMvZtzLVxfyBWV
 7AHQFrFL7Bniw0dYTGY5L3FXTQmkVvFKNxd7F9Fzqvi6l2cHeIHl3kb3z
 MaKs8Qd6juLqFNIcMQyagWIjIk5F+Q1g0m/35jyu/yJn0LyT9Fk91KXUO
 z/IxW5L2rTz//K5kKnOP0aCvsB3DdaQjnU1Oc1RMH8ZntOeSD74RLkFbr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265125961"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="265125961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="706039981"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2022 05:41:23 -0700
Date: Thu, 28 Apr 2022 20:37:51 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 08/13] KVM: Use memfile_pfn_ops to obtain pfn for
 private pages
Message-ID: <20220428123751.GB10508@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-9-chao.p.peng@linux.intel.com>
 <YkJLFu98hZOvTSrL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkJLFu98hZOvTSrL@google.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 11:56:06PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > @@ -2217,4 +2220,34 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
> >  /* Max number of entries allowed for each kvm dirty ring */
> >  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
> >  
> > +#ifdef CONFIG_MEMFILE_NOTIFIER
> > +static inline long kvm_memfile_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
> > +				       int *order)
> > +{
> > +	pgoff_t index = gfn - slot->base_gfn +
> > +			(slot->private_offset >> PAGE_SHIFT);
> 
> This is broken for 32-bit kernels, where gfn_t is a 64-bit value but pgoff_t is a
> 32-bit value.  There's no reason to support this for 32-bit kernels, so...
> 
> The easiest fix, and likely most maintainable for other code too, would be to
> add a dedicated CONFIG for private memory, and then have KVM check that for all
> the memfile stuff.  x86 can then select it only for 64-bit kernels, and in turn
> select MEMFILE_NOTIFIER iff private memory is supported.
> 
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index ca7b2a6a452a..ee9c8c155300 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -48,7 +48,9 @@ config KVM
>         select SRCU
>         select INTERVAL_TREE
>         select HAVE_KVM_PM_NOTIFIER if PM
> -       select MEMFILE_NOTIFIER
> +       select HAVE_KVM_PRIVATE_MEM if X86_64
> +       select MEMFILE_NOTIFIER if HAVE_KVM_PRIVATE_MEM
> +
>         help
>           Support hosting fully virtualized guest machines using hardware
>           virtualization extensions.  You will need a fairly recent
> 
> And in addition to replacing checks on CONFIG_MEMFILE_NOTIFIER, the probing of
> whether or not KVM_MEM_PRIVATE is allowed can be:
> 
> @@ -1499,23 +1499,19 @@ static void kvm_replace_memslot(struct kvm *kvm,
>         }
>  }
> 
> -bool __weak kvm_arch_private_memory_supported(struct kvm *kvm)
> -{
> -       return false;
> -}
> -
>  static int check_memory_region_flags(struct kvm *kvm,
>                                 const struct kvm_userspace_memory_region *mem)
>  {
>         u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> 
> -       if (kvm_arch_private_memory_supported(kvm))
> -               valid_flags |= KVM_MEM_PRIVATE;
> -
>  #ifdef __KVM_HAVE_READONLY_MEM
>         valid_flags |= KVM_MEM_READONLY;
>  #endif
> 
> +#ifdef CONFIG_KVM_HAVE_PRIVATE_MEM
> +       valid_flags |= KVM_MEM_PRIVATE;
> +#endif

One thing to mention is CONFIG_KVM_HAVE_PRIVATE_MEM is build-time thing.
Do you think we should or not do that for runtime? E.g. expose by vm_type
so only when TDX is enabled KVM_MEM_PRIVATE is exposed.

Chao

