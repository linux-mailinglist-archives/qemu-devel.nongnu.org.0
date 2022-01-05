Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D3484E68
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:33:23 +0100 (CET)
Received: from localhost ([::1]:59888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4zrN-0006s9-LD
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:33:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4znF-0005DN-A9
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:29:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:7066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zn4-0005ih-9N
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641364134; x=1672900134;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=R4LxQJYszF/u/f5BeYXO0e51VwhoyCxemYgl6dbn0rc=;
 b=i9bEgFyefo7ru5luD3AD6cDAJvike9Jp6V0jsT8oc157HzImI3BLqyPf
 MW+vJLLnwyn+H5suB0dD1+28P9rjt4pOlchsxb34TsdoeV2Pvwu9N2m9j
 VgZo4qwUpbYsC5GsKEefI3LUBQt+bGWC0UJY4PAX7tNbIHBRjyZx6rNH3
 c/YpAdJeSeFwZTV6hNLu1IX2RK9wwy7YrNBV6pkYavLJPHcxuVQqDEFoT
 7lamJJvHlfZmeqBfNGNdUq1qtfi9duyAipKCeQNp/0SdbS3lYsyEpF1Wt
 ETtgz1duKGPExF+IFk8QlGKwqJDolh6qpEH2rwBA/8jAKyK/eLx/gXMPS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222372647"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="222372647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 22:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="526385523"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 04 Jan 2022 22:28:44 -0800
Date: Wed, 5 Jan 2022 14:28:10 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 kvm/queue 14/16] KVM: Handle page fault for private
 memory
Message-ID: <20220105062810.GB25283@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-15-chao.p.peng@linux.intel.com>
 <20220104014629.GA2330@yzhao56-desk.sh.intel.com>
 <20220104091008.GA21806@chaop.bj.intel.com>
 <20220104100612.GA19947@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104100612.GA19947@yzhao56-desk.sh.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 06:06:12PM +0800, Yan Zhao wrote:
> On Tue, Jan 04, 2022 at 05:10:08PM +0800, Chao Peng wrote:
> > On Tue, Jan 04, 2022 at 09:46:35AM +0800, Yan Zhao wrote:
> > > On Thu, Dec 23, 2021 at 08:30:09PM +0800, Chao Peng wrote:
> > > > When a page fault from the secondary page table while the guest is
> > > > running happens in a memslot with KVM_MEM_PRIVATE, we need go
> > > > different paths for private access and shared access.
> > > > 
> > > >   - For private access, KVM checks if the page is already allocated in
> > > >     the memory backend, if yes KVM establishes the mapping, otherwise
> > > >     exits to userspace to convert a shared page to private one.
> > > >
> > > will this conversion be atomical or not?
> > > For example, after punching a hole in a private memory slot, will KVM
> > > see two notifications: one for invalidation of the whole private memory
> > > slot, and one for fallocate of the rest ranges besides the hole?
> > > Or, KVM only sees one invalidation notification for the hole?
> > 
> > Punching hole doesn't need to invalidate the whole memory slot. It only
> > send one invalidation notification to KVM for the 'hole' part.
> good :)
> 
> > 
> > Taking shared-to-private conversion as example it only invalidates the
> > 'hole' part (that usually only the portion of the whole memory) on the
> > shared fd,, and then fallocate the private memory in the private fd at
> > the 'hole'. The KVM invalidation notification happens when the shared
> > hole gets invalidated. The establishment of the private mapping happens
> > at subsequent KVM page fault handlers.
> > 
> > > Could you please show QEMU code about this conversion?
> > 
> > See below for the QEMU side conversion code. The above described
> > invalidation and fallocation will be two steps in this conversion. If
> > error happens in the middle then this error will be propagated to
> > kvm_run to do the proper action (e.g. may kill the guest?).
> > 
> > int ram_block_convert_range(RAMBlock *rb, uint64_t start, size_t length,
> >                             bool shared_to_private)
> > {
> >     int ret; 
> >     int fd_from, fd_to;
> > 
> >     if (!rb || rb->private_fd <= 0) { 
> >         return -1;
> >     }    
> > 
> >     if (!QEMU_PTR_IS_ALIGNED(start, rb->page_size) ||
> >         !QEMU_PTR_IS_ALIGNED(length, rb->page_size)) {
> >         return -1;
> >     }    
> > 
> >     if (length > rb->max_length) {
> >         return -1;
> >     }    
> > 
> >     if (shared_to_private) {
> >         fd_from = rb->fd;
> >         fd_to = rb->private_fd;
> >     } else {
> >         fd_from = rb->private_fd;
> >         fd_to = rb->fd;
> >     }    
> > 
> >     ret = ram_block_discard_range_fd(rb, start, length, fd_from);
> >     if (ret) {
> >         return ret; 
> >     }    
> > 
> >     if (fd_to > 0) { 
> >         return fallocate(fd_to, 0, start, length);
> >     }    
> > 
> >     return 0;
> > }
> > 
> Thanks. So QEMU will re-generate memslots and set KVM_MEM_PRIVATE
> accordingly? Will it involve slot deletion and create?

