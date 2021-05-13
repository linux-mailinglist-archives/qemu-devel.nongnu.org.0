Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14237F611
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:59:01 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh93V-0003wW-27
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lh92O-0002Yv-An
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:57:52 -0400
Received: from foss.arm.com ([217.140.110.172]:53948)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lh92H-0000LD-GI
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:57:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D2F1476;
 Thu, 13 May 2021 03:57:42 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 487D43F73B;
 Thu, 13 May 2021 03:57:40 -0700 (PDT)
Subject: Re: [PATCH v11 2/6] arm64: kvm: Introduce MTE VM feature
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-3-steven.price@arm.com> <20210428170705.GB4022@arm.com>
 <c3293d47-a5f2-ea4a-6730-f5cae26d8a7e@arm.com> <YJGHApOCXl811VK3@arm.com>
 <329286e8-a8f3-ea1a-1802-58813255a4a5@arm.com>
 <20210507182538.GF26528@arm.com> <20210510183506.GA10910@arm.com>
 <c891d4eb-b388-1658-8c8a-e76477062463@arm.com>
 <20210512174502.GC12391@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7c1cb7c8-6ab4-62bd-fa17-2fb7be6d7f09@arm.com>
Date: Thu, 13 May 2021 11:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210512174502.GC12391@arm.com>
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

