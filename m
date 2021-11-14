Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20444FBD8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 22:36:34 +0100 (CET)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmNAv-00068h-HV
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 16:36:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mmN9y-0005D6-CS; Sun, 14 Nov 2021 16:35:34 -0500
Received: from mail.csgraf.de ([85.25.223.15]:39452 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mmN9w-0007lO-0q; Sun, 14 Nov 2021 16:35:33 -0500
Received: from [192.168.106.118]
 (dynamic-095-118-029-131.95.118.pool.telefonica.de [95.118.29.131])
 by csgraf.de (Postfix) with ESMTPSA id 920AA608038A;
 Sun, 14 Nov 2021 22:35:29 +0100 (CET)
Message-ID: <55997def-c09c-00c8-711a-50a2ac6e7576@csgraf.de>
Date: Sun, 14 Nov 2021 22:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
In-Reply-To: <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.402,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 14.11.21 18:41, Alexander Graf wrote:
>
>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>>
>> ﻿On Sun, 14 Nov 2021 at 10:56, Alexander Graf <agraf@csgraf.de> wrote:
>>> When we expose an SMC conduit, we're implicitly telling the guest that
>>> there is EL3 available because it needs to call it. While that EL3 then
>>> is not backed by the emulated CPU, from the guest's EL2 point of view,
>>> it still means there is an EL3 to call into.
>>>
>>> This is a problem for VMware ESXi, which validates EL3 availability before
>>> doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.
>>>
>>> Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>> ---
>>> target/arm/cpu.c | 20 +++++++++++++++-----
>>> 1 file changed, 15 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index a211804fd3..21092c5242 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>>           */
>>>          unset_feature(env, ARM_FEATURE_EL3);
>>>
>>> -        /* Disable the security extension feature bits in the processor feature
>>> -         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
>>> -         */
>>> -        cpu->isar.id_pfr1 &= ~0xf0;
>>> -        cpu->isar.id_aa64pfr0 &= ~0xf000;
>>> +        if (cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
>>> +            /*
>>> +             * We tell the guest to use SMC calls into EL3 for PSCI calls, so
>>> +             * there has to be EL3 available. We merely execute it on the host
>>> +             * in QEMU rather than in actual EL3 inside the guest.
>>> +             */
>>> +        } else {
>>> +            /*
>>> +             * Disable the security extension feature bits in the processor
>>> +             * feature registers as well. These are id_pfr1[7:4] and
>>> +             * id_aa64pfr0[15:12].
>>> +             */
>>> +            cpu->isar.id_pfr1 &= ~0xf0;
>>> +            cpu->isar.id_aa64pfr0 &= ~0xf000;
>>> +        }
>> This is tricky, because we use the cpu->isar values to determine whether
>> we should be emulating things. So this change means we now create an
>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>> unset), and depending on which of the two "do we have EL3?" methods
>> any bit of the TCG code is using will give different results...
> Do you think it would be sufficient to go through all readers of the isar bits and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy to do so then! :)


The aa32 pfr1 seems to have a single consumer:

static inline bool isar_feature_aa32_m_sec_state(const ARMISARegisters *id)
{
     /*
      * Return true if M-profile state handling insns
      * (VSCCLRM, CLRM, FPCTX access insns) are implemented
      */
     return FIELD_EX32(id->id_pfr1, ID_PFR1, SECURITY) >= 3;
}

which is only called for M profile. For M profile however, the patch is 
irrelevant as it's patching inside a !arm_feature(env, ARM_FEATURE_M) 
branch.

The only consumer of the AA64PFR.EL3 field I could find was in KVM code 
when assembling -cpu host. It again is unaffected by this patch.


Alex



