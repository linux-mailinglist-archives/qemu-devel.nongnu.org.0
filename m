Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D56588A08
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:00:36 +0200 (CEST)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBB2-0001tj-9F
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJB7f-0004Gj-83
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:57:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:22731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJB7d-0003Zf-1h
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659520621; x=1691056621;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=p5ITce4KSwHKZdQfiAt1mQ6fsiDPcz5sMpR9X2/JV9U=;
 b=UATPRp5qaBQktw8nKHv8AN3Er+s5LvIh8Ve8od5imP7L7YVsv+R1vJYD
 G1f9vkv37TGDH0lGfXQt6/9HXglJlLv4ZfrAAdTt5crunbGZ+8MxcGRaR
 hFA7xcTj46UMAvBWxe55CoRpttzRwcMn/D6reQzIfOYGw8fAfzd2EULLT
 HgwxWk1z/D4jeaCpZ37tPmvp9XxcrXy3SD+clu03G0DUVclvdx+ptTHFI
 j3tTtuswJMLO9Qwxdz7OwMdX/Zhs+qx5auawvcsmRPmRMjGNL34tD2Nwh
 qW4qL7U3LE2AyLHPu7artMgxpSyh/6H+kv8cN8BuXON6B9+pBnhmiGCs8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="270013148"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="270013148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 02:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="599589620"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 03 Aug 2022 02:56:47 -0700
Date: Wed, 3 Aug 2022 17:52:00 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 12/14] KVM: Handle page fault for private memory
Message-ID: <20220803095200.GB607465@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-13-chao.p.peng@linux.intel.com>
 <YuRKAcT3cuEE4GgF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuRKAcT3cuEE4GgF@google.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 29, 2022 at 08:58:41PM +0000, Sean Christopherson wrote:
