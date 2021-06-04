Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7973939B748
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:43:53 +0200 (CEST)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7Iu-00088o-Ei
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lp7HV-0005jU-EL
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:42:25 -0400
Received: from foss.arm.com ([217.140.110.172]:56570)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lp7HR-00016c-UR
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:42:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF7C312FC;
 Fri,  4 Jun 2021 03:42:18 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4917C3F73D;
 Fri,  4 Jun 2021 03:42:16 -0700 (PDT)
Subject: Re: [PATCH v13 4/8] KVM: arm64: Introduce MTE VM feature
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210524104513.13258-1-steven.price@arm.com>
 <20210524104513.13258-5-steven.price@arm.com>
 <20210603160031.GE20338@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a0810f3b-4f13-e8b5-7057-a9de1201887a@arm.com>
Date: Fri, 4 Jun 2021 11:42:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603160031.GE20338@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.603,
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

On 03/06/2021 17:00, Catalin Marinas wrote:
> On Mon, May 24, 2021 at 11:45:09AM +0100, Steven Price wrote:
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index c5d1f3c87dbd..226035cf7d6c 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -822,6 +822,42 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
>>  	return PAGE_SIZE;
>>  }
>>  
>> +static int sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
>> +			     unsigned long size)
>> +{
>> +	if (kvm_has_mte(kvm)) {
> 
> Nitpick (less indentation):
> 
> 	if (!kvm_has_mte(kvm))
> 		return 0;

Thanks, will change.

>> +		/*
>> +		 * The page will be mapped in stage 2 as Normal Cacheable, so
>> +		 * the VM will be able to see the page's tags and therefore
>> +		 * they must be initialised first. If PG_mte_tagged is set,
>> +		 * tags have already been initialised.
>> +		 * pfn_to_online_page() is used to reject ZONE_DEVICE pages
>> +		 * that may not support tags.
>> +		 */
>> +		unsigned long i, nr_pages = size >> PAGE_SHIFT;
>> +		struct page *page = pfn_to_online_page(pfn);
>> +
>> +		if (!page)
>> +			return -EFAULT;
>> +
>> +		for (i = 0; i < nr_pages; i++, page++) {
>> +			/*
>> +			 * There is a potential (but very unlikely) race
>> +			 * between two VMs which are sharing a physical page
>> +			 * entering this at the same time. However by splitting
>> +			 * the test/set the only risk is tags being overwritten
>> +			 * by the mte_clear_page_tags() call.
>> +			 */
> 
> And I think the real risk here is when the page is writable by at least
> one of the VMs sharing the page. This excludes KSM, so it only leaves
> the MAP_SHARED mappings.
> 
>> +			if (!test_bit(PG_mte_tagged, &page->flags)) {
>> +				mte_clear_page_tags(page_address(page));
>> +				set_bit(PG_mte_tagged, &page->flags);
>> +			}
>> +		}
> 
> If we want to cover this race (I'd say in a separate patch), we can call
> mte_sync_page_tags(page, __pte(0), false, true) directly (hopefully I
> got the arguments right). We can avoid the big lock in most cases if
> kvm_arch_prepare_memory_region() sets a VM_MTE_RESET (tag clear etc.)
> and __alloc_zeroed_user_highpage() clears the tags on allocation (as we
> do for VM_MTE but the new flag would not affect the stage 1 VMM page
> attributes).

To be honest I'm coming round to just exporting a
mte_prepare_page_tags() function which does the clear/set with the lock
held. I doubt it's such a performance critical path that it will cause
any noticeable issues. Then if we run into performance problems in the
future we can start experimenting with extra VM flags etc as necessary.

And from your later email:
> Another idea: if VM_SHARED is found for any vma within a region in
> kvm_arch_prepare_memory_region(), we either prevent the enabling of MTE
> for the guest or reject the memory slot if MTE was already enabled.
> 
> An alternative here would be to clear VM_MTE_ALLOWED so that any
> subsequent mprotect(PROT_MTE) in the VMM would fail in
> arch_validate_flags(). MTE would still be allowed in the guest but in
> the VMM for the guest memory regions. We can probably do this
> irrespective of VM_SHARED. Of course, the VMM can still mmap() the
> memory initially with PROT_MTE but that's not an issue IIRC, only the
> concurrent mprotect().

This could work, but I worry that it's potential fragile. Also the rules
for what user space can do are not obvious and may be surprising. I'd
also want to look into the likes of mremap() to see how easy it would be
to ensure that we couldn't end up with VM_SHARED (or VM_MTE_ALLOWED)
memory sneaking into a memslot.

Unless you think it's worth complicating the ABI in the hope of avoiding
the big lock overhead I think it's probably best to stick with the big
lock at least until we have more data on the overhead.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  			  struct kvm_memory_slot *memslot, unsigned long hva,
>>  			  unsigned long fault_status)
>> @@ -971,8 +1007,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  	if (writable)
>>  		prot |= KVM_PGTABLE_PROT_W;
>>  
>> -	if (fault_status != FSC_PERM && !device)
>> +	if (fault_status != FSC_PERM && !device) {
>> +		ret = sanitise_mte_tags(kvm, pfn, vma_pagesize);
>> +		if (ret)
>> +			goto out_unlock;
> 
> Maybe it was discussed in a previous version, why do we need this in
> addition to kvm_set_spte_gfn()?

kvm_set_spte_gfn() is only used for the MMU notifier path (e.g. if a
memslot is changed by the VMM). For the initial access we will normally
fault the page into stage 2 with user_mem_abort().

>> +
>>  		clean_dcache_guest_page(pfn, vma_pagesize);
>> +	}
>>  
>>  	if (exec_fault) {
>>  		prot |= KVM_PGTABLE_PROT_X;
>> @@ -1168,12 +1209,17 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>>  {
>>  	kvm_pfn_t pfn = pte_pfn(range->pte);
>> +	int ret;
>>  
>>  	if (!kvm->arch.mmu.pgt)
>>  		return 0;
>>  
>>  	WARN_ON(range->end - range->start != 1);
>>  
>> +	ret = sanitise_mte_tags(kvm, pfn, PAGE_SIZE);
>> +	if (ret)
>> +		return false;
>> +
>>  	/*
>>  	 * We've moved a page around, probably through CoW, so let's treat it
>>  	 * just like a translation fault and clean the cache to the PoC.
> 
> Otherwise the patch looks fine.
> 

Thanks for the review.

Steve

