Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE07333D6B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:12:14 +0100 (CET)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJydJ-0007IZ-Rc
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJybl-0006XM-2B
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:10:37 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:38717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJybi-0005Ug-Jw
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:10:36 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2V8Z-1ljvxI3RyJ-013yyO; Wed, 10 Mar 2021 14:10:31 +0100
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
From: Laurent Vivier <laurent@vivier.eu>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
 <78a760-65e9-3689-b0b7-cb80b7af81a@eik.bme.hu>
 <f58c7e62-5518-98cd-44eb-8eab5ab736d8@vivier.eu>
Message-ID: <24d71ce3-b5b9-28fa-74c2-b22076bef287@vivier.eu>
Date: Wed, 10 Mar 2021 14:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f58c7e62-5518-98cd-44eb-8eab5ab736d8@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JebNFydYf9LRQ+jh0C7ZICzxD0KpREu9Mm/pVgZQohVFnJQVtMH
 XWn/i1hObfwjj8e4jernF+7WFsFrPWNIPwG8qIPK8+TDpyFdpQ7OMZYJrgLpmyQcbiX+DnU
 tiTsU3gjLsX8Qd22VGpWD6XKw+0mU1JnbDC5S/h0weWNfksPKYegF+kxquBscze/gKHXIW4
 Vc17d+gUkwNJzwsu/e7iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NeYUCgcOU8g=:s9sV7Gejl8VvWepyvCzQBK
 FFwgD7oH1A8noRtpsUj5pSgbSKTu2oWRcpl6sIDMfPDShE+iLeJck8l34blW8Wjn470DxD0rP
 73QdFuU16rnv7jxlkCB8sAPxK9sdToQ6pUo9dqW9qFuoAHXyuKSXHAt4TYib2t/Qqo90xh3g0
 yjCdHNylHHT4z6rKpc4b1wW2Iu2M5P/r46XgxClOExPxlyswNn4SLXTmcP741AFRbwz4fvX9I
 BX9kKhmlf4rGiJpXp/Jk6r5SDJX+gfINk0wDcOaP0Ztm0odITMx5hM42kWnl3oA15mnMbgy61
 E8d4xbLEMupWvUMHMBtyV+K0oteiDBX8JOikdlIEHvvlcJrBR2zi7Wd3x6GaUkYySLPwRgntx
 SKm+RRilXO066TW/H5DJIOIYe1uFjhTcj/HUK2rDupKYzMtUcB0QZm7SClO4pl/9oUVL06bEI
 Dekb2J1MiA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/03/2021 à 13:56, Laurent Vivier a écrit :
> Le 10/03/2021 à 13:32, BALATON Zoltan a écrit :
>> On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
>>> The 60Hz timer is initialised using timer_new_ns() meaning that the timer
>>> interval should be measured in ns, and therefore its period is a thousand
>>> times too short.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>> hw/misc/mac_via.c | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>>> index f994fefa7c..c6e1552a59 100644
>>> --- a/hw/misc/mac_via.c
>>> +++ b/hw/misc/mac_via.c
>>> @@ -302,8 +302,8 @@ static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>>>     MOS6522State *s = MOS6522(v1s);
>>>
>>>     /* 60 Hz irq */
>>> -    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
>>> -                          16630 * 16630;
>>> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630000) /
>>> +                          16630000 * 16630000;
>>
>> Can you put this magic number in a #define maybe also rewriting it in a way that shows it
>> corresponds to a 60 Hz interval. (There's NANOSECONDS_PER_SECOND defined in include/qemu/timer.h
>> that could be used for that, there's also SCALE_MS that might replace 1000 * 1000 elsewhere in this
>> file). Also NANOSECONDS_PER_SECOND / 60 is 16666666, should that value be used here instead?
> 
> In fact, the Mac Frequency is not exactly 60 Hz, in docs we can find 60.147 Hz, in kernel 60.15 Hz.
> I Think there are several ways to compute it...
> 

In fact, we can read:

"the vertical retrace frequency is approximately 60.15 Hz, resulting in a period of approximately
16.63 milliseconds"

https://developer.apple.com/library/archive/documentation/mac/pdf/Processes/Vertical_Retrace_Mgr.pdf

Thanks,
Laurent


