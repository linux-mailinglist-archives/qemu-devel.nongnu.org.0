Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059E62D48F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovZqN-0002Eq-Hl; Thu, 17 Nov 2022 03:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovZq6-0002Cg-Vu; Thu, 17 Nov 2022 03:01:51 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovZq2-0004Td-RS; Thu, 17 Nov 2022 03:01:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3054113FCF361;
 Thu, 17 Nov 2022 09:01:24 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 09:01:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003c4f11eac-bf75-47b9-9550-d15f78110560,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <465b2d2e-5958-d63f-02dc-cf96dd1d459e@kaod.org>
Date: Thu, 17 Nov 2022 09:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>, Keith Busch
 <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>, Peter Delevoryas
 <peter@pjd.dev>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-block@nongnu.org>, Jeremy Kerr
 <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, Klaus Jensen
 <k.jensen@samsung.com>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
 <Y3XXcWUnntBrIXq+@cormorant.local>
 <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
 <Y3Xktt8b85RvJ89A@cormorant.local>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y3Xktt8b85RvJ89A@cormorant.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9fddcbc4-5a6f-4d65-a87c-270eabb9c85b
X-Ovh-Tracer-Id: 16884839431422446584
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpkhgsuhhstghhsehkvghrnhgvlhdrohhrghdptghmihhnhigrrhgusehmvhhishhtrgdrtghomhdpphgvthgvrhesphhjugdruggvvhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjkhestghoug
 gvtghonhhsthhruhgtthdrtghomhdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/17/22 08:37, Klaus Jensen wrote:
> On Nov 17 07:56, Cédric Le Goater wrote:
>> On 11/17/22 07:40, Klaus Jensen wrote:
>>> On Nov 16 16:58, Cédric Le Goater wrote:
>>>> On 11/16/22 09:43, Klaus Jensen wrote:
>>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>>
>>>>> It is not given that the current master will release the bus after a
>>>>> transfer ends. Only schedule a pending master if the bus is idle.
>>>>>
>>>>> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
>>>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>>> ---
>>>>>     hw/i2c/aspeed_i2c.c  |  2 ++
>>>>>     hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
>>>>>     include/hw/i2c/i2c.h |  2 ++
>>>>>     3 files changed, 26 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>>>> index c166fd20fa11..1f071a3811f7 100644
>>>>> --- a/hw/i2c/aspeed_i2c.c
>>>>> +++ b/hw/i2c/aspeed_i2c.c
>>>>> @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>>>>>             }
>>>>>             SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
>>>>>             aspeed_i2c_set_state(bus, I2CD_IDLE);
>>>>> +
>>>>> +        i2c_schedule_pending_master(bus->bus);
>>>>
>>>> Shouldn't it be i2c_bus_release() ?
>>>>
>>>
>>> The reason for having both i2c_bus_release() and
>>> i2c_schedule_pending_master() is that i2c_bus_release() sort of pairs
>>> with i2c_bus_master(). They either set or clear the bus->bh member.
>>>
>>> In the current design, the controller (in this case the Aspeed I2C) is
>>> an "implicit" master (it does not have a bottom half driving it), so
>>> there is no bus->bh to clear.
>>>
>>> I should (and will) write some documentation on the asynchronous API.
>>
>> I found the routine names confusing. Thanks for the clarification.
>>
>> Maybe we could do this rename  :
>>
>>    i2c_bus_release()             -> i2c_bus_release_and_clear()
>>    i2c_schedule_pending_master() -> i2c_bus_release()
>>
>> and keep i2c_schedule_pending_master() internal the I2C core subsystem.
>>
> 
> How about renaming i2c_bus_master to i2c_bus_acquire() such that it
> pairs with i2c_bus_release().

Looks good to me.

> And then add an i2c_bus_yield() to be used by the controller? I think we
> should be able to assert in i2c_bus_yield() that bus->bh is NULL. But
> I'll take a closer look at that.

I am using your i2c-echo slave device to track regressions in the Aspeed
machines. May be we could merge it for tests ?

Thanks,

C.

