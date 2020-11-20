Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5967F2BA648
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:35:52 +0100 (CET)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2pb-00024z-FO
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1kg2nr-0001Qf-8R
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:34:03 -0500
Received: from foss.arm.com ([217.140.110.172]:38264)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1kg2nn-0008H2-Ep
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:34:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F2921042;
 Fri, 20 Nov 2020 01:33:55 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9B893F70D;
 Fri, 20 Nov 2020 01:33:52 -0800 (PST)
Subject: Re: [PATCH v4 2/2] arm64: kvm: Introduce MTE VCPU feature
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20201026155727.36685-1-steven.price@arm.com>
 <20201026155727.36685-3-steven.price@arm.com> <X7P1VLZhBh045tsr@trantor>
 <f34b3d16-8bc7-af9d-c0e0-fb114d2465aa@arm.com> <X7VQua7YO4isMFPU@trantor>
 <20201118170552.cuczyylf34ows5jd@kamzik.brq.redhat.com>
 <f4f7073c-a0d5-f259-8fbc-514c0c5ddbed@arm.com> <20201119162409.GC4376@gaia>
From: Steven Price <steven.price@arm.com>
Message-ID: <08549858-82e1-c5c2-4c6b-2923ab18732e@arm.com>
Date: Fri, 20 Nov 2020 09:33:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119162409.GC4376@gaia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 19/11/2020 16:24, Catalin Marinas wrote:
> On Thu, Nov 19, 2020 at 12:45:52PM +0000, Steven Price wrote:
>> On 18/11/2020 17:05, Andrew Jones wrote:
>>> On Wed, Nov 18, 2020 at 04:50:01PM +0000, Catalin Marinas wrote:
>>>> On Wed, Nov 18, 2020 at 04:01:20PM +0000, Steven Price wrote:
>>>>> On 17/11/2020 16:07, Catalin Marinas wrote:
>>>>>> On Mon, Oct 26, 2020 at 03:57:27PM +0000, Steven Price wrote:
>>>>>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>>>>>> index 19aacc7d64de..38fe25310ca1 100644
>>>>>>> --- a/arch/arm64/kvm/mmu.c
>>>>>>> +++ b/arch/arm64/kvm/mmu.c
>>>>>>> @@ -862,6 +862,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>>>>>>     	if (vma_pagesize == PAGE_SIZE && !force_pte)
>>>>>>>     		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
>>>>>>>     							   &pfn, &fault_ipa);
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * The otherwise redundant test for system_supports_mte() allows the
>>>>>>> +	 * code to be compiled out when CONFIG_ARM64_MTE is not present.
>>>>>>> +	 */
>>>>>>> +	if (system_supports_mte() && kvm->arch.mte_enabled && pfn_valid(pfn)) {
>>>>>>> +		/*
>>>>>>> +		 * VM will be able to see the page's tags, so we must ensure
>>>>>>> +		 * they have been initialised.
>>>>>>> +		 */
>>>>>>> +		struct page *page = pfn_to_page(pfn);
>>>>>>> +		long i, nr_pages = compound_nr(page);
>>>>>>> +
>>>>>>> +		/* if PG_mte_tagged is set, tags have already been initialised */
>>>>>>> +		for (i = 0; i < nr_pages; i++, page++) {
>>>>>>> +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>>>>>>> +				mte_clear_page_tags(page_address(page));
>>>>>>> +		}
>>>>>>> +	}
>>>>>>
>>>>>> If this page was swapped out and mapped back in, where does the
>>>>>> restoring from swap happen?
>>>>>
>>>>> Restoring from swap happens above this in the call to gfn_to_pfn_prot()
>>>>
>>>> Looking at the call chain, gfn_to_pfn_prot() ends up with
>>>> get_user_pages() using the current->mm (the VMM) and that does a
>>>> set_pte_at(), presumably restoring the tags. Does this mean that all
>>>> memory mapped by the VMM in user space should have PROT_MTE set?
>>>> Otherwise we don't take the mte_sync_tags() path in set_pte_at() and no
>>>> tags restored from swap (we do save them since when they were mapped,
>>>> PG_mte_tagged was set).
>>>>
>>>> So I think the code above should be similar to mte_sync_tags(), even
>>>> calling a common function, but I'm not sure where to get the swap pte
>>>> from.
>>
>> You're right - the code is broken as it stands. I've just been able to
>> reproduce the loss of tags due to swap.
>>
>> The problem is that we also don't have a suitable pte to do the restore from
>> swap from. So either set_pte_at() would have to unconditionally check for
>> MTE tags for all previous swap entries as you suggest below. I had a quick
>> go at testing this and hit issues with the idle task getting killed during
>> boot - I fear there are some fun issues regarding initialisation order here.
> 
> My attempt here but not fully tested (just booted, no swap support):

Ah, very similar to what I had, just without the silly mistake... ;)

I just did a quick test with this and it seems to work. I obviously 
should have looked harder before giving up on this approach.

Thanks!

Steve

> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b35833259f08..27d7fd336a16 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -304,7 +304,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>   		__sync_icache_dcache(pte);
>   
>   	if (system_supports_mte() &&
> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
> +	    pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
>   		mte_sync_tags(ptep, pte);
>   
>   	__check_racy_pte_update(mm, ptep, pte);
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 52a0638ed967..bbd6c56d33d9 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -20,18 +20,24 @@
>   #include <asm/ptrace.h>
>   #include <asm/sysreg.h>
>   
> -static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
> +static void mte_sync_page_tags(struct page *page, pte_t *ptep, pte_t pte,
> +			       bool check_swap)
>   {
>   	pte_t old_pte = READ_ONCE(*ptep);
>   
>   	if (check_swap && is_swap_pte(old_pte)) {
>   		swp_entry_t entry = pte_to_swp_entry(old_pte);
>   
> -		if (!non_swap_entry(entry) && mte_restore_tags(entry, page))
> +		if (!non_swap_entry(entry) && mte_restore_tags(entry, page)) {
> +			set_bit(PG_mte_tagged, &page->flags);
>   			return;
> +		}
>   	}
>   
> -	mte_clear_page_tags(page_address(page));
> +	if (pte_tagged(pte)) {
> +		mte_clear_page_tags(page_address(page));
> +		set_bit(PG_mte_tagged, &page->flags);
> +	}
>   }
>   
>   void mte_sync_tags(pte_t *ptep, pte_t pte)
> @@ -42,8 +48,8 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
>   
>   	/* if PG_mte_tagged is set, tags have already been initialised */
>   	for (i = 0; i < nr_pages; i++, page++) {
> -		if (!test_and_set_bit(PG_mte_tagged, &page->flags))
> -			mte_sync_page_tags(page, ptep, check_swap);
> +		if (!test_bit(PG_mte_tagged, &page->flags))
> +			mte_sync_page_tags(page, ptep, pte, check_swap);
>   	}
>   }
> 


