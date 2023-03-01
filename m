Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644066A6D07
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMUv-0008OA-DL; Wed, 01 Mar 2023 08:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXMUr-0008N7-9F
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:27:53 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXMUo-0003am-7T
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:27:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 076932A7B1;
 Wed,  1 Mar 2023 13:27:44 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 14:27:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001755528a9-9b36-4a35-befc-f088aff4e89f,
 BA6511934B6943C3167A88A21852BB5F3FADB7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9d2cc891-9316-ccd4-ca33-035073bec256@kaod.org>
Date: Wed, 1 Mar 2023 14:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 7/8] aspeed: Introduce a spi_boot region under the SoC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-8-clg@kaod.org>
 <49213633-802b-afdd-d54d-e40a866e3fc2@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <49213633-802b-afdd-d54d-e40a866e3fc2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7083b5dd-809b-411d-a2a7-3fc6e0814d26
X-Ovh-Tracer-Id: 5967269506860092268
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudelhedggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/15/23 12:02, Philippe Mathieu-Daudé wrote:
> On 14/2/23 18:18, Cédric Le Goater wrote:
>> The default boot of the Aspeed SoCs is address 0x0. For this reason,
>> the FMC flash device contents are remapped by HW on the first 256MB of
>> the address space. In QEMU, this is currently done in the machine init
>> with the setup of a region alias.
>>
>> Move this code to the SoC and introduce an extra container to prepare
>> ground for the boot ROM region which will overlap the FMC flash
>> remapping.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/arm/aspeed_soc.h |  3 +++
>>   hw/arm/aspeed.c             | 13 +------------
>>   hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
>>   hw/arm/aspeed_soc.c         | 14 ++++++++++++++
>>   hw/arm/fby35.c              |  8 +-------
>>   5 files changed, 32 insertions(+), 19 deletions(-)
> 
>>   enum {
>> +    ASPEED_DEV_SPI_BOOT,
>>       ASPEED_DEV_IOMEM,
>>       ASPEED_DEV_UART1,
>>       ASPEED_DEV_UART2,
> 
> 
>>   #define ASPEED_SOC_DPMCU_SIZE       0x00040000
>>   static const hwaddr aspeed_soc_ast2600_memmap[] = {
>> +    [ASPEED_DEV_SPI_BOOT]  = 0x0,
> 
> Isn't this a constant address for this Soc family?
> If so, we can define ASPEED_SOC_RESET_ADDR once ...

I will introduce :

   #define ASPEED_SPI_BOOT_ADDR 0x0

and use it every where it makes sense. This should replace FIRMWARE_ADDR
in aspeed.c also.

Thanks,

C.

> 
>>       [ASPEED_DEV_SRAM]      = 0x10000000,
>>       [ASPEED_DEV_DPMCU]     = 0x18000000,
>>       /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
>> @@ -282,6 +283,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>       qemu_irq irq;
>>       g_autofree char *sram_name = NULL;
>> +    /* Default boot region (SPI memory or ROMs) */
>> +    memory_region_init(&s->spi_boot_container, OBJECT(s),
>> +                       "aspeed.spi_boot_container", 0x10000000);
>> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],
> 
> ... and use it here.
> 
>> +                                &s->spi_boot_container);
> 


