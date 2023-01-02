Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FB65AF7D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:23:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCHxS-0008IC-SI; Mon, 02 Jan 2023 05:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCHxR-0008I0-6C
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:22:17 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCHxP-0006KV-78
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:22:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 74CDD1504AD30;
 Mon,  2 Jan 2023 11:22:02 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 11:22:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c51d5bad-23a1-4924-9daf-21135f1e8531,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <76d3dd32-a8c0-c171-db8a-eb9939580ac8@kaod.org>
Date: Mon, 2 Jan 2023 11:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/9] hw/watchdog/wdt_aspeed: Map the whole MMIO range
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>, 
 Peter Delevoryas <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal
 <bleal@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Troy
 Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229152325.32041-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ebaa08ba-9057-4d6f-b2ea-ffc0690429b2
X-Ovh-Tracer-Id: 12702965699787918209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgslhgvrghlsehrvg
 guhhgrthdrtghomhdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhpuggvlhesfhgsrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12/29/22 16:23, Philippe Mathieu-Daudé wrote:
> Avoid confusing two different things:
> - the WDT I/O region size ('iosize')
> - at which offset the SoC map the WDT ('offset')
> While it is often the same, we can map smaller region sizes at
> larger offsets.
> 
> Here we are interested in the I/O region size. Rename as 'iosize'
> and map the whole range, not only the first implemented registers.
> Unimplemented registers accesses are already logged as guest-errors.
> 
> Otherwise when booting the demo in [*] we get:
> 
>    aspeed.io: unimplemented device write (size 4, offset 0x1851a8, value 0x030f1ff1)
>    aspeed.io: unimplemented device write (size 4, offset 0x1851ac, value 0x03fffff1)
>    aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1)
>    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)

These are unimplemented registers related to software mode reset, which is a new
feature of the AST2600 SoC. The AST10x0 SoCs add a few more regs, hence the larger
MMIO width for the WDT registers. Until now, they have been harmless.

> 
> [*] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed_ast10x0.c          |  2 +-
>   hw/arm/aspeed_ast2600.c          |  2 +-
>   hw/arm/aspeed_soc.c              |  2 +-
>   hw/watchdog/wdt_aspeed.c         | 12 +++++++-----
>   include/hw/watchdog/wdt_aspeed.h |  2 +-
>   5 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 4d0b9b115f..122b3fd3f3 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -325,7 +325,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>               return;
>           }
>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>       }
>   
>       /* GPIO */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index cd75465c2b..a79e05ddbd 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -472,7 +472,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>       }
>   
>       /* RAM */
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b05b9dd416..2c0924d311 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -393,7 +393,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>           aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
> -                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
> +                        sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize);
>       }
>   
>       /* RAM  */
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index d753693a2e..c1311ce74c 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>   {
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>       AspeedWDTState *s = ASPEED_WDT(dev);
> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>   
>       assert(s->scu);
>   
> @@ -270,8 +271,9 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>        */
>       s->pclk_freq = PCLK_HZ;
>   
> +    assert(awc->iosize >= ASPEED_WDT_REGS_MAX * 4);
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
> +                          TYPE_ASPEED_WDT, awc->iosize);
>       sysbus_init_mmio(sbd, &s->iomem);
>   }
>   
> @@ -309,7 +311,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>   
>       dc->desc = "ASPEED 2400 Watchdog Controller";
> -    awc->offset = 0x20;
> +    awc->iosize = 0x20;
>       awc->ext_pulse_width_mask = 0xff;
>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>       awc->wdt_reload = aspeed_wdt_reload;
> @@ -346,7 +348,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>   
>       dc->desc = "ASPEED 2500 Watchdog Controller";
> -    awc->offset = 0x20;
> +    awc->iosize = 0x20;
>       awc->ext_pulse_width_mask = 0xfffff;
>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> @@ -369,7 +371,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>   
>       dc->desc = "ASPEED 2600 Watchdog Controller";
> -    awc->offset = 0x40;
> +    awc->iosize = 0x40;
>       awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>       awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> @@ -392,7 +394,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>   
>       dc->desc = "ASPEED 1030 Watchdog Controller";
> -    awc->offset = 0x80;
> +    awc->iosize = 0x80;
>       awc->ext_pulse_width_mask = 0xfffff; /* TODO */
>       awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index dfa5dfa424..db91ee6b51 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -40,7 +40,7 @@ struct AspeedWDTState {
>   struct AspeedWDTClass {
>       SysBusDeviceClass parent_class;
>   
> -    uint32_t offset;
> +    uint32_t iosize;
>       uint32_t ext_pulse_width_mask;
>       uint32_t reset_ctrl_reg;
>       void (*reset_pulse)(AspeedWDTState *s, uint32_t property);


