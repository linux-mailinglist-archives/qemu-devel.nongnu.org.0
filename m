Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474A38B30B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:22:45 +0200 (CEST)
Received: from localhost ([::1]:49416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkVY-0002lZ-CC
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljkFM-0003UA-MR
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:06:00 -0400
Received: from foss.arm.com ([217.140.110.172]:46098)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljkFI-0005OI-Jj
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:05:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B333D11B3;
 Thu, 20 May 2021 08:05:54 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F08993F73B;
 Thu, 20 May 2021 08:05:51 -0700 (PDT)
Subject: Re: [PATCH v12 4/8] arm64: kvm: Introduce MTE VM feature
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-5-steven.price@arm.com> <20210520115426.GB12251@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5f0996d6-0a6e-ebcd-afcd-8290faba6780@arm.com>
Date: Thu, 20 May 2021 16:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520115426.GB12251@arm.com>
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

On 20/05/2021 12:54, Catalin Marinas wrote:
> On Mon, May 17, 2021 at 01:32:35PM +0100, Steven Price wrote:
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index c5d1f3c87dbd..8660f6a03f51 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -822,6 +822,31 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
>>  	return PAGE_SIZE;
>>  }
>>  
>> +static int sanitise_mte_tags(struct kvm *kvm, unsigned long size,
>> +			     kvm_pfn_t pfn)
>> +{
>> +	if (kvm_has_mte(kvm)) {
>> +		/*
>> +		 * The page will be mapped in stage 2 as Normal Cacheable, so
>> +		 * the VM will be able to see the page's tags and therefore
>> +		 * they must be initialised first. If PG_mte_tagged is set,
>> +		 * tags have already been initialised.
>> +		 */
>> +		unsigned long i, nr_pages = size >> PAGE_SHIFT;
>> +		struct page *page = pfn_to_online_page(pfn);
>> +
>> +		if (!page)
>> +			return -EFAULT;
> 
> IIRC we ended up with pfn_to_online_page() to reject ZONE_DEVICE pages
> that may be mapped into a guest and we have no idea whether they support
> MTE. It may be worth adding a comment, otherwise, as Marc said, the page
> wouldn't disappear.

I'll add a comment.

>> +
>> +		for (i = 0; i < nr_pages; i++, page++) {
>> +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>> +				mte_clear_page_tags(page_address(page));
> 
> We started the page->flags thread and ended up fixing it for the host
> set_pte_at() as per the first patch:
> 
> https://lore.kernel.org/r/c3293d47-a5f2-ea4a-6730-f5cae26d8a7e@arm.com
> 
> Now, can we have a race between the stage 2 kvm_set_spte_gfn() and a
> stage 1 set_pte_at()? Only the latter takes a lock. Or between two
> kvm_set_spte_gfn() in different VMs? I think in the above thread we
> concluded that there's only a problem if the page is shared between
> multiple VMMs (MAP_SHARED). How realistic is this and what's the
> workaround?
> 
> Either way, I think it's worth adding a comment here on the race on
> page->flags as it looks strange that here it's just a test_and_set_bit()
> while set_pte_at() uses a spinlock.
> 

Very good point! I should have thought about that. I think splitting the
test_and_set_bit() in two (as with the cache flush) is sufficient. While
there technically still is a race which could lead to user space tags
being clobbered:

a) It's very odd for a VMM to be doing an mprotect() after the fact to
add PROT_MTE, or to be sharing the memory with another process which
sets PROT_MTE.

b) The window for the race is incredibly small and the VMM (generally)
needs to be robust against the guest changing tags anyway.

But I'll add a comment here as well:

	/*
	 * There is a potential race between sanitising the
	 * flags here and user space using mprotect() to add
	 * PROT_MTE to access the tags, however by splitting
	 * the test/set the only risk is user space tags
	 * being overwritten by the mte_clear_page_tags() call.
	 */

Thanks,

Steve

