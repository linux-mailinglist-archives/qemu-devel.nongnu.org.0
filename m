Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB12BA691
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:52:05 +0100 (CET)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg35I-0007Bt-SE
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1kg34I-0006d2-3E
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:51:02 -0500
Received: from foss.arm.com ([217.140.110.172]:38612)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1kg34F-0006JO-2o
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:51:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FF871042;
 Fri, 20 Nov 2020 01:50:57 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BD123F70D;
 Fri, 20 Nov 2020 01:50:54 -0800 (PST)
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: Marc Zyngier <maz@kernel.org>, Andrew Jones <drjones@redhat.com>
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
Date: Fri, 20 Nov 2020 09:50:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 Peter Maydell <peter.maydell@linaro.org>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 kvmarm <kvmarm@lists.cs.columbia.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Julien Thierry <julien.thierry.kdev@gmail.com>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2020 19:11, Marc Zyngier wrote:
> On 2020-11-19 18:42, Andrew Jones wrote:
>> On Thu, Nov 19, 2020 at 03:45:40PM +0000, Peter Maydell wrote:
>>> On Thu, 19 Nov 2020 at 15:39, Steven Price <steven.price@arm.com> wrote:
>>> > This series adds support for Arm's Memory Tagging Extension (MTE) to
>>> > KVM, allowing KVM guests to make use of it. This builds on the 
>>> existing
>>> > user space support already in v5.10-rc1, see [1] for an overview.
>>>
>>> > The change to require the VMM to map all guest memory PROT_MTE is
>>> > significant as it means that the VMM has to deal with the MTE tags 
>>> even
>>> > if it doesn't care about them (e.g. for virtual devices or if the VMM
>>> > doesn't support migration). Also unfortunately because the VMM can
>>> > change the memory layout at any time the check for PROT_MTE/VM_MTE has
>>> > to be done very late (at the point of faulting pages into stage 2).
>>>
>>> I'm a bit dubious about requring the VMM to map the guest memory
>>> PROT_MTE unless somebody's done at least a sketch of the design
>>> for how this would work on the QEMU side. Currently QEMU just
>>> assumes the guest memory is guest memory and it can access it
>>> without special precautions...
>>>
>>
>> There are two statements being made here:
>>
>> 1) Requiring the use of PROT_MTE when mapping guest memory may not fit
>>    QEMU well.
>>
>> 2) New KVM features should be accompanied with supporting QEMU code in
>>    order to prove that the APIs make sense.
>>
>> I strongly agree with (2). While kvmtool supports some quick testing, it
>> doesn't support migration. We must test all new features with a migration
>> supporting VMM.
>>
>> I'm not sure about (1). I don't feel like it should be a major problem,
>> but (2).

(1) seems to be contentious whichever way we go. Either PROT_MTE isn't 
required in which case it's easy to accidentally screw up migration, or 
it is required in which case it's difficult to handle normal guest 
memory from the VMM. I get the impression that probably I should go back 
to the previous approach - sorry for the distraction with this change.

(2) isn't something I'm trying to skip, but I'm limited in what I can do 
myself so would appreciate help here. Haibo is looking into this.

>>
>> I'd be happy to help with the QEMU prototype, but preferably when there's
>> hardware available. Has all the current MTE testing just been done on
>> simulators? And, if so, are there regression tests regularly running on
>> the simulators too? And can they test migration? If hardware doesn't
>> show up quickly and simulators aren't used for regression tests, then
>> all this code will start rotting from day one.

As Marc says, hardware isn't available. Testing is either via the Arm 
FVP model (that I've been using for most of my testing) or QEMU full 
system emulation.

> 
> While I agree with the sentiment, the reality is pretty bleak.
> 
> I'm pretty sure nobody will ever run a migration on emulation. I also doubt
> there is much overlap between MTE users and migration users, unfortunately.
> 
> No HW is available today, and when it becomes available, it will be in
> the form of a closed system on which QEMU doesn't run, either because
> we are locked out of EL2 (as usual), or because migration is not part of
> the use case (like KVM on Android, for example).
> 
> So we can wait another two (five?) years until general purpose HW becomes
> available, or we start merging what we can test today. I'm inclined to
> do the latter.
> 
> And I think it is absolutely fine for QEMU to say "no MTE support with KVM"
> (we can remove all userspace visibility, except for the capability).

What I'm trying to achieve is a situation where KVM+MTE without 
migration works and we leave ourselves a clear path where migration can 
be added. With hindsight I think this version of the series was a wrong 
turn - if we return to not requiring PROT_MTE then we have the following 
two potential options to explore for migration in the future:

  * The VMM can choose to enable PROT_MTE if it needs to, and if desired 
we can add a flag to enforce this in the kernel.

  * If needed a new kernel interface can be provided to fetch/set tags 
from guest memory which isn't mapped PROT_MTE.

Does this sound reasonable?

I'll clean up the set_pte_at() change and post a v6 later today.

