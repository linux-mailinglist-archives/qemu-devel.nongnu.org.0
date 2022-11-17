Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C962D3AD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:57:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYp5-0001SY-2L; Thu, 17 Nov 2022 01:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovYox-0001RF-OO; Thu, 17 Nov 2022 01:56:24 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovYov-00087D-0b; Thu, 17 Nov 2022 01:56:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 35C9113FC88E5;
 Thu, 17 Nov 2022 07:56:14 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 07:56:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005e4ea5eb1-7e02-4635-96d8-8f15bbaf77e8,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
Date: Thu, 17 Nov 2022 07:56:03 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y3XXcWUnntBrIXq+@cormorant.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e24ac3a2-0f0f-44dc-b818-24372699c8c9
X-Ovh-Tracer-Id: 15784553746249649144
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpkhgsuhhstghhsehkvghrnhgvlhdrohhrghdptghmihhnhigrrhgusehmvhhishhtrgdrtghomhdpphgvthgvrhesphhjugdruggvvhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjkhestghoug
 gvtghonhhsthhruhgtthdrtghomhdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/17/22 07:40, Klaus Jensen wrote:
> On Nov 16 16:58, Cédric Le Goater wrote:
>> On 11/16/22 09:43, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> It is not given that the current master will release the bus after a
>>> transfer ends. Only schedule a pending master if the bus is idle.
>>>
>>> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>>    hw/i2c/aspeed_i2c.c  |  2 ++
>>>    hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
>>>    include/hw/i2c/i2c.h |  2 ++
>>>    3 files changed, 26 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
>>> index c166fd20fa11..1f071a3811f7 100644
>>> --- a/hw/i2c/aspeed_i2c.c
>>> +++ b/hw/i2c/aspeed_i2c.c
>>> @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>>>            }
>>>            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
>>>            aspeed_i2c_set_state(bus, I2CD_IDLE);
>>> +
>>> +        i2c_schedule_pending_master(bus->bus);
>>
>> Shouldn't it be i2c_bus_release() ?
>>
> 
> The reason for having both i2c_bus_release() and
> i2c_schedule_pending_master() is that i2c_bus_release() sort of pairs
> with i2c_bus_master(). They either set or clear the bus->bh member.
> 
> In the current design, the controller (in this case the Aspeed I2C) is
> an "implicit" master (it does not have a bottom half driving it), so
> there is no bus->bh to clear.
>
> I should (and will) write some documentation on the asynchronous API.

I found the routine names confusing. Thanks for the clarification.

Maybe we could do this rename  :

   i2c_bus_release()             -> i2c_bus_release_and_clear()
   i2c_schedule_pending_master() -> i2c_bus_release()

and keep i2c_schedule_pending_master() internal the I2C core subsystem.

C.