> On Wed, Jul 06, 2022, Chao Peng wrote:
> > A page fault can carry the private/shared information for
> > KVM_MEM_PRIVATE memslot, this can be filled by architecture code(like
> > TDX code). To handle page fault for such access, KVM maps the page only
> > when this private property matches the host's view on the page.
> > 
> > For a successful match, private pfn is obtained with memfile_notifier
> > callbacks from private fd and shared pfn is obtained with existing
> > get_user_pages.
> > 
> > For a failed match, KVM causes a KVM_EXIT_MEMORY_FAULT exit to
> > userspace. Userspace then can convert memory between private/shared from
> > host's view then retry the access.
> > 
> > Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c          | 60 ++++++++++++++++++++++++++++++++-
> >  arch/x86/kvm/mmu/mmu_internal.h | 18 ++++++++++
> >  arch/x86/kvm/mmu/mmutrace.h     |  1 +
> >  include/linux/kvm_host.h        | 35 ++++++++++++++++++-
> >  4 files changed, 112 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 545eb74305fe..27dbdd4fe8d1 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -3004,6 +3004,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
> >  	if (max_level == PG_LEVEL_4K)
> >  		return PG_LEVEL_4K;
> >  
> > +	if (kvm_mem_is_private(kvm, gfn))
> > +		return max_level;
> > +
> >  	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
> >  	return min(host_level, max_level);
> >  }
> > @@ -4101,10 +4104,52 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
> >  	kvm_mmu_do_page_fault(vcpu, work->cr2_or_gpa, 0, true);
> >  }
> >  
> > +static inline u8 order_to_level(int order)
> > +{
> > +	enum pg_level level;
> > +
> > +	for (level = KVM_MAX_HUGEPAGE_LEVEL; level > PG_LEVEL_4K; level--)
> 
> Curly braces needed for the for-loop.
> 
> And I think it makes sense to take in the fault->max_level, that way this is
> slightly more performant when the guest mapping is smaller than the host, e.g.
> 
> 	for (level = max_level; level > PG_LEVEL_4K; level--)
> 		...
> 
> 	return level;
> 
> Though I think I'd vote to avoid a loop entirely and do:
> 
> 	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> 
> 	if (order > ???)
> 		return PG_LEVEL_1G;
> 	
> 	if (order > ???)
> 		return PG_LEVEL_2M;
> 
> 	return PG_LEVEL_4K;

Sounds good.

> 
> 
> > +		if (order >= page_level_shift(level) - PAGE_SHIFT)
> > +			return level;
> > +	return level;
> > +}
> > +
> > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +				   struct kvm_page_fault *fault)
> > +{
> > +	int order;
> > +	struct kvm_memory_slot *slot = fault->slot;
> > +	bool private_exist = kvm_mem_is_private(vcpu->kvm, fault->gfn);
> > +
> > +	if (fault->is_private != private_exist) {
> > +		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> > +		if (fault->is_private)
> > +			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> > +		else
> > +			vcpu->run->memory.flags = 0;
> > +		vcpu->run->memory.padding = 0;
> > +		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> > +		vcpu->run->memory.size = PAGE_SIZE;
> > +		return RET_PF_USER;
> > +	}
> > +
> > +	if (fault->is_private) {
> > +		if (kvm_private_mem_get_pfn(slot, fault->gfn, &fault->pfn, &order))
> > +			return RET_PF_RETRY;
> > +		fault->max_level = min(order_to_level(order), fault->max_level);
> > +		fault->map_writable = !(slot->flags & KVM_MEM_READONLY);
> > +		return RET_PF_FIXED;
> > +	}
> > +
> > +	/* Fault is shared, fallthrough. */
> > +	return RET_PF_CONTINUE;
> > +}
> > +
> >  static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> >  {
> >  	struct kvm_memory_slot *slot = fault->slot;
> >  	bool async;
> > +	int r;
> >  
> >  	/*
> >  	 * Retry the page fault if the gfn hit a memslot that is being deleted
> > @@ -4133,6 +4178,12 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> >  			return RET_PF_EMULATE;
> >  	}
> >  
> > +	if (kvm_slot_can_be_private(slot)) {
> > +		r = kvm_faultin_pfn_private(vcpu, fault);
> > +		if (r != RET_PF_CONTINUE)
> > +			return r == RET_PF_FIXED ? RET_PF_CONTINUE : r;
> 
> I apologize if I've given you conflicting feedback in the past.  Now that this
> returns RET_PF_* directly, I definitely think it makes sense to do:
> 
> 	if (kvm_slot_can_be_private(slot) &&
> 	    fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> 		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> 		if (fault->is_private)
> 			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> 		else
> 			vcpu->run->memory.flags = 0;
> 		vcpu->run->memory.padding = 0;
> 		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> 		vcpu->run->memory.size = PAGE_SIZE;
> 		return RET_PF_USER;
> 	}
> 
> 	if (fault->is_private)
> 		return kvm_faultin_pfn_private(vcpu, fault);
> 
> That way kvm_faultin_pfn_private() only handles private faults, and this doesn't
> need to play games with RET_PF_FIXED.

Agreed, this looks much simpler.

> 
> 
> > +	}
> > +
> >  	async = false;
> >  	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,
> >  					  fault->write, &fault->map_writable,
> > @@ -4241,7 +4292,11 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >  		read_unlock(&vcpu->kvm->mmu_lock);
> >  	else
> >  		write_unlock(&vcpu->kvm->mmu_lock);
> > -	kvm_release_pfn_clean(fault->pfn);
> > +
> > +	if (fault->is_private)
> > +		kvm_private_mem_put_pfn(fault->slot, fault->pfn);
> > +	else
> > +		kvm_release_pfn_clean(fault->pfn);
> 
> AFAIK, we never bottomed out on whether or not this is needed[*].  Can you follow
> up with Kirill to get an answer before posting v8?

Sure.

Chao
> 
> [*] https://lore.kernel.org/all/20220620141647.GC2016793@chaop.bj.intel.com

