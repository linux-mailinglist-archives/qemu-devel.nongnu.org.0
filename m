Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D43B305B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 15:44:11 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwPeM-0000Tz-Cf
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lwPdL-0008EN-Rx
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 09:43:07 -0400
Received: from foss.arm.com ([217.140.110.172]:50354)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lwPdG-00032m-86
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 09:43:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B519ED1;
 Thu, 24 Jun 2021 06:43:00 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE6453F882;
 Thu, 24 Jun 2021 06:42:57 -0700 (PDT)
Subject: Re: [PATCH v17 5/6] KVM: arm64: ioctl to fetch/store tags in a guest
To: Marc Zyngier <maz@kernel.org>
References: <20210621111716.37157-1-steven.price@arm.com>
 <20210621111716.37157-6-steven.price@arm.com> <87k0mjidwb.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <b5666753-0ea5-c6e9-766a-0eac2dad08a2@arm.com>
Date: Thu, 24 Jun 2021 14:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87k0mjidwb.wl-maz@kernel.org>
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

On 24/06/2021 14:35, Marc Zyngier wrote:
> Hi Steven,
> 
> On Mon, 21 Jun 2021 12:17:15 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> The VMM may not wish to have it's own mapping of guest memory mapped
>> with PROT_MTE because this causes problems if the VMM has tag checking
>> enabled (the guest controls the tags in physical RAM and it's unlikely
>> the tags are correct for the VMM).
>>
>> Instead add a new ioctl which allows the VMM to easily read/write the
>> tags from guest memory, allowing the VMM's mapping to be non-PROT_MTE
>> while the VMM can still read/write the tags for the purpose of
>> migration.
>>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/arm64/include/asm/kvm_host.h |  3 ++
>>  arch/arm64/include/asm/mte-def.h  |  1 +
>>  arch/arm64/include/uapi/asm/kvm.h | 11 +++++
>>  arch/arm64/kvm/arm.c              |  7 +++
>>  arch/arm64/kvm/guest.c            | 82 +++++++++++++++++++++++++++++++
>>  include/uapi/linux/kvm.h          |  1 +
>>  6 files changed, 105 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 309e36cc1b42..6a2ac4636d42 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -729,6 +729,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>>  int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>  			       struct kvm_device_attr *attr);
>>  
>> +long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> +				struct kvm_arm_copy_mte_tags *copy_tags);
>> +
>>  /* Guest/host FPSIMD coordination helpers */
>>  int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
>>  void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu);
>> diff --git a/arch/arm64/include/asm/mte-def.h b/arch/arm64/include/asm/mte-def.h
>> index cf241b0f0a42..626d359b396e 100644
>> --- a/arch/arm64/include/asm/mte-def.h
>> +++ b/arch/arm64/include/asm/mte-def.h
>> @@ -7,6 +7,7 @@
>>  
>>  #define MTE_GRANULE_SIZE	UL(16)
>>  #define MTE_GRANULE_MASK	(~(MTE_GRANULE_SIZE - 1))
>> +#define MTE_GRANULES_PER_PAGE	(PAGE_SIZE / MTE_GRANULE_SIZE)
>>  #define MTE_TAG_SHIFT		56
>>  #define MTE_TAG_SIZE		4
>>  #define MTE_TAG_MASK		GENMASK((MTE_TAG_SHIFT + (MTE_TAG_SIZE - 1)), MTE_TAG_SHIFT)
>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
>> index 24223adae150..b3edde68bc3e 100644
>> --- a/arch/arm64/include/uapi/asm/kvm.h
>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>> @@ -184,6 +184,17 @@ struct kvm_vcpu_events {
>>  	__u32 reserved[12];
>>  };
>>  
>> +struct kvm_arm_copy_mte_tags {
>> +	__u64 guest_ipa;
>> +	__u64 length;
>> +	void __user *addr;
>> +	__u64 flags;
>> +	__u64 reserved[2];
>> +};
>> +
>> +#define KVM_ARM_TAGS_TO_GUEST		0
>> +#define KVM_ARM_TAGS_FROM_GUEST		1
>> +
>>  /* If you need to interpret the index values, here is the key: */
>>  #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
>>  #define KVM_REG_ARM_COPROC_SHIFT	16
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 28ce26a68f09..511f3716fe33 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -1359,6 +1359,13 @@ long kvm_arch_vm_ioctl(struct file *filp,
>>  
>>  		return 0;
>>  	}
>> +	case KVM_ARM_MTE_COPY_TAGS: {
>> +		struct kvm_arm_copy_mte_tags copy_tags;
>> +
>> +		if (copy_from_user(&copy_tags, argp, sizeof(copy_tags)))
>> +			return -EFAULT;
>> +		return kvm_vm_ioctl_mte_copy_tags(kvm, &copy_tags);
>> +	}
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index 5cb4a1cd5603..4ddb20017b2f 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -995,3 +995,85 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>  
>>  	return ret;
>>  }
>> +
>> +long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> +				struct kvm_arm_copy_mte_tags *copy_tags)
>> +{
>> +	gpa_t guest_ipa = copy_tags->guest_ipa;
>> +	size_t length = copy_tags->length;
>> +	void __user *tags = copy_tags->addr;
>> +	gpa_t gfn;
>> +	bool write = !(copy_tags->flags & KVM_ARM_TAGS_FROM_GUEST);
>> +	int ret = 0;
>> +
>> +	if (!kvm_has_mte(kvm))
>> +		return -EINVAL;
>> +
>> +	if (copy_tags->reserved[0] || copy_tags->reserved[1])
>> +		return -EINVAL;
>> +
>> +	if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
>> +		return -EINVAL;
>> +
>> +	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
>> +		return -EINVAL;
>> +
>> +	gfn = gpa_to_gfn(guest_ipa);
>> +
>> +	mutex_lock(&kvm->slots_lock);
>> +
>> +	while (length > 0) {
>> +		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
>> +		void *maddr;
>> +		unsigned long num_tags;
>> +		struct page *page;
>> +
>> +		if (is_error_noslot_pfn(pfn)) {
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>> +
>> +		page = pfn_to_online_page(pfn);
>> +		if (!page) {
>> +			/* Reject ZONE_DEVICE memory */
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>> +		maddr = page_address(page);
>> +
>> +		if (!write) {
>> +			if (test_bit(PG_mte_tagged, &page->flags))
>> +				num_tags = mte_copy_tags_to_user(tags, maddr,
>> +							MTE_GRANULES_PER_PAGE);
>> +			else
>> +				/* No tags in memory, so write zeros */
>> +				num_tags = MTE_GRANULES_PER_PAGE -
>> +					clear_user(tags, MTE_GRANULES_PER_PAGE);
>> +			kvm_release_pfn_clean(pfn);
>> +		} else {
>> +			num_tags = mte_copy_tags_from_user(maddr, tags,
>> +							MTE_GRANULES_PER_PAGE);
>> +			kvm_release_pfn_dirty(pfn);
>> +		}
>> +
>> +		if (num_tags != MTE_GRANULES_PER_PAGE) {
>> +			ret = -EFAULT;
>> +			goto out;
>> +		}
>> +
>> +		/* Set the flag after checking the write completed fully */
>> +		if (write)
>> +			set_bit(PG_mte_tagged, &page->flags);
> 
> This ended up catching my eye as I was merging some other patches.
> 
> This set_bit() occurs *after* the page has been released, meaning it
> could have been evicted and reused in the interval. I plan to fix it
> as below. Please let me know if that works for you.
> 
> Thanks,
> 
> 	M.
> 
> From a78d3206378a7101659fbc2a4bf01cb9376c4793 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Thu, 24 Jun 2021 14:21:05 +0100
> Subject: [PATCH] KVM: arm64: Set the MTE tag bit before releasing the page
> 
> Setting a page flag without holding a reference to the page
> is living dangerously. In the tag-writing path, we drop the
> reference to the page by calling kvm_release_pfn_dirty(),
> and only then set the PG_mte_tagged bit.
> 
> It would be safer to do it the other way round.
> 
> Fixes: f0376edb1ddca ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> Cc: Steven Price <steven.price@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Well spotted - I'd originally had the set_bit there - but moved it down
when I realised it should only be set if the mte_copy_tags_from_user()
completed successfully. Obviously I hadn't noticed that the page
reference had gone by that point.

Thanks for fixing it. FWIW:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  arch/arm64/kvm/guest.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 4ddb20017b2f..60815ae477cf 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1053,6 +1053,14 @@ long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		} else {
>  			num_tags = mte_copy_tags_from_user(maddr, tags,
>  							MTE_GRANULES_PER_PAGE);
> +
> +			/*
> +			 * Set the flag after checking the write
> +			 * completed fully
> +			 */
> +			if (num_tags == MTE_GRANULES_PER_PAGE)
> +				set_bit(PG_mte_tagged, &page->flags);
> +
>  			kvm_release_pfn_dirty(pfn);
>  		}
>  
> @@ -1061,10 +1069,6 @@ long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  			goto out;
>  		}
>  
> -		/* Set the flag after checking the write completed fully */
> -		if (write)
> -			set_bit(PG_mte_tagged, &page->flags);
> -
>  		gfn++;
>  		tags += num_tags;
>  		length -= PAGE_SIZE;
> 


