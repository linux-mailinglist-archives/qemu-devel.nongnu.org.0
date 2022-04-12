Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5E4FDF4A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:14:01 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFPE-0004SS-6f
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neFLq-0003BL-TX
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:10:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:58252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neFLo-0000o4-H2
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649765428; x=1681301428;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=H3y2PO8iP1I2VKt5VHY/5jS3296P+ova6WPUU37ZDYU=;
 b=P7iu60O0YirDyKCYgAKs9Ku0n4tysjsxkY8xjmn64xnfZneVQi70Kf0L
 RB/PGoENx4/P3NptMp21znfI1/GcATyu+xEzkpFyuL/Cw7PK4d66r4R9B
 kZFy77DFbIACUImUMADkMiDKbEYCvghsjGC+ykDrEiHPZvV7gHP5xF0vT
 e47RNvwG9SCOb/SucimmNxT6qBFD0U7fQ6cAG7DO8L1cNF86Gx35pvquy
 I3xb4XWgi7OUO06RyyvwVYVlCeq/BjWp5vi/O9kiA+N9EqA3cIb5D9rx4
 LG0Sf+7SVXUA549T2S/1u9zIgIgGf7CfCvmGu+xOIX5sgPb7QMxBisLoe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262107991"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="262107991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 05:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="526015878"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga002.jf.intel.com with ESMTP; 12 Apr 2022 05:10:16 -0700
Date: Tue, 12 Apr 2022 20:10:05 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 09/13] KVM: Handle page fault for private memory
Message-ID: <20220412121005.GC7309@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-10-chao.p.peng@linux.intel.com>
 <YkJbxiL/Az7olWlq@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkJbxiL/Az7olWlq@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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

