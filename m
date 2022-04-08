Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17934F97B5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:10:04 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpJL-000255-Fk
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncpGt-0008No-NW
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:07:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:31419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncpGr-0000uz-Rc
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649426849; x=1680962849;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=eDkQXvXOF7yKn1iuVU45nfja4Im2dxSC1xviYqR0nWQ=;
 b=VWlNUNYgSJDEPZqQ5eAYvlkqZoAusJ8V3aKvzuYc6jtXo0QIRfYuJeWl
 VRwZi/4tveO9kSAfF/mcB3hek0z4ZVK2GL4POqSK04xM33Sp+6qykNPPF
 uFPIMauhEFen8FGYaNVCH0LoUCK/XpafPn8Og+aJZZMerd02KpL+d8hZW
 xn0TGovUSXh/95561Ll0ygphZvkBvgAEsSYPkT/2NT4HxnKwk/RGR8P3m
 T8PQMKev6z1GIjVs0R+f0xk+bEmjxbzMyZg2TPiyX8NPi2tNZngo2nsXs
 h1FEnZHo6jW9sWxPXEWnqOQJEVzmix4cC9Rcnzi0AbyZmS9ylYz/4JR4I w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="243732477"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="243732477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 07:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="571498592"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2022 07:07:18 -0700
Date: Fri, 8 Apr 2022 22:07:07 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 08/13] KVM: Use memfile_pfn_ops to obtain pfn for
 private pages
Message-ID: <20220408140707.GG57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-9-chao.p.peng@linux.intel.com>
 <YkJLFu98hZOvTSrL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkJLFu98hZOvTSrL@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Looks good.

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
> +
>         if (mem->flags & ~valid_flags)
>                 return -EINVAL;
> 
> > +
> > +	return slot->pfn_ops->get_lock_pfn(file_inode(slot->private_file),
> > +					   index, order);
> 
> In a similar vein, get_locK_pfn() shouldn't return a "long".  KVM likely won't use
> these APIs on 32-bit kernels, but that may not hold true for other subsystems, and
> this code is confusing and technically wrong.  The pfns for struct page squeeze
> into an unsigned long because PAE support is capped at 64gb, but casting to a
> signed long could result in a pfn with bit 31 set being misinterpreted as an error.
> 
> Even returning an "unsigned long" for the pfn is wrong.  It "works" for the shmem
> code because shmem deals only with struct page, but it's technically wrong, especially
> since one of the selling points of this approach is that it can work without struct
> page.

Hmmm, that's correct.

> 
> OUT params suck, but I don't see a better option than having the return value be
> 0/-errno, with "pfn_t *pfn" for the resolved pfn.
> 
> > +}
> > +
> > +static inline void kvm_memfile_put_pfn(struct kvm_memory_slot *slot,
> > +				       kvm_pfn_t pfn)
> > +{
> > +	slot->pfn_ops->put_unlock_pfn(pfn);
> > +}
> > +
> > +#else
> > +static inline long kvm_memfile_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
> > +				       int *order)
> > +{
> 
> This should be a WARN_ON() as its usage should be guarded by a KVM_PRIVATE_MEM
> check, and private memslots should be disallowed in this case.
> 
> Alternatively, it might be a good idea to #ifdef these out entirely and not provide
> stubs.  That'd likely require a stub or two in arch code, but overall it might be
> less painful in the long run, e.g. would force us to more carefully consider the
> touch points for private memory.  Definitely not a requirement, just an idea.

Make sense, let me try.

Thanks,
Chao

