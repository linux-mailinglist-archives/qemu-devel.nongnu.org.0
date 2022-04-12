Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCD4FE156
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:58:00 +0200 (CEST)
Received: from localhost ([::1]:34950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neG5n-0001KO-5i
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neG4V-0000Lt-VB
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:56:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:19187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neG4T-0002II-AJ
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649768197; x=1681304197;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=C6dk3/dvShTsf13TiSzcqE0mSsR+MyMx9FW9JNjPSEc=;
 b=essNIswIG9yjzI/mAIU0BFKfyefssjEBa3x/JBYAWYjDrt5gOKqB5gqj
 2Q/S0f/OQ5OolveoXcOXkGKsxXUq392JdAYPxQhP5yR28/AIXWvcBzHyY
 tCKQov4zDCE20Q2y1Ty3PAj75b400s1aUCKU0Pc0lrxo7OOnEzQnAzAsn
 Dz/RsQRYcQ5IQLIEDROiDjlX/EMAUJ7rnoSYtYDehWtI0jT/OUMU83fIX
 FEy961o9o5wFoNbcYTTrWK/dBOR/x0Y5tos9ZgYuijVO5WCDOAgiYfLWw
 hZPWaUqhNMwhKfcPv3Se2wyB4NOS2xAwDG+0xiGbtrSG5ahVUS/kjJtBp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262547301"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="262547301"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 05:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="699824982"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 05:56:28 -0700
Date: Tue, 12 Apr 2022 20:56:18 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 12/13] KVM: Expose KVM_MEM_PRIVATE
Message-ID: <20220412125618.GC8013@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-13-chao.p.peng@linux.intel.com>
 <YkNaPLVLk/pO0zjr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkNaPLVLk/pO0zjr@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Tue, Mar 29, 2022 at 07:13:00PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > KVM_MEM_PRIVATE is not exposed by default but architecture code can turn
> > on it by implementing kvm_arch_private_memory_supported().
> > 
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/linux/kvm_host.h |  1 +
> >  virt/kvm/kvm_main.c      | 24 +++++++++++++++++++-----
> >  2 files changed, 20 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 186b9b981a65..0150e952a131 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1432,6 +1432,7 @@ bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
> >  int kvm_arch_post_init_vm(struct kvm *kvm);
> >  void kvm_arch_pre_destroy_vm(struct kvm *kvm);
> >  int kvm_arch_create_vm_debugfs(struct kvm *kvm);
> > +bool kvm_arch_private_memory_supported(struct kvm *kvm);
> >  
> >  #ifndef __KVM_HAVE_ARCH_VM_ALLOC
> >  /*
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 52319f49d58a..df5311755a40 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -1485,10 +1485,19 @@ static void kvm_replace_memslot(struct kvm *kvm,
> >  	}
> >  }
> >  
> > -static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
> > +bool __weak kvm_arch_private_memory_supported(struct kvm *kvm)
> > +{
> > +	return false;
> > +}
> > +
> > +static int check_memory_region_flags(struct kvm *kvm,
> > +				const struct kvm_userspace_memory_region *mem)
> >  {
> >  	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> >  
> > +	if (kvm_arch_private_memory_supported(kvm))
> > +		valid_flags |= KVM_MEM_PRIVATE;
> > +
> >  #ifdef __KVM_HAVE_READONLY_MEM
> >  	valid_flags |= KVM_MEM_READONLY;
> >  #endif
> > @@ -1900,7 +1909,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >  	int as_id, id;
> >  	int r;
> >  
> > -	r = check_memory_region_flags(mem);
> > +	r = check_memory_region_flags(kvm, mem);
> >  	if (r)
> >  		return r;
> >  
> > @@ -1913,10 +1922,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >  		return -EINVAL;
> >  	if (mem->guest_phys_addr & (PAGE_SIZE - 1))
> >  		return -EINVAL;
> > -	/* We can read the guest memory with __xxx_user() later on. */
> >  	if ((mem->userspace_addr & (PAGE_SIZE - 1)) ||
> > -	    (mem->userspace_addr != untagged_addr(mem->userspace_addr)) ||
> > -	     !access_ok((void __user *)(unsigned long)mem->userspace_addr,
> > +	    (mem->userspace_addr != untagged_addr(mem->userspace_addr)))
> > +		return -EINVAL;
> > +	/* We can read the guest memory with __xxx_user() later on. */
> > +	if (!(mem->flags & KVM_MEM_PRIVATE) &&
> > +	    !access_ok((void __user *)(unsigned long)mem->userspace_addr,
> 
> This should sanity check private_offset for private memslots.  At a bare minimum,
> wrapping should be disallowed.

Will add this.

> 
> >  			mem->memory_size))
> >  		return -EINVAL;
> >  	if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
> > @@ -1957,6 +1968,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >  		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
> >  			return -EINVAL;
> >  	} else { /* Modify an existing slot. */
> > +		/* Private memslots are immutable, they can only be deleted. */
> > +		if (mem->flags & KVM_MEM_PRIVATE)
> > +			return -EINVAL;
> 
> These sanity checks belong in "KVM: Register private memslot to memory backing store",
> e.g. that patch is "broken" without the immutability restriction.  It's somewhat moot
> because the code is unreachable, but it makes reviewing confusing/difficult.
> 
> But rather than move the sanity checks back, I think I'd prefer to pull all of patch 10
> here.  I think it also makes sense to drop "KVM: Use memfile_pfn_ops to obtain pfn for
> private pages" and add the pointer in "struct kvm_memory_slot" in patch "KVM: Extend the
> memslot to support fd-based private memory", with the use of the ops folded into
> "KVM: Handle page fault for private memory".  Adding code to KVM and KVM-x86 in a single
> patch is ok, and overall makes things easier to review because the new helpers have a
> user right away, especially since there will be #ifdeffery.
> 
> I.e. end up with something like:
> 
>   mm: Introduce memfile_notifier
>   mm/shmem: Restrict MFD_INACCESSIBLE memory against RLIMIT_MEMLOCK
>   KVM: Extend the memslot to support fd-based private memory
>   KVM: Use kvm_userspace_memory_region_ext
>   KVM: Add KVM_EXIT_MEMORY_ERROR exit
>   KVM: Handle page fault for private memory
>   KVM: Register private memslot to memory backing store
>   KVM: Zap existing KVM mappings when pages changed in the private fd
>   KVM: Enable and expose KVM_MEM_PRIVATE

Thanks for the suggestion. That makes sense.

Chao
> 
> >  		if ((mem->userspace_addr != old->userspace_addr) ||
> >  		    (npages != old->npages) ||
> >  		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
> > -- 
> > 2.17.1
> > 

