Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDB4D4EE2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:20:37 +0100 (CET)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLWm-0005s1-Bl
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:20:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nSLTn-0002eU-HB; Thu, 10 Mar 2022 11:17:32 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nSLTk-0002QQ-Vh; Thu, 10 Mar 2022 11:17:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.159])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 22DB2E84CEB9;
 Thu, 10 Mar 2022 17:17:26 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 10 Mar
 2022 17:17:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00332f87d50-7dca-453c-b249-0851dec43cd3,
 50FE52C2FF4DE979A383A870B6AFEB2A520DEB89) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <e2304f0f-aba1-de1d-50c7-6da0cfd25f53@kaod.org>
Date: Thu, 10 Mar 2022 17:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] ppc/pnv: Fix PEC lookup function for POWER10
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220310155101.294568-1-fbarrat@linux.ibm.com>
 <20220310155101.294568-4-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220310155101.294568-4-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b3fc0b00-cec0-41e3-a591-3f548afaacd8
X-Ovh-Tracer-Id: 2636294632556825568
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 3/10/22 16:51, Frederic Barrat wrote:
> The PEC array used when looking for the PEC hosting a PHB is stored in
> the chip structure. The array is at a different offset in Pnv9Chip and
> Pnv10Chip. The lookup function was therefore not working properly on
> POWER10.
> This patch fixes it by introducing a class method to get the correct
> PEC pointer based on the chip object and PEC index.
> 
> Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/pci-host/pnv_phb4.c |  5 ++---
>   hw/ppc/pnv.c           | 14 ++++++++++++++
>   include/hw/ppc/pnv.h   |  1 +
>   3 files changed, 17 insertions(+), 3 deletions(-)



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Queued for 7.0.

Thanks,

C.



> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index d1a911f988..4732633833 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1548,7 +1548,6 @@ static void pnv_phb4_instance_init(Object *obj)
>   static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>                                            Error **errp)
>   {
> -    Pnv9Chip *chip9 = PNV9_CHIP(chip);
>       int chip_id = phb->chip_id;
>       int index = phb->phb_id;
>       int i, j;
> @@ -1556,9 +1555,9 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>       for (i = 0; i < chip->num_pecs; i++) {
>           /*
>            * For each PEC, check the amount of phbs it supports
> -         * and see if the given phb4 index matches an index.
> +         * and see if the given phb index matches an index.
>            */
> -        PnvPhb4PecState *pec = &chip9->pecs[i];
> +        PnvPhb4PecState *pec = PNV_CHIP_GET_CLASS(chip)->get_pec(chip, i);
>   
>           for (j = 0; j < pec->num_phbs; j++) {
>               if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index df58403a3a..3a676cd570 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1561,6 +1561,12 @@ static uint32_t pnv_chip_power9_xscom_pcba(PnvChip *chip, uint64_t addr)
>       return addr >> 3;
>   }
>   
> +static PnvPhb4PecState *pnv_chip_power9_get_pec(PnvChip *chip, uint32_t index)
> +{
> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    return &chip9->pecs[index];
> +}
> +
>   static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -1580,6 +1586,7 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
>       k->xscom_pcba = pnv_chip_power9_xscom_pcba;
>       dc->desc = "PowerNV Chip POWER9";
>       k->num_pecs = PNV9_CHIP_MAX_PEC;
> +    k->get_pec = pnv_chip_power9_get_pec;
>   
>       device_class_set_parent_realize(dc, pnv_chip_power9_realize,
>                                       &k->parent_realize);
> @@ -1769,6 +1776,12 @@ static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr)
>       return addr >> 3;
>   }
>   
> +static PnvPhb4PecState *pnv_chip_power10_get_pec(PnvChip *chip, uint32_t index)
> +{
> +    Pnv10Chip *chip10 = PNV10_CHIP(chip);
> +    return &chip10->pecs[index];
> +}
> +
>   static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -1788,6 +1801,7 @@ static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
>       k->xscom_pcba = pnv_chip_power10_xscom_pcba;
>       dc->desc = "PowerNV Chip POWER10";
>       k->num_pecs = PNV10_CHIP_MAX_PEC;
> +    k->get_pec = pnv_chip_power10_get_pec;
>   
>       device_class_set_parent_realize(dc, pnv_chip_power10_realize,
>                                       &k->parent_realize);
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 1e34ddd502..282f76ba08 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -163,6 +163,7 @@ struct PnvChipClass {
>       void (*pic_print_info)(PnvChip *chip, Monitor *mon);
>       uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
>       uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
> +    PnvPhb4PecState *(*get_pec)(PnvChip *chip, uint32_t index);
>   };
>   
>   #define PNV_CHIP_TYPE_SUFFIX "-" TYPE_PNV_CHIP


