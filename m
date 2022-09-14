Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99E15B81FE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 09:25:04 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYMlb-0006YT-Lg
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 03:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMhI-0002OC-HL
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:20:37 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:46547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMhG-00046R-Eo
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:20:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5BBBE27770;
 Wed, 14 Sep 2022 07:20:32 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 14 Sep
 2022 09:20:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00436f23602-be7e-4d4e-ac5c-13ffe4624ef6,
 6464241036B73DE4A97B8AD469DDB011F00B0909) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <72002e41-280a-3f65-d38e-2580bebaaf57@kaod.org>
Date: Wed, 14 Sep 2022 09:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 10/20] ppc440_sdram: Implement enable bit in the DDR2
 SDRAM
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <df9ffe4da6b582df860c939368b5f942ac1962de.1663097286.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <df9ffe4da6b582df860c939368b5f942ac1962de.1663097286.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1cad897c-fe40-45ce-8de4-d0b5d1c121f3
X-Ovh-Tracer-Id: 9277415235837660067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/13/22 21:52, BALATON Zoltan wrote:
> To allow removing the do_init hack we need to improve the DDR2 SDRAM
> controller model to handle the enable/disable bit that it ignored so
> far.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>


Please consider adding a define instead.

Thanks,

C.


> ---
> v2: replace 0x08000000 with BIT(27)
> 
>   hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
>   1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 01184e717b..3c442eaecc 100644
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
> +            if (!(sdram->mcopt2 & BIT(27)) && (val & BIT(27))) {
> +                trace_ppc4xx_sdram_enable("enable");
> +                /* validate all RAM mappings */
> +                sdram_map_bcr(sdram);
> +                sdram->mcopt2 |= BIT(27);
> +            } else if ((sdram->mcopt2 & BIT(27)) && !(val & BIT(27))) {
> +                trace_ppc4xx_sdram_enable("disable");
> +                /* invalidate all RAM mappings */
> +                sdram_unmap_bcr(sdram);
> +                sdram->mcopt2 &= ~BIT(27);
> +            }
> +            break;
>           default:
>               break;
>           }
> @@ -694,6 +723,7 @@ static void sdram_reset(void *opaque)
>       ppc440_sdram_t *sdram = opaque;
>   
>       sdram->addr = 0;
> +    sdram->mcopt2 = BIT(27);
>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,


