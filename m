Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E9507F89
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 05:18:37 +0200 (CEST)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh0rU-0004Qf-66
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 23:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nh0qc-0003ks-CH
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 23:17:42 -0400
Received: from mga06b.intel.com ([134.134.136.31]:33112 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nh0qa-0007MR-18
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 23:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650424660; x=1681960660;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=aSlmWYo67979bXI+8rgE6ppMUFAAUoPR5mX4oC2meD8=;
 b=myqdJ0+ljYSkhoB3xSU8KwnrpLghkGNn6M6AWeAP0Vv1N4Wjd0mLc6iZ
 T7ApY5JuMRbPefKioPrVGC60/aUHOh686AWUCkd1Yot6yTrWyHCT9WqHu
 7RvbSjDl1vWJCIL66qduynIuug/rCSxJhsrTAj8sCWfbfdiUFSZYBgAJ0
 QauhctPtjTDeDx4XuEpbtYhy+G9lJ+aZRuwa6cS1adyCYHHKnUY1kcn3o
 uMfOx/OzY81Uq590tENhL2DfoXXiQALGp5rZHZr98TSqgZq3hTd9rEGIg
 syHi3V+kPA83UHiXVWfOUMGnEMkYJisxT0tRJCogtcSN8MNNy4EWwuMbB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="324368132"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="324368132"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 20:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="667588846"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga004.jf.intel.com with ESMTP; 19 Apr 2022 20:17:27 -0700
Date: Wed, 20 Apr 2022 11:17:18 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v5 11/13] KVM: Zap existing KVM mappings when pages
 changed in the private fd
Message-ID: <20220420031718.GA39591@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-12-chao.p.peng@linux.intel.com>
 <CAGtprH-qTB2sehidF7xkSvR3X4D5cUOLpMBXf4mhTEh0BUR-mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH-qTB2sehidF7xkSvR3X4D5cUOLpMBXf4mhTEh0BUR-mQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga06.intel.com
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
Cc: Wanpeng Li <wanpengli@tencent.com>, Jun Nakajima <jun.nakajima@intel.com>,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 03:43:56PM -0700, Vishal Annapurve wrote:
> On Thu, Mar 10, 2022 at 6:11 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > KVM gets notified when memory pages changed in the memory backing store.
> > When userspace allocates the memory with fallocate() or frees memory
> > with fallocate(FALLOC_FL_PUNCH_HOLE), memory backing store calls into
> > KVM fallocate/invalidate callbacks respectively. To ensure KVM never
> > maps both the private and shared variants of a GPA into the guest, in
> > the fallocate callback, we should zap the existing shared mapping and
> > in the invalidate callback we should zap the existing private mapping.
> >
> > In the callbacks, KVM firstly converts the offset range into the
> > gfn_range and then calls existing kvm_unmap_gfn_range() which will zap
> > the shared or private mapping. Both callbacks pass in a memslot
> > reference but we need 'kvm' so add a reference in memslot structure.
> >
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  include/linux/kvm_host.h |  3 ++-
> >  virt/kvm/kvm_main.c      | 36 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 9b175aeca63f..186b9b981a65 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -236,7 +236,7 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> >  int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
> >  #endif
> >
> > -#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> > +#if defined(KVM_ARCH_WANT_MMU_NOTIFIER) || defined(CONFIG_MEMFILE_NOTIFIER)
> >  struct kvm_gfn_range {
> >         struct kvm_memory_slot *slot;
> >         gfn_t start;
> > @@ -568,6 +568,7 @@ struct kvm_memory_slot {
> >         loff_t private_offset;
> >         struct memfile_pfn_ops *pfn_ops;
> >         struct memfile_notifier notifier;
> > +       struct kvm *kvm;
> >  };
> >
> >  static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 67349421eae3..52319f49d58a 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -841,8 +841,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
> >  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
> >
> >  #ifdef CONFIG_MEMFILE_NOTIFIER
> > +static void kvm_memfile_notifier_handler(struct memfile_notifier *notifier,
> > +                                        pgoff_t start, pgoff_t end)
> > +{
> > +       int idx;
> > +       struct kvm_memory_slot *slot = container_of(notifier,
> > +                                                   struct kvm_memory_slot,
> > +                                                   notifier);
> > +       struct kvm_gfn_range gfn_range = {
> > +               .slot           = slot,
> > +               .start          = start - (slot->private_offset >> PAGE_SHIFT),
> > +               .end            = end - (slot->private_offset >> PAGE_SHIFT),
> > +               .may_block      = true,
> > +       };
> > +       struct kvm *kvm = slot->kvm;
> > +
> > +       gfn_range.start = max(gfn_range.start, slot->base_gfn);
> 
> gfn_range.start seems to be page offset within the file. Should this rather be:
> gfn_range.start = slot->base_gfn + min(gfn_range.start, slot->npages);

Right. For start we don't really need care about the uppper bound
here (will check below), so this should be enough:
	gfn_range.start = slot->base_gfn + gfn_range.start;

> 
> > +       gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> > +
> 
> Similar to previous comment, should this rather be:
> gfn_range.end = slot->base_gfn + min(gfn_range.end, slot->npages);

This is correct.

Thanks,
Chao
> 
> > +       if (gfn_range.start >= gfn_range.end)
> > +               return;
> > +
> > +       idx = srcu_read_lock(&kvm->srcu);
> > +       KVM_MMU_LOCK(kvm);
> > +       kvm_unmap_gfn_range(kvm, &gfn_range);
> > +       kvm_flush_remote_tlbs(kvm);
> > +       KVM_MMU_UNLOCK(kvm);
> > +       srcu_read_unlock(&kvm->srcu, idx);
> > +}
> > +
> > +static struct memfile_notifier_ops kvm_memfile_notifier_ops = {
> > +       .invalidate = kvm_memfile_notifier_handler,
> > +       .fallocate = kvm_memfile_notifier_handler,
> > +};
> > +
> >  static inline int kvm_memfile_register(struct kvm_memory_slot *slot)
> >  {
> > +       slot->notifier.ops = &kvm_memfile_notifier_ops;
> >         return memfile_register_notifier(file_inode(slot->private_file),
> >                                          &slot->notifier,
> >                                          &slot->pfn_ops);
> > @@ -1963,6 +1998,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >         new->private_file = file;
> >         new->private_offset = mem->flags & KVM_MEM_PRIVATE ?
> >                               region_ext->private_offset : 0;
> > +       new->kvm = kvm;
> >
> >         r = kvm_set_memslot(kvm, old, new, change);
> >         if (!r)
> > --
> > 2.17.1
> >

