Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F7337305
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:50:30 +0100 (CET)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKlp-000119-Cr
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lKKWV-00045K-QT
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:39 -0500
Received: from foss.arm.com ([217.140.110.172]:55762)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lKKWT-0006gE-5j
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9572AED1;
 Thu, 11 Mar 2021 04:34:35 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 074673F793;
 Thu, 11 Mar 2021 04:34:32 -0800 (PST)
Subject: Re: [PATCH v9 6/6] KVM: arm64: Document MTE capability and ioctl
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210301142315.30920-1-steven.price@arm.com>
 <20210301142315.30920-7-steven.price@arm.com>
 <CAFEAcA8pkvWeGV19QEaZx+pENDpUTO3=p-euPjkjeiU8OGtZzw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <1ea52603-2e99-1e81-92b3-0e14cf1e2d1e@arm.com>
Date: Thu, 11 Mar 2021 12:35:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pkvWeGV19QEaZx+pENDpUTO3=p-euPjkjeiU8OGtZzw@mail.gmail.com>
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 11:01, Peter Maydell wrote:
> On Mon, 1 Mar 2021 at 14:23, Steven Price <steven.price@arm.com> wrote:
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
>>   Documentation/virt/kvm/api.rst | 37 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index aed52b0fc16e..1406ea138127 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -4939,6 +4939,23 @@ KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO
>>   Allows Xen vCPU attributes to be read. For the structure and types,
>>   see KVM_XEN_VCPU_SET_ATTR above.
>>
>> +4.131 KVM_ARM_MTE_COPY_TAGS
>> +---------------------------
>> +
>> +:Capability: KVM_CAP_ARM_MTE
>> +:Architectures: arm64
>> +:Type: vm ioctl
>> +:Parameters: struct kvm_arm_copy_mte_tags
>> +:Returns: 0 on success, < 0 on error
>> +
>> +Copies Memory Tagging Extension (MTE) tags to/from guest tag memory.
> 
> Mostly virt/kvm/api.rst seems to include documentation of the
> associated structs, something like:
> 
> ::
> 
>    struct kvm_arm_copy_mte_tags {
>           __u64 guest_ipa;
>           __u64 length;
>           union {
>                   void __user *addr;
>                   __u64 padding;
>           };
>           __u64 flags;
>    };
> 
> 
> which saves the reader having to cross-reference against the header file.

Good point - I'll add that.

> It also means you can more naturally use the actual field names in the doc,
> eg:
> 
>> +The
>> +starting address and length of guest memory must be ``PAGE_SIZE`` aligned.
> 
> you could say "The guest_ipa and length fields" here.
> 
> Also "The addr field must point to a buffer which the tags will
> be copied to or from." I assume.

Indeed - I'll add the clarification.

>> +The size of the buffer to store the tags is ``(length / MTE_GRANULE_SIZE)``
>> +bytes (i.e. 1/16th of the corresponding size).
> 
>> + Each byte contains a single tag
>> +value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
>> +``PTRACE_POKEMTETAGS``.
> 
> What are the valid values for 'flags' ? It looks like they specify which
> direction the copy is, which we definitely need to document here.

Yes either KVM_ARM_TAGS_TO_GUEST or KVM_ARM_TAGS_FROM_GUEST - again I'll 
clarify that.

> What happens if the caller requests a tag copy for an area of guest
> address space which doesn't have tags (eg it has nothing mapped),
> or for an area of guest addres space which has tags in some parts
> but not in others ?

Guest memory either exists (and has tags) or doesn't exist (assuming MTE 
is enabled for the guest). So the cases this can fail are:

  * The region isn't completely covered with memslots
  * The region isn't completely writable (and KVM_ARM_TAGS_TO_GUEST is 
specified).
  * User space doesn't have access to the memory (i.e. the memory would 
SIGSEGV or similar if the VMM accessed it).

Currently all the above produce the error -ENOENT, which now I come to 
enumerate the cases doesn't seem like a great error code (it's really 
only appropriate for the first)! Perhaps -EFAULT would be better.

>> +
>>   5. The kvm_run structure
>>   ========================
>>
>> @@ -6227,6 +6244,25 @@ KVM_RUN_BUS_LOCK flag is used to distinguish between them.
>>   This capability can be used to check / enable 2nd DAWR feature provided
>>   by POWER10 processor.
>>
>> +7.23 KVM_CAP_ARM_MTE
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
>> +that the tags are maintained during swap or hibernation of the host, however
> 
> s/,/;/

Yep

>> +the VMM needs to manually save/restore the tags as appropriate if the VM is
>> +migrated.
>> +
>> +When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
>> +perform a bulk copy of tags to/from the guest
> 
> "guest."

Good spot.

>> +
>>   8. Other capabilities.
>>   ======================
>>
>> @@ -6716,3 +6752,4 @@ KVM_XEN_HVM_SET_ATTR, KVM_XEN_HVM_GET_ATTR, KVM_XEN_VCPU_SET_ATTR and
>>   KVM_XEN_VCPU_GET_ATTR ioctls, as well as the delivery of exception vectors
>>   for event channel upcalls when the evtchn_upcall_pending field of a vcpu's
>>   vcpu_info is set.
>> +
>> --
>> 2.20.1
> 
> 
> Stray whitespace change ?

Not sure how that got there - but will remove.

Thanks,

Steve

