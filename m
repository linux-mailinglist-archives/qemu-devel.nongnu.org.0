Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6D38A88E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 12:52:40 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgIB-0000Lt-9J
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 06:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljgHA-00084T-M9
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:51:36 -0400
Received: from foss.arm.com ([217.140.110.172]:38964)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljgH6-0001Xc-9B
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:51:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F182B14FF;
 Thu, 20 May 2021 03:51:28 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4372F3F719;
 Thu, 20 May 2021 03:51:26 -0700 (PDT)
Subject: Re: [PATCH v12 6/8] arm64: kvm: Expose KVM_ARM_CAP_MTE
To: Marc Zyngier <maz@kernel.org>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-7-steven.price@arm.com> <87tun1tg1l.wl-maz@kernel.org>
 <4e1fc7b7-ea8c-a87c-9177-d9e03ff96cb8@arm.com> <8735uhvhqz.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <2dff0e85-abfd-4261-a670-6008ff9195ff@arm.com>
Date: Thu, 20 May 2021 11:51:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8735uhvhqz.wl-maz@kernel.org>
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

On 20/05/2021 11:09, Marc Zyngier wrote:
> On Wed, 19 May 2021 14:26:31 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> On 17/05/2021 18:40, Marc Zyngier wrote:
>>> On Mon, 17 May 2021 13:32:37 +0100,
>>> Steven Price <steven.price@arm.com> wrote:
>>>>
>>>> It's now safe for the VMM to enable MTE in a guest, so expose the
>>>> capability to user space.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> ---
>>>>  arch/arm64/kvm/arm.c      | 9 +++++++++
>>>>  arch/arm64/kvm/sys_regs.c | 3 +++
>>>>  2 files changed, 12 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>>> index 1cb39c0803a4..e89a5e275e25 100644
>>>> --- a/arch/arm64/kvm/arm.c
>>>> +++ b/arch/arm64/kvm/arm.c
>>>> @@ -93,6 +93,12 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>>>>  		r = 0;
>>>>  		kvm->arch.return_nisv_io_abort_to_user = true;
>>>>  		break;
>>>> +	case KVM_CAP_ARM_MTE:
>>>> +		if (!system_supports_mte() || kvm->created_vcpus)
>>>> +			return -EINVAL;
>>>> +		r = 0;
>>>> +		kvm->arch.mte_enabled = true;
>>>
>>> As far as I can tell from the architecture, this isn't valid for a
>>> 32bit guest.
>>
>> Indeed, however the MTE flag is a property of the VM not of the vCPU.
>> And, unless I'm mistaken, it's technically possible to create a VM where
>> some CPUs are 32 bit and some 64 bit. Not that I can see much use of a
>> configuration like that.
> 
> It looks that this is indeed a bug, and I'm on my way to squash it.
> Can't believe we allowed that for so long...

Ah, well if you're going to kill off mixed 32bit/64bit VMs then...

> But the architecture clearly states:
> 
> <quote>
> These features are supported in AArch64 state only.
> </quote>
> 
> So I'd expect something like:
> 
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 956cdc240148..50635eacfa43 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -220,7 +220,8 @@ int kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  	switch (vcpu->arch.target) {
>  	default:
>  		if (test_bit(KVM_ARM_VCPU_EL1_32BIT, vcpu->arch.features)) {
> -			if (!cpus_have_const_cap(ARM64_HAS_32BIT_EL1)) {
> +			if (!cpus_have_const_cap(ARM64_HAS_32BIT_EL1) ||
> +			    vcpu->kvm->arch.mte_enabled) {
>  				ret = -EINVAL;
>  				goto out;
>  			}
> 
> that makes it completely impossible to create 32bit CPUs within a
> MTE-enabled guest.

... that makes complete sense, and I'll include this hunk in my next
posting.

Thanks,

Steve