KVM will not re-generate memslots when do the conversion, instead, it
does unmap/map a range on the same memslot. For memslot with tag
KVM_MEM_PRIVATE, it always have two mappings (private/shared) but at a
time only one is effective. What conversion does is to turn off the
existing mapping and turn on the other mapping for specified range in
that slot.

> 
> > > 
> > > 
> > > >   - For shared access, KVM also checks if the page is already allocated
> > > >     in the memory backend, if yes then exit to userspace to convert a
> > > >     private page to shared one, otherwise it's treated as a traditional
> > > >     hva-based shared memory, KVM lets existing code to obtain a pfn with
> > > >     get_user_pages() and establish the mapping.
> > > > 
> > > > The above code assume private memory is persistent and pre-allocated in
> > > > the memory backend so KVM can use this information as an indicator for
> > > > a page is private or shared. The above check is then performed by
> > > > calling kvm_memfd_get_pfn() which currently is implemented as a
> > > > pagecache search but in theory that can be implemented differently
> > > > (i.e. when the page is even not mapped into host pagecache there should
> > > > be some different implementation).
> > > > 
> > > > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > > > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > > > ---
> > > >  arch/x86/kvm/mmu/mmu.c         | 73 ++++++++++++++++++++++++++++++++--
> > > >  arch/x86/kvm/mmu/paging_tmpl.h | 11 +++--
> > > >  2 files changed, 77 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index 2856eb662a21..fbcdf62f8281 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > @@ -2920,6 +2920,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
> > > >  	if (max_level == PG_LEVEL_4K)
> > > >  		return PG_LEVEL_4K;
> > > >  
> > > > +	if (kvm_slot_is_private(slot))
> > > > +		return max_level;
> > > > +
> > > >  	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
> > > >  	return min(host_level, max_level);
> > > >  }
> > > > @@ -3950,7 +3953,59 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> > > >  				  kvm_vcpu_gfn_to_hva(vcpu, gfn), &arch);
> > > >  }
> > > >  
> > > > -static bool kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault, int *r)
> > > > +static bool kvm_vcpu_is_private_gfn(struct kvm_vcpu *vcpu, gfn_t gfn)
> > > > +{
> > > > +	/*
> > > > +	 * At this time private gfn has not been supported yet. Other patch
> > > > +	 * that enables it should change this.
> > > > +	 */
> > > > +	return false;
> > > > +}
> > > > +
> > > > +static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > > > +				    struct kvm_page_fault *fault,
> > > > +				    bool *is_private_pfn, int *r)
> > > > +{
> > > > +	int order;
> > > > +	int mem_convert_type;
> > > > +	struct kvm_memory_slot *slot = fault->slot;
> > > > +	long pfn = kvm_memfd_get_pfn(slot, fault->gfn, &order);
> > > For private memory slots, it's possible to have pfns backed by
> > > backends other than memfd, e.g. devicefd.
> > 
> > Surely yes, although this patch only supports memfd, but it's designed
> > to be extensible to support other memory backing stores than memfd. There
> > is one assumption in this design however: one private memslot can be
> > backed by only one type of such memory backing store, e.g. if the
> > devicefd you mentioned can independently provide memory for a memslot
> > then that's no issue.
> > 
> > >So is it possible to let those
> > > private memslots keep private and use traditional hva-based way?
> > 
> > Typically this fd-based private memory uses the 'offset' as the
> > userspace address to get a pfn from the backing store fd. But I believe
> > the current code does not prevent you from using the hva as the
> By hva-based way, I mean mmap is required for this fd.
> 
> > userspace address, as long as your memory backing store understand that
> > address and can provide the pfn basing on it. But since you already have
> > the hva, you probably already mmap-ed the fd to userspace, that seems
> > not this private memory patch can protect you. Probably I didn't quite
> Yes, for this fd, though mapped in private memslot, there's no need to
> prevent QEMU/host from accessing it as it will not cause the severe machine
> check.
> 
> > understand 'keep private' you mentioned here.
> 'keep private' means allow this kind of private memslot which does not
> require protection from this private memory patch :)

Then I think such memory can be the shared part of memory of the
KVM_MEM_PRIVATE memslot. As said above, this is initially supported :)

Chao
> 
> 
> Thanks
> Yan
> > > Reasons below:
> > > 1. only memfd is supported in this patch set.
> > > 2. qemu/host read/write to those private memslots backing up by devicefd may
> > > not cause machine check.
> > > 

