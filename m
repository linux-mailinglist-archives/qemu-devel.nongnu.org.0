Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C411038AD98
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 14:07:20 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljhSR-0004kX-Bg
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 08:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljhRI-0003yD-Mq
 for qemu-devel@nongnu.org; Thu, 20 May 2021 08:06:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljhRD-0005EI-JJ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 08:06:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07E1661059;
 Thu, 20 May 2021 12:05:58 +0000 (UTC)
Date: Thu, 20 May 2021 13:05:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 7/8] KVM: arm64: ioctl to fetch/store tags in a guest
Message-ID: <20210520120556.GC12251@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-8-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517123239.8025-8-steven.price@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, May 17, 2021 at 01:32:38PM +0100, Steven Price wrote:
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 24223adae150..b3edde68bc3e 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -184,6 +184,17 @@ struct kvm_vcpu_events {
>  	__u32 reserved[12];
>  };
>  
> +struct kvm_arm_copy_mte_tags {
> +	__u64 guest_ipa;
> +	__u64 length;
> +	void __user *addr;
> +	__u64 flags;
> +	__u64 reserved[2];

I forgot the past discussions, what's the reserved for? Future
expansion?

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index e89a5e275e25..4b6c83beb75d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1309,6 +1309,65 @@ static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
>  	}
>  }
>  
> +static int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> +				      struct kvm_arm_copy_mte_tags *copy_tags)
> +{
> +	gpa_t guest_ipa = copy_tags->guest_ipa;
> +	size_t length = copy_tags->length;
> +	void __user *tags = copy_tags->addr;
> +	gpa_t gfn;
> +	bool write = !(copy_tags->flags & KVM_ARM_TAGS_FROM_GUEST);
> +	int ret = 0;
> +
> +	if (copy_tags->reserved[0] || copy_tags->reserved[1])
> +		return -EINVAL;
> +
> +	if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
> +		return -EINVAL;
> +
> +	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
> +		return -EINVAL;
> +
> +	gfn = gpa_to_gfn(guest_ipa);
> +
> +	mutex_lock(&kvm->slots_lock);
> +
> +	while (length > 0) {
> +		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
> +		void *maddr;
> +		unsigned long num_tags = PAGE_SIZE / MTE_GRANULE_SIZE;
> +
> +		if (is_error_noslot_pfn(pfn)) {
> +			ret = -EFAULT;
> +			goto out;
> +		}
> +
> +		maddr = page_address(pfn_to_page(pfn));
> +
> +		if (!write) {
> +			num_tags = mte_copy_tags_to_user(tags, maddr, num_tags);
> +			kvm_release_pfn_clean(pfn);

Do we need to check if PG_mte_tagged is set? If the page was not faulted
into the guest address space but the VMM has the page, does the
gfn_to_pfn_prot() guarantee that a kvm_set_spte_gfn() was called? If
not, this may read stale tags.

> +		} else {
> +			num_tags = mte_copy_tags_from_user(maddr, tags,
> +							   num_tags);
> +			kvm_release_pfn_dirty(pfn);
> +		}

Same question here, if the we can't guarantee the stage 2 pte being set,
we'd need to set PG_mte_tagged.

> +
> +		if (num_tags != PAGE_SIZE / MTE_GRANULE_SIZE) {
> +			ret = -EFAULT;
> +			goto out;
> +		}
> +
> +		gfn++;
> +		tags += num_tags;
> +		length -= PAGE_SIZE;
> +	}
> +
> +out:
> +	mutex_unlock(&kvm->slots_lock);
> +	return ret;
> +}
> +

-- 
Catalin

