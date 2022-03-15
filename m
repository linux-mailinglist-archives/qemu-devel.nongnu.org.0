Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC944D971F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:07:04 +0100 (CET)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU38x-0007s0-Eu
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:07:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU2oi-0003PN-Vy
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:46:09 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU2od-0005V2-8l
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:46:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F241CEA19B85;
 Tue, 15 Mar 2022 09:45:59 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 09:45:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0019be9d3b2-e1e0-4f4b-aff8-e1ed15652d43,
 0AA06F5B2DB7430ED15449CA9F1189DB5B14FCF3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d7343179-46e0-5ad1-8339-439d59eceaf4@kaod.org>
Date: Tue, 15 Mar 2022 09:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/2] hw: aspeed_scu: Add AST2600 apb_freq and hpll
 calculation function
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220315075753.8591-1-steven_lee@aspeedtech.com>
 <20220315075753.8591-2-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315075753.8591-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4392ad79-9990-4bf3-a2f0-18e6134551de
X-Ovh-Tracer-Id: 5928707435723066220
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 08:57, Steven Lee wrote:
> AST2600's HPLL register offset and bit definition are different from
> AST2500. Add a hpll calculation function and an apb frequency calculation
> function based on SCU200 register description in ast2600v11.pdf.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/misc/aspeed_scu.c         | 39 +++++++++++++++++++++++++++++++++++-
>   include/hw/misc/aspeed_scu.h | 18 +++++++++++++++++
>   2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index d06e179a6e..d65f86df3d 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -213,6 +213,11 @@ static uint32_t aspeed_scu_get_random(void)
>   }
>   
>   uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
> +{
> +    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
> +}
> +
> +static uint32_t aspeed_2400_scu_get_apb_freq(AspeedSCUState *s)
>   {
>       AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
>       uint32_t hpll = asc->calc_hpll(s, s->regs[HPLL_PARAM]);
> @@ -221,6 +226,15 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
>           / asc->apb_divider;
>   }
>   
> +static uint32_t aspeed_2600_scu_get_apb_freq(AspeedSCUState *s)
> +{
> +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
> +    uint32_t hpll = asc->calc_hpll(s, s->regs[AST2600_HPLL_PARAM]);
> +
> +    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[AST2600_CLK_SEL]) + 1)
> +        / asc->apb_divider;
> +}
> +
>   static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
>   {
>       AspeedSCUState *s = ASPEED_SCU(opaque);
> @@ -426,6 +440,26 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
>       return clkin * multiplier;
>   }
>   
> +static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
> +{
> +    uint32_t multiplier = 1;
> +    uint32_t clkin = aspeed_scu_get_clkin(s);
> +
> +    if (hpll_reg & SCU_AST2600_H_PLL_OFF) {
> +        return 0;
> +    }
> +
> +    if (!(hpll_reg & SCU_AST2600_H_PLL_BYPASS_EN)) {
> +        uint32_t p = (hpll_reg >> 19) & 0xf;
> +        uint32_t n = (hpll_reg >> 13) & 0x3f;
> +        uint32_t m = hpll_reg & 0x1fff;
> +
> +        multiplier = ((m + 1) / (n + 1)) / (p + 1);
> +    }
> +
> +    return clkin * multiplier;
> +}
> +
>   static void aspeed_scu_reset(DeviceState *dev)
>   {
>       AspeedSCUState *s = ASPEED_SCU(dev);
> @@ -525,6 +559,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2400 System Control Unit";
>       asc->resets = ast2400_a0_resets;
>       asc->calc_hpll = aspeed_2400_scu_calc_hpll;
> +    asc->get_apb = aspeed_2400_scu_get_apb_freq;
>       asc->apb_divider = 2;
>       asc->nr_regs = ASPEED_SCU_NR_REGS;
>       asc->ops = &aspeed_ast2400_scu_ops;
> @@ -545,6 +580,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2500 System Control Unit";
>       asc->resets = ast2500_a1_resets;
>       asc->calc_hpll = aspeed_2500_scu_calc_hpll;
> +    asc->get_apb = aspeed_2400_scu_get_apb_freq;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_SCU_NR_REGS;
>       asc->ops = &aspeed_ast2500_scu_ops;
> @@ -716,7 +752,8 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2600 System Control Unit";
>       dc->reset = aspeed_ast2600_scu_reset;
>       asc->resets = ast2600_a3_resets;
> -    asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
> +    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
> +    asc->get_apb = aspeed_2600_scu_get_apb_freq;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
>       asc->ops = &aspeed_ast2600_scu_ops;
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index c14aff2bcb..6bf67589e8 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -56,6 +56,7 @@ struct AspeedSCUClass {
>   
>       const uint32_t *resets;
>       uint32_t (*calc_hpll)(AspeedSCUState *s, uint32_t hpll_reg);
> +    uint32_t (*get_apb)(AspeedSCUState *s);
>       uint32_t apb_divider;
>       uint32_t nr_regs;
>       const MemoryRegionOps *ops;
> @@ -316,4 +317,21 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
>           SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
>           SCU_AST2500_HW_STRAP_RESERVED1)
>   
> +/* SCU200   H-PLL Parameter Register (for Aspeed AST2600 SOC)
> + *
> + *  28:26  H-PLL Parameters
> + *  25     Enable H-PLL reset
> + *  24     Enable H-PLL bypass mode
> + *  23     Turn off H-PLL
> + *  22:19  H-PLL Post Divider (P)
> + *  18:13  H-PLL Numerator (M)
> + *  12:0   H-PLL Denumerator (N)
> + *
> + *  (Output frequency) = CLKIN(25MHz) * [(M+1) / (N+1)] / (P+1)
> + *
> + * The default frequency is 1200Mhz when CLKIN = 25MHz
> + */
> +#define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
> +#define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
> +
>   #endif /* ASPEED_SCU_H */


