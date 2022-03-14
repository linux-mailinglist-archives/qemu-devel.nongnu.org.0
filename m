Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD964D8470
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 13:23:26 +0100 (CET)
Received: from localhost ([::1]:37034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTjjQ-0005cC-Ht
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 08:23:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nTjhk-0004XH-Q1; Mon, 14 Mar 2022 08:21:41 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nTjhi-0004lW-Gs; Mon, 14 Mar 2022 08:21:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0C43523B88;
 Mon, 14 Mar 2022 12:21:33 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 14 Mar
 2022 13:21:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011f3e5358-885e-4a36-9a8a-2842a1cb50f6,
 36C99A321836BFF262E8699FCEA9DB4638EDD4AF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bd116f19-2110-b4be-8c17-845051d0e2d0@kaod.org>
Date: Mon, 14 Mar 2022 13:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/1] hw: aspeed_scu: Add AST2600 hpll calculation
 function
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220314095449.22089-1-steven_lee@aspeedtech.com>
 <20220314095449.22089-2-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220314095449.22089-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 922cba02-4df0-467d-a6f0-f37e19a5c8b1
X-Ovh-Tracer-Id: 3696610869560576876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleegieffuefgkedtjeeuleehtefftdffueejtdekkeelieekjeefveekkeeuuefhnecuffhomhgrihhnpehpughfrdhithenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Steven,

On 3/14/22 10:54, Steven Lee wrote:
> AST2600's HPLL register offset and bit definition are different from
> AST2500. Add a hpll calculation function for ast2600 and modify apb frequency
> calculation function based on SCU200 register description in ast2600v11.pdf.

It looks good. A few minor comments on the modeling.
  
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/misc/aspeed_scu.c         | 43 ++++++++++++++++++++++++++++++++----
>   include/hw/misc/aspeed_scu.h | 17 ++++++++++++++
>   2 files changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index d06e179a6e..3b11e98d66 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -205,6 +205,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
>        [BMC_DEV_ID]      = 0x00002402U
>   };
>   
> +static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg);
> +
>   static uint32_t aspeed_scu_get_random(void)
>   {
>       uint32_t num;
> @@ -215,9 +217,19 @@ static uint32_t aspeed_scu_get_random(void)
>   uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
>   {
>       AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
> -    uint32_t hpll = asc->calc_hpll(s, s->regs[HPLL_PARAM]);
> +    uint32_t hpll, hpll_reg, clk_sel_reg;
> +
> +    if (asc->calc_hpll == aspeed_2600_scu_calc_hpll) {

That's indeed one way to distinguish the AST2600 from the previous SoCs.
I would prefer to introduce a new APB freq class handler to deal with
the differences in the AST2600. aspeed_scu_get_apb_freq() would become :

	uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
	{
	    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
	}

The current aspeed_scu_get_apb_freq() would become the AST2400 and AST2500
handler and you would have to introduce a new one for the AST2600.

> +        hpll_reg = s->regs[AST2600_HPLL_PARAM];
> +        clk_sel_reg = s->regs[AST2600_CLK_SEL];
> +    } else {
> +        hpll_reg = s->regs[HPLL_PARAM];
> +        clk_sel_reg = s->regs[CLK_SEL];
> +    }
> +
> +    hpll = asc->calc_hpll(s, hpll_reg);
>   
> -    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) + 1)
> +    return hpll / (SCU_CLK_GET_PCLK_DIV(clk_sel_reg) + 1)
>           / asc->apb_divider;>   }
>   
> @@ -357,7 +369,10 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
>   
>   static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
>   {
> -    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
> +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
> +
> +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
> +        asc->calc_hpll == aspeed_2600_scu_calc_hpll) {

Indeed, the AST2600 CLKIN is always 25Mhz. Instead of testing ->calc_hpll,
I would introduce a class attribute, something like 'bool is_25Mhz'.

This change should be in a second patch though.

Thanks,

C.

>           return 25000000;
>       } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
>           return 48000000;
> @@ -426,6 +441,26 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
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
> +    if (!(hpll_reg & SCU_H_PLL_BYPASS_EN)) {
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
> @@ -716,7 +751,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2600 System Control Unit";
>       dc->reset = aspeed_ast2600_scu_reset;
>       asc->resets = ast2600_a3_resets;
> -    asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
> +    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
>       asc->ops = &aspeed_ast2600_scu_ops;
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index c14aff2bcb..91c500c5bc 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -316,4 +316,21 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
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
> + *  18:13   H-PLL Numerator (M)
> + *  12:0    H-PLL Denumerator (N)
> + *
> + *  (Output frequency) = CLKIN(25MHz) * [(M+1) / (N+1)] / (P+1)
> + *
> + * The default frequency is 1200Mhz when CLKIN = 25MHz
> + */
> +#define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
> +#define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
> +
>   #endif /* ASPEED_SCU_H */


