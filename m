Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AFC6CC039
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:10:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph95l-0001oV-AD; Tue, 28 Mar 2023 09:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph95i-0001o9-Gl
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:10:22 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph95g-0003Hu-Id
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:10:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.139])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A6B1521926;
 Tue, 28 Mar 2023 13:10:16 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 28 Mar
 2023 15:10:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001c1407045-5d60-4232-86f1-b9ca6fff205e,
 5D21C2AA46E1B9891D174392918792ED1A5C90BB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <413c3af3-38cf-0e7e-73f5-c817cb9b1176@kaod.org>
Date: Tue, 28 Mar 2023 15:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] qtest: Add functions for accessing devices on Aspeed
 I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <marcandre.lureau@redhat.com>, <ninad@linux.ibm.com>, <joel@jms.id.au>,
 <andrew@aj.id.au>
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
 <20230327202416.3617162-2-stefanb@linux.ibm.com>
 <0368d6a6-5f66-9758-6977-818128d928b5@kaod.org>
 <ac889ea5-b335-ba77-46b6-6b91966e4da6@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ac889ea5-b335-ba77-46b6-6b91966e4da6@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a30f0ede-5960-4a48-8ce1-1e6856add4ce
X-Ovh-Tracer-Id: 16661066822872959782
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhgrrhgtrghnughrvgdrlhhurhgvrghusehrvgguhhgrthdrtghomhdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
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

On 3/28/23 14:26, Stefan Berger wrote:
> 
> 
> On 3/28/23 02:39, Cédric Le Goater wrote:
>> On 3/27/23 22:24, Stefan Berger wrote:
>>> Add read and write functions for accessing registers of I2C devices
>>> connected to the Aspeed I2C controller.
>>>
>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> [... ]
>>
>>> +#ifndef QTEST_ASPEED_H
>>> +#define QTEST_ASPEED_H
>>> +
>>> +#include <stdint.h>
>>> +
>>> +#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
>>> +
>>> +static inline uint32_t ast2600_aspeed_i2c_calc_dev_addr(uint8_t bus_num)
>>
>> I think you could simplify the name ast2600_aspeed_i2c_calc_dev_addr()
>> to aspeed_i2c_calc_bus_addr() and add a comment saying it implements only
>> the AST2600 I2C controller. I don't think we will need the others.
> 
> 
> What are 'the others'?

AST2400 and AST2500 SoC.

>>> +{
>>> +    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
>>> +}
>>
>> The formula is :
>>
>>     return soc_base + (soc_i2c_offset + bus_num) * soc_i2c_reg_size;
> 
> That's what I thought:
> 
> return soc_base + soc_i2c_offset + (bus_num * soc_i2c_reg_size);
>
> I will keep it as it is, though.

It should work also for the AST2600

FYI, see the layouts below,

Thanks,

C.


AST2400

     000000001e78a000-000000001e78afff (prio 0, i/o): aspeed.i2c
       000000001e78a040-000000001e78a07f (prio 0, i/o): aspeed.i2c.bus.0
       000000001e78a080-000000001e78a0bf (prio 0, i/o): aspeed.i2c.bus.1
       000000001e78a0c0-000000001e78a0ff (prio 0, i/o): aspeed.i2c.bus.2
       000000001e78a100-000000001e78a13f (prio 0, i/o): aspeed.i2c.bus.3
       000000001e78a140-000000001e78a17f (prio 0, i/o): aspeed.i2c.bus.4
       000000001e78a180-000000001e78a1bf (prio 0, i/o): aspeed.i2c.bus.5
       000000001e78a1c0-000000001e78a1ff (prio 0, i/o): aspeed.i2c.bus.6
       000000001e78a300-000000001e78a33f (prio 0, i/o): aspeed.i2c.bus.7
       000000001e78a340-000000001e78a37f (prio 0, i/o): aspeed.i2c.bus.8
       000000001e78a380-000000001e78a3bf (prio 0, i/o): aspeed.i2c.bus.9
       000000001e78a3c0-000000001e78a3ff (prio 0, i/o): aspeed.i2c.bus.10
       000000001e78a400-000000001e78a43f (prio 0, i/o): aspeed.i2c.bus.11
       000000001e78a440-000000001e78a47f (prio 0, i/o): aspeed.i2c.bus.12
       000000001e78a480-000000001e78a4bf (prio 0, i/o): aspeed.i2c.bus.13
       000000001e78a800-000000001e78afff (prio 0, i/o): aspeed.i2c-pool

