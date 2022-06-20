Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA7551D85
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:18:49 +0200 (CEST)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IEq-00017k-SQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o3I8Y-0003V5-V5
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:12:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:5933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o3I8W-0007r2-1y
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655734336; x=1687270336;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=K/d62gPSVg4NmMutWFje50dPhFVYB3cepmG67K0wcUc=;
 b=D3f3lhcOhbdiY1OPuWYNtACj13OsjIvHkrWzGCWt76iKJaGkMcM8/rPk
 gcq8Mh4oQzf0vycGrOo4NvcYn5PTsNX3IvQmKKmwJYb/kJT7vwvFVD4nW
 fEPXTsuFpEbhkDc6T1ZRqwJPLVPhU2wRaz++jB7w7B2LFIqzj44abfsnj
 HzpJ80+8mSwI4RQwfarEBfBPI0kaE7CkUuKI85cuNrD45Lp4fZMMk0Xxf
 Wta0+jz7lpflbCv2vljgh6kVznjxKbm9rRDLmmCH0abR3q8rqc9Fu1SEW
 zZn4xx4X3VzGu9H6s3Qu502fySi7LnXEAGG1vS16uLQb7fPJT+Av5CKVA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="343897072"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="343897072"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 07:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="584911886"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 20 Jun 2022 07:12:02 -0700
Date: Mon, 20 Jun 2022 22:08:41 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220620140841.GA2016793@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <Yqzpf3AEYabFWjnW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqzpf3AEYabFWjnW@google.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
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

On Fri, Jun 17, 2022 at 08:52:15PM +0000, Sean Christopherson wrote:
> On Thu, May 19, 2022, Chao Peng wrote:
> > @@ -653,12 +662,12 @@ struct kvm_irq_routing_table {
> >  };
> >  #endif
> >  
> > -#ifndef KVM_PRIVATE_MEM_SLOTS
> > -#define KVM_PRIVATE_MEM_SLOTS 0
> > +#ifndef KVM_INTERNAL_MEM_SLOTS
> > +#define KVM_INTERNAL_MEM_SLOTS 0
> >  #endif
> 
> This rename belongs in a separate patch.

Will separate it out, thanks.

