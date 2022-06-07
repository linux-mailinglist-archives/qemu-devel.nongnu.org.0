Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF453FAF7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:15:11 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWEn-00006m-3R
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyVyG-00023k-VY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:58:01 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:56263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyVyD-0004Wx-Ck
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:57:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 82DAF10858136;
 Tue,  7 Jun 2022 11:57:44 +0200 (CEST)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 11:57:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00394ed4ecc-cff8-4b05-95fa-e8513ab5fe67,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d244b9d9-3907-132c-cad3-ff31393b31fe@kaod.org>
Date: Tue, 7 Jun 2022 11:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 04/21] aspeed: i2c: Use reg array instead of individual
 vars
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>,
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-5-clg@kaod.org>
 <CACPK8Xe1n-N157r9Ea8DR_7TK6qDbe4Z-9z+qvRfOWU+RxJuSg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xe1n-N157r9Ea8DR_7TK6qDbe4Z-9z+qvRfOWU+RxJuSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: df2abb35-4f88-4d2f-b4de-a344acc4b0b2
X-Ovh-Tracer-Id: 2384656005477338058
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegslhgvrghlsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/22 01:49, Joel Stanley wrote:
> On Mon, 6 Jun 2022 at 15:08, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> From: Joe Komlodi <komlodi@google.com>
>>
>> Using a register array will allow us to represent old-mode and new-mode
>> I2C registers by using the same underlying register array, instead of
>> adding an entire new set of variables to represent new mode.
> 
> The downside of this approach is you lose the safety of having
> discrete types. A write to s->regs[R_FOO] can overwrite R_BAR.
> 
> 
>>
>> As part of this, we also do additional cleanup to use ARRAY_FIELD_
>> macros instead of FIELD_ macros on registers.
>>
>> Signed-off-by: Joe Komlodi <komlodi@google.com>
>> Change-Id: Ib94996b17c361b8490c042b43c99d8abc69332e3
>> Message-Id: <20220331043248.2237838-5-komlodi@google.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/i2c/aspeed_i2c.h |  11 +-
>>   hw/i2c/aspeed_i2c.c         | 286 +++++++++++++++++-------------------
>>   2 files changed, 133 insertions(+), 164 deletions(-)
> 
>> @@ -858,12 +834,12 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
>>   {
>>       AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
>>
>> -    s->intr_ctrl = 0;
>> -    s->intr_status = 0;
>> -    s->cmd = 0;
>> -    s->buf = 0;
>> -    s->dma_addr = 0;
>> -    s->dma_len = 0;
>> +    s->regs[R_I2CD_INTR_CTRL] = 0;
>> +    s->regs[R_I2CD_INTR_STS] = 0;
>> +    s->regs[R_I2CD_CMD] = 0;
>> +    s->regs[R_I2CD_BYTE_BUF] = 0;
>> +    s->regs[R_I2CD_DMA_ADDR] = 0;
>> +    s->regs[R_I2CD_DMA_LEN] = 0;
> 
> Could this become a memset of s->regs?

yes. It should. I can take care of it.

Thanks,

C.

> 
>>       i2c_end_transfer(s->bus);
>>   }
>>
>> @@ -921,10 +897,10 @@ static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
>>   static uint8_t *aspeed_2400_i2c_bus_pool_base(AspeedI2CBus *bus)
>>   {
>>       uint8_t *pool_page =
>> -        &bus->controller->pool[FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL,
>> -                                          POOL_PAGE_SEL) * 0x100];
>> +        &bus->controller->pool[ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL,
>> +                                                POOL_PAGE_SEL) * 0x100];
>>
>> -    return &pool_page[FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, OFFSET)];
>> +    return &pool_page[ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, OFFSET)];
>>   }
>>
>>   static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
>> --
>> 2.35.3
>>


