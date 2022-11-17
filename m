Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B361E62DD01
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:41:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovf8B-0004ru-R7; Thu, 17 Nov 2022 08:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovf89-0004r6-B0; Thu, 17 Nov 2022 08:40:37 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovf87-0001xA-CC; Thu, 17 Nov 2022 08:40:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A849F13FFB3E6;
 Thu, 17 Nov 2022 14:40:30 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 14:40:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0015ea10662-7451-4875-8c3e-4ed45b66f22d,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <15100caa-4c03-a166-7ce3-fe1d30471a30@kaod.org>
Date: Thu, 17 Nov 2022 14:40:27 +0100
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
 <465b2d2e-5958-d63f-02dc-cf96dd1d459e@kaod.org>
 <Y3YiAhXX1FKuYMoc@cormorant.local>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y3YiAhXX1FKuYMoc@cormorant.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9fc5d7ef-695d-4cfa-8d39-8e04ae33fd2c
X-Ovh-Tracer-Id: 4165266707627674616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpkhgsuhhstghhsehkvghrnhgvlhdrohhrghdptghmihhnhigrrhgusehmvhhishhtrgdrtghomhdpphgvthgvrhesphhjugdruggvvhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjkhestghouggvtg
 honhhsthhruhgtthdrtghomhdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
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

On 11/17/22 12:58, Klaus Jensen wrote:
> On Nov 17 09:01, Cédric Le Goater wrote:
>> On 11/17/22 08:37, Klaus Jensen wrote:
>>> On Nov 17 07:56, Cédric Le Goater wrote:
>>>> On 11/17/22 07:40, Klaus Jensen wrote:
>>>>> On Nov 16 16:58, Cédric Le Goater wrote:
>>>>>> On 11/16/22 09:43, Klaus Jensen wrote:
>>>>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>>>>
>>>>>>> It is not given that the current master will release the bus after a
>>>>>>> transfer ends. Only schedule a pending master if the bus is idle.
>>>>>>>
>>>>>>> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
>>>>>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>>>>> ---
>>>>>>>      hw/i2c/aspeed_i2c.c  |  2 ++
>>>>>>>      hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
>>>>>>>      include/hw/i2c/i2c.h |  2 ++
>>>>>>>      3 files changed, 26 insertions(+), 15 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>>>>>> index c166fd20fa11..1f071a3811f7 100644
>>>>>>> --- a/hw/i2c/aspeed_i2c.c
>>>>>>> +++ b/hw/i2c/aspeed_i2c.c
>>>>>>> @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>>>>>>>              }
>>>>>>>              SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
>>>>>>>              aspeed_i2c_set_state(bus, I2CD_IDLE);
>>>>>>> +
>>>>>>> +        i2c_schedule_pending_master(bus->bus);
>>>>>>
>>>>>> Shouldn't it be i2c_bus_release() ?
>>>>>>
>>>>>
>>>>> The reason for having both i2c_bus_release() and
>>>>> i2c_schedule_pending_master() is that i2c_bus_release() sort of pairs
>>>>> with i2c_bus_master(). They either set or clear the bus->bh member.
>>>>>
>>>>> In the current design, the controller (in this case the Aspeed I2C) is
>>>>> an "implicit" master (it does not have a bottom half driving it), so
>>>>> there is no bus->bh to clear.
>>>>>
>>>>> I should (and will) write some documentation on the asynchronous API.
>>>>
>>>> I found the routine names confusing. Thanks for the clarification.
>>>>
>>>> Maybe we could do this rename  :
>>>>
>>>>     i2c_bus_release()             -> i2c_bus_release_and_clear()
>>>>     i2c_schedule_pending_master() -> i2c_bus_release()
>>>>
>>>> and keep i2c_schedule_pending_master() internal the I2C core subsystem.
>>>>
>>>
>>> How about renaming i2c_bus_master to i2c_bus_acquire() such that it
>>> pairs with i2c_bus_release().
>>
>> Looks good to me.
>>
>>> And then add an i2c_bus_yield() to be used by the controller? I think we
>>> should be able to assert in i2c_bus_yield() that bus->bh is NULL. But
>>> I'll take a closer look at that.
>>
>> I am using your i2c-echo slave device to track regressions in the Aspeed
>> machines. May be we could merge it for tests ?
>>
> 
> Oh, cool.
> 
> Sure, I'd be happy to help "maintain" it ;)

And so, I am seeing errors with the little POC you sent.

without:
   
   console: echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
   console: # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
   console: [    4.252431] i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64
   console: i2cset -y 3 0x42 0x64 0x00 0xaa i
   /console: # i2cset -y 3 0x42 0x64 0x00 0xaa i
   console: # hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom
   console: 0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
   console: poweroff
   console: 0000010 ffff ffff ffff ffff ffff ffff ffff ffff
   console: *
   console: 0000100

with:
   
   console: echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
   console: # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
   console: [    4.413210] i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64
   console: i2cset -y 3 0x42 0x64 0x00 0xaa i
   console: # i2cset -y 3 0x42 0x64 0x00 0xaa i
   console: # hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom
   console: 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
   console: *
   console: 0000100
   
C.

