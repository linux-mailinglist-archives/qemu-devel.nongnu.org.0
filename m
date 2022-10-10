Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452385F9B3B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:43:02 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohoNI-0003vT-CR
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ohoIW-0007Si-5X
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:38:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:20776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ohoIQ-0003g6-8B
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665391078; x=1696927078;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=/vuv9C+O7yyfz0UZadWdOspuDVGHXflFppFtBTStze0=;
 b=jFvFO9WpRsYGtbjLxOmZ9K+Zo6Eay2gUenEXlHbJYixA6rsKpnjUYhSD
 41UZCULFVUNEyEi/NXL2135kVosB7ZUd+mcFi3FAH9VWbWV8+dea6rfy2
 iMc7ytmsC3/LtLYTiKdpkzLsrLuBqKLTjg4FdFX6Xq6kV1glsX2YHUM/n
 rYYs82ICml4I976JHqVO75Zmn6Dbsufj7d00nk4D0P5aThm7c0kI49uj4
 HiKApuoH/3/eX6rUJVpMhDaarSomp4h6vdx9gyVi0ezZBma/bp/aSXZ6i
 2zBpK12n6AQ4Y+N7ZnROhrY5cGybD/hmg0PQ8Lio6qejXF8qt7+oMfLD6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390481358"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390481358"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 01:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="656855059"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="656855059"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 10 Oct 2022 01:37:46 -0700
Date: Mon, 10 Oct 2022 16:33:13 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 8/8] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20221010083313.GB3145236@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-9-chao.p.peng@linux.intel.com>
 <CA+EHjTwXPrHYb2us7+vrdS9jwYXv3j5UniG0bpb6dKgV77A=8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwXPrHYb2us7+vrdS9jwYXv3j5UniG0bpb6dKgV77A=8A@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 09:55:31AM +0100, Fuad Tabba wrote:
