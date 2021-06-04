Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F390B39B996
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:12:16 +0200 (CEST)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp9cW-0005dY-3Y
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lp9aO-00031T-Hv
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:10:04 -0400
Received: from foss.arm.com ([217.140.110.172]:59606)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lp9aH-0006ax-Ka
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:10:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72B462B;
 Fri,  4 Jun 2021 06:09:55 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA0CD3F774;
 Fri,  4 Jun 2021 06:09:52 -0700 (PDT)
Subject: Re: [PATCH v13 7/8] KVM: arm64: ioctl to fetch/store tags in a guest
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210524104513.13258-1-steven.price@arm.com>
 <20210524104513.13258-8-steven.price@arm.com>
 <20210603171336.GH20338@arm.com>
 <02c7682e-5fb6-29eb-9105-02e3521756a2@arm.com>
 <20210604114233.GE31173@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b3c869e3-b693-5e3f-3748-1c62b01e9b22@arm.com>
Date: Fri, 4 Jun 2021 14:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604114233.GE31173@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
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

On 04/06/2021 12:42, Catalin Marinas wrote:
> On Fri, Jun 04, 2021 at 12:15:56PM +0100, Steven Price wrote:
>> On 03/06/2021 18:13, Catalin Marinas wrote:
>>> On Mon, May 24, 2021 at 11:45:12AM +0100, Steven Price wrote:
>>>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
>>>> index 24223adae150..b3edde68bc3e 100644
>>>> --- a/arch/arm64/include/uapi/asm/kvm.h
>>>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>>>> @@ -184,6 +184,17 @@ struct kvm_vcpu_events {
>>>>  	__u32 reserved[12];
>>>>  };
>>>>  
>>>> +struct kvm_arm_copy_mte_tags {
>>>> +	__u64 guest_ipa;
>>>> +	__u64 length;
>>>> +	void __user *addr;
>>>> +	__u64 flags;
>>>> +	__u64 reserved[2];
>>>> +};
>>>> +
>>>> +#define KVM_ARM_TAGS_TO_GUEST		0
>>>> +#define KVM_ARM_TAGS_FROM_GUEST		1
>>>> +
>>>>  /* If you need to interpret the index values, here is the key: */
>>>>  #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
>>>>  #define KVM_REG_ARM_COPROC_SHIFT	16
>>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>>> index e89a5e275e25..baa33359e477 100644
>>>> --- a/arch/arm64/kvm/arm.c
>>>> +++ b/arch/arm64/kvm/arm.c
>>>> @@ -1345,6 +1345,13 @@ long kvm_arch_vm_ioctl(struct file *filp,
>>>>  
>>>>  		return 0;
>>>>  	}
>>>> +	case KVM_ARM_MTE_COPY_TAGS: {
>>>> +		struct kvm_arm_copy_mte_tags copy_tags;
>>>> +
>>>> +		if (copy_from_user(&copy_tags, argp, sizeof(copy_tags)))
>>>> +			return -EFAULT;
>>>> +		return kvm_vm_ioctl_mte_copy_tags(kvm, &copy_tags);
>>>> +	}
>>>
>>> I wonder whether we need an update of the user structure following a
>>> fault, like how much was copied etc. In case of an error, some tags were
>>> copied and the VMM may want to skip the page before continuing. But here
>>> there's no such information provided.
>>>
>>> On the ptrace interface, we return 0 on the syscall if any bytes were
>>> copied and update iov_len to such number. Maybe you want to still return
>>> an error here but updating copy_tags.length would be nice (and, of
>>> course, a copy_to_user() back).
>>
>> Good idea - as you suggest I'll make it update length with the number of
>> bytes not processed. Although in general I think we're expecting the VMM
>> to know where the memory is so this is more of a programming error - but
>> could still be useful for debugging.
> 
> Or update it to the number of bytes copied to be consistent with
> ptrace()'s iov.len. On success, the structure is effectively left
> unchanged.

I was avoiding that because it confuses the error code when the initial
copy_from_user() fails. In that case the structure is clearly unchanged,
so you can only tell from a -EFAULT return that nothing happened. By
returning the number of bytes left you can return an error code along
with the information that the copy only half completed.

It also seems cleaner to leave the structure unchanged if e.g. the flags
or reserved fields are invalid rather than having to set length=0 to
signal that nothing was done.

Although I do feel like arguing whether to use a ptrace() interface or a
copy_{to,from}_user() interface is somewhat ridiculous considering
neither are exactly considered good.

Rather than changing the structure we could return either an error code
(if nothing was copied) or the number of bytes left. That way ioctl()==0
means complete success, >0 means partial success and <0 means complete
failure and provides a detailed error code. The ioctl() can be repeated
(with adjusted pointers) if it returns >0 and a detailed error is needed.

Steve

