Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09858FFAF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:33:04 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMABC-0002NU-Ip
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMA8m-0000fT-OT
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:30:32 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMA8k-0000n7-8j
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:30:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 87C5D217A9;
 Thu, 11 Aug 2022 15:30:27 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 11 Aug
 2022 17:30:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0036383aba0-1b5a-444c-8fa8-7628de1857f8,
 B18B381393FCCA734C2622819310E7EBE9D8D149) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <3d1c4889-2e42-b725-32c1-a21140bf3956@kaod.org>
Date: Thu, 11 Aug 2022 17:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 5/8] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Alistair Francis <alistair@alistair23.me>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220811151413.3350684-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b9a497cb-eb05-4f2c-bf5c-962392ebd2b7
X-Ovh-Tracer-Id: 2347219833297603549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggedgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/11/22 17:14, Alex Bennée wrote:
> Investigating why some BMC models are so slow compared to a plain ARM
> virt machines I did some profiling of:
> 
>    ./qemu-system-arm -M romulus-bmc -nic user \
>      -drive
>      file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
>      -nographic -serial mon:stdio
> 
> And saw that object_class_dynamic_cast_assert was dominating the
> profile times. We have a number of cases in this model of the SSI bus.
> As the class is static once the object is created we just cache it and
> use it instead of the dynamic case macros.
> 
> Profiling against:
> 
>    ./tests/venv/bin/avocado run \
>      tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0
> 
> Before: 35.565 s ±  0.087 s
> After: 15.713 s ±  0.287 s
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>

Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> 
> ---
> v2
>   - split patches
> ---
>   include/hw/ssi/ssi.h |  3 +++
>   hw/ssi/ssi.c         | 18 ++++++++----------
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index f411858ab0..6950f86810 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -59,6 +59,9 @@ struct SSIPeripheralClass {
>   struct SSIPeripheral {
>       DeviceState parent_obj;
>   
> +    /* cache the class */
> +    SSIPeripheralClass *spc;
> +
>       /* Chip select state */
>       bool cs;
>   };
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index 003931fb50..d54a109bee 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -38,9 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
>       bool cs = !!level;
>       assert(n == 0);
>       if (s->cs != cs) {
> -        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
> -        if (ssc->set_cs) {
> -            ssc->set_cs(s, cs);
> +        if (s->spc->set_cs) {
> +            s->spc->set_cs(s, cs);
>           }
>       }
>       s->cs = cs;
> @@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
>   
>   static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
>   {
> -    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
> +    SSIPeripheralClass *ssc = dev->spc;
>   
>       if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
> -            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> -            ssc->cs_polarity == SSI_CS_NONE) {
> +        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> +        ssc->cs_polarity == SSI_CS_NONE) {
>           return ssc->transfer(dev, val);
>       }
>       return 0;
> @@ -67,6 +66,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
>               ssc->cs_polarity != SSI_CS_NONE) {
>           qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
>       }
> +    s->spc = ssc;
>   
>       ssc->realize(s, errp);
>   }
> @@ -115,13 +115,11 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
>   {
>       BusState *b = BUS(bus);
>       BusChild *kid;
> -    SSIPeripheralClass *ssc;
>       uint32_t r = 0;
>   
>       QTAILQ_FOREACH(kid, &b->children, sibling) {
> -        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
> -        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
> -        r |= ssc->transfer_raw(peripheral, val);
> +        SSIPeripheral *p = SSI_PERIPHERAL(kid->child);
> +        r |= p->spc->transfer_raw(p, val);
>       }
>   
>       return r;


