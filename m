Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA92C4757
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:14:37 +0100 (CET)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzJM-0006Yi-0T
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <james.morse@arm.com>)
 id 1khzI4-00066y-Sm
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:13:16 -0500
Received: from foss.arm.com ([217.140.110.172]:56928)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <james.morse@arm.com>) id 1khzI2-000884-As
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:13:16 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3860C31B;
 Wed, 25 Nov 2020 10:13:11 -0800 (PST)
Received: from [172.16.1.114] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD4F33F23F;
 Wed, 25 Nov 2020 10:13:08 -0800 (PST)
Subject: Re: [PATCH v4 2/2] arm64: kvm: Introduce MTE VCPU feature
To: Steven Price <steven.price@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20201026155727.36685-1-steven.price@arm.com>
 <20201026155727.36685-3-steven.price@arm.com> <X7P1VLZhBh045tsr@trantor>
 <f34b3d16-8bc7-af9d-c0e0-fb114d2465aa@arm.com>
From: James Morse <james.morse@arm.com>
Message-ID: <4212c864-805a-cef4-7138-0f8995cadf5e@arm.com>
Date: Wed, 25 Nov 2020 18:13:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f34b3d16-8bc7-af9d-c0e0-fb114d2465aa@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172; envelope-from=james.morse@arm.com;
 helo=foss.arm.com
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
 Dave Martin <Dave.Martin@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Steven, Catalin,

On 18/11/2020 16:01, Steven Price wrote:
> On 17/11/2020 16:07, Catalin Marinas wrote:
>> On Mon, Oct 26, 2020 at 03:57:27PM +0000, Steven Price wrote:
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index 19aacc7d64de..38fe25310ca1 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -862,6 +862,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t
>>> fault_ipa,
>>>       if (vma_pagesize == PAGE_SIZE && !force_pte)
>>>           vma_pagesize = transparent_hugepage_adjust(memslot, hva,
>>>                                  &pfn, &fault_ipa);
>>> +
>>> +    /*
>>> +     * The otherwise redundant test for system_supports_mte() allows the
>>> +     * code to be compiled out when CONFIG_ARM64_MTE is not present.
>>> +     */
>>> +    if (system_supports_mte() && kvm->arch.mte_enabled && pfn_valid(pfn)) {
>>> +        /*
>>> +         * VM will be able to see the page's tags, so we must ensure
>>> +         * they have been initialised.
>>> +         */
>>> +        struct page *page = pfn_to_page(pfn);
>>> +        long i, nr_pages = compound_nr(page);
>>> +
>>> +        /* if PG_mte_tagged is set, tags have already been initialised */
>>> +        for (i = 0; i < nr_pages; i++, page++) {
>>> +            if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>>> +                mte_clear_page_tags(page_address(page));
>>> +        }
>>> +    }
>>
>> If this page was swapped out and mapped back in, where does the
>> restoring from swap happen?
> 
> Restoring from swap happens above this in the call to gfn_to_pfn_prot()
> 
>> I may have asked in the past, is user_mem_abort() the only path for
>> mapping Normal pages into stage 2?
>>
> 
> That is my understanding (and yes you asked before) and no one has corrected me! ;)

A recent discovery: Copy on write will cause kvm_set_spte_handler() to fixup the mapping
(instead of just invalidating it) on the assumption the guest is going to read whatever
was written.

Its possible user_mem_abort() will go and stomp on that mapping a second time, but if the
VMM triggers this at stage1, you won't have a vcpu for the update.


Thanks,

James

