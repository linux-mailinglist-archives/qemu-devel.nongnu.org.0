Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6A40C40F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:01:14 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSfB-0006hR-QW
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQScn-0005kF-FX; Wed, 15 Sep 2021 06:58:45 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50418 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQSci-0000Ii-Vl; Wed, 15 Sep 2021 06:58:45 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id 3C4D460803DB;
 Wed, 15 Sep 2021 12:58:30 +0200 (CEST)
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
 <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
 <3132e2f5-41a6-6011-808b-7ea12abec1c0@csgraf.de>
 <CAFEAcA9k0-przZxAXpdwZKju9GW4gFpTcqAxTD4z_QoueHg=NQ@mail.gmail.com>
 <87wnnib291.wl-maz@kernel.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <4ce23412-7484-f77a-6378-4369b0b2397c@csgraf.de>
Date: Wed, 15 Sep 2021 12:58:29 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87wnnib291.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 15.09.21 11:46, Marc Zyngier wrote:
> On Mon, 13 Sep 2021 13:30:57 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Mon, 13 Sept 2021 at 13:02, Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>> On 13.09.21 13:44, Peter Maydell wrote:
>>>> On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
>>>>> To keep your train of thought though, what would you do if we encounter
>>>>> a conduit that is different from the chosen one? Today, I am aware of 2
>>>>> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].
>>>> If the SMC or HVC insn isn't being used for PSCI then it should
>>>> have its standard architectural behaviour.
>>> Why?
>> QEMU's assumption here is that there are basically two scenarios
>> for these instructions:
>>  (1) we're providing an emulation of firmware that uses this
>>      instruction (and only this insn, not the other one) to
>>      provide PSCI services
>>  (2) we're not emulating any firmware at all, we're running it
>>      in the guest, and that guest firmware is providing PSCI
>>
>> In case (1) we provide a PSCI ABI on the end of the insn.
>> In case (2) we provide the architectural behaviour for the insn
>> so that the guest firmware can use it.
>>
>> We don't currently have
>>  (3) we're providing an emulation of firmware that does something
>>      other than providing PSCI services on this instruction
>>
>> which is what I think you're asking for. (Alternatively, you might
>> be after "provide PSCI via SMC, not HVC", ie use a different conduit.
>> If hvf documents that SMC is guaranteed to trap that would be
>> possible, I guess.)
>>
>>> Also, why does KVM behave differently?
>> Looks like Marc made KVM set x0 to -1 for SMC calls in kernel commit
>> c0938c72f8070aa; conveniently he's on the cc list here so we can
>> ask him :-)
> If we got a SMC trap into KVM, that's because the HW knows about it,
> so injecting an UNDEF is rather counter productive (we don't hide the
> fact that EL3 actually exists).


This is the part where you and Peter disagree :). What would you suggest
to do to create consistency between KVM and TCG based EL0/1 only VMs?


> However, we don't implement anything on the back of this instruction,
> so we just return NOT_IMPLEMENTED (-1). With NV, we actually use it as
> a guest hypervisor can use it for PSCI and SMC is guaranteed to trap
> even if EL3 doesn't exist in the HW.
>
> For the brain-damaged case where there is no EL3, SMC traps and the
> hypervisor doesn't actually advertises EL3, that's likely a guest
> bug. Tough luck.
>
> Side note: Not sure where HVF does, but on the M1 running Linux, SMC
> appears to trap to EL2 with EC=0x3f, which is a reserved exception
> class. This of course results in an UNDEF being injected because as
> far as KVM is concerned, this should never happen.


Could that be yet another magical implementation specific MSR bit that
needs to be set? Hvf returns 0x17 (EC_AA64_SMC) for SMC calls.


Alex


