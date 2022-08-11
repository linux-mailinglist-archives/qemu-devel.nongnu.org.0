Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6D59067D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 20:50:51 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMDGa-0002Go-J6
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 14:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMDBF-0005U5-3K
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:45:23 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:50689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMDB3-0005lr-T4
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:45:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B107B11DF7C87;
 Thu, 11 Aug 2022 20:45:01 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 11 Aug
 2022 20:45:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005226e4fd1-4fca-4ed0-b2ae-edc8c2477be3,
 B18B381393FCCA734C2622819310E7EBE9D8D149) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <2fe16781-c586-b787-1446-b79b453ed770@kaod.org>
Date: Thu, 11 Aug 2022 20:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 07/11] ppc/pnv: add PHB4 helpers for user
 created pnv-phb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-8-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220811163950.578927-8-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1e6c9979-15cc-4e92-9505-f2d465145bb8
X-Ovh-Tracer-Id: 5633158713013668832
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggedgudeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 8/11/22 18:39, Daniel Henrique Barboza wrote:
> The PHB4 backend relies on a link with the corresponding PEC element.
> This is trivial to do during machine_init() time for default devices,
> but not so much for user created ones.
> 
> pnv_phb4_get_pec() is a small variation of the function that was
> reverted by commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5}
> devices". We'll use it to determine the appropriate PEC for a given user
> created pnv-phb that uses a PHB4 backend.
> 
> This is done during realize() time, in pnv_phb_user_device_init().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/pnv.c | 35 ++++++++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index e82d6522f0..0644f45a1d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -281,6 +281,34 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>       g_free(reg);
>   }
>   
> +static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
> +                                         Error **errp)
> +{
> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    int chip_id = phb->chip_id;
> +    int index = phb->phb_id;
> +    int i, j;
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        /*
> +         * For each PEC, check the amount of phbs it supports
> +         * and see if the given phb4 index matches an index.
> +         */
> +        PnvPhb4PecState *pec = &chip9->pecs[i];
> +
> +        for (j = 0; j < pec->num_phbs; j++) {
> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> +                return pec;
> +            }
> +        }
> +    }
> +    error_setg(errp,
> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> +               chip_id, index);
> +
> +    return NULL;
> +}
> +
>   /*
>    * Adds a PnvPHB to the chip. Returns the parent obj of the
>    * PHB which varies with each version (phb version 3 is parented
> @@ -302,10 +330,11 @@ Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
>           chip8->num_phbs++;
>   
>           return OBJECT(chip);
> -    } else {
> -        /* phb4 support will be added later */
> -        return NULL;
>       }
> +
> +    phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), errp);
> +
> +    return OBJECT(phb->pec);
>   }
>   
>   static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)


