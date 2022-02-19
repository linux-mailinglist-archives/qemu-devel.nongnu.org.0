Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FD4BC9BA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 19:13:24 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLUEV-0007Lu-HZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 13:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLUCS-00067r-Tp; Sat, 19 Feb 2022 13:11:17 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLUBf-0007pb-T5; Sat, 19 Feb 2022 13:11:16 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9E4587457E7;
 Sat, 19 Feb 2022 19:10:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 52549745712; Sat, 19 Feb 2022 19:10:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 500DC745708;
 Sat, 19 Feb 2022 19:10:23 +0100 (CET)
Date: Sat, 19 Feb 2022 19:10:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH 1/1] hw/ide: share bmdma read and write functions between
 piix.c and via.c
In-Reply-To: <649a783e-f214-b2d1-2c10-d0def052f0f7@gmail.com>
Message-ID: <37b96ba3-d96b-388a-5863-ff248517ec9@eik.bme.hu>
References: <20220219080818.327683-1-liavalb@gmail.com>
 <20220219080818.327683-2-liavalb@gmail.com>
 <5b443413-5f5c-48f9-161-6573b79aa8e3@eik.bme.hu>
 <ba8fb8ae-9af0-a740-6451-1e12dba14691@gmail.com>
 <c0736fce-7f4b-7d7b-22a0-4eb102a8572@eik.bme.hu>
 <1066433-593c-c1c5-fa6d-1d30d1c5844@eik.bme.hu>
 <649a783e-f214-b2d1-2c10-d0def052f0f7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1217806381-1645294223=:22518"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1217806381-1645294223=:22518
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 19 Feb 2022, Liav Albani wrote:
> On 2/19/22 17:57, BALATON Zoltan wrote:
>> On Sat, 19 Feb 2022, BALATON Zoltan wrote:
>>> Maybe even the first if that's already contained in the default function 
>>> could be avoided with some reorganisation like
>>> 
>>> if (size == 1) {
>>>    remaining switch cases to set val
>>> } else {
>>>    val = bmdma_default_read();
>>> }
>> 
>> On second thought this misses the cases where size == 1 and addr is those 
>> handeled in bmdma_default_read so one would still need the default case in 
>> the if part and then it's not much better than duplicating the if. Maybe 
>> calling the default first, then handling the remaining cases, like
>> 
>> val = bmdma_default_read();
>> if (size == 1) {
>>     remaining switch cases to set val
>> }
>> return val;
>> 
>> is the simplest and avoids the duplicated if. (Now we only have two trace 
>> messages instead of one but that's probably not a problem as it's only a 
>> debugging aid.
>> 
> Hmm, is it OK though to have two trace messages? I'm not against it, but if 
> someone tries to use the debug messages to see what's going on, it's better 
> to not have two of the same message as it will confuse people. We definitely 
> don't want that to happen.

I don't think this is a problem. One message is from the bmdma default 
function and one is from the cmd646 specific function overriding it so 
both may have some usefulness and one can enable/disable them separately 
so for cmd646 one can only enable the specific one to avoid duplicated 
messages.

> So, let's keep it simple (and remove code duplications) but also let's do 
> that correctly, to ensure that in the view of the developer that uses the 
> debug messages, it all seem clear and neat :)

I don't see an easy way to avoid that otherwise because we can't move the 
trace out from the default functions because some controllers only use 
that so the simplest is to not care about this.

>> 
>>> but I wasn't sure that won't change anything so may need a bit more 
>>> thought.
>>> 
>>>>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>>>>> ---
>>>>>> hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
>>>>>> hw/ide/piix.c        | 50 ++-----------------------------------------
>>>>>> hw/ide/via.c         | 51 ++------------------------------------------
>>>>>> include/hw/ide/pci.h |  4 ++++
>>>>>> 4 files changed, 55 insertions(+), 97 deletions(-)
>>>>>> 
>>>>>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>>>>>> index 84ba733548..c8b867659a 100644
>>>>>> --- a/hw/ide/pci.c
>>>>>> +++ b/hw/ide/pci.c
>>>>>> @@ -502,6 +502,53 @@ static const struct IDEDMAOps bmdma_ops = {
>>>>>>     .reset = bmdma_reset,
>>>>>> };
>>>>>> 
>>>>>> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>>>>> +                           unsigned size)
>>>>> 
>>>>> Indentation off? Also everywhere else, usually we indent not with the 
>>>>> parenthesis but with the list within. (Auto indent in most editors does 
>>>>> that probably.)
>>>>> 
>>>> I guess you mean that it should be:
>>>> 
>>>> +uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>>> +                                                unsigned size)
>>>> 
>>>> Like this?
>>> 
>>> No, like the code you've moved had it. The split line should start after 
>>> the ( not on the same column. So:
>>> 
>>> uint64_t bmdma_default_read(void *opaque, hwaddr addr,
>>>                             unsigned size)
>>> 
>>> but this line does not need to be split at all as it fits within 80 chars 
>>> so better to keep it one line and only split where needed.
>>> 
>>>> I'm using Visual Studio Code, so I might not have the correct settings 
>>>> for this editor with QEMU.
>>>> The checkpatch script doesn't complain on style issues, so what can I do 
>>>> to make this correct?
>>> 
>>> If checkpatch is happy then probably not a problem but just look at how 
>>> code is indented on other places and follow the same. The coding style doc 
>>> may have some words on it too. I don't know what setting Visual Studio 
>>> might need.
>
> OK. I'll align it to the character after the start of the parenthesis. I'll 
> take a look into other code snippets in QEMU, but at least in the IDE code, 
> there are lots of code style issues (the checkpatch script says so) so I'll 
> probably look into other parts of QEMU to see how it goes.

Some parts of QEMU has some old code not yet following the latest coding 
style. Checkpatch usually tells you and if it's a few lines it's OK to 
correct it in the part you touch to silence checkpatch. Otherwise a 
separate code style fix patch before the modifications could also be 
included to avoid such warnings during later changes. I think this is 
explained in the patch submission guidelines.

> I'll take this a bit slow, as I wanted to send v2 today. This is probably not 
> a good idea as we should let people to see this and maybe to let the 
> maintainer (John) to look into this and put his comments on this too. I'll 
> give this a couple of days - no rush here, although I'd be very happy to see 
> things going forward as soon as possible, so we merge this patch and then 
> going back to the ich6-ide patch, and then hopefully more patches to the IDE 
> code to add more features and fixes in this part of QEMU codebase.

The only constraint is if you want this in the next release or it's ok to 
postpone it further. See the planning page about the schedule: 
https://wiki.qemu.org/Planning/7.0 which means if it's not in a pull 
request until March 8 then it will miss 7.0 and you'll have plenty of time 
to get the remaining changes polished until development opens again in 
second half of April.

Regards,
BALATON Zoltan
--3866299591-1217806381-1645294223=:22518--

