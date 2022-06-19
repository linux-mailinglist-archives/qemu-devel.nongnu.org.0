Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB105550AB8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 14:58:57 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2uW0-0007Gi-Q9
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 08:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uQv-0001uQ-HR
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 08:53:41 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uQt-0008I1-Em
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 08:53:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1AB182002E;
 Sun, 19 Jun 2022 12:53:36 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 14:53:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0056a5c6980-0ab9-4fc1-8935-5bd1ea399348,
 F3BB28978D5D33C371BBBD2B34D0F30B2C684C62) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <101d6288-9379-aec1-9825-936a9f7b00a8@kaod.org>
Date: Sun, 19 Jun 2022 14:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 7/9] ppc/pnv: make pnv_chip_power8_pic_print_info() use
 chip8->phbs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-8-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220618110202.87735-8-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 450c7551-917f-4461-9200-3a42dff80347
X-Ovh-Tracer-Id: 2040130631898467296
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
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

On 6/18/22 13:02, Daniel Henrique Barboza wrote:
> It's inneficient to scroll all child objects when we have all PHBs
> available in chip8->phbs[].
> 
> pnv_chip_power8_pic_print_info_child() ended up folded into
> pic_print_info() for simplicity.
> 
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/pnv.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 08136def8e..2a9067687b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -652,25 +652,19 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
>       return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
>   }
>   
> -static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
> -{
> -    Monitor *mon = opaque;
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> -        ics_pic_print_info(&phb3->lsis, mon);
> -    }
> -    return 0;
> -}
> -
>   static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>   {
>       Pnv8Chip *chip8 = PNV8_CHIP(chip);
> +    int i;
>   
>       ics_pic_print_info(&chip8->psi.ics, mon);
> -    object_child_foreach(OBJECT(chip),
> -                         pnv_chip_power8_pic_print_info_child, mon);
> +
> +    for (i = 0; i < chip8->num_phbs; i++) {
> +        PnvPHB3 *phb3 = &chip8->phbs[i];
> +
> +        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> +        ics_pic_print_info(&phb3->lsis, mon);
> +    }
>   }
>   
>   static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)


