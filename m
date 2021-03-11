Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32033687B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:17:42 +0100 (CET)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK91I-0003hE-VN
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lK8zp-0003G8-BC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:16:09 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lK8zl-0007Gp-7w
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:16:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8C7767456E3;
 Thu, 11 Mar 2021 01:15:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5702C7456B8; Thu, 11 Mar 2021 01:15:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 53AA57456B7;
 Thu, 11 Mar 2021 01:15:59 +0100 (CET)
Date: Thu, 11 Mar 2021 01:15:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
In-Reply-To: <4d88313a-c067-163d-2d80-c60786bc9d85@ilande.co.uk>
Message-ID: <6bf78d5d-d0d-807d-c35-5a5c40c4b977@eik.bme.hu>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
 <78a760-65e9-3689-b0b7-cb80b7af81a@eik.bme.hu>
 <f58c7e62-5518-98cd-44eb-8eab5ab736d8@vivier.eu>
 <24d71ce3-b5b9-28fa-74c2-b22076bef287@vivier.eu>
 <762713e4-96a8-e989-fa76-2febad83afce@vivier.eu>
 <4d88313a-c067-163d-2d80-c60786bc9d85@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-975901755-1615421759=:66176"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-975901755-1615421759=:66176
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
> On 10/03/2021 13:24, Laurent Vivier wrote:
>> Le 10/03/2021 à 14:10, Laurent Vivier a écrit :
>>> Le 10/03/2021 à 13:56, Laurent Vivier a écrit :
>>>> Le 10/03/2021 à 13:32, BALATON Zoltan a écrit :
>>>>> On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
>>>>>> The 60Hz timer is initialised using timer_new_ns() meaning that the 
>>>>>> timer
>>>>>> interval should be measured in ns, and therefore its period is a 
>>>>>> thousand
>>>>>> times too short.
>>>>>> 
>>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>>> ---
>>>>>> hw/misc/mac_via.c | 4 ++--
>>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>> 
>>>>>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>>>>>> index f994fefa7c..c6e1552a59 100644
>>>>>> --- a/hw/misc/mac_via.c
>>>>>> +++ b/hw/misc/mac_via.c
>>>>>> @@ -302,8 +302,8 @@ static void 
>>>>>> via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>>>>>>      MOS6522State *s = MOS6522(v1s);
>>>>>>
>>>>>>      /* 60 Hz irq */
>>>>>> -    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 
>>>>>> 16630) /
>>>>>> -                          16630 * 16630;
>>>>>> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 
>>>>>> 16630000) /
>>>>>> +                          16630000 * 16630000;
>>>>> 
>>>>> Can you put this magic number in a #define maybe also rewriting it in a 
>>>>> way that shows it
>>>>> corresponds to a 60 Hz interval. (There's NANOSECONDS_PER_SECOND defined 
>>>>> in include/qemu/timer.h
>>>>> that could be used for that, there's also SCALE_MS that might replace 
>>>>> 1000 * 1000 elsewhere in this
>>>>> file). Also NANOSECONDS_PER_SECOND / 60 is 16666666, should that value 
>>>>> be used here instead?
>>>> 
>>>> In fact, the Mac Frequency is not exactly 60 Hz, in docs we can find 
>>>> 60.147 Hz, in kernel 60.15 Hz.
>>>> I Think there are several ways to compute it...
>>>> 
>>> 
>>> In fact, we can read:
>>> 
>>> "the vertical retrace frequency is approximately 60.15 Hz, resulting in a 
>>> period of approximately
>>> 16.63 milliseconds"
>>> 
>>> https://developer.apple.com/library/archive/documentation/mac/pdf/Processes/Vertical_Retrace_Mgr.pdf
>> 
>> The exact value is 16625800 ns
>> 
>> "Macintosh Family Hardware Reference" ISBN 0-201-19255-1
>> "The video interface"
>> p. 13-3
>> 
>> "[...] This means the full frame is redisplayed every 370 scan lines, or 
>> once every 166625.8 µs."
>
> Thanks Laurent! Given that the exact precision is 6 digits I don't think it's 
> possible to make use of conversion macros without either making it harder to 
> read or reducing the precision.
>
> I think the best solution here would be to #define VIA1_60HZ_TIMER_PERIOD_NS 
> with a comment containing the above reference, and use that in the period 
> calculation. Would that be sufficient?

Yes, I think that would make this a lot clearer than having this number 
without explanation so that would be sufficient.

Is this referred to as 60Hz timer in the hardware docs? Because that name 
is a bit misleading when it's actually not exactly 60Hz. But in the 
previous patch VBlank which this was called before was also found 
misleading so I can't think of a better name. Not sure if calling it 
compat_vblank would be too verbose or any better. Maybe you can just add a 
comment explaining what this is somewhere where it's defined or near the 
update function and then it does not matter what you call it, the comment 
should explain why it's not quite sixty_hz. I'm also OK with calling it 
sixty_hz just though if there's a way to give it a less confusing name you 
could consider that but I don't have a better name either so feel free to 
ignore this.

Regards,
BALATON Zoltan
--3866299591-975901755-1615421759=:66176--

