Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4D48664F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:49:37 +0100 (CET)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5U5A-0008PO-Ku
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:49:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tbg-0000J7-EJ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:19:08 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:58637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tbe-0002dZ-9P
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:19:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id F1831226C4;
 Thu,  6 Jan 2022 14:19:03 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:19:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00446f41272-ba5b-4e58-adef-18fb616e39da,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b4fcec68-cf3f-bb18-782f-a6ac2da42646@kaod.org>
Date: Thu, 6 Jan 2022 15:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 13/18] pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in
 pnv_pec_dt_xscom()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-14-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-14-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 16e07802-efd8-43d5-a78e-fa3eff333675
X-Ovh-Tracer-Id: 18038886833761324000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> Relying on stack->phb to write the xscom DT of the PEC is something that
> we won't be able to do with user creatable pnv-phb4 devices.
> 
> Hopefully, this can be done by using pnv_phb4_pec_get_phb_id(), which is
> already used by pnv_pec_realize() to set the phb-id of the stack. Use
> the same idea in pnv_pec_dt_xscom() to write ibm,phb-index without the
> need to accessing stack->phb, since stack->phb is not granted to be !=
> NULL when user creatable phbs are introduced.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4_pec.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index e47d19dfff..0675fc55bc 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -449,8 +449,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>                         pecc->compat_size)));
>   
>       for (i = 0; i < pec->num_stacks; i++) {
> -        PnvPhb4PecStack *stack = &pec->stacks[i];
> -        PnvPHB4 *phb = &stack->phb;
> +        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
>           int stk_offset;
>   
>           name = g_strdup_printf("stack@%x", i);
> @@ -460,7 +459,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>           _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
>                             pecc->stk_compat_size)));
>           _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
> -        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb->phb_id)));
> +        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
>       }
>   
>       return 0;
> 


