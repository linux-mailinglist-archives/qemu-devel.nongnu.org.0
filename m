Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C3E34FDD3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:11:13 +0200 (CEST)
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXoe-0001AB-P7
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lRXnU-0000eZ-D2
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:10:00 -0400
Received: from foss.arm.com ([217.140.110.172]:58174)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lRXnR-0003Ku-C4
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:09:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5282A11B3;
 Wed, 31 Mar 2021 03:09:54 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6BEA3F792;
 Wed, 31 Mar 2021 03:09:51 -0700 (PDT)
Subject: Re: [PATCH v10 1/6] arm64: mte: Sync tags for pages where PTE is
 untagged
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210312151902.17853-1-steven.price@arm.com>
 <20210312151902.17853-2-steven.price@arm.com> <20210326185653.GG5126@arm.com>
 <21842e4d-7935-077c-3d6f-fced89b7f2bb@arm.com>
 <20210330101314.GC18075@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <98894641-8344-4d69-0c33-41eb73f5adf3@arm.com>
Date: Wed, 31 Mar 2021 11:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330101314.GC18075@arm.com>
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

On 30/03/2021 11:13, Catalin Marinas wrote:
> On Mon, Mar 29, 2021 at 04:55:29PM +0100, Steven Price wrote:
>> On 26/03/2021 18:56, Catalin Marinas wrote:
>>> On Fri, Mar 12, 2021 at 03:18:57PM +0000, Steven Price wrote:
>>>> A KVM guest could store tags in a page even if the VMM hasn't mapped
>>>> the page with PROT_MTE. So when restoring pages from swap we will
>>>> need to check to see if there are any saved tags even if !pte_tagged().
>>>>
>>>> However don't check pages which are !pte_valid_user() as these will
>>>> not have been swapped out.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>>    arch/arm64/include/asm/pgtable.h |  2 +-
>>>>    arch/arm64/kernel/mte.c          | 16 ++++++++++++----
>>>>    2 files changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>>> index e17b96d0e4b5..84166625c989 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>>>    		__sync_icache_dcache(pte);
>>>>    	if (system_supports_mte() &&
>>>> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
>>>> +	    pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
>>>>    		mte_sync_tags(ptep, pte);
>>>
>>> With the EPAN patches queued in for-next/epan, pte_valid_user()
>>> disappeared as its semantics weren't very clear.
>>
>> Thanks for pointing that out.
>>
>>> So this relies on the set_pte_at() being done on the VMM address space.
>>> I wonder, if the VMM did an mprotect(PROT_NONE), can the VM still access
>>> it via stage 2? If yes, the pte_valid_user() test wouldn't work. We need
>>> something like pte_present() && addr <= user_addr_max().
>>
>> AFAIUI the stage 2 matches the VMM's address space (for the subset that has
>> memslots). So mprotect(PROT_NONE) would cause the stage 2 mapping to be
>> invalidated and a subsequent fault would exit to the VMM to sort out. This
>> sort of thing is done for the lazy migration use case (i.e. pages are
>> fetched as the VM tries to access them).
> 
> There's also the protected KVM case which IIUC wouldn't provide any
> mapping of the guest memory to the host (or maybe the host still thinks
> it's there but cannot access it without a Stage 2 fault). At least in
> this case it wouldn't swap pages out and it would be the responsibility
> of the EL2 code to clear the tags when giving pages to the guest
> (user_mem_abort() must not touch the page).
> 
> So basically we either have a valid, accessible mapping in the VMM and
> we can handle the tags via set_pte_at() or we leave it to whatever is
> running at EL2 in the pKVM case.

For the pKVM case it's up to the EL2 code to hand over suitably scrubbed 
pages to the guest, and the host doesn't have access to the pages so we 
(currently) don't have to worry about swap. If swap get implemented it 
will presumably be up to the EL2 code to package up both the normal data 
and the MTE tags into an encrypted bundle for the host to stash somewhere.

> I don't remember whether we had a clear conclusion in the past: have we
> ruled out requiring the VMM to map the guest memory with PROT_MTE
> entirely? IIRC a potential problem was the VMM using MTE itself and
> having to disable it when accessing the guest memory.

Yes, there are some ugly corner cases if we require the VMM to map with 
PROT_MTE. Hence patch 5 - an ioctl to allow the VMM to access the tags 
without having to maintain a PROT_MTE mapping.

> Another potential issue (I haven't got my head around it yet) is a race
> in mte_sync_tags() as we now defer the PG_mte_tagged bit setting until
> after the tags had been restored. Can we have the same page mapped by
> two ptes, each attempting to restore it from swap and one gets it first
> and starts modifying it? Given that we set the actual pte after setting
> PG_mte_tagged, it's probably alright but I think we miss some barriers.

I'm not sure if I've got my head round this one yet either, but you 
could be right there's a race. This exists without these patches:

CPU 1                    |  CPU 2
-------------------------+-----------------
set_pte_at()             |
--> mte_sync_tags()      |
--> test_and_set_bit()   |
--> mte_sync_page_tags() | set_pte_at()
    [stalls/sleeps]       | --> mte_sync_tags()
                          | --> test_and_set_bit()
                          |     [already set by CPU 1]
                          | set_pte()
                          | [sees stale tags]
    [eventually wakes up  |
     and sets tags]       |

What I'm struggling to get my head around is whether there's always a 
sufficient lock held during the call to set_pte_at() to avoid the above. 
I suspect not because the two calls could be in completely separate 
processes.

We potentially could stick a lock_page()/unlock_page() sequence in 
mte_sync_tags(). I just ran a basic test and didn't hit problems with 
that. Any thoughts?

> Also, if a page is not a swap one, we currently clear the tags if mapped
> as pte_tagged() (prior to this patch). We'd need something similar when
> mapping it in the guest so that we don't leak tags but to avoid any page
> ending up with PG_mte_tagged, I think you moved the tag clearing to
> user_mem_abort() in the KVM code. I presume set_pte_at() in the VMM
> would be called first and then set in Stage 2.

Yes - KVM will perform the equivalent of get_user_pages() before setting 
the entry in Stage 2, that should end up performing any set_pte_at() 
calls to populate the VMM's page tables. So the VMM 'sees' the memory 
before stage 2.

>>> BTW, ignoring virtualisation, can we ever bring a page in from swap on a
>>> PROT_NONE mapping (say fault-around)? It's not too bad if we keep the
>>> metadata around for when the pte becomes accessible but I suspect we
>>> remove it if the page is removed from swap.
>>
>> There are two stages of bringing data from swap. First is populating the
>> swap cache by doing the physical read from swap. The second is actually
>> restoring the page table entries.
> 
> When is the page metadata removed? I want to make sure we don't drop it
> for some pte attributes.

The tag metadata for swapped pages lives for the same length of time as 
the swap metadata itself. The swap code already makes sure that the 
metadata hangs around as long as there are any swap PTEs in existence, 
so I think everything should be fine here. The 
arch_swap_invalidate_xxx() calls match up with the frontswap calls as it 
has the same lifetime requirements.

Steve

