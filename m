Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE134D45A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:56:39 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuFp-0004tu-V4
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lQuEz-0004Cn-9s
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:55:45 -0400
Received: from foss.arm.com ([217.140.110.172]:48770)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lQuEo-0004rX-LO
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:55:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0F36142F;
 Mon, 29 Mar 2021 08:55:30 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAA313F719;
 Mon, 29 Mar 2021 08:55:27 -0700 (PDT)
Subject: Re: [PATCH v10 1/6] arm64: mte: Sync tags for pages where PTE is
 untagged
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210312151902.17853-1-steven.price@arm.com>
 <20210312151902.17853-2-steven.price@arm.com> <20210326185653.GG5126@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <21842e4d-7935-077c-3d6f-fced89b7f2bb@arm.com>
Date: Mon, 29 Mar 2021 16:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326185653.GG5126@arm.com>
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

On 26/03/2021 18:56, Catalin Marinas wrote:
> Hi Steven,
> 
> On Fri, Mar 12, 2021 at 03:18:57PM +0000, Steven Price wrote:
>> A KVM guest could store tags in a page even if the VMM hasn't mapped
>> the page with PROT_MTE. So when restoring pages from swap we will
>> need to check to see if there are any saved tags even if !pte_tagged().
>>
>> However don't check pages which are !pte_valid_user() as these will
>> not have been swapped out.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h |  2 +-
>>   arch/arm64/kernel/mte.c          | 16 ++++++++++++----
>>   2 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index e17b96d0e4b5..84166625c989 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>   		__sync_icache_dcache(pte);
>>   
>>   	if (system_supports_mte() &&
>> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
>> +	    pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
>>   		mte_sync_tags(ptep, pte);
> 
> With the EPAN patches queued in for-next/epan, pte_valid_user()
> disappeared as its semantics weren't very clear.

Thanks for pointing that out.

> So this relies on the set_pte_at() being done on the VMM address space.
> I wonder, if the VMM did an mprotect(PROT_NONE), can the VM still access
> it via stage 2? If yes, the pte_valid_user() test wouldn't work. We need
> something like pte_present() && addr <= user_addr_max().

AFAIUI the stage 2 matches the VMM's address space (for the subset that 
has memslots). So mprotect(PROT_NONE) would cause the stage 2 mapping to 
be invalidated and a subsequent fault would exit to the VMM to sort out. 
This sort of thing is done for the lazy migration use case (i.e. pages 
are fetched as the VM tries to access them).

> BTW, ignoring virtualisation, can we ever bring a page in from swap on a
> PROT_NONE mapping (say fault-around)? It's not too bad if we keep the
> metadata around for when the pte becomes accessible but I suspect we
> remove it if the page is removed from swap.

There are two stages of bringing data from swap. First is populating the 
swap cache by doing the physical read from swap. The second is actually 
restoring the page table entries.

Clearly the first part can happen even with PROT_NONE (the simple case 
is there's another mapping which is !PROT_NONE).

For the second I'm a little hazy on exactly what happens when you do a 
'swapoff' - that may cause a page to be re-inserted into a page table 
without a fault. If you follow the chain down from try_to_unuse() you 
end up at a call to set_pte_at(). So we need set_pte_at() to handle a 
PROT_NONE mapping. So I guess the test we really want here is just 
(pte_val() & PTE_USER).

Steve