> 
> >  #define KVM_MEM_SLOTS_NUM SHRT_MAX
> > -#define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_PRIVATE_MEM_SLOTS)
> > +#define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
> >  
> >  #ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> >  static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
> > @@ -1087,9 +1096,9 @@ enum kvm_mr_change {
> >  };
> >  
> >  int kvm_set_memory_region(struct kvm *kvm,
> > -			  const struct kvm_userspace_memory_region *mem);
> > +			  const struct kvm_user_mem_region *mem);
> >  int __kvm_set_memory_region(struct kvm *kvm,
> > -			    const struct kvm_userspace_memory_region *mem);
> > +			    const struct kvm_user_mem_region *mem);
> >  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
> >  void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
> >  int kvm_arch_prepare_memory_region(struct kvm *kvm,
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index e10d131edd80..28cacd3656d4 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -103,6 +103,29 @@ struct kvm_userspace_memory_region {
> >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> >  };
> >  
> > +struct kvm_userspace_memory_region_ext {
> > +	struct kvm_userspace_memory_region region;
> > +	__u64 private_offset;
> > +	__u32 private_fd;
> > +	__u32 pad1;
> > +	__u64 pad2[14];
> > +};
> > +
> > +#ifdef __KERNEL__
> > +/* Internal helper, the layout must match above user visible structures */
> 
> It's worth explicity calling out which structureso this aliases.  And rather than
> add a comment about the layout needing to match that, enforce it in code. I
> personally wouldn't bother with an expolicit comment about the layout, IMO that's
> a fairly obvious implication of aliasing.
> 
> /*
>  * kvm_user_mem_region is a kernel-only alias of kvm_userspace_memory_region_ext
>  * that "unpacks" kvm_userspace_memory_region so that KVM can directly access
>  * all fields from the top-level "extended" region.
>  */
> 

Thanks.

> 
> And I think it's in this patch that you missed a conversion to the alias, in the
> prototype for check_memory_region_flags() (looks like it gets fixed up later in
> the series).
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 0f81bf0407be..8765b334477d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1466,7 +1466,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
>         }
>  }
> 
> -static int check_memory_region_flags(const struct kvm_userspace_memory_region *mem)
> +static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
>  {
>         u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> 
> @@ -4514,6 +4514,33 @@ static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
>         return fd;
>  }
> 
> +#define SANITY_CHECK_MEM_REGION_FIELD(field)                                   \
> +do {                                                                           \
> +       BUILD_BUG_ON(offsetof(struct kvm_user_mem_region, field) !=             \
> +                    offsetof(struct kvm_userspace_memory_region, field));      \
> +       BUILD_BUG_ON(sizeof_field(struct kvm_user_mem_region, field) !=         \
> +                    sizeof_field(struct kvm_userspace_memory_region, field));  \
> +} while (0)
> +
> +#define SANITY_CHECK_MEM_REGION_EXT_FIELD(field)                                       \
> +do {                                                                                   \
> +       BUILD_BUG_ON(offsetof(struct kvm_user_mem_region, field) !=                     \
> +                    offsetof(struct kvm_userspace_memory_region_ext, field));          \
> +       BUILD_BUG_ON(sizeof_field(struct kvm_user_mem_region, field) !=                 \
> +                    sizeof_field(struct kvm_userspace_memory_region_ext, field));      \
> +} while (0)
> +
> +static void kvm_sanity_check_user_mem_region_alias(void)
> +{
> +       SANITY_CHECK_MEM_REGION_FIELD(slot);
> +       SANITY_CHECK_MEM_REGION_FIELD(flags);
> +       SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
> +       SANITY_CHECK_MEM_REGION_FIELD(memory_size);
> +       SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
> +       SANITY_CHECK_MEM_REGION_EXT_FIELD(private_offset);
> +       SANITY_CHECK_MEM_REGION_EXT_FIELD(private_fd);
> +}
> +
>  static long kvm_vm_ioctl(struct file *filp,
>                            unsigned int ioctl, unsigned long arg)
>  {
> @@ -4541,6 +4568,8 @@ static long kvm_vm_ioctl(struct file *filp,
>                 unsigned long size;
>                 u32 flags;
> 
> +               kvm_sanity_check_user_mem_region_alias();
> +
>                 memset(&mem, 0, sizeof(mem));
> 
>                 r = -EFAULT;
> 
> > +struct kvm_user_mem_region {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size;
> > +	__u64 userspace_addr;
> > +	__u64 private_offset;
> > +	__u32 private_fd;
> > +	__u32 pad1;
> > +	__u64 pad2[14];
> > +};
> > +#endif
> > +
> >  /*
> >   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
> >   * other bits are reserved for kvm internal use which are defined in
> > @@ -110,6 +133,7 @@ struct kvm_userspace_memory_region {
> >   */
> >  #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
> >  #define KVM_MEM_READONLY	(1UL << 1)
> > +#define KVM_MEM_PRIVATE		(1UL << 2)
> 
> Hmm, KVM_MEM_PRIVATE is technically wrong now that a "private" memslot maps private
> and/or shared memory.  Strictly speaking, we don't actually need a new flag.  Valid
> file descriptors must be >=0, so the logic for specifying a memslot that can be
> converted between private and shared could be that "(int)private_fd < 0" means
> "not convertible", i.e. derive the flag from private_fd.

I think a flag is still needed, the problem is private_fd can be safely
accessed only when this flag is set, e.g. without this flag, we can't
copy_from_user these new fields since they don't exist for previous
kvm_userspace_memory_region callers.

> 
> And looking at the two KVM consumers of the flag, via kvm_slot_is_private(), they're
> both wrong.  Both kvm_faultin_pfn() and kvm_mmu_max_mapping_level() should operate
> on the _fault_, not the slot.  So it would actually be a positive to not have an easy
> way to query if a slot supports conversion.
> 
> >  /* for KVM_IRQ_LINE */
> >  struct kvm_irq_level {
> 
> ...
> 
> > +		if (flags & KVM_MEM_PRIVATE) {
> 
> An added bonus of dropping KVM_MEM_PRIVATE is that these checks go away.
> 
> > +			r = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		size = sizeof(struct kvm_userspace_memory_region);
> > +
> > +		if (copy_from_user(&mem, argp, size))
> > +			goto out;
> > +
> > +		r = -EINVAL;
> > +		if ((flags ^ mem.flags) & KVM_MEM_PRIVATE)
> >  			goto out;
> >  
> > -		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> > +		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
> >  		break;
> >  	}
> >  	case KVM_GET_DIRTY_LOG: {
> > -- 
> > 2.25.1
> > 

