Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132262B97C7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:26:19 +0100 (CET)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmlG-0007cf-44
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kfmjN-0006uU-Ff
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:24:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:52378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kfmjK-0000GT-Aj
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:24:20 -0500
Received: from gaia (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FA2622264;
 Thu, 19 Nov 2020 16:24:12 +0000 (UTC)
Date: Thu, 19 Nov 2020 16:24:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 2/2] arm64: kvm: Introduce MTE VCPU feature
Message-ID: <20201119162409.GC4376@gaia>
References: <20201026155727.36685-1-steven.price@arm.com>
 <20201026155727.36685-3-steven.price@arm.com>
 <X7P1VLZhBh045tsr@trantor>
 <f34b3d16-8bc7-af9d-c0e0-fb114d2465aa@arm.com>
 <X7VQua7YO4isMFPU@trantor>
 <20201118170552.cuczyylf34ows5jd@kamzik.brq.redhat.com>
 <f4f7073c-a0d5-f259-8fbc-514c0c5ddbed@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4f7073c-a0d5-f259-8fbc-514c0c5ddbed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 11:24:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Haibo Xu <Haibo.Xu@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, Thomas Gleixner <tglx@linutronix.de>,
 Julien Thierry <julien.thierry.kdev@gmail.com>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 12:45:52PM +0000, Steven Price wrote:
> On 18/11/2020 17:05, Andrew Jones wrote:
> > On Wed, Nov 18, 2020 at 04:50:01PM +0000, Catalin Marinas wrote:
> > > On Wed, Nov 18, 2020 at 04:01:20PM +0000, Steven Price wrote:
> > > > On 17/11/2020 16:07, Catalin Marinas wrote:
> > > > > On Mon, Oct 26, 2020 at 03:57:27PM +0000, Steven Price wrote:
> > > > > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > > > > index 19aacc7d64de..38fe25310ca1 100644
> > > > > > --- a/arch/arm64/kvm/mmu.c
> > > > > > +++ b/arch/arm64/kvm/mmu.c
> > > > > > @@ -862,6 +862,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > > > >    	if (vma_pagesize == PAGE_SIZE && !force_pte)
> > > > > >    		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
> > > > > >    							   &pfn, &fault_ipa);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The otherwise redundant test for system_supports_mte() allows the
> > > > > > +	 * code to be compiled out when CONFIG_ARM64_MTE is not present.
> > > > > > +	 */
> > > > > > +	if (system_supports_mte() && kvm->arch.mte_enabled && pfn_valid(pfn)) {
> > > > > > +		/*
> > > > > > +		 * VM will be able to see the page's tags, so we must ensure
> > > > > > +		 * they have been initialised.
> > > > > > +		 */
> > > > > > +		struct page *page = pfn_to_page(pfn);
> > > > > > +		long i, nr_pages = compound_nr(page);
> > > > > > +
> > > > > > +		/* if PG_mte_tagged is set, tags have already been initialised */
> > > > > > +		for (i = 0; i < nr_pages; i++, page++) {
> > > > > > +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
> > > > > > +				mte_clear_page_tags(page_address(page));
> > > > > > +		}
> > > > > > +	}
> > > > > 
> > > > > If this page was swapped out and mapped back in, where does the
> > > > > restoring from swap happen?
> > > > 
> > > > Restoring from swap happens above this in the call to gfn_to_pfn_prot()
> > > 
> > > Looking at the call chain, gfn_to_pfn_prot() ends up with
> > > get_user_pages() using the current->mm (the VMM) and that does a
> > > set_pte_at(), presumably restoring the tags. Does this mean that all
> > > memory mapped by the VMM in user space should have PROT_MTE set?
> > > Otherwise we don't take the mte_sync_tags() path in set_pte_at() and no
> > > tags restored from swap (we do save them since when they were mapped,
> > > PG_mte_tagged was set).
> > > 
> > > So I think the code above should be similar to mte_sync_tags(), even
> > > calling a common function, but I'm not sure where to get the swap pte
> > > from.
> 
> You're right - the code is broken as it stands. I've just been able to
> reproduce the loss of tags due to swap.
> 
> The problem is that we also don't have a suitable pte to do the restore from
> swap from. So either set_pte_at() would have to unconditionally check for
> MTE tags for all previous swap entries as you suggest below. I had a quick
> go at testing this and hit issues with the idle task getting killed during
> boot - I fear there are some fun issues regarding initialisation order here.

My attempt here but not fully tested (just booted, no swap support):

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b35833259f08..27d7fd336a16 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -304,7 +304,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 		__sync_icache_dcache(pte);
 
 	if (system_supports_mte() &&
-	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
+	    pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
 		mte_sync_tags(ptep, pte);
 
 	__check_racy_pte_update(mm, ptep, pte);
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 52a0638ed967..bbd6c56d33d9 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -20,18 +20,24 @@
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
 
-static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
+static void mte_sync_page_tags(struct page *page, pte_t *ptep, pte_t pte,
+			       bool check_swap)
 {
 	pte_t old_pte = READ_ONCE(*ptep);
 
 	if (check_swap && is_swap_pte(old_pte)) {
 		swp_entry_t entry = pte_to_swp_entry(old_pte);
 
-		if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
+		if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
+			set_bit(PG_mte_tagged, &page->flags);
 			return;
+		}
 	}
 
-	mte_clear_page_tags(page_address(page));
+	if (pte_tagged(pte)) {
+		mte_clear_page_tags(page_address(page));
+		set_bit(PG_mte_tagged, &page->flags);
+	}
 }
 
 void mte_sync_tags(pte_t *ptep, pte_t pte)
@@ -42,8 +48,8 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
 
 	/* if PG_mte_tagged is set, tags have already been initialised */
 	for (i = 0; i < nr_pages; i++, page++) {
-		if (!test_and_set_bit(PG_mte_tagged, &page->flags))
-			mte_sync_page_tags(page, ptep, check_swap);
+		if (!test_bit(PG_mte_tagged, &page->flags))
+			mte_sync_page_tags(page, ptep, pte, check_swap);
 	}
 }

-- 
Catalin

