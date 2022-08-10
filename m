Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BC58EDC1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:00:36 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmGB-0003C8-Vn
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLllC-0004Qd-Bq
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:28:34 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:41655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLllA-0005z2-10
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:28:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2E67D1FEEC;
 Wed, 10 Aug 2022 13:28:29 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 15:28:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001f0dc0602-eb14-4bfd-b980-a1e6a414d9b0,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <b9595c23-a97c-25bc-2770-be274f05d815@kaod.org>
Date: Wed, 10 Aug 2022 15:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v3 05/11] ppc/pnv: turn chip8->phbs[] into a
 PnvPHB* array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
 <20220810100536.473859-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220810100536.473859-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 605fa039-d855-45c2-a6dc-bdb393695528
X-Ovh-Tracer-Id: 12861436113087859680
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

On 8/10/22 12:05, Daniel Henrique Barboza wrote:
> When enabling user created PHBs (a change reverted by commit 9c10d86fee)
> we were handling PHBs created by default versus by the user in different
> manners. The only difference between these PHBs is that one will have a
> valid phb3->chip that is assigned during pnv_chip_power8_realize(),
> while the user created needs to search which chip it belongs to.
> 
> Aside from that there shouldn't be any difference. Making the default
> PHBs behave in line with the user created ones will make it easier to
> re-introduce them later on. It will also make the code easier to follow
> since we are dealing with them in equal manner.
> 
> The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
> This will allow us to assign user created PHBs into it later on. The way
> we initilize the default case is now more in line with that would happen
> with the user created case: the object is created, parented by the chip
> because pnv_xscom_dt() relies on it, and then assigned to the array.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c |  7 +++++++
>   hw/ppc/pnv.c          | 20 +++++++++++++++-----
>   include/hw/ppc/pnv.h  |  6 +++++-
>   3 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 18a050a6d3..40a960c54c 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -90,6 +90,13 @@ static void pnv_phb_user_device_init(PnvPHB *phb)
>       }
>   
>       if (phb->version == 3) {
> +        Pnv8Chip *chip8 = PNV8_CHIP(chip);
> +
> +        phb->chip = chip;
> +
> +        chip8->phbs[chip8->num_phbs] = phb;
> +        chip8->num_phbs++;
> +

I think we need an helper to register a phb in the chip, or a chip class
handler, to isolate the code modifying the chip from a sub chip model.
It would be cleaner.


>           parent = OBJECT(chip);
>       } else {
>           /* phb4 support will be added later */

Specially when you look at the PHB4 version which is very different.
It could return the parent also.

> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f9e5a3d248..44066ffb8c 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -661,7 +661,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>       ics_pic_print_info(&chip8->psi.ics, mon);
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB *phb = &chip8->phbs[i];
> +        PnvPHB *phb = chip8->phbs[i];
>           PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>           pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> @@ -1154,7 +1154,17 @@ static void pnv_chip_power8_instance_init(Object *obj)
>       chip8->num_phbs = pcc->num_phbs;
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
> +        PnvPHB *phb = PNV_PHB(object_new(TYPE_PNV_PHB));


may be use :

           Object *phb = object_new(TYPE_PNV_PHB);

> +
> +        /*
> +         * We need the chip to parent the PHB to allow the DT
> +         * to build correctly (via pnv_xscom_dt()).
> +         *
> +         * TODO: the PHB should be parented by a PEC device that, at
> +         * this moment, is not modelled powernv8/phb3.
> +         */
> +        object_property_add_child(obj, "phb[*]", OBJECT(phb));
> +        chip8->phbs[i] = phb;

and :
            object_property_add_child(obj, "phb[*]", phb);
            chip8->phbs[i] = PNV_PHB(phb);

This is minor.

C.

>       }
>   
>   }
> @@ -1270,7 +1280,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>   
>       /* PHB controllers */
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB *phb = &chip8->phbs[i];
> +        PnvPHB *phb = chip8->phbs[i];
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
> @@ -1938,7 +1948,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>           }
>   
>           for (j = 0; j < chip8->num_phbs; j++) {
> -            PnvPHB *phb = &chip8->phbs[j];
> +            PnvPHB *phb = chip8->phbs[j];
>               PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>               if (ics_valid_irq(&phb3->lsis, irq)) {
> @@ -1977,7 +1987,7 @@ static void pnv_ics_resend(XICSFabric *xi)
>           ics_resend(&chip8->psi.ics);
>   
>           for (j = 0; j < chip8->num_phbs; j++) {
> -            PnvPHB *phb = &chip8->phbs[j];
> +            PnvPHB *phb = chip8->phbs[j];
>               PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>               ics_resend(&phb3->lsis);
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 033d907287..aea6128e7f 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -81,7 +81,11 @@ struct Pnv8Chip {
>       PnvHomer     homer;
>   
>   #define PNV8_CHIP_PHB3_MAX 4
> -    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
> +    /*
> +     * The array is used to allow quick access to the phbs by
> +     * pnv_ics_get_child() and pnv_ics_resend_child().
> +     */
> +    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
>       uint32_t     num_phbs;
>   
>       XICSFabric    *xics;


