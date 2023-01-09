Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F8662DBA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwMQ-0005ZJ-PA; Mon, 09 Jan 2023 12:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEwMO-0005Y8-R1; Mon, 09 Jan 2023 12:55:00 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEwMN-00074a-29; Mon, 09 Jan 2023 12:55:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2B51015230CB4;
 Mon,  9 Jan 2023 18:54:53 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 18:54:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018f856684-d757-4259-be3a-f4ca134e8240,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f92e9758-bd42-bf7c-f5a0-8998d2eabf20@kaod.org>
Date: Mon, 9 Jan 2023 18:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
Content-Language: en-US
To: Stephen Longfield <slongfield@google.com>
CC: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <venture@google.com>, <wuhaotsh@google.com>
References: <20221220221437.3303721-1-slongfield@google.com>
 <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
 <CAK_0=FLEiWQMWqzkM_EZ4VCzwRYeTbN9djuFgDR1EwVAZ1oALA@mail.gmail.com>
 <CAK_0=FKBx8DxTCJ1QzW7SC8QenNmvm13aJyO9P882V3gKhWxLg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAK_0=FKBx8DxTCJ1QzW7SC8QenNmvm13aJyO9P882V3gKhWxLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: baa6b6ee-9020-4760-8e27-e0f1fa4e4fea
X-Ovh-Tracer-Id: 6119547468826446700
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefgfekteekgeelheeujeeghfetkeetleeiudeuffektefgkeehueffheevveekjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhlohhnghhfihgvlhgusehgohhoghhlvgdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhmpdifuhhhrghothhshhesghhoohhglhgvrdgtohhmpdfovfetjf
 hoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/9/23 18:50, Stephen Longfield wrote:
> Does anything more need to happen with this patch before it can be
> applied? Not sure if it had gotten lost over the holidays.

I queued it with other aspeed changes :

   https://github.com/legoater/qemu/commits/aspeed-8.0

We have some time before 8.0 is released.

Thanks,

C.


> 
> Best,
> 
> --Stephen
> 
> 
> On Wed, Dec 21, 2022 at 9:58 AM Stephen Longfield <slongfield@google.com> wrote:
>>
>> On Tue, Dec 20, 2022 at 11:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> On 12/20/22 23:14, Stephen Longfield wrote:
>>>> With the `size += 4` before the call to `crc32`, the CRC calculation
>>>> would overrun the buffer. Size is used in the while loop starting on
>>>> line 1009 to determine how much data to write back, with the last
>>>> four bytes coming from `crc_ptr`, so do need to increase it, but should
>>>> do this after the computation.
>>>>
>>>> I'm unsure why this use of uninitialized memory in the CRC doesn't
>>>> result in CRC errors, but it seems clear to me that it should not be
>>>> included in the calculation.
>>>>
>>>> Signed-off-by: Stephen Longfield <slongfield@google.com>
>>>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>>>
>>>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> I think imx_fec.c is impacted also.
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>
>> Thanks for pointing that out, looks to be exactly the same. I'll send
>> out a separate patch that fixes the issue in that file.
>>
>> Best,
>>
>> --Stephen
>>
>>>
>>>> ---
>>>>    hw/net/ftgmac100.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
>>>> index 83ef0a783e..d3bf14be53 100644
>>>> --- a/hw/net/ftgmac100.c
>>>> +++ b/hw/net/ftgmac100.c
>>>> @@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>>>>            return size;
>>>>        }
>>>>
>>>> -    /* 4 bytes for the CRC.  */
>>>> -    size += 4;
>>>>        crc = cpu_to_be32(crc32(~0, buf, size));
>>>> +    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
>>>> +    size += 4;
>>>>        crc_ptr = (uint8_t *) &crc;
>>>>
>>>>        /* Huge frames are truncated.  */
>>>> --
>>>> 2.39.0.314.g84b9a713c41-goog
>>>>
>>>


