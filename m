Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795753AE5A5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:08:59 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFvO-0002y5-In
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lvFuX-0002JR-CR
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:08:05 -0400
Received: from foss.arm.com ([217.140.110.172]:52028)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lvFuU-0007j4-8S
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:08:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7B91FB;
 Mon, 21 Jun 2021 02:08:00 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95C723F718;
 Mon, 21 Jun 2021 02:07:57 -0700 (PDT)
Subject: Re: [PATCH v16 3/7] KVM: arm64: Introduce MTE VM feature
To: Marc Zyngier <maz@kernel.org>
References: <20210618132826.54670-1-steven.price@arm.com>
 <20210618132826.54670-4-steven.price@arm.com> <87a6njd22b.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <566f272b-39e3-5da0-6b94-5f992a77adbe@arm.com>
Date: Mon, 21 Jun 2021 10:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6njd22b.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 Andrew Jones <drjones@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 qemu-devel@nongnu.org, Catalin Marinas <catalin.marinas@arm.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/2021 10:01, Marc Zyngier wrote:
> On Fri, 18 Jun 2021 14:28:22 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> Add a new VM feature 'KVM_ARM_CAP_MTE' which enables memory tagging
>> for a VM. This will expose the feature to the guest and automatically
>> tag memory pages touched by the VM as PG_mte_tagged (and clear the tag
>> storage) to ensure that the guest cannot see stale tags, and so that
>> the tags are correctly saved/restored across swap.
>>
>> Actually exposing the new capability to user space happens in a later
>> patch.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/arm64/include/asm/kvm_emulate.h |  3 ++
>>  arch/arm64/include/asm/kvm_host.h    |  3 ++
>>  arch/arm64/kvm/hyp/exception.c       |  3 +-
>>  arch/arm64/kvm/mmu.c                 | 62 +++++++++++++++++++++++++++-
>>  arch/arm64/kvm/sys_regs.c            |  7 ++++
>>  include/uapi/linux/kvm.h             |  1 +
>>  6 files changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
>> index f612c090f2e4..6bf776c2399c 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -84,6 +84,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>>  	if (cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
>>  	    vcpu_el1_is_32bit(vcpu))
>>  		vcpu->arch.hcr_el2 |= HCR_TID2;
>> +
>> +	if (kvm_has_mte(vcpu->kvm))
>> +		vcpu->arch.hcr_el2 |= HCR_ATA;
>>  }
>>  
>>  static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 7cd7d5c8c4bc..afaa5333f0e4 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -132,6 +132,8 @@ struct kvm_arch {
>>  
>>  	u8 pfr0_csv2;
>>  	u8 pfr0_csv3;
>> +	/* Memory Tagging Extension enabled for the guest */
>> +	bool mte_enabled;
>>  };
>>  
>>  struct kvm_vcpu_fault_info {
>> @@ -769,6 +771,7 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>>  #define kvm_arm_vcpu_sve_finalized(vcpu) \
>>  	((vcpu)->arch.flags & KVM_ARM64_VCPU_SVE_FINALIZED)
>>  
>> +#define kvm_has_mte(kvm) (system_supports_mte() && (kvm)->arch.mte_enabled)
>>  #define kvm_vcpu_has_pmu(vcpu)					\
>>  	(test_bit(KVM_ARM_VCPU_PMU_V3, (vcpu)->arch.features))
>>  
>> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
>> index 73629094f903..56426565600c 100644
>> --- a/arch/arm64/kvm/hyp/exception.c
>> +++ b/arch/arm64/kvm/hyp/exception.c
>> @@ -112,7 +112,8 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>>  	new |= (old & PSR_C_BIT);
>>  	new |= (old & PSR_V_BIT);
>>  
>> -	// TODO: TCO (if/when ARMv8.5-MemTag is exposed to guests)
>> +	if (kvm_has_mte(vcpu->kvm))
>> +		new |= PSR_TCO_BIT;
>>  
>>  	new |= (old & PSR_DIT_BIT);
>>  
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index c5d1f3c87dbd..f5305b7561ad 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -822,6 +822,45 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
>>  	return PAGE_SIZE;
>>  }
>>  
>> +/*
>> + * The page will be mapped in stage 2 as Normal Cacheable, so the VM will be
>> + * able to see the page's tags and therefore they must be initialised first. If
>> + * PG_mte_tagged is set, tags have already been initialised.
>> + *
>> + * The race in the test/set of the PG_mte_tagged flag is handled by:
>> + * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
>> + *   racing to santise the same page
>> + * - mmap_lock protects between a VM faulting a page in and the VMM performing
>> + *   an mprotect() to add VM_MTE
>> + */
>> +static int sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
>> +			     unsigned long size)
>> +{
>> +	unsigned long i, nr_pages = size >> PAGE_SHIFT;
>> +	struct page *page;
>> +
>> +	if (!kvm_has_mte(kvm))
>> +		return 0;
>> +
>> +	/*
>> +	 * pfn_to_online_page() is used to reject ZONE_DEVICE pages
>> +	 * that may not support tags.
>> +	 */
>> +	page = pfn_to_online_page(pfn);
>> +
>> +	if (!page)
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < nr_pages; i++, page++) {
>> +		if (!test_bit(PG_mte_tagged, &page->flags)) {
>> +			mte_clear_page_tags(page_address(page));
>> +			set_bit(PG_mte_tagged, &page->flags);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  			  struct kvm_memory_slot *memslot, unsigned long hva,
>>  			  unsigned long fault_status)
>> @@ -971,8 +1010,16 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  	if (writable)
>>  		prot |= KVM_PGTABLE_PROT_W;
>>  
>> -	if (fault_status != FSC_PERM && !device)
>> +	if (fault_status != FSC_PERM && !device) {
>> +		/* Check the VMM hasn't introduced a new VM_SHARED VMA */
>> +		if (kvm_has_mte(kvm) && vma->vm_flags & VM_SHARED)
>> +			return -EINVAL;
> 
> nit: I'd rather we return -EFAULT here. That's consistent with other
> cases where we can't satisfy the mapping.

Sure, and it would be even better if I dropped the lock (goto
out_unlock) - I'll fix that too!

Thanks,

Steve

