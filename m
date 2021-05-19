Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A84388AB1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 11:33:24 +0200 (CEST)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljIZv-0001ts-0l
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 05:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljIYn-0001Ey-4e
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:32:13 -0400
Received: from foss.arm.com ([217.140.110.172]:48746)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljIYj-0005jN-6I
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:32:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9B69101E;
 Wed, 19 May 2021 02:32:05 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 402773F73D;
 Wed, 19 May 2021 02:32:03 -0700 (PDT)
Subject: Re: [PATCH v12 3/8] arm64: mte: Sync tags for pages where PTE is
 untagged
To: Marc Zyngier <maz@kernel.org>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-4-steven.price@arm.com> <87y2cdtk09.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <f3a3f560-4d2b-9cd3-bbf4-ea8135ab4d17@arm.com>
Date: Wed, 19 May 2021 10:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87y2cdtk09.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/05/2021 17:14, Marc Zyngier wrote:
> On Mon, 17 May 2021 13:32:34 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> A KVM guest could store tags in a page even if the VMM hasn't mapped
>> the page with PROT_MTE. So when restoring pages from swap we will
>> need to check to see if there are any saved tags even if !pte_tagged().
>>
>> However don't check pages for which pte_access_permitted() returns false
>> as these will not have been swapped out.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h |  9 +++++++--
>>  arch/arm64/kernel/mte.c          | 16 ++++++++++++++--
>>  2 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 0b10204e72fc..275178a810c1 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -314,8 +314,13 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>  	if (pte_present(pte) && pte_user_exec(pte) && !pte_special(pte))
>>  		__sync_icache_dcache(pte);
>>  
>> -	if (system_supports_mte() &&
>> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
>> +	/*
>> +	 * If the PTE would provide user space access to the tags associated
>> +	 * with it then ensure that the MTE tags are synchronised.  Exec-only
>> +	 * mappings don't expose tags (instruction fetches don't check tags).
> 
> I'm not sure I understand this comment. Of course, execution doesn't
> match tags. But the memory could still have tags associated with
> it. Does this mean such a page would lose its tags is swapped out?

Hmm, I probably should have reread that - the context of the comment is
lost.

I added the comment when changing to pte_access_permitted(), and the
comment on pte_access_permitted() explains a potential gotcha:

 * p??_access_permitted() is true for valid user mappings (PTE_USER
 * bit set, subject to the write permission check). For execute-only
 * mappings, like PROT_EXEC with EPAN (both PTE_USER and PTE_UXN bits
 * not set) must return false. PROT_NONE mappings do not have the
 * PTE_VALID bit set.

So execute-only mappings return false even though that is effectively a
type of user access. However, because MTE checks are not performed by
the PE for instruction fetches this doesn't matter. I'll update the
comment, how about:

/*
 * If the PTE would provide user space access to the tags associated
 * with it then ensure that the MTE tags are synchronised.  Although
 * pte_access_permitted() returns false for exec only mappings, they
 * don't expose tags (instruction fetches don't check tags).
 */

Thanks,

Steve

> Thanks,
> 
> 	M.
> 
>> +	 */
>> +	if (system_supports_mte() && pte_present(pte) &&
>> +	    pte_access_permitted(pte, false) && !pte_special(pte))
>>  		mte_sync_tags(ptep, pte);
>>  
>>  	__check_racy_pte_update(mm, ptep, pte);
>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>> index c88e778c2fa9..a604818c52c1 100644
>> --- a/arch/arm64/kernel/mte.c
>> +++ b/arch/arm64/kernel/mte.c
>> @@ -33,11 +33,15 @@ DEFINE_STATIC_KEY_FALSE(mte_async_mode);
>>  EXPORT_SYMBOL_GPL(mte_async_mode);
>>  #endif
>>  
>> -static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
>> +static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap,
>> +			       bool pte_is_tagged)
>>  {
>>  	unsigned long flags;
>>  	pte_t old_pte = READ_ONCE(*ptep);
>>  
>> +	if (!is_swap_pte(old_pte) && !pte_is_tagged)
>> +		return;
>> +
>>  	spin_lock_irqsave(&tag_sync_lock, flags);
>>  
>>  	/* Recheck with the lock held */
>> @@ -53,6 +57,9 @@ static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
>>  		}
>>  	}
>>  
>> +	if (!pte_is_tagged)
>> +		goto out;
>> +
>>  	page_kasan_tag_reset(page);
>>  	/*
>>  	 * We need smp_wmb() in between setting the flags and clearing the
>> @@ -76,10 +83,15 @@ void mte_sync_tags(pte_t *ptep, pte_t pte)
>>  	bool check_swap = nr_pages == 1;
>>  	bool pte_is_tagged = pte_tagged(pte);
>>  
>> +	/* Early out if there's nothing to do */
>> +	if (!check_swap && !pte_is_tagged)
>> +		return;
>> +
>>  	/* if PG_mte_tagged is set, tags have already been initialised */
>>  	for (i = 0; i < nr_pages; i++, page++) {
>>  		if (!test_bit(PG_mte_tagged, &page->flags))
>> -			mte_sync_page_tags(page, ptep, check_swap);
>> +			mte_sync_page_tags(page, ptep, check_swap,
>> +					   pte_is_tagged);
>>  	}
>>  }
>>  
>> -- 
>> 2.20.1
>>
>>
> 


