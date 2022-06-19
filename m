Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEEF550AB1
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 14:56:04 +0200 (CEST)
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2uT9-0003dM-V0
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 08:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o2uQU-0001Vl-Bm; Sun, 19 Jun 2022 08:53:14 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o2uQR-0008Gn-8K; Sun, 19 Jun 2022 08:53:13 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4162423CE0;
 Sun, 19 Jun 2022 12:53:08 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 14:53:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0031718ccb2-6da9-4acd-8b07-0a14a6767542,
 F3BB28978D5D33C371BBBD2B34D0F30B2C684C62) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <071f3be8-cb6c-7f8b-c0df-b3a9e8b2dc3f@kaod.org>
Date: Sun, 19 Jun 2022 14:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 6/9] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-7-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220618110202.87735-7-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5a990a35-1f3c-4465-a32c-a28e5d26b41e
X-Ovh-Tracer-Id: 2032249334996962272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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

On 6/18/22 13:01, Daniel Henrique Barboza wrote:
> pnv_ics_resend() is scrolling through all the child objects of the chip
> to search for the PHBs. It's faster and simpler to just use the phbs[]
> array.
> 
> pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
> simple to justify its own function.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/pnv.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index ff7f803662..08136def8e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1979,28 +1979,22 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>       return NULL;
>   }
>   
> -static int pnv_ics_resend_child(Object *child, void *opaque)
> -{
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        ics_resend(&phb3->lsis);
> -        ics_resend(ICS(&phb3->msis));
> -    }
> -    return 0;
> -}
> -
>   static void pnv_ics_resend(XICSFabric *xi)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
> -        PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
>           ics_resend(&chip8->psi.ics);
> -        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
> +
> +        for (j = 0; j < chip8->num_phbs; j++) {
> +            PnvPHB3 *phb3 = &chip8->phbs[j];
> +
> +            ics_resend(&phb3->lsis);
> +            ics_resend(ICS(&phb3->msis));
> +        }
>       }
>   }
>   


