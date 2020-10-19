Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBA292640
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 13:13:14 +0200 (CEST)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUT6H-0003MG-RY
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 07:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kUT4u-0002KQ-NW; Mon, 19 Oct 2020 07:11:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:25421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kUT4r-0004F2-Nt; Mon, 19 Oct 2020 07:11:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C15D6746331;
 Mon, 19 Oct 2020 13:11:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9A3B87475FF; Mon, 19 Oct 2020 13:11:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 989C6746333;
 Mon, 19 Oct 2020 13:11:42 +0200 (CEST)
Date: Mon, 19 Oct 2020 13:11:42 +0200 (CEST)
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] hw/pci-host/grackle: Verify PIC link is properly set
In-Reply-To: <87k0vm1wny.fsf@dusky.pond.sub.org>
Message-ID: <24bcd4-fde2-22a2-d3f4-cd42d9ee13c6@eik.bme.hu>
References: <20201011190332.3189611-1-f4bug@amsat.org>
 <20201011223446.GA4787@yekko.fritz.box>
 <369509c1-2e90-13cf-8845-892e754516d1@amsat.org>
 <20201012065436.GB71119@yekko.fritz.box>
 <9f7e4847-801d-dcd3-b876-bf2d276251@eik.bme.hu>
 <6e587154-4bc5-c44c-0c85-b46e0dddd3aa@amsat.org>
 <87k0vm1wny.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-225831745-1603105902=:10643"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 07:11:43
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-225831745-1603105902=:10643
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 19 Oct 2020, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> On 10/12/20 1:50 PM, BALATON Zoltan via wrote:
>>> On Mon, 12 Oct 2020, David Gibson wrote:
>>>> On Mon, Oct 12, 2020 at 08:21:41AM +0200, Philippe
>>>> Mathieu-DaudÃƒÆ’Ã‚Â© wrote:
>>>>> On 10/12/20 12:34 AM, David Gibson wrote:
>>>>>> On Sun, Oct 11, 2020 at 09:03:32PM +0200, Philippe
>>>>>> Mathieu-DaudÃƒÆ’Ã‚Â© wrote:
>>>>>>> The Grackle PCI host model expects the interrupt controller
>>>>>>> being set, but does not verify it is present. Add a check to
>>>>>>> help developers using this model.
>>>>>>
>>>>>> I don't think thaqt's very likely, but, sure, applied to ppc-for-5.2
>>>>>
>>>>> Do you want I correct the description as:
>>>>> "The Grackle PCI host model expects the interrupt controller
>>>>> being set, but does not verify it is present.
>>>>> A developer basing its implementation on the Grackle model
>>>>> might hit this problem. Add a check to help future developers
>>>>> using this model as reference."?
>>>>
>>>> No, it's fine.Â  All I was saying is that the chances of anyone using
>>>> Grackle in future seem very low to me.
>>> So maybe an assert instead of a user visible error would be enough?
>>
>> My understanding is realize() shouldn't abort()
>> (the caller might choose to by using &error_abort).
>
> assert() is for checking invariants.  A violated invariant is a
> programming error: developers screwed up, safe recovery is impossible.
>
> Abusing assert() to catch errors that are not programming errors is
> wrong.
>
> You may check invariants with assert() anywhere in the code.
>
> You should not misuse assert() anywhere in the code.
>
> Sometimes, an error condition that is *not* a programming error in the
> function where it is detected *is* a programming error for certain
> calls.  Having these calls pass &error_abort is a common solution for
> this problem.
>
> Hope this helps.

Helps just a bit but after reading this I'm still confused if this 
particular case should be assert or ser error.

I was suggesting assert and I think it's a programming error to use the 
grackle model without setting PIC link but not sure if users can also 
create this instance via command line (even if it does not make much 
sense) in which case it's probably better to return error. Having all 
devices user creatable via -device without a way to describe their 
dependencies is a nice way to make all sorts of errors possible. But maybe 
aborting with assert during creation of the machine is still OK. If people 
device_add a model later and that crashes then it's their problem. Unless 
we want to avoid that being used as DoS in enterprise setting. So maybe we 
should never abort then if there's a way to fail with an error instead.

I can look at this problem from different angles and all seem to be 
plausible resulting in different solutions.

Regards,
BALATON Zoltan
--3866299591-225831745-1603105902=:10643--

