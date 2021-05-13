Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D532537FA4D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:10:57 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCzI-0000F1-El
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lhCxE-0007uy-6B
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:08:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lhCxA-0005Vp-8I
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:08:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC94E613BF;
 Thu, 13 May 2021 15:08:39 +0000 (UTC)
Date: Thu, 13 May 2021 16:08:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v11 2/6] arm64: kvm: Introduce MTE VM feature
Message-ID: <20210513150835.GA6801@arm.com>
References: <20210416154309.22129-3-steven.price@arm.com>
 <20210428170705.GB4022@arm.com>
 <c3293d47-a5f2-ea4a-6730-f5cae26d8a7e@arm.com>
 <YJGHApOCXl811VK3@arm.com>
 <329286e8-a8f3-ea1a-1802-58813255a4a5@arm.com>
 <20210507182538.GF26528@arm.com> <20210510183506.GA10910@arm.com>
 <c891d4eb-b388-1658-8c8a-e76477062463@arm.com>
 <20210512174502.GC12391@arm.com>
 <7c1cb7c8-6ab4-62bd-fa17-2fb7be6d7f09@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c1cb7c8-6ab4-62bd-fa17-2fb7be6d7f09@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 11:57:39AM +0100, Steven Price wrote:
> On 12/05/2021 18:45, Catalin Marinas wrote:
> > On Wed, May 12, 2021 at 04:46:48PM +0100, Steven Price wrote:
> >>>>>> On Thu, Apr 29, 2021 at 05:06:41PM +0100, Steven Price wrote:
> >>>>>>> Given the changes to set_pte_at() which means that tags are restored from
> >>>>>>> swap even if !PROT_MTE, the only race I can see remaining is the creation of
> >>>>>>> new PROT_MTE mappings. As you mention an attempt to change mappings in the
> >>>>>>> VMM memory space should involve a mmu notifier call which I think serialises
> >>>>>>> this. So the remaining issue is doing this in a separate address space.
> >>>>>>>
> >>>>>>> So I guess the potential problem is:
> >>>>>>>
> >>>>>>>    * allocate memory MAP_SHARED but !PROT_MTE
> >>>>>>>    * fork()
> >>>>>>>    * VM causes a fault in parent address space
> >>>>>>>    * child does a mprotect(PROT_MTE)
> >>>>>>>
> >>>>>>> With the last two potentially racing. Sadly I can't see a good way of
> >>>>>>> handling that.
[...]
> >> 4. Sledgehammer locking in mte_sync_page_tags(), add a spinlock only for
> >> the MTE case where we have to sync tags (see below). What the actual
> >> performance impact of this is I've no idea. It could certainly be bad
> >> if there are a lot of pages with MTE enabled, which sadly is exactly
> >> the case if KVM is used with MTE :(
> >>
> >> --->8----
> >> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> >> index 0d320c060ebe..389ad40256f6 100644
> >> --- a/arch/arm64/kernel/mte.c
> >> +++ b/arch/arm64/kernel/mte.c
> >> @@ -25,23 +25,33 @@
> >>  u64 gcr_kernel_excl __ro_after_init;
> >>  static bool report_fault_once = true;
> >> +static spinlock_t tag_sync_lock;
> >>  static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap,
> >>  			       bool pte_is_tagged)
> >>  {
> >>  	pte_t old_pte = READ_ONCE(*ptep);
> >> +	if (!is_swap_pte(old_pte) && !pte_is_tagged)
> >> +		return;
> >> +
> >> +	spin_lock_irqsave(&tag_sync_lock, flags);
> >> +
> >> +	/* Recheck with the lock held */
> >> +	if (test_bit(PG_mte_tagged, &page->flags))
> >> +		goto out;
> > 
> > Can we skip the lock if the page already has the PG_mte_tagged set?
> > That's assuming that we set the flag only after clearing the tags. The
> > normal case where mprotect() is called on a page already mapped with
> > PROT_MTE would not be affected.
> 
> It was missing from the diff context (sorry, should have double checked
> that), but I was keeping the check in mte_sync_tags():
> 
>   void mte_sync_tags(pte_t *ptep, pte_t pte)
>   {
> 	struct page *page = pte_page(pte);
> 	long i, nr_pages = compound_nr(page);
> 	bool check_swap = nr_pages == 1;
> 	bool pte_is_tagged = pte_tagged(pte);
> 	unsigned long flags;
> 
> 	/* Early out if there's nothing to do */
> 	if (!check_swap && !pte_is_tagged)
> 		return;
> 
> 	/* if PG_mte_tagged is set, tags have already been initialised */
> 	for (i = 0; i < nr_pages; i++, page++) {
> 		if (!test_bit(PG_mte_tagged, &page->flags))
> 			mte_sync_page_tags(page, ptep, check_swap,
> 					   pte_is_tagged);
> 	}
>   }
> 
> So the hit is only taken if !PG_mte_tagged - hence the "recheck" comment
> in mte_sync_page_tags() once the lock is held. I guess if I'm going this
> route it would make sense to refactor this to be a bit clearer.

I think we can go with this for now but we should still raise it with
the mm folk, maybe they have a better idea on how to avoid the race in
the core code. There are other architectures affected, those that use
PG_arch_1.

As the kernel stands currently, we'd take the lock on any set_pte_at()
for a tagged page when first mapped. With Peter's patches to use DC
GZVA, the tag zeroing is done on allocation. Until those are merged, we
could do something similar in the arch code but without the DC GZVA
optimisation (useful if we need to cc this fix to stable):

----------8<--------------------------
From 9f445f794454cf139c0953391e6c30fa3f075dc1 Mon Sep 17 00:00:00 2001
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Thu, 13 May 2021 14:15:37 +0100
Subject: [PATCH] arm64: Handle MTE tags zeroing in
 __alloc_zeroed_user_highpage()

Currently, on an anonymous page fault, the kernel allocates a zeroed
page and maps it in user space. If the mapping is tagged (PROT_MTE),
set_pte_at() additionally clears the tags under a spinlock to avoid a
race on the page->flags. In order to optimise the lock, clear the page
tags on allocation in __alloc_zeroed_user_highpage() if the vma flags
have VM_MTE set.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/page.h |  6 ++++--
 arch/arm64/mm/fault.c         | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
index 012cffc574e8..97853570d0f1 100644
--- a/arch/arm64/include/asm/page.h
+++ b/arch/arm64/include/asm/page.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/personality.h> /* for READ_IMPLIES_EXEC */
+#include <linux/types.h>
 #include <asm/pgtable-types.h>
 
 struct page;
@@ -28,8 +29,9 @@ void copy_user_highpage(struct page *to, struct page *from,
 void copy_highpage(struct page *to, struct page *from);
 #define __HAVE_ARCH_COPY_HIGHPAGE
 
-#define __alloc_zeroed_user_highpage(movableflags, vma, vaddr) \
-	alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO | movableflags, vma, vaddr)
+struct page *__alloc_zeroed_user_highpage(gfp_t movableflags,
+					  struct vm_area_struct *vma,
+					  unsigned long vaddr);
 #define __HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE
 
 #define clear_user_page(page, vaddr, pg)	clear_page(page)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 871c82ab0a30..5a03428e97f3 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -921,3 +921,24 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned int esr,
 	debug_exception_exit(regs);
 }
 NOKPROBE_SYMBOL(do_debug_exception);
+
+/*
+ * Used during anonymous page fault handling.
+ */
+struct page *__alloc_zeroed_user_highpage(gfp_t movableflags,
+					  struct vm_area_struct *vma,
+					  unsigned long vaddr)
+{
+	struct page *page;
+	bool tagged = system_supports_mte() && (vma->vm_flags & VM_MTE);
+
+	page = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO | movableflags, vma,
+			      vaddr);
+	if (tagged && page) {
+		mte_clear_page_tags(page_address(page));
+		page_kasan_tag_reset(page);
+		set_bit(PG_mte_tagged, &page->flags);
+	}
+
+	return page;
+}


