Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398738B234
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:49:37 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjzU-0005cE-F0
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljjwx-0000Zw-GS
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:46:59 -0400
Received: from foss.arm.com ([217.140.110.172]:45756)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljjwu-0002Qs-0U
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:46:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1198DED1;
 Thu, 20 May 2021 07:46:52 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11D393F73B;
 Thu, 20 May 2021 07:46:47 -0700 (PDT)
Subject: Re: [PATCH v12 4/8] arm64: kvm: Introduce MTE VM feature
To: Marc Zyngier <maz@kernel.org>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-5-steven.price@arm.com> <87wnrxtikl.wl-maz@kernel.org>
 <60fc8939-36b7-35ce-837c-b69d0d40c9a4@arm.com> <875yzdvldb.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <e44c7782-bf7a-80f5-a8ae-75bbb44649ae@arm.com>
Date: Thu, 20 May 2021 15:46:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875yzdvldb.wl-maz@kernel.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2021 09:51, Marc Zyngier wrote:
> On Wed, 19 May 2021 11:48:21 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> On 17/05/2021 17:45, Marc Zyngier wrote:
>>> On Mon, 17 May 2021 13:32:35 +0100,
>>> Steven Price <steven.price@arm.com> wrote:
[...]
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>>>  			  struct kvm_memory_slot *memslot, unsigned long hva,
>>>>  			  unsigned long fault_status)
>>>> @@ -971,8 +996,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>>>  	if (writable)
>>>>  		prot |= KVM_PGTABLE_PROT_W;
>>>>  
>>>> -	if (fault_status != FSC_PERM && !device)
>>>> +	if (fault_status != FSC_PERM && !device) {
>>>> +		ret = sanitise_mte_tags(kvm, vma_pagesize, pfn);
>>>> +		if (ret)
>>>> +			goto out_unlock;
>>>> +
>>>>  		clean_dcache_guest_page(pfn, vma_pagesize);
>>>> +	}
>>>>  
>>>>  	if (exec_fault) {
>>>>  		prot |= KVM_PGTABLE_PROT_X;
>>>> @@ -1168,12 +1198,17 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>>>>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>>>>  {
>>>>  	kvm_pfn_t pfn = pte_pfn(range->pte);
>>>> +	int ret;
>>>>  
>>>>  	if (!kvm->arch.mmu.pgt)
>>>>  		return 0;
>>>>  
>>>>  	WARN_ON(range->end - range->start != 1);
>>>>  
>>>> +	ret = sanitise_mte_tags(kvm, PAGE_SIZE, pfn);
>>>> +	if (ret)
>>>> +		return ret;
>>>
>>> Notice the change in return type?
>>
>> I do now - I was tricked by the use of '0' as false. Looks like false
>> ('0') is actually the correct return here to avoid an unnecessary
>> kvm_flush_remote_tlbs().
> 
> Yup. BTW, the return values have been fixed to proper boolean types in
> the latest set of fixes.

Thanks for the heads up - I'll return 'false' to avoid regressing that.

>>
>>>> +
>>>>  	/*
>>>>  	 * We've moved a page around, probably through CoW, so let's treat it
>>>>  	 * just like a translation fault and clean the cache to the PoC.
>>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>>> index 76ea2800c33e..24a844cb79ca 100644
>>>> --- a/arch/arm64/kvm/sys_regs.c
>>>> +++ b/arch/arm64/kvm/sys_regs.c
>>>> @@ -1047,6 +1047,9 @@ static u64 read_id_reg(const struct kvm_vcpu *vcpu,
>>>>  		break;
>>>>  	case SYS_ID_AA64PFR1_EL1:
>>>>  		val &= ~FEATURE(ID_AA64PFR1_MTE);
>>>> +		if (kvm_has_mte(vcpu->kvm))
>>>> +			val |= FIELD_PREP(FEATURE(ID_AA64PFR1_MTE),
>>>> +					  ID_AA64PFR1_MTE);
>>>
>>> Shouldn't this be consistent with what the HW is capable of
>>> (i.e. FEAT_MTE3 if available), and extracted from the sanitised view
>>> of the feature set?
>>
>> Yes - however at the moment our sanitised view is either FEAT_MTE2 or
>> nothing:
>>
>> 	{
>> 		.desc = "Memory Tagging Extension",
>> 		.capability = ARM64_MTE,
>> 		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
>> 		.matches = has_cpuid_feature,
>> 		.sys_reg = SYS_ID_AA64PFR1_EL1,
>> 		.field_pos = ID_AA64PFR1_MTE_SHIFT,
>> 		.min_field_value = ID_AA64PFR1_MTE,
>> 		.sign = FTR_UNSIGNED,
>> 		.cpu_enable = cpu_enable_mte,
>> 	},
>>
>> When host support for FEAT_MTE3 is added then the KVM code will need
>> revisiting to expose that down to the guest safely (AFAICS there's
>> nothing extra to do here, but I haven't tested any of the MTE3
>> features). I don't think we want to expose newer versions to the guest
>> than the host is aware of. (Or indeed expose FEAT_MTE if the host has
>> MTE disabled because Linux requires at least FEAT_MTE2).
> 
> What I was suggesting is to have something like this:
> 
>      pfr = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
>      mte = cpuid_feature_extract_unsigned_field(pfr, ID_AA64PFR1_MTE_SHIFT);
>      val |= FIELD_PREP(FEATURE(ID_AA64PFR1_MTE), mte);
> 
> which does the trick nicely, and doesn't expose more than the host
> supports.

Ok, I have to admit to not fully understanding the sanitised register
code - but wouldn't this expose higher MTE values if all CPUs support
it, even though the host doesn't know what a hypothetical 'MTE4' adds?
Or is there some magic in the sanitising that caps the value to what the
host knows about?

Thanks,

Steve

