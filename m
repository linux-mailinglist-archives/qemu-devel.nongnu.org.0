Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591238AF98
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:04:55 +0200 (CEST)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiM9-00023H-30
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljiLD-0001Ls-OK
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:03:56 -0400
Received: from foss.arm.com ([217.140.110.172]:43584)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljiLA-0006SZ-GN
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:03:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A401011D4;
 Thu, 20 May 2021 06:03:50 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6E2C3F73B;
 Thu, 20 May 2021 06:03:47 -0700 (PDT)
Subject: Re: [PATCH v12 3/8] arm64: mte: Sync tags for pages where PTE is
 untagged
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-4-steven.price@arm.com> <20210519180610.GE21619@arm.com>
 <3bac3a47-9f96-c7bf-e401-fdef60dcc9d8@arm.com>
 <20210520122550.GD12251@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <85946169-3670-c33e-bd49-abd16dce3fa1@arm.com>
Date: Thu, 20 May 2021 14:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520122550.GD12251@arm.com>
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
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2021 13:25, Catalin Marinas wrote:
> On Thu, May 20, 2021 at 12:55:21PM +0100, Steven Price wrote:
>> On 19/05/2021 19:06, Catalin Marinas wrote:
>>> On Mon, May 17, 2021 at 01:32:34PM +0100, Steven Price wrote:
>>>> A KVM guest could store tags in a page even if the VMM hasn't mapped
>>>> the page with PROT_MTE. So when restoring pages from swap we will
>>>> need to check to see if there are any saved tags even if !pte_tagged().
>>>>
>>>> However don't check pages for which pte_access_permitted() returns false
>>>> as these will not have been swapped out.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>>  arch/arm64/include/asm/pgtable.h |  9 +++++++--
>>>>  arch/arm64/kernel/mte.c          | 16 ++++++++++++++--
>>>>  2 files changed, 21 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>>> index 0b10204e72fc..275178a810c1 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -314,8 +314,13 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>>>  	if (pte_present(pte) && pte_user_exec(pte) && !pte_special(pte))
>>>>  		__sync_icache_dcache(pte);
>>>>  
>>>> -	if (system_supports_mte() &&
>>>> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
>>>> +	/*
>>>> +	 * If the PTE would provide user space access to the tags associated
>>>> +	 * with it then ensure that the MTE tags are synchronised.  Exec-only
>>>> +	 * mappings don't expose tags (instruction fetches don't check tags).
>>>> +	 */
>>>> +	if (system_supports_mte() && pte_present(pte) &&
>>>> +	    pte_access_permitted(pte, false) && !pte_special(pte))
>>>>  		mte_sync_tags(ptep, pte);
>>>
>>> Looking at the mte_sync_page_tags() logic, we bail out early if it's the
>>> old pte is not a swap one and the new pte is not tagged. So we only need
>>> to call mte_sync_tags() if it's a tagged new pte or the old one is swap.
>>> What about changing the set_pte_at() test to:
>>>
>>> 	if (system_supports_mte() && pte_present(pte) && !pte_special(pte) &&
>>> 	    (pte_tagged(pte) || is_swap_pte(READ_ONCE(*ptep))))
>>> 		mte_sync_tags(ptep, pte);
>>>
>>> We can even change mte_sync_tags() to take the old pte directly:
>>>
>>> 	if (system_supports_mte() && pte_present(pte) && !pte_special(pte)) {
>>> 		pte_t old_pte = READ_ONCE(*ptep);
>>> 		if (pte_tagged(pte) || is_swap_pte(old_pte))
>>> 			mte_sync_tags(old_pte, pte);
>>> 	}
>>>
>>> It would save a function call in most cases where the page is not
>>> tagged.
>>
>> Yes that looks like a good optimisation - although you've missed the
>> pte_access_permitted() part of the check ;)
> 
> I was actually wondering if we could remove it. I don't think it buys us
> much as we have a pte_present() check already, so we know it is pointing
> to a valid page. Currently we'd only get a tagged pte on user mappings,
> same with swap entries.

Actually the other way round makes more sense surely?
pte_access_permitted() is true if both PTE_VALID & PTE_USER are set.
pte_present() is true if *either* PTE_VALID or PTE_PROT_NONE are set. So
the pte_present() is actually redundant.

> When vmalloc kasan_hw will be added, I think we have a set_pte_at() with
> a tagged pte but init_mm and high address (we might as well add a
> warning if addr > TASK_SIZE_64 on the mte_sync_tags path so that we
> don't forget).

While we might not yet have tagged kernel pages - I'm not sure there's
much point weakening the check to have to then check addr as well in the
future.

>> The problem I hit is one of include dependencies:
>>
>> is_swap_pte() is defined (as a static inline) in
>> include/linux/swapops.h. However the definition depends on
>> pte_none()/pte_present() which are defined in pgtable.h - so there's a
>> circular dependency.
>>
>> Open coding is_swap_pte() in set_pte_at() works, but it's a bit ugly.
>> Any ideas on how to improve on the below?
>>
>> 	if (system_supports_mte() && pte_present(pte) &&
>> 	    pte_access_permitted(pte, false) && !pte_special(pte)) {
>> 		pte_t old_pte = READ_ONCE(*ptep);
>> 		/*
>> 		 * We only need to synchronise if the new PTE has tags enabled
>> 		 * or if swapping in (in which case another mapping may have
>> 		 * set tags in the past even if this PTE isn't tagged).
>> 		 * (!pte_none() && !pte_present()) is an open coded version of
>> 		 * is_swap_pte()
>> 		 */
>> 		if (pte_tagged(pte) || (!pte_none(pte) && !pte_present(pte)))
>> 			mte_sync_tags(old_pte, pte);
>> 	}
> 
> That's why I avoided testing my suggestion ;). I think we should just
> add !pte_none() in there with a comment that it may be a swap pte and
> use the is_swap_pte() again on the mte_sync_tags() path. We already have
> the pte_present() check.

Well of course I didn't test the above beyond building - and I've
screwed up because the open coded is_swap_pte() should have been called
on old_pte not pte!

So the pte_present() check above (which I've just removed...) is for the
*new* PTE. So I think we need to keep both here.

Steve

