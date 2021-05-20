Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BB38A8C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 12:53:44 +0200 (CEST)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgJD-0002GH-BA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 06:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljgHr-0000TB-Ep
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:52:19 -0400
Received: from foss.arm.com ([217.140.110.172]:39028)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljgHp-00022M-DK
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:52:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EDCD150C;
 Thu, 20 May 2021 03:52:16 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C18FE3F719;
 Thu, 20 May 2021 03:52:12 -0700 (PDT)
Subject: Re: [PATCH v12 8/8] KVM: arm64: Document MTE capability and ioctl
To: Marc Zyngier <maz@kernel.org>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-9-steven.price@arm.com> <87r1i5teou.wl-maz@kernel.org>
 <3b4cca00-e81d-322e-6f65-4d0850aac5a5@arm.com> <871ra1vh2s.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <3e9f2388-89fe-f762-8e59-03f4d70320fc@arm.com>
Date: Thu, 20 May 2021 11:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871ra1vh2s.wl-maz@kernel.org>
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

On 20/05/2021 11:24, Marc Zyngier wrote:
> On Wed, 19 May 2021 15:09:23 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> On 17/05/2021 19:09, Marc Zyngier wrote:
>>> On Mon, 17 May 2021 13:32:39 +0100,
>>> Steven Price <steven.price@arm.com> wrote:
[...]>>>> +bytes (i.e. 1/16th of the corresponding size). Each byte
contains a single tag
>>>> +value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
>>>> +``PTRACE_POKEMTETAGS``.
>>>> +
>>>>  5. The kvm_run structure
>>>>  ========================
>>>>  
>>>> @@ -6362,6 +6396,25 @@ default.
>>>>  
>>>>  See Documentation/x86/sgx/2.Kernel-internals.rst for more details.
>>>>  
>>>> +7.26 KVM_CAP_ARM_MTE
>>>> +--------------------
>>>> +
>>>> +:Architectures: arm64
>>>> +:Parameters: none
>>>> +
>>>> +This capability indicates that KVM (and the hardware) supports exposing the
>>>> +Memory Tagging Extensions (MTE) to the guest. It must also be enabled by the
>>>> +VMM before the guest will be granted access.
>>>> +
>>>> +When enabled the guest is able to access tags associated with any memory given
>>>> +to the guest. KVM will ensure that the pages are flagged ``PG_mte_tagged`` so
>>>> +that the tags are maintained during swap or hibernation of the host; however
>>>> +the VMM needs to manually save/restore the tags as appropriate if the VM is
>>>> +migrated.
>>>> +
>>>> +When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
>>>> +perform a bulk copy of tags to/from the guest.
>>>> +
>>>
>>> Missing limitation to AArch64 guests.
>>
>> As mentioned previously it's not technically limited to AArch64, but
>> I'll expand this to make it clear that MTE isn't usable from a AArch32 VCPU.
> 
> I believe the architecture is quite clear that it *is* limited to
> AArch64. The clarification is welcome though.

I explained that badly. A system supporting MTE doesn't have to have all
CPUs running AArch64 - fairly obviously you can boot a 32 bit OS on a
system supporting AArch64.

Since the KVM capability is a VM capability it's not architecturally
inconsistent to enable it even if all your CPUs are running AArch32 (at
EL1 and lower) - just a bit pointless.

However, given your comment that a mixture of AArch32/AArch64 VCPUs is a
bug - we can fail creation of AArch32 VCPUs and I'll explicitly document
this is a AArch64 only feature.

Thanks,

Steve

