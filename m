Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F63340D8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:55:32 +0100 (CET)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0FH-0000fj-L4
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lK0C2-0007cB-9i
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:52:10 -0500
Received: from foss.arm.com ([217.140.110.172]:40516)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lK0By-0004on-KJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:52:08 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E28E731B;
 Wed, 10 Mar 2021 06:52:03 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43E663F793;
 Wed, 10 Mar 2021 06:52:01 -0800 (PST)
Subject: Re: [PATCH v9 2/6] arm64: kvm: Introduce MTE VM feature
To: Marc Zyngier <maz@kernel.org>
References: <20210301142315.30920-1-steven.price@arm.com>
 <20210301142315.30920-3-steven.price@arm.com> <87im60xnn4.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <c8478448-7717-d9ac-de0f-e9574f0c7006@arm.com>
Date: Wed, 10 Mar 2021 14:52:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87im60xnn4.wl-maz@kernel.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 17:06, Marc Zyngier wrote:
> On Mon, 01 Mar 2021 14:23:11 +0000,
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
>>   arch/arm64/include/asm/kvm_emulate.h |  3 +++
>>   arch/arm64/include/asm/kvm_host.h    |  3 +++
>>   arch/arm64/kvm/hyp/exception.c       |  3 ++-
>>   arch/arm64/kvm/mmu.c                 | 16 ++++++++++++++++
>>   arch/arm64/kvm/sys_regs.c            |  3 ++-
>>   include/uapi/linux/kvm.h             |  1 +
>>   6 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
>> index f612c090f2e4..6bf776c2399c 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -84,6 +84,9 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>>   	if (cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
>>   	    vcpu_el1_is_32bit(vcpu))
>>   		vcpu->arch.hcr_el2 |= HCR_TID2;
>> +
>> +	if (kvm_has_mte(vcpu->kvm))
>> +		vcpu->arch.hcr_el2 |= HCR_ATA;
>>   }
>>   
>>   static inline unsigned long *vcpu_hcr(struct kvm_vcpu *vcpu)
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 3d10e6527f7d..1170ee137096 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -132,6 +132,8 @@ struct kvm_arch {
>>   
>>   	u8 pfr0_csv2;
>>   	u8 pfr0_csv3;
>> +	/* Memory Tagging Extension enabled for the guest */
>> +	bool mte_enabled;
>>   };
>>   
>>   struct kvm_vcpu_fault_info {
>> @@ -767,6 +769,7 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>>   #define kvm_arm_vcpu_sve_finalized(vcpu) \
>>   	((vcpu)->arch.flags & KVM_ARM64_VCPU_SVE_FINALIZED)
>>   
>> +#define kvm_has_mte(kvm) (system_supports_mte() && (kvm)->arch.mte_enabled)
>>   #define kvm_vcpu_has_pmu(vcpu)					\
>>   	(test_bit(KVM_ARM_VCPU_PMU_V3, (vcpu)->arch.features))
>>   
>> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
>> index 73629094f903..56426565600c 100644
>> --- a/arch/arm64/kvm/hyp/exception.c
>> +++ b/arch/arm64/kvm/hyp/exception.c
>> @@ -112,7 +112,8 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>>   	new |= (old & PSR_C_BIT);
>>   	new |= (old & PSR_V_BIT);
>>   
>> -	// TODO: TCO (if/when ARMv8.5-MemTag is exposed to guests)
>> +	if (kvm_has_mte(vcpu->kvm))
>> +		new |= PSR_TCO_BIT;
>>   
>>   	new |= (old & PSR_DIT_BIT);
>>   
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 77cb2d28f2a4..fdb6ab604fd0 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -879,6 +879,22 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>   	if (vma_pagesize == PAGE_SIZE && !force_pte)
>>   		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
>>   							   &pfn, &fault_ipa);
>> +
>> +	if (kvm_has_mte(kvm) && pfn_valid(pfn)) {
>> +		/*
>> +		 * VM will be able to see the page's tags, so we must ensure
>> +		 * they have been initialised. if PG_mte_tagged is set, tags
>> +		 * have already been initialised.
>> +		 */
>> +		struct page *page = pfn_to_page(pfn);
>> +		unsigned long i, nr_pages = vma_pagesize >> PAGE_SHIFT;
>> +
>> +		for (i = 0; i < nr_pages; i++, page++) {
>> +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
>> +				mte_clear_page_tags(page_address(page));
>> +		}
>> +	}
> 
> Is there any reason to do this dance for anything but a translation
> fault?

Good point I guess this should have a (fault_status != FSC_PERM) in the 
test to match the other paths.

>> +
>>   	if (writable)
>>   		prot |= KVM_PGTABLE_PROT_W;
>>   
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 4f2f1e3145de..e09dbc00b0a2 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -1046,7 +1046,8 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
>>   		val |= FIELD_PREP(FEATURE(ID_AA64PFR0_CSV3), (u64)vcpu->kvm->arch.pfr0_csv3);
>>   		break;
>>   	case SYS_ID_AA64PFR1_EL1:
>> -		val &= ~FEATURE(ID_AA64PFR1_MTE);
>> +		if (!kvm_has_mte(vcpu->kvm))
>> +			val &= ~FEATURE(ID_AA64PFR1_MTE);
> 
> Are we happy to expose *any* of the MTE flavours? Or should we
> restrict it in any way?

Another good point - it would make sense to restrict this in case 
another MTE flavour is invented.

Thanks,

Steve

>>   		break;
>>   	case SYS_ID_AA64ISAR1_EL1:
>>   		if (!vcpu_has_ptrauth(vcpu))
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 8b281f722e5b..05618a4abf7e 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -1078,6 +1078,7 @@ struct kvm_ppc_resize_hpt {
>>   #define KVM_CAP_DIRTY_LOG_RING 192
>>   #define KVM_CAP_X86_BUS_LOCK_EXIT 193
>>   #define KVM_CAP_PPC_DAWR1 194
>> +#define KVM_CAP_ARM_MTE 195
>>   
>>   #ifdef KVM_CAP_IRQ_ROUTING
>>   
>> -- 
>> 2.20.1
>>
>>
> 
> Thanks,
> 
> 	M.
> 


