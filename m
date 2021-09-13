Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E71408ACD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:13:37 +0200 (CEST)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkq6-0000YM-IF
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPkfX-0000dM-Ka; Mon, 13 Sep 2021 08:02:39 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43988 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPkfU-0000an-TS; Mon, 13 Sep 2021 08:02:39 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id 80AAB608037D;
 Mon, 13 Sep 2021 14:02:33 +0200 (CEST)
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
 <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <3132e2f5-41a6-6011-808b-7ea12abec1c0@csgraf.de>
Date: Mon, 13 Sep 2021 14:02:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
 Peter Collingbourne <pcc@google.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13.09.21 13:44, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 13.09.21 10:54, Peter Maydell wrote:
>>> Something in here should be checking whether the insn the guest
>>> used matches the PSCI conduit configured for the VM, ie
>>> what arm_is_psci_call() does after your patch 10.
>>
>> It's yet another case where I believe we are both reading the spec
>> differently :)
>>
>>   https://documentation-service.arm.com/static/6013e5faeee5236980d08619
>>
>> Section 2.5.3 speaks about the conduits. It says
>>
>>     Service calls are expected to be invoked through SMC instructions,
>> except
>>     for Standard Hypervisor Calls and Vendor Specific Hypervisor Calls. On
>>     some platforms, however, SMC instructions are not available, and the
>>     services can be accessed through HVC instructions. The method that
>>     is used to invoke the service is referred to as the conduit.
>>
>> To me, that reads like "Use SMC whenever you can. If your hardware does
>> not give you a way to handle SMC calls, falling back to HVC is ok. In
>> that case, indicate that mandate to the OS".
> QEMU here is being the platform, so we define what the conduit is
> (or if one even exists). For the virt board this is "if the
> guest has EL3 firmware, then the guest firmware is providing PSCI,
> and QEMU should not; otherwise if the guest has EL2 then QEMU's
> emulated firmware should be at EL3 using SMC, otherwise use HVC".
>
> (So in practice for hvf at the moment this will mean the conduit
> is always HVC, since hvf doesn't allow EL3 or EL2 in the guest.)
>
>> In hvf, we can very easily trap for SMC calls and handle them. Why are
>> we making OSs implement HVC call paths when SMC would work just as well
>> for everyone?
> OSes have to handle both anyway, because on real hardware if
> there is no EL3 then it is IMPDEF whether SMC is trappable
> to the hypervisor or whether it just UNDEFs to EL1.
>
>> To keep your train of thought though, what would you do if we encounter
>> a conduit that is different from the chosen one? Today, I am aware of 2
>> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].
> If the SMC or HVC insn isn't being used for PSCI then it should
> have its standard architectural behaviour.


Why? Also, why does KVM behave differently? And why does Windows rely on
SMC availability on boot?

If you really insist that you don't care about users running Windows
with TCG and EL2=0, so be it. At least you can enable EL2 and it works
then. But I can't on hvf. It's one of the most useful use cases for hvf
on QEMU and I won't break it just because you insist that "SMC behavior
is IMPDEF, so it must be UNDEF". If it's IMPDEF, it may as well be "set
x0 to -1 and add 4 to pc".

And yes, this is a hill I will die on :)


Alex