On 12/05/2021 18:45, Catalin Marinas wrote:
> On Wed, May 12, 2021 at 04:46:48PM +0100, Steven Price wrote:
>> On 10/05/2021 19:35, Catalin Marinas wrote:
>>> On Fri, May 07, 2021 at 07:25:39PM +0100, Catalin Marinas wrote:
>>>> On Thu, May 06, 2021 at 05:15:25PM +0100, Steven Price wrote:
>>>>> On 04/05/2021 18:40, Catalin Marinas wrote:
>>>>>> On Thu, Apr 29, 2021 at 05:06:41PM +0100, Steven Price wrote:
>>>>>>> Given the changes to set_pte_at() which means that tags are restored from
>>>>>>> swap even if !PROT_MTE, the only race I can see remaining is the creation of
>>>>>>> new PROT_MTE mappings. As you mention an attempt to change mappings in the
>>>>>>> VMM memory space should involve a mmu notifier call which I think serialises
>>>>>>> this. So the remaining issue is doing this in a separate address space.
>>>>>>>
>>>>>>> So I guess the potential problem is:
>>>>>>>
>>>>>>>    * allocate memory MAP_SHARED but !PROT_MTE
>>>>>>>    * fork()
>>>>>>>    * VM causes a fault in parent address space
>>>>>>>    * child does a mprotect(PROT_MTE)
>>>>>>>
>>>>>>> With the last two potentially racing. Sadly I can't see a good way of
>>>>>>> handling that.
> [...]
>>> Options:
>>>
>>> 1. Change the mte_sync_tags() code path to set the flag after clearing
>>>     and avoid reading stale tags. We document that mprotect() on
>>>     MAP_SHARED may lead to tag loss. Maybe we can intercept this in the
>>>     arch code and return an error.
>>
>> This is the best option I've come up with so far - but it's not a good
>> one! We can replace the set_bit() with a test_and_set_bit() to catch the
>> race after it has occurred - but I'm not sure what we can do about it
>> then (we've already wiped the data). Returning an error doesn't seem
>> particularly useful at that point, a message in dmesg is about the best
>> I can come up with.
> 
> What I meant about intercepting is on something like
> arch_validate_flags() to prevent VM_SHARED and VM_MTE together but only
> for mprotect(), not mmap(). However, arch_validate_flags() is currently
> called on both mmap() and mprotect() paths.

I think even if we were to restrict mprotect() there would be corner
cases around swapping in. For example if a page mapped VM_SHARED|VM_MTE
is faulted simultaneously in both processes then we have the same situation:

 * with test_and_set_bit() one process could potentially see the tags
before they have been restored - i.e. a data leak.

 * with separated test and set then one process could write to the tags
before the second restore has completed causing a lost update.

Obviously completely banning VM_SHARED|VM_MTE might work, but I don't
think that's a good idea.

> We can't do much in set_pte_at() to prevent the race with only a single
> bit.
> 
>>> 2. Figure out some other locking in the core code. However, if
>>>     mprotect() in one process can race with a handle_pte_fault() in
>>>     another, on the same shared mapping, it's not trivial.
>>>     filemap_map_pages() would take the page lock before calling
>>>     do_set_pte(), so mprotect() would need the same page lock.
>>
>> I can't see how this is going to work without harming the performance of
>> non-MTE work. Ultimately we're trying to add some sort of locking for
>> two (mostly) unrelated processes doing page table operations, which will
>> hurt scalability.
> 
> Another option is to have an arch callback to force re-faulting on the
> pte. That means we don't populate it back after the invalidation in the
> change_protection() path. We could do this only if the new pte is tagged
> and the page doesn't have PG_mte_tagged. The faulting path takes the
> page lock IIUC.

As above - I don't think this race is just on the change_protection() path.

> Well, at least for stage 1, I haven't thought much about stage 2.
> 
>>> 3. Use another PG_arch_3 bit as a lock to spin on in the arch code (i.e.
>>>     set it around the other PG_arch_* bit setting).
>>
>> This is certainly tempting, although sadly the existing
>> wait_on_page_bit() is sleeping - so this would either be a literal spin,
>> or we'd need to implement a new non-sleeping wait mechanism.
> 
> Yeah, it would have to be a custom spinning mechanism, something like:
> 
> 	/* lock the page */
> 	while (test_and_set_bit(PG_arch_3, &page->flags))
> 		smp_cond_load_relaxed(&page->flags, !(VAL & PG_arch_3));
> 	...
> 	/* unlock the page */
> 	clear_bit(PG_arch_3, &page->flags);

Presumably we'd also need to ensure interrupts are disabled to ensure
we're not pre-empted in the middle and potentially deadlock. It's
doable, but I'd prefer not to invent a new lock type if possible.

>> 4. Sledgehammer locking in mte_sync_page_tags(), add a spinlock only for
>> the MTE case where we have to sync tags (see below). What the actual
>> performance impact of this is I've no idea. It could certainly be bad
>> if there are a lot of pages with MTE enabled, which sadly is exactly
>> the case if KVM is used with MTE :(
>>
>> --->8----
>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>> index 0d320c060ebe..389ad40256f6 100644
>> --- a/arch/arm64/kernel/mte.c
>> +++ b/arch/arm64/kernel/mte.c
>> @@ -25,23 +25,33 @@
>>  u64 gcr_kernel_excl __ro_after_init;
>>  static bool report_fault_once = true;
>> +static spinlock_t tag_sync_lock;
>>  static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap,
>>  			       bool pte_is_tagged)
>>  {
>>  	pte_t old_pte = READ_ONCE(*ptep);
>> +	if (!is_swap_pte(old_pte) && !pte_is_tagged)
>> +		return;
>> +
>> +	spin_lock_irqsave(&tag_sync_lock, flags);
>> +
>> +	/* Recheck with the lock held */
>> +	if (test_bit(PG_mte_tagged, &page->flags))
>> +		goto out;
> 
> Can we skip the lock if the page already has the PG_mte_tagged set?
> That's assuming that we set the flag only after clearing the tags. The
> normal case where mprotect() is called on a page already mapped with
> PROT_MTE would not be affected.
> 

It was missing from the diff context (sorry, should have double checked
that), but I was keeping the check in mte_sync_tags():

  void mte_sync_tags(pte_t *ptep, pte_t pte)
  {
	struct page *page = pte_page(pte);
	long i, nr_pages = compound_nr(page);
	bool check_swap = nr_pages == 1;
	bool pte_is_tagged = pte_tagged(pte);
	unsigned long flags;

	/* Early out if there's nothing to do */
	if (!check_swap && !pte_is_tagged)
		return;

	/* if PG_mte_tagged is set, tags have already been initialised */
	for (i = 0; i < nr_pages; i++, page++) {
		if (!test_bit(PG_mte_tagged, &page->flags))
			mte_sync_page_tags(page, ptep, check_swap,
					   pte_is_tagged);
	}
  }

So the hit is only taken if !PG_mte_tagged - hence the "recheck" comment
in mte_sync_page_tags() once the lock is held. I guess if I'm going this
route it would make sense to refactor this to be a bit clearer.

Steve

