Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028415783F5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:41:40 +0200 (CEST)
Received: from localhost ([::1]:43718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDR0F-0004q0-3K
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDQtl-0001IP-62
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:34:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:13080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDQti-0007UK-8m
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658151294; x=1689687294;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=rHFYZeCUhUEMCyj5v9zq3o/zGTENSXf+B8mm6YmDQ6A=;
 b=h4js6bEZ5qDzdhLsWx2BxDmz2d/Cuy5yQMXmtheYIyxwXudpsenPH1b2
 NruhhiHYbYlxnRkh7KIW/F+j1WAHD4gIN7u77c2TNmN+mumu7us6unhKd
 pg7AqiQnnGc84GwP5L4YKTtXnAoDOF4aJu2fw21zrxgQ1nS/CVDHjqSmF
 NGDyXHQrPeALtrPF4g1aB7CosaTpm0QIxhA2S/RwWvSN3vKXL7rbTZuIF
 GRyU7grc5AnoxYnRqZpLwOtdeiKNAfLPKoCu9P3at9TcFkY5s5/nXPLYi
 Rs34PBQEe7+VJF/FLKlMaEb9io+nBRoLsSItECNRiAw8bfI6Y1BEVZ1YD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="266624660"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="266624660"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="624730241"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 18 Jul 2022 06:34:40 -0700
Date: Mon, 18 Jul 2022 21:29:50 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 07/14] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <20220718132950.GA38104@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-8-chao.p.peng@linux.intel.com>
 <d480a850-601b-cda2-b671-04d839c98429@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d480a850-601b-cda2-b671-04d839c98429@amd.com>
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

On Fri, Jul 15, 2022 at 01:36:15PM +0200, Gupta, Pankaj wrote:
> > Currently in mmu_notifier validate path, hva range is recorded and then
> > checked in the mmu_notifier_retry_hva() from page fault path. However
> > for the to be introduced private memory, a page fault may not have a hva
> 
> As this patch appeared in v7, just wondering did you see an actual bug
> because of it? And not having corresponding 'hva' occurs only with private
> memory because its not mapped to host userspace?

The addressed problem is not new in this version, previous versions I
also had code to handle it (just in different way). But the problem is:
mmu_notifier/memfile_notifier may be in the progress of invalidating a
pfn that obtained earlier in the page fault handler, when happens, we
should retry the fault. In v6 I used global mmu_notifier_retry() for
memfile_notifier but that can block unrelated mmu_notifer invalidation
which has hva range specified.

Sean gave a comment at https://lkml.org/lkml/2022/6/17/1001 to separate
memfile_notifier from mmu_notifier but during the implementation I
realized we actually can reuse the same code for shared and private
memory if both using gpa range and that can simplify the code handling
in kvm_zap_gfn_range and some other code (e.g. we don't need two
versions for memfile_notifier/mmu_notifier).

Adding gpa range for private memory invalidation also relieves the
above blocking issue between private memory page fault and mmu_notifier.

Chao
> 
> Thanks,
> Pankaj
> 
> > associated, checking gfn(gpa) makes more sense. For existing non private
> > memory case, gfn is expected to continue to work.
> > 
> > The patch also fixes a potential bug in kvm_zap_gfn_range() which has
> > already been using gfn when calling kvm_inc/dec_notifier_count() in
> > current code.
> > 
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c   |  2 +-
> >   include/linux/kvm_host.h | 18 ++++++++----------
> >   virt/kvm/kvm_main.c      |  6 +++---
> >   3 files changed, 12 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index f7fa4c31b7c5..0d882fad4bc1 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4182,7 +4182,7 @@ static bool is_page_fault_stale(struct kvm_vcpu *vcpu,
> >   		return true;
> >   	return fault->slot &&
> > -	       mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, fault->hva);
> > +	       mmu_notifier_retry_gfn(vcpu->kvm, mmu_seq, fault->gfn);
> >   }
> >   static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 0bdb6044e316..e9153b54e2a4 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -767,8 +767,8 @@ struct kvm {
> >   	struct mmu_notifier mmu_notifier;
> >   	unsigned long mmu_notifier_seq;
> >   	long mmu_notifier_count;
> > -	unsigned long mmu_notifier_range_start;
> > -	unsigned long mmu_notifier_range_end;
> > +	gfn_t mmu_notifier_range_start;
> > +	gfn_t mmu_notifier_range_end;
> >   #endif
> >   	struct list_head devices;
> >   	u64 manual_dirty_log_protect;
> > @@ -1362,10 +1362,8 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
> >   void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
> >   #endif
> > -void kvm_inc_notifier_count(struct kvm *kvm, unsigned long start,
> > -				   unsigned long end);
> > -void kvm_dec_notifier_count(struct kvm *kvm, unsigned long start,
> > -				   unsigned long end);
> > +void kvm_inc_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end);
> > +void kvm_dec_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end);
> >   long kvm_arch_dev_ioctl(struct file *filp,
> >   			unsigned int ioctl, unsigned long arg);
> > @@ -1923,9 +1921,9 @@ static inline int mmu_notifier_retry(struct kvm *kvm, unsigned long mmu_seq)
> >   	return 0;
> >   }
> > -static inline int mmu_notifier_retry_hva(struct kvm *kvm,
> > +static inline int mmu_notifier_retry_gfn(struct kvm *kvm,
> >   					 unsigned long mmu_seq,
> > -					 unsigned long hva)
> > +					 gfn_t gfn)
> >   {
> >   	lockdep_assert_held(&kvm->mmu_lock);
> >   	/*
> > @@ -1935,8 +1933,8 @@ static inline int mmu_notifier_retry_hva(struct kvm *kvm,
> >   	 * positives, due to shortcuts when handing concurrent invalidations.
> >   	 */
> >   	if (unlikely(kvm->mmu_notifier_count) &&
> > -	    hva >= kvm->mmu_notifier_range_start &&
> > -	    hva < kvm->mmu_notifier_range_end)
> > +	    gfn >= kvm->mmu_notifier_range_start &&
> > +	    gfn < kvm->mmu_notifier_range_end)
> >   		return 1;
> >   	if (kvm->mmu_notifier_seq != mmu_seq)
> >   		return 1;
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index da263c370d00..4d7f0e72366f 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -536,8 +536,7 @@ static void kvm_mmu_notifier_invalidate_range(struct mmu_notifier *mn,
> >   typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
> > -typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
> > -			     unsigned long end);
> > +typedef void (*on_lock_fn_t)(struct kvm *kvm, gfn_t start, gfn_t end);
> >   typedef void (*on_unlock_fn_t)(struct kvm *kvm);
> > @@ -624,7 +623,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
> >   				locked = true;
> >   				KVM_MMU_LOCK(kvm);
> >   				if (!IS_KVM_NULL_FN(range->on_lock))
> > -					range->on_lock(kvm, range->start, range->end);
> > +					range->on_lock(kvm, gfn_range.start,
> > +							    gfn_range.end);
> >   				if (IS_KVM_NULL_FN(range->handler))
> >   					break;
> >   			}

