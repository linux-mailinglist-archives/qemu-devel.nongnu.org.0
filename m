Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B0489CF5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:59:36 +0100 (CET)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6x55-0006Cg-6q
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:59:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6x3c-00053z-95
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:58:04 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:46487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6x3a-0004hB-0L
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:58:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8F61320B3F;
 Mon, 10 Jan 2022 15:57:59 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:57:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0056b256563-491c-414c-8815-48e52d9659e8,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <19dfa590-311a-4a9d-45b6-64d1d8bd995b@kaod.org>
Date: Mon, 10 Jan 2022 16:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 07/10] ppc/pnv: move PHB4 related XSCOM init to
 phb4_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-8-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-8-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 88752cc1-8791-4371-b6e7-22a26a57fe17
X-Ovh-Tracer-Id: 6307009807445560288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 15:33, Daniel Henrique Barboza wrote:
> Before enabling pnv-phb4 user creatable devices we need to handle PHB4
> specific code in pnv_pec_stk_realize().
> 
> The 'stack->phb_regs_mr' PHB4 passthrough XSCOM initialization relies on
> 'stack->phb' being not NULL. Moving 'stack->phb_regs_mr' region_init()
> and add_subregion() to phb4_realize() time is a natural thing to do and
> it'll spare us from checking 'phb->stack != NULL' in stk_realize() when
> user creatable pnv-phb4s are implemented.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c     | 27 +++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb4_pec.c | 10 ----------
>   2 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 1a7395772f..152911a285 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1194,6 +1194,31 @@ void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack,
>                                &error_abort);
>   }
>   
> +static void pnv_phb4_init_xscom_passthrough(PnvPHB4 *phb)
> +{
> +    PnvPhb4PecState *pec;
> +    PnvPhb4PecClass *pecc;
> +    uint32_t pec_pci_base;
> +    char name[64];
> +
> +    assert(phb->stack);
> +
> +    pec = phb->stack->pec;
> +    pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    pec_pci_base = pecc->xscom_pci_base(pec);
> +
> +    /* PHB pass-through */
> +    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
> +             pec->chip_id, pec->index, phb->stack->stack_no);
> +    pnv_xscom_region_init(&phb->stack->phb_regs_mr, OBJECT(phb),
> +                          &pnv_phb4_xscom_ops, phb, name, 0x40);
> +
> +    pnv_xscom_add_subregion(pec->chip,
> +                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> +                            0x40 * phb->stack->stack_no,
> +                            &phb->stack->phb_regs_mr);
> +}
> +
>   static void pnv_phb4_instance_init(Object *obj)
>   {
>       PnvPHB4 *phb = PNV_PHB4(obj);
> @@ -1223,6 +1248,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
>                             name, 0x2000);
>   
> +    pnv_phb4_init_xscom_passthrough(phb);
> +
>       /*
>        * PHB4 doesn't support IO space. However, qemu gets very upset if
>        * we don't have an IO region to anchor IO BARs onto so we just
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 042dc0b775..5e02a51f04 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -571,12 +571,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>                             &pnv_pec_stk_pci_xscom_ops, stack, name,
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
> -    /* PHB pass-through */
> -    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
> -             pec->chip_id, pec->index, stack->stack_no);
> -    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(stack->phb),
> -                          &pnv_phb4_xscom_ops, stack->phb, name, 0x40);
> -
>       if (stack->phb && !sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
>           return;
>       }
> @@ -591,10 +585,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       pnv_xscom_add_subregion(chip,
>                               pec_pci_base + 0x40 * (stack->stack_no + 1),
>                               &stack->pci_regs_mr);
> -    pnv_xscom_add_subregion(chip,
> -                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> -                            0x40 * stack->stack_no,
> -                            &stack->phb_regs_mr);
>   }


Can't we simply move the XSCOM init and mapping under phb4 realize routine ?

Thanks,

C.


>   static Property pnv_pec_stk_properties[] = {
> 


