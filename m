Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE036EE03
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:18:20 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9Mp-0001Wj-W8
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lc9Bm-0004x1-IP
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 12:06:57 -0400
Received: from foss.arm.com ([217.140.110.172]:47528)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lc9Bf-0005L9-09
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 12:06:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB6151FB;
 Thu, 29 Apr 2021 09:06:45 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 025393F70D;
 Thu, 29 Apr 2021 09:06:42 -0700 (PDT)
Subject: Re: [PATCH v11 2/6] arm64: kvm: Introduce MTE VM feature
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-3-steven.price@arm.com> <20210428170705.GB4022@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <c3293d47-a5f2-ea4a-6730-f5cae26d8a7e@arm.com>
Date: Thu, 29 Apr 2021 17:06:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428170705.GB4022@arm.com>
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

On 28/04/2021 18:07, Catalin Marinas wrote:
> On Fri, Apr 16, 2021 at 04:43:05PM +0100, Steven Price wrote:
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 77cb2d28f2a4..5f8e165ea053 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -879,6 +879,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   	if (vma_pagesize == PAGE_SIZE && !force_pte)
>>   		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
>>   							   &pfn, &fault_ipa);
>> +
>> +	if (fault_status != FSC_PERM && kvm_has_mte(kvm) && !device &&
>> +	    pfn_valid(pfn)) {
> 
> In the current implementation, device == !pfn_valid(), so we could skip
> the latter check.

Thanks, I'll drop that check.

>> +		/*
>> +		 * VM will be able to see the page's tags, so we must ensure
>> +		 * they have been initialised. if PG_mte_tagged is set, tags
>> +		 * have already been initialised.
>> +		 */
>> +		unsigned long i, nr_pages = vma_pagesize >> PAGE_SHIFT;
>> +		struct page *page = pfn_to_online_page(pfn);
>> +
>> +		if (!page)
>> +			return -EFAULT;
> 
> I think that's fine, though maybe adding a comment that otherwise it
> would be mapped at stage 2 as Normal Cacheable and we cannot guarantee
> that the memory supports MTE tags.

That's what I intended by "be able to see the page's tags", but I'll 
reword to be explicit about it being Normal Cacheable.

>> +
>> +		for (i = 0; i < nr_pages; i++, page++) {
>> +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>> +				mte_clear_page_tags(page_address(page));
>> +		}
>> +	}
>> +
>>   	if (writable)
>>   		prot |= KVM_PGTABLE_PROT_W;
> 
> I probably asked already but is the only way to map a standard RAM page
> (not device) in stage 2 via the fault handler? One case I had in mind
> was something like get_user_pages() but it looks like that one doesn't
> call set_pte_at_notify(). There are a few other places where
> set_pte_at_notify() is called and these may happen before we got a
> chance to fault on stage 2, effectively populating the entry (IIUC). If
> that's an issue, we could move the above loop and check closer to the
> actual pte setting like kvm_pgtable_stage2_map().

The only call sites of kvm_pgtable_stage2_map() are in mmu.c:

  * kvm_phys_addr_ioremap() - maps as device in stage 2

  * user_mem_abort() - handled above

  * kvm_set_spte_handler() - ultimately called from the .change_pte() 
callback of the MMU notifier

So the last one is potentially a problem. It's called via the MMU 
notifiers in the case of set_pte_at_notify(). The users of that are:

  * uprobe_write_opcode(): Allocates a new page and performs a 
copy_highpage() to copy the data to the new page (which with MTE 
includes the tags and will copy across the PG_mte_tagged flag).

  * write_protect_page() (KSM): Changes the permissions on the PTE but 
it's still the same page, so nothing to do regarding MTE.

  * replace_page() (KSM): If the page has MTE tags then the MTE version 
of memcmp_pages() will return false, so the only caller 
(try_to_merge_one_page()) will never call this on a page with tags.

  * wp_page_copy(): This one is more interesting - if we go down the 
cow_user_page() path with an old page then everything is safe (tags are 
copied over). The is_zero_pfn() case worries me a bit - a new page is 
allocated, but I can't instantly see anything to zero out the tags (and 
set PG_mte_tagged).

  * migrate_vma_insert_page(): I think migration should be safe as the 
tags should be copied.

So wp_page_copy() looks suspicious.

kvm_pgtable_stage2_map() looks like it could be a good place for the 
checks, it looks like it should work and is probably a more obvious 
place for the checks.

> While the set_pte_at() race on the page flags is somewhat clearer, we
> may still have a race here with the VMM's set_pte_at() if the page is
> mapped as tagged. KVM has its own mmu_lock but it wouldn't be held when
> handling the VMM page tables (well, not always, see below).
> 
> gfn_to_pfn_prot() ends up calling get_user_pages*(). At least the slow
> path (hva_to_pfn_slow()) ends up with FOLL_TOUCH in gup and the VMM pte
> would be set, tags cleared (if PROT_MTE) before the stage 2 pte. I'm not
> sure whether get_user_page_fast_only() does the same.
> 
> The race with an mprotect(PROT_MTE) in the VMM is fine I think as the
> KVM mmu notifier is invoked before set_pte_at() and racing with another
> user_mem_abort() is serialised by the KVM mmu_lock. The subsequent
> set_pte_at() would see the PG_mte_tagged set either by the current CPU
> or by the one it was racing with.
> 

Given the changes to set_pte_at() which means that tags are restored 
from swap even if !PROT_MTE, the only race I can see remaining is the 
creation of new PROT_MTE mappings. As you mention an attempt to change 
mappings in the VMM memory space should involve a mmu notifier call 
which I think serialises this. So the remaining issue is doing this in a 
separate address space.

So I guess the potential problem is:

  * allocate memory MAP_SHARED but !PROT_MTE
  * fork()
  * VM causes a fault in parent address space
  * child does a mprotect(PROT_MTE)

With the last two potentially racing. Sadly I can't see a good way of 
handling that.

Steve

