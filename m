Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A2376300
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 11:45:59 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lex3W-0006BU-HV
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 05:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lex2L-0005kc-8d
 for qemu-devel@nongnu.org; Fri, 07 May 2021 05:44:45 -0400
Received: from foss.arm.com ([217.140.110.172]:45136)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lex2I-00073R-M2
 for qemu-devel@nongnu.org; Fri, 07 May 2021 05:44:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF03C106F;
 Fri,  7 May 2021 02:44:40 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 534693F718;
 Fri,  7 May 2021 02:44:38 -0700 (PDT)
Subject: Re: [PATCH v11 5/6] KVM: arm64: ioctl to fetch/store tags in a guest
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-6-steven.price@arm.com>
 <20210427175844.GB17872@arm.com>
 <340d35c2-46ed-35ea-43fa-e5cb64c27230@arm.com> <YJGIBTor+blelKKT@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <25c85740-0119-549e-6ddb-aea69c5efc76@arm.com>
Date: Fri, 7 May 2021 10:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJGIBTor+blelKKT@arm.com>
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
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/05/2021 18:44, Catalin Marinas wrote:
> On Thu, Apr 29, 2021 at 05:06:07PM +0100, Steven Price wrote:
>> On 27/04/2021 18:58, Catalin Marinas wrote:
>>> On Fri, Apr 16, 2021 at 04:43:08PM +0100, Steven Price wrote:
>>>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
>>>> index 24223adae150..2b85a047c37d 100644
>>>> --- a/arch/arm64/include/uapi/asm/kvm.h
>>>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>>>> @@ -184,6 +184,20 @@ struct kvm_vcpu_events {
>>>>    	__u32 reserved[12];
>>>>    };
>>>> +struct kvm_arm_copy_mte_tags {
>>>> +	__u64 guest_ipa;
>>>> +	__u64 length;
>>>> +	union {
>>>> +		void __user *addr;
>>>> +		__u64 padding;
>>>> +	};
>>>> +	__u64 flags;
>>>> +	__u64 reserved[2];
>>>> +};
> [...]
>>> Maybe add the two reserved
>>> values to the union in case we want to store something else in the
>>> future.
>>
>> I'm not sure what you mean here. What would the reserved fields be unioned
>> with? And surely they are no longer reserved in that case?
> 
> In case you want to keep the structure size the same for future
> expansion and the expansion only happens via the union, you'd add some
> padding in there just in case. We do this for struct siginfo with an
> _si_pad[] array in the union.
> 

Ah I see what you mean. In this case "padding" is just a sizer to ensure 
that flags is always the same alignment - it's not intended to be used. 
As I noted previously though it's completely pointless as this only on 
arm64 and even 32 bit Arm would naturally align the following __u64.

reserved[] is for expansion and I guess we could have a union over the 
whole struct (like siginfo) but I think it's generally clearer to just 
spell out the reserved fields at the end of the struct.

TLDR; the union will be gone along with "padding" in the next version. 
"reserved" remains at the end of the struct for future use.

Thanks,

Steve

