Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB4419215
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:16:43 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUngg-0000yv-Pb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUnVm-0002oC-Hr
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:05:28 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:56213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUnVk-0005kO-Bl
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:05:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8019521A08;
 Mon, 27 Sep 2021 10:05:22 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 27 Sep
 2021 12:05:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006757d3b18-eb2e-4837-8480-1034a5013d3b,
 7A1C2730502A6E1581EB46D208322E62E5328AE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9c12c735-2cb4-0902-7d43-ccba7888b098@kaod.org>
Date: Mon, 27 Sep 2021 12:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210924061953.1996620-1-pdel@fb.com>
 <20210924061953.1996620-2-pdel@fb.com>
 <e4a8adf5-5b9f-0617-3b66-98d532187a1b@amsat.org>
 <24C5D588-770A-476C-A329-993619106251@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <24C5D588-770A-476C-A329-993619106251@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 756e842b-493a-4fef-99a7-3c92dcbcfbd0
X-Ovh-Tracer-Id: 10907999773035694886
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.478,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "rashmica.g@gmail.com" <rashmica.g@gmail.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 16:28, Peter Delevoryas wrote:
> 
>> On Sep 25, 2021, at 4:03 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> ﻿Hi Peter,
>>
>>> On 9/24/21 08:19, pdel@fb.com wrote:
>>> From: Peter Delevoryas <pdel@fb.com>
>>> The gpio array is declared as a dense array:
>>> ...
>>> qemu_irq gpios[ASPEED_GPIO_NR_PINS];
>>> (AST2500 has 228, AST2400 has 216, AST2600 has 208)
>>> However, this array is used like a matrix of GPIO sets
>>> (e.g. gpio[NR_SETS][NR_PINS_PER_SET] = gpio[8][32])
>>> size_t offset = set * GPIOS_PER_SET + gpio;
>>> qemu_set_irq(s->gpios[offset], !!(new & mask));
>>> This can result in an out-of-bounds access to "s->gpios" because the
>>> gpio sets do _not_ have the same length. Some of the groups (e.g.
>>> GPIOAB) only have 4 pins. 228 != 8 * 32 == 256.
>>> To fix this, I converted the gpio array from dense to sparse, to that
>>> match both the hardware layout and this existing indexing code.
>>
>> This is one logical change: 1 patch
>>
>>> Also, I noticed that some of the property specifications looked wrong:
>>> the lower 8 bits in the input and output u32's correspond to the first
>>> group label, and the upper 8 bits correspond to the last group label.
>>
>> Another logical change: another patch :)
>>
>> So please split this patch in 2. Maybe easier to fix GPIOSetProperties
>> first, then convert from dense to sparse array.
>>
> 
> Good point, I’ll split it up then!

Yes. We can surely merge the GPIOSetProperties patch quickly.

I hope Rashmica has some time to check the second part.
  
Thanks,

C.


> 
>> Regards,
>>
>> Phil.
>>
>>> I looked at the datasheet and several of these declarations seemed
>>> incorrect to me (I was basing it off of the I/O column). If somebody
>>> can double-check this, I'd really appreciate it!
>>> Some were definitely wrong though, like "Y" and "Z" in the 2600.
>>> @@ -796,7 +776,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
>>>       [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
>>>       [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
>>>       [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
>>> -    [6] = {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
>>> +    [6] = {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
>>>       [7] = {0x000000ff,  0x000000ff,  {"AC"} },
>>>   };
>>> @@ -805,9 +785,9 @@ static GPIOSetProperties ast2600_3_3v_set_props[] = {
>>>       [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
>>>       [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
>>>       [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
>>> -    [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
>>> -    [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
>>> -    [6] = {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
>>> +    [4] = {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
>>> +    [5] = {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
>>> +    [6] = {0x0000ffff,  0x0000ffff,  {"Y", "Z", "", ""} },
>>>   };
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>> ---
>>>   hw/gpio/aspeed_gpio.c         | 80 +++++++++++++++--------------------
>>>   include/hw/gpio/aspeed_gpio.h |  5 +--
>>>   2 files changed, 35 insertions(+), 50 deletions(-)


