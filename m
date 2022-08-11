Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECE59067F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 20:51:22 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMDH7-0002Xo-Ic
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMDBq-00061q-4A
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:45:54 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oMDBo-0005zK-HR
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:45:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 68DD011DF7CE7;
 Thu, 11 Aug 2022 20:45:51 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 11 Aug
 2022 20:45:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00293f3d21e-58af-4ace-a793-d84cd8bb8e3f,
 B18B381393FCCA734C2622819310E7EBE9D8D149) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <ae7e1198-0698-09c8-cef1-db7215b8248b@kaod.org>
Date: Thu, 11 Aug 2022 20:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 09/11] ppc/pnv: change pnv_phb4_get_pec() to
 also retrieve chip10->pecs
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-10-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220811163950.578927-10-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 67f4c9a2-5f45-49a5-8b13-f01e51d99ce1
X-Ovh-Tracer-Id: 5647232460992383968
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeggedgudeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehvdel
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 18:39, Daniel Henrique Barboza wrote:
> The function assumes that we're always dealing with a PNV9_CHIP()
> object. This is not the case when the pnv-phb device belongs to a
> powernv10 machine.
> 
> Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
> necessary.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/pnv.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index ec0558ed1c..e6c14fe231 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -284,17 +284,30 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>   static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>                                            Error **errp)
>   {
> -    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    PnvPHB *phb_base = phb->phb_base;
> +    PnvPhb4PecState *pecs = NULL;
>       int chip_id = phb->chip_id;
>       int index = phb->phb_id;
>       int i, j;
>   
> +    if (phb_base->version == 4) {
> +        Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +
> +        pecs = chip9->pecs;
> +    } else if (phb_base->version == 5) {
> +        Pnv10Chip *chip10 = PNV10_CHIP(chip);
> +
> +        pecs = chip10->pecs;
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
>       for (i = 0; i < chip->num_pecs; i++) {
>           /*
>            * For each PEC, check the amount of phbs it supports
>            * and see if the given phb4 index matches an index.
>            */
> -        PnvPhb4PecState *pec = &chip9->pecs[i];
> +        PnvPhb4PecState *pec = &pecs[i];
>   
>           for (j = 0; j < pec->num_phbs; j++) {
>               if (index == pnv_phb4_pec_get_phb_id(pec, j)) {


