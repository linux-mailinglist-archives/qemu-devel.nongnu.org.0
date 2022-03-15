Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A834D92BB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:46:54 +0100 (CET)
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTxD3-0003V4-CE
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:46:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nTxAo-0001mf-DK; Mon, 14 Mar 2022 22:44:34 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:22806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nTxAk-00064W-ER; Mon, 14 Mar 2022 22:44:33 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22F2XWtx034803;
 Tue, 15 Mar 2022 10:33:32 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Mar
 2022 10:43:37 +0800
Date: Tue, 15 Mar 2022 10:42:58 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v1 1/1] hw: aspeed_scu: Add AST2600 hpll calculation
 function
Message-ID: <20220315024257.GA6162@aspeedtech.com>
References: <20220314095449.22089-1-steven_lee@aspeedtech.com>
 <20220314095449.22089-2-steven_lee@aspeedtech.com>
 <bd116f19-2110-b4be-8c17-845051d0e2d0@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd116f19-2110-b4be-8c17-845051d0e2d0@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22F2XWtx034803
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 03/14/2022 20:21, Cédric Le Goater wrote:
> Hello Steven,
> 
> On 3/14/22 10:54, Steven Lee wrote:
> > AST2600's HPLL register offset and bit definition are different from
> > AST2500. Add a hpll calculation function for ast2600 and modify apb frequency
> > calculation function based on SCU200 register description in ast2600v11.pdf.
> 
> It looks good. A few minor comments on the modeling.
>   
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >   hw/misc/aspeed_scu.c         | 43 ++++++++++++++++++++++++++++++++----
> >   include/hw/misc/aspeed_scu.h | 17 ++++++++++++++
> >   2 files changed, 56 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> > index d06e179a6e..3b11e98d66 100644
> > --- a/hw/misc/aspeed_scu.c
> > +++ b/hw/misc/aspeed_scu.c
> > @@ -205,6 +205,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
> >        [BMC_DEV_ID]      = 0x00002402U
> >   };
> >   
> > +static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg);
> > +
> >   static uint32_t aspeed_scu_get_random(void)
> >   {
> >       uint32_t num;
> > @@ -215,9 +217,19 @@ static uint32_t aspeed_scu_get_random(void)
> >   uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
> >   {
> >       AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
> > -    uint32_t hpll = asc->calc_hpll(s, s->regs[HPLL_PARAM]);
> > +    uint32_t hpll, hpll_reg, clk_sel_reg;
> > +
> > +    if (asc->calc_hpll == aspeed_2600_scu_calc_hpll) {
> 
> That's indeed one way to distinguish the AST2600 from the previous SoCs.
> I would prefer to introduce a new APB freq class handler to deal with
> the differences in the AST2600. aspeed_scu_get_apb_freq() would become :
> 
> 	uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
> 	{
> 	    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
> 	}
> 
> The current aspeed_scu_get_apb_freq() would become the AST2400 and AST2500
> handler and you would have to introduce a new one for the AST2600.
> 

Hi Cédric,

Thanks for the review.
I was wondering if the following implementation is good to you.

1 Modify aspeed_scu_get_apb_freq() as below
 	uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
 	{
 	    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
 	}

2. Introduce 2 APB class handlers: aspeed_2400_scu_get_apb_freq() and aspeed_2600_scu_get_apb_freq()

3. Add new attribute get_apb in AspeedSCUClass.

4. In aspeed_2400_scu_class_init() and aspeed_2500_scu_class_init()
	asc->get_apb = aspeed_2400_scu_get_apb_freq;

   In aspeed_2600_scu_class_init()
	asc->get_apb = aspeed_2600_scu_get_apb_freq;

> > +        hpll_reg = s->regs[AST2600_HPLL_PARAM];
> > +        clk_sel_reg = s->regs[AST2600_CLK_SEL];
> > +    } else {
> > +        hpll_reg = s->regs[HPLL_PARAM];
> > +        clk_sel_reg = s->regs[CLK_SEL];
> > +    }
> > +
> > +    hpll = asc->calc_hpll(s, hpll_reg);
> >   
> > -    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) + 1)
> > +    return hpll / (SCU_CLK_GET_PCLK_DIV(clk_sel_reg) + 1)
> >           / asc->apb_divider;>   }
> >   
> > @@ -357,7 +369,10 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
> >   
> >   static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
> >   {
> > -    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
> > +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
> > +
> > +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
> > +        asc->calc_hpll == aspeed_2600_scu_calc_hpll) {
> 
> Indeed, the AST2600 CLKIN is always 25Mhz. Instead of testing ->calc_hpll,
> I would introduce a class attribute, something like 'bool is_25Mhz'.
> 
> This change should be in a second patch though.
> 

will add a new attribute for clkin in the second patch.

Thanks,
Steven

> Thanks,
> 
> C.
> 
> >           return 25000000;
> >       } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
> >           return 48000000;
> > @@ -426,6 +441,26 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
> >       return clkin * multiplier;
> >   }
> >   
> > +static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
> > +{
> > +    uint32_t multiplier = 1;
> > +    uint32_t clkin = aspeed_scu_get_clkin(s);
> > +
> > +    if (hpll_reg & SCU_AST2600_H_PLL_OFF) {
> > +        return 0;
> > +    }
> > +
> > +    if (!(hpll_reg & SCU_H_PLL_BYPASS_EN)) {
> > +        uint32_t p = (hpll_reg >> 19) & 0xf;
> > +        uint32_t n = (hpll_reg >> 13) & 0x3f;
> > +        uint32_t m = hpll_reg & 0x1fff;
> > +
> > +        multiplier = ((m + 1) / (n + 1)) / (p + 1);
> > +    }
> > +
> > +    return clkin * multiplier;
> > +}
> > +
> >   static void aspeed_scu_reset(DeviceState *dev)
> >   {
> >       AspeedSCUState *s = ASPEED_SCU(dev);
> > @@ -716,7 +751,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
> >       dc->desc = "ASPEED 2600 System Control Unit";
> >       dc->reset = aspeed_ast2600_scu_reset;
> >       asc->resets = ast2600_a3_resets;
> > -    asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
> > +    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
> >       asc->apb_divider = 4;
> >       asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
> >       asc->ops = &aspeed_ast2600_scu_ops;
> > diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> > index c14aff2bcb..91c500c5bc 100644
> > --- a/include/hw/misc/aspeed_scu.h
> > +++ b/include/hw/misc/aspeed_scu.h
> > @@ -316,4 +316,21 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
> >           SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
> >           SCU_AST2500_HW_STRAP_RESERVED1)
> >   
> > +/* SCU200   H-PLL Parameter Register (for Aspeed AST2600 SOC)
> > + *
> > + *  28:26  H-PLL Parameters
> > + *  25     Enable H-PLL reset
> > + *  24     Enable H-PLL bypass mode
> > + *  23     Turn off H-PLL
> > + *  22:19  H-PLL Post Divider (P)
> > + *  18:13   H-PLL Numerator (M)
> > + *  12:0    H-PLL Denumerator (N)
> > + *
> > + *  (Output frequency) = CLKIN(25MHz) * [(M+1) / (N+1)] / (P+1)
> > + *
> > + * The default frequency is 1200Mhz when CLKIN = 25MHz
> > + */
> > +#define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
> > +#define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
> > +
> >   #endif /* ASPEED_SCU_H */
> 

