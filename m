Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C85B057C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:43:36 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvL4-0007du-IB
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvG6-0001xR-3B
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:38:26 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:58337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvG4-0007M6-7g
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:38:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7AF18125D80EB;
 Wed,  7 Sep 2022 15:38:20 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:38:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006cec0e991-3ef2-4f8c-b2e4-d284e886f31e,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <89b5bf70-87ee-f9b0-f731-a3abbce0c893@kaod.org>
Date: Wed, 7 Sep 2022 15:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 10/20] ppc440_sdram: Implement enable bit in the DDR2
 SDRAM controller
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 09a79a88-76d5-4234-9409-920f5ee4e15a
X-Ovh-Tracer-Id: 11442520756682918819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
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

On 8/19/22 18:55, BALATON Zoltan wrote:
> To allow removing the do_init hack we need to improve the DDR2 SDRAM
> controller model to handle the enable/disable bit that it ignored so
> far.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
>   1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index c33f91e134..7c1513ff69 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -23,6 +23,7 @@
>   #include "sysemu/reset.h"
>   #include "ppc440.h"
>   #include "qom/object.h"
> +#include "trace.h"
>   
>   /*****************************************************************************/
>   /* L2 Cache as SRAM */
> @@ -484,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>   /* SDRAM controller */
>   typedef struct ppc440_sdram_t {
>       uint32_t addr;
> +    uint32_t mcopt2;
>       int nbanks;
>       Ppc4xxSdramBank bank[4];
>   } ppc440_sdram_t;
> @@ -581,12 +583,15 @@ static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
>   {
>       if (sdram->bank[i].bcr & 1) {
>           /* First unmap RAM if enabled */
> +        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
> +                                 sdram_size(sdram->bank[i].bcr));
>           sdram_bank_unmap(&sdram->bank[i]);
>       }
>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
>       sdram->bank[i].base = sdram_base(bcr);
>       sdram->bank[i].size = sdram_size(bcr);
>       if (enabled && (bcr & 1)) {
> +        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>           sdram_bank_map(&sdram->bank[i]);
>       }
>   }
> @@ -596,7 +601,7 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
>       int i;
>   
>       for (i = 0; i < sdram->nbanks; i++) {
> -        if (sdram->bank[i].size != 0) {
> +        if (sdram->bank[i].size) {
>               sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
>                                                 sdram->bank[i].size), 1);
>           } else {
> @@ -605,6 +610,17 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
>       }
>   }
>   
> +static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
> +{
> +    int i;
> +
> +    for (i = 0; i < sdram->nbanks; i++) {
> +        if (sdram->bank[i].size) {
> +            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
> +        }
> +    }
> +}
> +
>   static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>   {
>       ppc440_sdram_t *sdram = opaque;
> @@ -636,7 +652,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>               ret = 0x80000000;
>               break;
>           case 0x21: /* SDRAM_MCOPT2 */
> -            ret = 0x08000000;
> +            ret = sdram->mcopt2;
>               break;
>           case 0x40: /* SDRAM_MB0CF */
>               ret = 0x00008001;
> @@ -680,6 +696,19 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
>           switch (sdram->addr) {
>           case 0x00: /* B0CR */
>               break;
> +        case 0x21: /* SDRAM_MCOPT2 */
> +            if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
> +                trace_ppc4xx_sdram_enable("enable");
> +                /* validate all RAM mappings */
> +                sdram_map_bcr(sdram);
> +                sdram->mcopt2 |= 0x08000000;
> +            } else if ((sdram->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
> +                trace_ppc4xx_sdram_enable("disable");
> +                /* invalidate all RAM mappings */
> +                sdram_unmap_bcr(sdram);
> +                sdram->mcopt2 &= ~0x08000000;
> +            }
> +            break;
>           default:
>               break;
>           }
> @@ -694,6 +723,7 @@ static void sdram_reset(void *opaque)
>       ppc440_sdram_t *sdram = opaque;
>   
>       sdram->addr = 0;
> +    sdram->mcopt2 = 0x08000000;

Introducing a define for the 0x08000000 value would make the code easier
to read.

Thanks,

C.

>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,


