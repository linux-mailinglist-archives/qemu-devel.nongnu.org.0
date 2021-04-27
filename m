Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5836CA9C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:50:55 +0200 (CEST)
Received: from localhost ([::1]:51630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRrK-0003Sp-Hy
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lbRks-0008Ex-G6
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:44:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lbRkk-0007vg-GU
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:44:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81EE6613E5;
 Tue, 27 Apr 2021 17:44:00 +0000 (UTC)
Date: Tue, 27 Apr 2021 18:43:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v11 1/6] arm64: mte: Sync tags for pages where PTE is
 untagged
Message-ID: <20210427174357.GA17872@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-2-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416154309.22129-2-steven.price@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Fri, Apr 16, 2021 at 04:43:04PM +0100, Steven Price wrote:
> A KVM guest could store tags in a page even if the VMM hasn't mapped
> the page with PROT_MTE. So when restoring pages from swap we will
> need to check to see if there are any saved tags even if !pte_tagged().
> 
> However don't check pages which are !pte_valid_user() as these will
> not have been swapped out.

You should remove the pte_valid_user() mention from the commit log as
well.

> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e17b96d0e4b5..cf4b52a33b3c 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>  		__sync_icache_dcache(pte);
>  
>  	if (system_supports_mte() &&
> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
> +	    pte_present(pte) && (pte_val(pte) & PTE_USER) && !pte_special(pte))

I would add a pte_user() macro here or, if we restore the tags only when
the page is readable, use pte_access_permitted(pte, false). Also add a
comment why we do this.

There's also the pte_user_exec() case which may not have the PTE_USER
set (exec-only permission) but I don't think it matters. We don't do tag
checking on instruction fetches, so if the user adds a PROT_READ to it,
it would go through set_pte_at() again. I'm not sure KVM does anything
special with exec-only mappings at stage 2, I suspect they won't be
accessible by the guest (but needs checking).

>  		mte_sync_tags(ptep, pte);
>  
>  	__check_racy_pte_update(mm, ptep, pte);
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index b3c70a612c7a..e016ab57ea36 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -26,17 +26,23 @@ u64 gcr_kernel_excl __ro_after_init;
>  
>  static bool report_fault_once = true;
>  
> -static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
> +static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap,
> +			       bool pte_is_tagged)
>  {
>  	pte_t old_pte = READ_ONCE(*ptep);
>  
>  	if (check_swap && is_swap_pte(old_pte)) {
>  		swp_entry_t entry = pte_to_swp_entry(old_pte);
>  
> -		if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
> +		if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
> +			set_bit(PG_mte_tagged, &page->flags);
>  			return;
> +		}
>  	}
>  
> +	if (!pte_is_tagged || test_and_set_bit(PG_mte_tagged, &page->flags))
> +		return;

I don't think we need another test_bit() here, it was done in the
caller (bar potential races which need more thought).

> +
>  	page_kasan_tag_reset(page);
>  	/*
>  	 * We need smp_wmb() in between setting the flags and clearing the
> @@ -54,11 +60,13 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
>  	struct page *page = pte_page(pte);
>  	long i, nr_pages = compound_nr(page);
>  	bool check_swap = nr_pages == 1;
> +	bool pte_is_tagged = pte_tagged(pte);
>  
>  	/* if PG_mte_tagged is set, tags have already been initialised */
>  	for (i = 0; i < nr_pages; i++, page++) {
> -		if (!test_and_set_bit(PG_mte_tagged, &page->flags))
> -			mte_sync_page_tags(page, ptep, check_swap);
> +		if (!test_bit(PG_mte_tagged, &page->flags))
> +			mte_sync_page_tags(page, ptep, check_swap,
> +					   pte_is_tagged);
>  	}
>  }

You were right in the previous thread that if we have a race, it's
already there even without your patches KVM patches.

If it's the same pte in a multithreaded app, we should be ok as the core
code holds the ptl (the arch code also holds the mmap_lock during
exception handling but only as a reader, so you can have multiple
holders).

If there are multiple ptes to the same page, for example mapped with
MAP_ANONYMOUS | MAP_SHARED, metadata recovery is done via
arch_swap_restore() before we even set the pte and with the page locked.
So calling lock_page() again in mte_restore_tags() would deadlock.

I can see that do_swap_page() also holds the page lock around
set_pte_at(), so I think we are covered.

Any other scenario I may have missed? My understanding is that if the
pte is the same, we have the ptl. Otherwise we have the page lock for
shared pages.

-- 
Catalin

