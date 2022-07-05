Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABD5674C1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:49:09 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ljY-0005TO-PR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8lY4-0004JO-A5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:37:16 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:34503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8lY1-0001CL-8k
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:37:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 51DEA26D2E;
 Tue,  5 Jul 2022 16:37:10 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 18:37:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006c8b0525c-ec78-40bc-af95-d062cefa3089,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <da9c52e2-905e-0f6d-13a7-a88eac365c66@kaod.org>
Date: Tue, 5 Jul 2022 18:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220705145814.461723-1-clg@kaod.org>
 <20220705145814.461723-3-clg@kaod.org>
 <526a762-2c94-186a-69e0-c5979973a58a@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <526a762-2c94-186a-69e0-c5979973a58a@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 0094b2f1-ffbd-4e01-aab5-8b36d7285380
X-Ovh-Tracer-Id: 7545218226064624492
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/5/22 18:27, BALATON Zoltan wrote:
> On Tue, 5 Jul 2022, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc.c           |  5 +----
>> hw/ppc/ppc405_uc.c     |  4 ++--
>> hw/ppc/ppc440_bamboo.c |  4 ++--
>> hw/ppc/sam460ex.c      |  4 ++--
>> hw/ppc/virtex_ml507.c  | 10 +++++-----
>> 5 files changed, 12 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index 15f2b5f0f07a..8c88d3a4806d 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -422,10 +422,7 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
>>
>> void ppc40x_irq_init(PowerPCCPU *cpu)
>> {
>> -    CPUPPCState *env = &cpu->env;
>> -
>> -    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc40x_set_irq,
>> -                                                  cpu, PPC40x_INPUT_NB);
>> +    qdev_init_gpio_in(DEVICE(cpu), ppc40x_set_irq, PPC40x_INPUT_NB);
>> }
>>
>> /* PowerPC E500 internal IRQ controller */
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 36c8ba6f3c14..d6420c88d3a6 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1470,9 +1470,9 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>     sysbus_realize_and_unref(uicsbd, &error_fatal);
>>
>>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
>> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
>> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
>> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
>> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>>
>>     *uicdevp = uicdev;
>>
>> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
>> index d5973f2484ed..873f930c77da 100644
>> --- a/hw/ppc/ppc440_bamboo.c
>> +++ b/hw/ppc/ppc440_bamboo.c
>> @@ -200,9 +200,9 @@ static void bamboo_init(MachineState *machine)
>>     sysbus_realize_and_unref(uicsbd, &error_fatal);
>>
>>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
>> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
>> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
>> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
>> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>>
>>     /* SDRAM controller */
>>     memset(ram_bases, 0, sizeof(ram_bases));
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 2f24598f55db..7e8da657c2a9 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -334,9 +334,9 @@ static void sam460ex_init(MachineState *machine)
>>
>>         if (i == 0) {
>>             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
>> -                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
>> +                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>>             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
>> -                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
>> +                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
> 
> Looks like indentation is off in above two lines.

Yes. This is to make check-patch happy.

C.

> 
> Regards,
> BALATON Zoltan
> 
>>         } else {
>>             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
>>                                qdev_get_gpio_in(uic[0], input_ints[i]));
>> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
>> index b67a709ddce2..53b126ff48a6 100644
>> --- a/hw/ppc/virtex_ml507.c
>> +++ b/hw/ppc/virtex_ml507.c
>> @@ -111,9 +111,9 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>>     sysbus_realize_and_unref(uicsbd, &error_fatal);
>>
>>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
>> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
>> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
>>     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
>> -                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
>> +                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>>
>>     /* This board doesn't wire anything up to the inputs of the UIC. */
>>     return cpu;
>> @@ -213,7 +213,7 @@ static void virtex_init(MachineState *machine)
>>     CPUPPCState *env;
>>     hwaddr ram_base = 0;
>>     DriveInfo *dinfo;
>> -    qemu_irq irq[32], *cpu_irq;
>> +    qemu_irq irq[32], cpu_irq;
>>     int kernel_size;
>>     int i;
>>
>> @@ -236,12 +236,12 @@ static void virtex_init(MachineState *machine)
>>                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>>                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
>>
>> -    cpu_irq = (qemu_irq *) &env->irq_inputs[PPC40x_INPUT_INT];
>> +    cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
>>     dev = qdev_new("xlnx.xps-intc");
>>     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
>>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
>> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
>>     for (i = 0; i < 32; i++) {
>>         irq[i] = qdev_get_gpio_in(dev, i);
>>     }
>>