> Hi,
> 
> On Thu, Sep 15, 2022 at 3:37 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > Expose KVM_MEM_PRIVATE and memslot fields private_fd/offset to
> > userspace. KVM will register/unregister private memslot to fd-based
> > memory backing store and response to invalidation event from
> > inaccessible_notifier to zap the existing memory mappings in the
> > secondary page table.
> >
> > Whether KVM_MEM_PRIVATE is actually exposed to userspace is determined
> > by architecture code which can turn on it by overriding the default
> > kvm_arch_has_private_mem().
> >
> > A 'kvm' reference is added in memslot structure since in
> > inaccessible_notifier callback we can only obtain a memslot reference
> > but 'kvm' is needed to do the zapping.
> >
> > Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/linux/kvm_host.h |   1 +
> >  virt/kvm/kvm_main.c      | 116 +++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 111 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index b9906cdf468b..cb4eefac709c 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -589,6 +589,7 @@ struct kvm_memory_slot {
> >         struct file *private_file;
> >         loff_t private_offset;
> >         struct inaccessible_notifier notifier;
> > +       struct kvm *kvm;
> >  };
> >
> >  static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 97d893f7482c..87e239d35b96 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -983,6 +983,57 @@ static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
> >                 xa_erase(&kvm->mem_attr_array, index);
> >         return r;
> >  }
> > +
> > +static void kvm_private_notifier_invalidate(struct inaccessible_notifier *notifier,
> > +                                           pgoff_t start, pgoff_t end)
> > +{
> > +       struct kvm_memory_slot *slot = container_of(notifier,
> > +                                                   struct kvm_memory_slot,
> > +                                                   notifier);
> > +       unsigned long base_pgoff = slot->private_offset >> PAGE_SHIFT;
> > +       gfn_t start_gfn = slot->base_gfn;
> > +       gfn_t end_gfn = slot->base_gfn + slot->npages;
> > +
> > +
> > +       if (start > base_pgoff)
> > +               start_gfn = slot->base_gfn + start - base_pgoff;
> > +
> > +       if (end < base_pgoff + slot->npages)
> > +               end_gfn = slot->base_gfn + end - base_pgoff;
> > +
> > +       if (start_gfn >= end_gfn)
> > +               return;
> > +
> > +       kvm_zap_gfn_range(slot->kvm, start_gfn, end_gfn);
> > +}
> > +
> > +static struct inaccessible_notifier_ops kvm_private_notifier_ops = {
> > +       .invalidate = kvm_private_notifier_invalidate,
> > +};
> > +
> > +static inline void kvm_private_mem_register(struct kvm_memory_slot *slot)
> > +{
> > +       slot->notifier.ops = &kvm_private_notifier_ops;
> > +       inaccessible_register_notifier(slot->private_file, &slot->notifier);
> > +}
> > +
> > +static inline void kvm_private_mem_unregister(struct kvm_memory_slot *slot)
> > +{
> > +       inaccessible_unregister_notifier(slot->private_file, &slot->notifier);
> > +}
> > +
> > +#else /* !CONFIG_HAVE_KVM_PRIVATE_MEM */
> > +
> > +static inline void kvm_private_mem_register(struct kvm_memory_slot *slot)
> > +{
> > +       WARN_ON_ONCE(1);
> > +}
> > +
> > +static inline void kvm_private_mem_unregister(struct kvm_memory_slot *slot)
> > +{
> > +       WARN_ON_ONCE(1);
> > +}
> > +
> >  #endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
> >
> >  #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
> > @@ -1029,6 +1080,11 @@ static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
> >  /* This does not remove the slot from struct kvm_memslots data structures */
> >  static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
> >  {
> > +       if (slot->flags & KVM_MEM_PRIVATE) {
> > +               kvm_private_mem_unregister(slot);
> > +               fput(slot->private_file);
> > +       }
> > +
> >         kvm_destroy_dirty_bitmap(slot);
> >
> >         kvm_arch_free_memslot(kvm, slot);
> > @@ -1600,10 +1656,16 @@ bool __weak kvm_arch_has_private_mem(struct kvm *kvm)
> >         return false;
> >  }
> >
> > -static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
> > +static int check_memory_region_flags(struct kvm *kvm,
> > +                                    const struct kvm_user_mem_region *mem)
> >  {
> >         u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> >
> > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > +       if (kvm_arch_has_private_mem(kvm))
> > +               valid_flags |= KVM_MEM_PRIVATE;
> > +#endif
> > +
> >  #ifdef __KVM_HAVE_READONLY_MEM
> >         valid_flags |= KVM_MEM_READONLY;
> >  #endif
> > @@ -1679,6 +1741,9 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
> >  {
> >         int r;
> >
> > +       if (change == KVM_MR_CREATE && new->flags & KVM_MEM_PRIVATE)
> > +               kvm_private_mem_register(new);
> > +
> 
> >From the discussion I had with Kirill in the first patch *, should
> this check that the private_fd is inaccessible?

Yes I can add a check in KVM code, see below for where I want to add it.

> 
> [*] https://lore.kernel.org/all/20221003110129.bbee7kawhw5ed745@box.shutemov.name/
> 
> Cheers,
> /fuad
> 
> >         /*
> >          * If dirty logging is disabled, nullify the bitmap; the old bitmap
> >          * will be freed on "commit".  If logging is enabled in both old and
> > @@ -1707,6 +1772,9 @@ static int kvm_prepare_memory_region(struct kvm *kvm,
> >         if (r && new && new->dirty_bitmap && (!old || !old->dirty_bitmap))
> >                 kvm_destroy_dirty_bitmap(new);
> >
> > +       if (r && change == KVM_MR_CREATE && new->flags & KVM_MEM_PRIVATE)
> > +               kvm_private_mem_unregister(new);
> > +
> >         return r;
> >  }
> >
> > @@ -2004,7 +2072,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >         int as_id, id;
> >         int r;
> >
> > -       r = check_memory_region_flags(mem);
> > +       r = check_memory_region_flags(kvm, mem);
> >         if (r)
> >                 return r;
> >
> > @@ -2023,6 +2091,10 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >              !access_ok((void __user *)(unsigned long)mem->userspace_addr,
> >                         mem->memory_size))
> >                 return -EINVAL;
> > +       if (mem->flags & KVM_MEM_PRIVATE &&
> > +               (mem->private_offset & (PAGE_SIZE - 1) ||
> > +                mem->private_offset > U64_MAX - mem->memory_size))
> > +               return -EINVAL;
> >         if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
> >                 return -EINVAL;
> >         if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
> > @@ -2061,6 +2133,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >                 if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
> >                         return -EINVAL;
> >         } else { /* Modify an existing slot. */
> > +               /* Private memslots are immutable, they can only be deleted. */
> > +               if (mem->flags & KVM_MEM_PRIVATE)
> > +                       return -EINVAL;
> >                 if ((mem->userspace_addr != old->userspace_addr) ||
> >                     (npages != old->npages) ||
> >                     ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
> > @@ -2089,10 +2164,27 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >         new->npages = npages;
> >         new->flags = mem->flags;
> >         new->userspace_addr = mem->userspace_addr;
> > +       if (mem->flags & KVM_MEM_PRIVATE) {
> > +               new->private_file = fget(mem->private_fd);
> > +               if (!new->private_file) {
> > +                       r = -EINVAL;

The check will go here.

> > +                       goto out;
> > +               }
> > +               new->private_offset = mem->private_offset;
> > +       }
> > +
> > +       new->kvm = kvm;
> >
> >         r = kvm_set_memslot(kvm, old, new, change);
> >         if (r)
> > -               kfree(new);
> > +               goto out;
> > +
> > +       return 0;
> > +
> > +out:
> > +       if (new->private_file)
> > +               fput(new->private_file);
> > +       kfree(new);
> >         return r;
> >  }
> >  EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
> > @@ -4747,16 +4839,28 @@ static long kvm_vm_ioctl(struct file *filp,
> >         }
> >         case KVM_SET_USER_MEMORY_REGION: {
> >                 struct kvm_user_mem_region mem;
> > -               unsigned long size = sizeof(struct kvm_userspace_memory_region);
> > +               unsigned int flags_offset = offsetof(typeof(mem), flags);
> > +               unsigned long size;
> > +               u32 flags;
> >
> >                 kvm_sanity_check_user_mem_region_alias();
> >
> > +               memset(&mem, 0, sizeof(mem));
> > +
> >                 r = -EFAULT;
> > -               if (copy_from_user(&mem, argp, size);
> > +               if (get_user(flags, (u32 __user *)(argp + flags_offset)))
> > +                       goto out;
> > +
> > +               if (flags & KVM_MEM_PRIVATE)
> > +                       size = sizeof(struct kvm_userspace_memory_region_ext);
> > +               else
> > +                       size = sizeof(struct kvm_userspace_memory_region);
> > +
> > +               if (copy_from_user(&mem, argp, size))
> >                         goto out;
> >
> >                 r = -EINVAL;
> > -               if (mem.flags & KVM_MEM_PRIVATE)
> > +               if ((flags ^ mem.flags) & KVM_MEM_PRIVATE)
> >                         goto out;
> >
> >                 r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
> > --
> > 2.25.1
> >

