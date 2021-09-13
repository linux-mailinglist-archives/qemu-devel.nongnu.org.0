Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A6409F1F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 23:31:06 +0200 (CEST)
Received: from localhost ([::1]:39320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPtXd-0002Lq-Ir
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 17:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPtWZ-0001JO-Ma; Mon, 13 Sep 2021 17:30:00 -0400
Received: from mail.csgraf.de ([85.25.223.15]:49514 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPtWX-00019e-JT; Mon, 13 Sep 2021 17:29:59 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 3E11060800D8;
 Mon, 13 Sep 2021 23:29:49 +0200 (CEST)
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
 <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
 <3132e2f5-41a6-6011-808b-7ea12abec1c0@csgraf.de>
 <CAFEAcA9k0-przZxAXpdwZKju9GW4gFpTcqAxTD4z_QoueHg=NQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <b5226bd4-f71d-b1bc-8b27-72a440d18dc9@csgraf.de>
Date: Mon, 13 Sep 2021 23:29:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9k0-przZxAXpdwZKju9GW4gFpTcqAxTD4z_QoueHg=NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
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
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13.09.21 14:30, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 13:02, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 13.09.21 13:44, Peter Maydell wrote:
>>> On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
>>>> To keep your train of thought though, what would you do if we encounter
>>>> a conduit that is different from the chosen one? Today, I am aware of 2
>>>> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].
>>> If the SMC or HVC insn isn't being used for PSCI then it should
>>> have its standard architectural behaviour.
>> Why?
> QEMU's assumption here is that there are basically two scenarios
> for these instructions:
>  (1) we're providing an emulation of firmware that uses this
>      instruction (and only this insn, not the other one) to
>      provide PSCI services
>  (2) we're not emulating any firmware at all, we're running it
>      in the guest, and that guest firmware is providing PSCI
>
> In case (1) we provide a PSCI ABI on the end of the insn.
> In case (2) we provide the architectural behaviour for the insn
> so that the guest firmware can use it.
>
> We don't currently have
>  (3) we're providing an emulation of firmware that does something
>      other than providing PSCI services on this instruction
>
> which is what I think you're asking for. (Alternatively, you might
> be after "provide PSCI via SMC, not HVC", ie use a different conduit.
> If hvf documents that SMC is guaranteed to trap that would be
> possible, I guess.)


Hvf doesn't document anything. The only documentation it has are its C
headers.

However, M1 does not implement EL3, but traps SMC calls. It's the only
chip Apple has out for hvf on ARM today. I would be very surprised if
they started to regress on that functionality.

So, would you be open to changing the default conduit to SMC for
hvf_enabled()? Is that really a better experience than just modeling
behavior after KVM?


>
>> Also, why does KVM behave differently?
> Looks like Marc made KVM set x0 to -1 for SMC calls in kernel commit
> c0938c72f8070aa; conveniently he's on the cc list here so we can
> ask him :-)
>
>> And why does Windows rely on
>> SMC availability on boot?
> Ask Microsoft, but probably either they don't realize that
> SMC might not exist and be trappable, or they only have a limited
> set of hosts they care about. CPUs with no EL3 are not that common.


I'm pretty sure it's the latter :).


>
>> If you really insist that you don't care about users running Windows
>> with TCG and EL2=0, so be it. At least you can enable EL2 and it works
>> then. But I can't on hvf. It's one of the most useful use cases for hvf
>> on QEMU and I won't break it just because you insist that "SMC behavior
>> is IMPDEF, so it must be UNDEF". If it's IMPDEF, it may as well be "set
>> x0 to -1 and add 4 to pc".
> I am not putting in random hacks for the benefit of specific guest OSes.
> If there's a good reason why QEMU's behaviour is wrong then we can change
> it, but "I want Windows to boot" doesn't count.


Ok, so today we have 2 implementations for SMC traps in an EL0/1 only VM:

  * TCG injects #UD
  * KVM sets x0 = -1 and pc += 4.

With v10 of the HVF patch set, I'm following what KVM is doing. Can we
leave it at that for now and sort out with Marc (and maybe ARM spec
writers) what we want to do consistently across all implementations as a
follow-up?


Thanks,

Alex


