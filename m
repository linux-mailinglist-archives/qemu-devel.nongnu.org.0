Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9054ADD9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:59:10 +0200 (CEST)
Received: from localhost ([::1]:55436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13KF-0006qj-RA
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o13Dp-0001AS-7C; Tue, 14 Jun 2022 05:52:29 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:35855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o13Dj-0002Ns-TU; Tue, 14 Jun 2022 05:52:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C41DE2B5E4;
 Tue, 14 Jun 2022 09:52:20 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 11:52:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0015164baf3-316a-43cb-b614-b713a4a3dd1b,
 521BD0C7D9B1F43011BF9161B4E1AE1788365C94) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8e08c33f-49a3-c486-87e4-9db32ea2da87@kaod.org>
Date: Tue, 14 Jun 2022 11:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 05/11] ppc/pnv: make pnv_ics_get() use the chip8->phbs[]
 array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>,
 <mark.cave-ayland@ilande.co.uk>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-6-danielhb@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220613154456.359674-6-danielhb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 44a82a27-fcf9-4fc3-94b3-6f71016d70a8
X-Ovh-Tracer-Id: 6508827365011000227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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

On 6/13/22 17:44, Daniel Henrique Barboza wrote:
> The function is working today by getting all the child objects of the
> chip, interacting with each of them to check whether the child is a PHB,
> and then doing what needs to be done.
> 
> We have all the chip PHBs in the phbs[] array so interacting with all
> child objects is unneeded.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---
>   hw/ppc/pnv.c | 30 ++++++++++++++----------------
>   1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 40e0cbd84d..05a8d5034f 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1944,41 +1944,39 @@ typedef struct ForeachPhb3Args {
>       ICSState *ics;
>   } ForeachPhb3Args;
>   
> -static int pnv_ics_get_child(Object *child, void *opaque)
> +static void pnv_ics_get_phb_ics(PnvPHB3 *phb3, ForeachPhb3Args *args)
>   {
> -    ForeachPhb3Args *args = opaque;
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> +    if (ics_valid_irq(&phb3->lsis, args->irq)) {
> +        args->ics = &phb3->lsis;
> +    }
>   
> -    if (phb3) {
> -        if (ics_valid_irq(&phb3->lsis, args->irq)) {
> -            args->ics = &phb3->lsis;
> -        }
> -        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> -            args->ics = ICS(&phb3->msis);
> -        }
> +    if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> +        args->ics = ICS(&phb3->msis);
>       }
> -    return args->ics ? 1 : 0;
>   }
>   
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
>       ForeachPhb3Args args = { irq, NULL };
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
> -        PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
>           if (ics_valid_irq(&chip8->psi.ics, irq)) {
>               return &chip8->psi.ics;
>           }
>   
> -        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
> -        if (args.ics) {
> -            return args.ics;
> +        for (j = 0; j < chip8->num_phbs; j++) {
> +            pnv_ics_get_phb_ics(&chip8->phbs[j], &args);

If we don't need this function elsewhere, why keep it ?

Thanks,

C.

> +
> +            if (args.ics) {
> +                return args.ics;
> +            }
>           }
>       }
> +
>       return NULL;
>   }
>   


