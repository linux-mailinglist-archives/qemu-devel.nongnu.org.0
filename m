Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33F336E71
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:06:11 +0100 (CET)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHGj-0008Po-Vy
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKHFc-0007oV-TU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:05:00 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52146
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKHFa-0008MP-Pe
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:05:00 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKHFT-0000to-Sz; Thu, 11 Mar 2021 09:04:57 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
 <78a760-65e9-3689-b0b7-cb80b7af81a@eik.bme.hu>
 <f58c7e62-5518-98cd-44eb-8eab5ab736d8@vivier.eu>
 <24d71ce3-b5b9-28fa-74c2-b22076bef287@vivier.eu>
 <762713e4-96a8-e989-fa76-2febad83afce@vivier.eu>
 <4d88313a-c067-163d-2d80-c60786bc9d85@ilande.co.uk>
 <6bf78d5d-d0d-807d-c35-5a5c40c4b977@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <65f60989-fa2e-1440-e32a-4aae16b1f137@ilande.co.uk>
Date: Thu, 11 Mar 2021 09:04:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6bf78d5d-d0d-807d-c35-5a5c40c4b977@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 11/03/2021 00:15, BALATON Zoltan wrote:

> On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
>> On 10/03/2021 13:24, Laurent Vivier wrote:
>>> Le 10/03/2021 à 14:10, Laurent Vivier a écrit :
>>>> Le 10/03/2021 à 13:56, Laurent Vivier a écrit :
>>>>> Le 10/03/2021 à 13:32, BALATON Zoltan a écrit :
>>>>>> On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
>>>>>>> The 60Hz timer is initialised using timer_new_ns() meaning that the timer
>>>>>>> interval should be measured in ns, and therefore its period is a thousand
>>>>>>> times too short.
>>>>>>>
>>>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>>>> ---
>>>>>>> hw/misc/mac_via.c | 4 ++--
>>>>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>>>>>>> index f994fefa7c..c6e1552a59 100644
>>>>>>> --- a/hw/misc/mac_via.c
>>>>>>> +++ b/hw/misc/mac_via.c
>>>>>>> @@ -302,8 +302,8 @@ static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>>>>>>>      MOS6522State *s = MOS6522(v1s);
>>>>>>>
>>>>>>>      /* 60 Hz irq */
>>>>>>> -    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
>>>>>>> -                          16630 * 16630;
>>>>>>> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630000) /
>>>>>>> +                          16630000 * 16630000;
>>>>>>
>>>>>> Can you put this magic number in a #define maybe also rewriting it in a way 
>>>>>> that shows it
>>>>>> corresponds to a 60 Hz interval. (There's NANOSECONDS_PER_SECOND defined in 
>>>>>> include/qemu/timer.h
>>>>>> that could be used for that, there's also SCALE_MS that might replace 1000 * 
>>>>>> 1000 elsewhere in this
>>>>>> file). Also NANOSECONDS_PER_SECOND / 60 is 16666666, should that value be used 
>>>>>> here instead?
>>>>>
>>>>> In fact, the Mac Frequency is not exactly 60 Hz, in docs we can find 60.147 Hz, 
>>>>> in kernel 60.15 Hz.
>>>>> I Think there are several ways to compute it...
>>>>>
>>>>
>>>> In fact, we can read:
>>>>
>>>> "the vertical retrace frequency is approximately 60.15 Hz, resulting in a period 
>>>> of approximately
>>>> 16.63 milliseconds"
>>>>
>>>> https://developer.apple.com/library/archive/documentation/mac/pdf/Processes/Vertical_Retrace_Mgr.pdf 
>>>>
>>>
>>> The exact value is 16625800 ns
>>>
>>> "Macintosh Family Hardware Reference" ISBN 0-201-19255-1
>>> "The video interface"
>>> p. 13-3
>>>
>>> "[...] This means the full frame is redisplayed every 370 scan lines, or once 
>>> every 166625.8 µs."
>>
>> Thanks Laurent! Given that the exact precision is 6 digits I don't think it's 
>> possible to make use of conversion macros without either making it harder to read 
>> or reducing the precision.
>>
>> I think the best solution here would be to #define VIA1_60HZ_TIMER_PERIOD_NS with a 
>> comment containing the above reference, and use that in the period calculation. 
>> Would that be sufficient?
> 
> Yes, I think that would make this a lot clearer than having this number without 
> explanation so that would be sufficient.
> 
> Is this referred to as 60Hz timer in the hardware docs? Because that name is a bit 
> misleading when it's actually not exactly 60Hz. But in the previous patch VBlank 
> which this was called before was also found misleading so I can't think of a better 
> name. Not sure if calling it compat_vblank would be too verbose or any better. Maybe 
> you can just add a comment explaining what this is somewhere where it's defined or 
> near the update function and then it does not matter what you call it, the comment 
> should explain why it's not quite sixty_hz. I'm also OK with calling it sixty_hz just 
> though if there's a way to give it a less confusing name you could consider that but 
> I don't have a better name either so feel free to ignore this.

Yes indeed, depending upon the documentation it is referred to as either the 60Hz or 
the 60.15Hz timer. Certainly that's enough information for anyone familiar with Mac 
internals to understand exactly what you are referring to. There are also plenty of 
examples of this elsewhere e.g. for graphics cards the high level claim will be that 
it supports over 16 million colours whereas the engineers know specifically that the 
exact number is 16777216.

I'll write up a suitable comment with a #define and send through a v2, perhaps 
altering the comment on the timer itself to read 60.15Hz as that's what the reference 
cited by Laurent also uses.


ATB,

Mark.