On Tue, Mar 29, 2022 at 01:07:18AM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > @@ -3890,7 +3893,59 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> >  				  kvm_vcpu_gfn_to_hva(vcpu, gfn), &arch);
> >  }
> >  
> > -static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault, int *r)
> > +static bool kvm_vcpu_is_private_gfn(struct kvm_vcpu *vcpu, gfn_t gfn)
> > +{
> > +	/*
> > +	 * At this time private gfn has not been supported yet. Other patch
> > +	 * that enables it should change this.
> > +	 */
> > +	return false;
> > +}
> > +
> > +static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +				    struct kvm_page_fault *fault,
> > +				    bool *is_private_pfn, int *r)
> 
> @is_private_pfn should be a field in @fault, not a separate parameter, and it
> should be a const property set by the original caller.  I would also name it
> "is_private", because if KVM proceeds past this point, it will be a property of
> the fault/access _and_ the pfn
> 
> I say it's a property of the fault because the below kvm_vcpu_is_private_gfn()
> should instead be:
> 
> 	if (fault->is_private)
> 
> The kvm_vcpu_is_private_gfn() check is TDX centric.  For SNP, private vs. shared
> is communicated via error code.  For software-only (I'm being optimistic ;-) ),
> we'd probably need to track private vs. shared internally in KVM, I don't think
> we'd want to force it to be a property of the gfn.

Make sense.

> 
> Then you can also move the fault->is_private waiver into is_page_fault_stale(),
> and drop the local is_private_pfn in direct_page_fault().
> 
> > +{
> > +	int order;
> > +	unsigned int flags = 0;
> > +	struct kvm_memory_slot *slot = fault->slot;
> > +	long pfn = kvm_memfile_get_pfn(slot, fault->gfn, &order);
> 
> If get_lock_pfn() and thus kvm_memfile_get_pfn() returns a pure error code instead
> of multiplexing the pfn, then this can be:
> 
> 	bool is_private_pfn;
> 
> 	is_private_pfn = !!kvm_memfile_get_pfn(slot, fault->gfn, &fault->pfn, &order);
> 
> That self-documents the "pfn < 0" == shared logic.

Yes, agreed.

> 
> > +
> > +	if (kvm_vcpu_is_private_gfn(vcpu, fault->addr >> PAGE_SHIFT)) {
> > +		if (pfn < 0)
> > +			flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
> > +		else {
> > +			fault->pfn = pfn;
> > +			if (slot->flags & KVM_MEM_READONLY)
> > +				fault->map_writable = false;
> > +			else
> > +				fault->map_writable = true;
> > +
> > +			if (order == 0)
> > +				fault->max_level = PG_LEVEL_4K;
> 
> This doesn't correctly handle order > 0, but less than the next page size, in which
> case max_level needs to be PG_LEVEL_4k.  It also doesn't handle the case where
> max_level > PG_LEVEL_2M.
> 
> That said, I think the proper fix is to have the get_lock_pfn() API return the max
> mapping level, not the order.  KVM, and presumably any other secondary MMU that might
> use these APIs, doesn't care about the order of the struct page, KVM cares about the
> max size/level of page it can map into the guest.  And similar to the previous patch,
> "order" is specific to struct page, which we are trying to avoid.

I remembered I suggested return max mapping level instead of order but
Kirill reminded me that PG_LEVEL_* is x86 specific, then changed back
to 'order'. It's just a matter of backing store or KVM to convert
'order' to mapping level.

> 
> > +			*is_private_pfn = true;
> 
> This is where KVM guarantees that is_private_pfn == fault->is_private.
> 
> > +			*r = RET_PF_FIXED;
> > +			return true;
> 
> Ewww.  This is super confusing.  Ditto for the "*r = -1" magic number.  I totally
> understand why you took this approach, it's just hard to follow because it kinda
> follows the kvm_faultin_pfn() semantics, but then inverts true and false in this
> one case.
> 
> I think the least awful option is to forego the helper and open code everything.
> If we ever refactor kvm_faultin_pfn() to be less weird then we can maybe move this
> to a helper.
> 
> Open coding isn't too bad if you reorganize things so that the exit-to-userspace
> path is a dedicated, early check.  IMO, it's a lot easier to read this way, open
> coded or not.

Yes the existing way of handling this is really awful, including the handling for 'r'
that will be finally return to KVM_RUN as part of the uAPI. Let me try your above
suggestion.

> 
> I think this is correct?  "is_private_pfn" and "level" are locals, everything else
> is in @fault.
> 
> 	if (kvm_slot_is_private(slot)) {
> 		is_private_pfn = !!kvm_memfile_get_pfn(slot, fault->gfn,
> 						       &fault->pfn, &level);
> 
> 		if (fault->is_private != is_private_pfn) {
> 			if (is_private_pfn)
> 				kvm_memfile_put_pfn(slot, fault->pfn);
> 
> 			vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
> 			if (fault->is_private)
> 				vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> 			else
> 				vcpu->run->memory.flags = 0;
> 			vcpu->run->memory.padding = 0;
> 			vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> 			vcpu->run->memory.size = PAGE_SIZE;
> 			*r = 0;
> 			return true;
> 		}
> 
> 		/*
> 		 * fault->pfn is all set if the fault is for a private pfn, just
> 		 * need to update other metadata.
> 		 */
> 		if (fault->is_private) {
> 			fault->max_level = min(fault->max_level, level);
> 			fault->map_writable = !(slot->flags & KVM_MEM_READONLY);
> 			return false;
> 		}
> 
> 		/* Fault is shared, fallthrough to the standard path. */
> 	}
> 
> 	async = false;
> 
> > @@ -4016,7 +4076,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >  	else
> >  		write_lock(&vcpu->kvm->mmu_lock);
> >  
> > -	if (is_page_fault_stale(vcpu, fault, mmu_seq))
> > +	if (!is_private_pfn && is_page_fault_stale(vcpu, fault, mmu_seq))
> 
> As above, I'd prefer this check go in is_page_fault_stale().  It means shadow MMUs
> will suffer a pointless check, but I don't think that's a big issue.  Oooh, unless
> we support software-only, which would play nice with nested and probably even legacy
> shadow paging.  Fun :-)

Sounds good.

> 
> >  		goto out_unlock;
> >  
> >  	r = make_mmu_pages_available(vcpu);
> > @@ -4033,7 +4093,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> >  		read_unlock(&vcpu->kvm->mmu_lock);
> >  	else
> >  		write_unlock(&vcpu->kvm->mmu_lock);
> > -	kvm_release_pfn_clean(fault->pfn);
> > +
> > +	if (is_private_pfn)
> 
> And this can be
> 
> 	if (fault->is_private)
> 
> Same feedback for paging_tmpl.h.

Agreed.

Thanks,
Chao

