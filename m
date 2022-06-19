Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0954B550AB0
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 14:54:15 +0200 (CEST)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2uRR-00026K-D5
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 08:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uPq-0000q3-17
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 08:52:34 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:43057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uPn-0008Ct-5m
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 08:52:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EF73F10E46024;
 Sun, 19 Jun 2022 14:52:20 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 14:52:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0024f729f7e-f7d6-41aa-b824-2f38ae8de1da,
 00BC8E0AC7FB4598DFE6F4B8055DE8008F581133) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2dc9c33e-b4a5-b3a3-6ce2-2dac66881218@kaod.org>
Date: Sun, 19 Jun 2022 14:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/9] ppc/pnv: make pnv_ics_get() use the chip8->phbs[]
 array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220618110202.87735-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 14d2f495-9ce9-449b-9e55-b03b79efbde0
X-Ovh-Tracer-Id: 2018738536414677984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/18/22 13:01, Daniel Henrique Barboza wrote:
> The function is working today by getting all the child objects of the
> chip, interacting with each of them to check whether the child is a PHB,
> and then doing what needs to be done.
> 
> We have all the chip PHBs in the phbs[] array so interacting with all
> child objects is unneeded. Open code pnv_ics_get_phb_ics() into
> pnv_ics_get() and remove both pnv_ics_get_phb_ics() and the
> ForeachPhb3Args struct.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/pnv.c | 38 +++++++++++---------------------------
>   1 file changed, 11 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 40e0cbd84d..ff7f803662 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1939,44 +1939,28 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> -typedef struct ForeachPhb3Args {
> -    int irq;
> -    ICSState *ics;
> -} ForeachPhb3Args;
> -
> -static int pnv_ics_get_child(Object *child, void *opaque)
> -{
> -    ForeachPhb3Args *args = opaque;
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        if (ics_valid_irq(&phb3->lsis, args->irq)) {
> -            args->ics = &phb3->lsis;
> -        }
> -        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> -            args->ics = ICS(&phb3->msis);
> -        }
> -    }
> -    return args->ics ? 1 : 0;
> -}
> -
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    ForeachPhb3Args args = { irq, NULL };
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
> +            PnvPHB3 *phb3 = &chip8->phbs[j];
> +
> +            if (ics_valid_irq(&phb3->lsis, irq)) {
> +                return &phb3->lsis;
> +            }
> +
> +            if (ics_valid_irq(ICS(&phb3->msis), irq)) {
> +                return ICS(&phb3->msis);
> +            }
>           }
>       }
>       return NULL;


