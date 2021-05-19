Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA07388FF9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:11:06 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMuf-0008Mm-G1
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1ljMtK-0007HA-Ml
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:09:42 -0400
Received: from foss.arm.com ([217.140.110.172]:34032)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1ljMtH-0004lr-V2
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:09:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3F6431B;
 Wed, 19 May 2021 07:09:37 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F3503F73B;
 Wed, 19 May 2021 07:09:35 -0700 (PDT)
Subject: Re: [PATCH v12 8/8] KVM: arm64: Document MTE capability and ioctl
To: Marc Zyngier <maz@kernel.org>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-9-steven.price@arm.com> <87r1i5teou.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <3b4cca00-e81d-322e-6f65-4d0850aac5a5@arm.com>
Date: Wed, 19 May 2021 15:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87r1i5teou.wl-maz@kernel.org>
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

On 17/05/2021 19:09, Marc Zyngier wrote:
> On Mon, 17 May 2021 13:32:39 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> A new capability (KVM_CAP_ARM_MTE) identifies that the kernel supports
>> granting a guest access to the tags, and provides a mechanism for the
>> VMM to enable it.
>>
>> A new ioctl (KVM_ARM_MTE_COPY_TAGS) provides a simple way for a VMM to
>> access the tags of a guest without having to maintain a PROT_MTE mapping
>> in userspace. The above capability gates access to the ioctl.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  Documentation/virt/kvm/api.rst | 53 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 22d077562149..a31661b870ba 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -5034,6 +5034,40 @@ see KVM_XEN_VCPU_SET_ATTR above.
>>  The KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST type may not be used
>>  with the KVM_XEN_VCPU_GET_ATTR ioctl.
>>  
>> +4.130 KVM_ARM_MTE_COPY_TAGS
>> +---------------------------
>> +
>> +:Capability: KVM_CAP_ARM_MTE
>> +:Architectures: arm64
>> +:Type: vm ioctl
>> +:Parameters: struct kvm_arm_copy_mte_tags
>> +:Returns: 0 on success, < 0 on error
>> +
>> +::
>> +
>> +  struct kvm_arm_copy_mte_tags {
>> +	__u64 guest_ipa;
>> +	__u64 length;
>> +	union {
>> +		void __user *addr;
>> +		__u64 padding;
>> +	};
>> +	__u64 flags;
>> +	__u64 reserved[2];
>> +  };
> 
> This doesn't exactly match the structure in the previous patch :-(.

:( I knew there was a reason I didn't include it in the documentation
for the first 9 versions... I'll fix this up, thanks for spotting it.

>> +
>> +Copies Memory Tagging Extension (MTE) tags to/from guest tag memory. The
>> +``guest_ipa`` and ``length`` fields must be ``PAGE_SIZE`` aligned. The ``addr``
>> +fieldmust point to a buffer which the tags will be copied to or from.
>> +
>> +``flags`` specifies the direction of copy, either ``KVM_ARM_TAGS_TO_GUEST`` or
>> +``KVM_ARM_TAGS_FROM_GUEST``.
>> +
>> +The size of the buffer to store the tags is ``(length / MTE_GRANULE_SIZE)``
> 
> Should we add a UAPI definition for MTE_GRANULE_SIZE?

I wasn't sure whether to export this or not. The ioctl is based around
the existing ptrace interface (PTRACE_{PEEK,POKE}MTETAGS) which doesn't
expose a UAPI definition. Admittedly the documentation there also just
says "16-byte granule" rather than MTE_GRANULE_SIZE.

So I'll just remove the reference to MTE_GRANULE_SIZE in the
documentation unless you feel that we should have a UAPI definition.

>> +bytes (i.e. 1/16th of the corresponding size). Each byte contains a single tag
>> +value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
>> +``PTRACE_POKEMTETAGS``.
>> +
>>  5. The kvm_run structure
>>  ========================
>>  
>> @@ -6362,6 +6396,25 @@ default.
>>  
>>  See Documentation/x86/sgx/2.Kernel-internals.rst for more details.
>>  
>> +7.26 KVM_CAP_ARM_MTE
>> +--------------------
>> +
>> +:Architectures: arm64
>> +:Parameters: none
>> +
>> +This capability indicates that KVM (and the hardware) supports exposing the
>> +Memory Tagging Extensions (MTE) to the guest. It must also be enabled by the
>> +VMM before the guest will be granted access.
>> +
>> +When enabled the guest is able to access tags associated with any memory given
>> +to the guest. KVM will ensure that the pages are flagged ``PG_mte_tagged`` so
>> +that the tags are maintained during swap or hibernation of the host; however
>> +the VMM needs to manually save/restore the tags as appropriate if the VM is
>> +migrated.
>> +
>> +When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
>> +perform a bulk copy of tags to/from the guest.
>> +
> 
> Missing limitation to AArch64 guests.

As mentioned previously it's not technically limited to AArch64, but
I'll expand this to make it clear that MTE isn't usable from a AArch32 VCPU.

Thanks,

Steve