AST2500

     000000001e78a000-000000001e78afff (prio 0, i/o): aspeed.i2c
       000000001e78a040-000000001e78a07f (prio 0, i/o): aspeed.i2c.bus.0
       000000001e78a080-000000001e78a0bf (prio 0, i/o): aspeed.i2c.bus.1
       000000001e78a0c0-000000001e78a0ff (prio 0, i/o): aspeed.i2c.bus.2
       000000001e78a100-000000001e78a13f (prio 0, i/o): aspeed.i2c.bus.3
       000000001e78a140-000000001e78a17f (prio 0, i/o): aspeed.i2c.bus.4
       000000001e78a180-000000001e78a1bf (prio 0, i/o): aspeed.i2c.bus.5
       000000001e78a1c0-000000001e78a1ff (prio 0, i/o): aspeed.i2c.bus.6
       000000001e78a200-000000001e78a2ff (prio 0, i/o): aspeed.i2c-pool
       000000001e78a300-000000001e78a33f (prio 0, i/o): aspeed.i2c.bus.7
       000000001e78a340-000000001e78a37f (prio 0, i/o): aspeed.i2c.bus.8
       000000001e78a380-000000001e78a3bf (prio 0, i/o): aspeed.i2c.bus.9
       000000001e78a3c0-000000001e78a3ff (prio 0, i/o): aspeed.i2c.bus.10
       000000001e78a400-000000001e78a43f (prio 0, i/o): aspeed.i2c.bus.11
       000000001e78a440-000000001e78a47f (prio 0, i/o): aspeed.i2c.bus.12
       000000001e78a480-000000001e78a4bf (prio 0, i/o): aspeed.i2c.bus.13

AST2600

     000000001e78a000-000000001e78afff (prio 0, i/o): aspeed.i2c
       000000001e78a080-000000001e78a0ff (prio 0, i/o): aspeed.i2c.bus.0
       000000001e78a100-000000001e78a17f (prio 0, i/o): aspeed.i2c.bus.1
       000000001e78a180-000000001e78a1ff (prio 0, i/o): aspeed.i2c.bus.2
       000000001e78a200-000000001e78a27f (prio 0, i/o): aspeed.i2c.bus.3
       000000001e78a280-000000001e78a2ff (prio 0, i/o): aspeed.i2c.bus.4
       000000001e78a300-000000001e78a37f (prio 0, i/o): aspeed.i2c.bus.5
       000000001e78a380-000000001e78a3ff (prio 0, i/o): aspeed.i2c.bus.6
       000000001e78a400-000000001e78a47f (prio 0, i/o): aspeed.i2c.bus.7
       000000001e78a480-000000001e78a4ff (prio 0, i/o): aspeed.i2c.bus.8
       000000001e78a500-000000001e78a57f (prio 0, i/o): aspeed.i2c.bus.9
       000000001e78a580-000000001e78a5ff (prio 0, i/o): aspeed.i2c.bus.10
       000000001e78a600-000000001e78a67f (prio 0, i/o): aspeed.i2c.bus.11
       000000001e78a680-000000001e78a6ff (prio 0, i/o): aspeed.i2c.bus.12
       000000001e78a700-000000001e78a77f (prio 0, i/o): aspeed.i2c.bus.13
       000000001e78a780-000000001e78a7ff (prio 0, i/o): aspeed.i2c.bus.14
       000000001e78a800-000000001e78a87f (prio 0, i/o): aspeed.i2c.bus.15
       000000001e78ac00-000000001e78adff (prio 0, i/o): aspeed.i2c-pool


