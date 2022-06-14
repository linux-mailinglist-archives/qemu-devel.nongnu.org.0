Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACA54AFEE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:09:01 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15Lw-0006Yb-Eb
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o15GM-00038W-Lf
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:03:20 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:55051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o15G9-0004Nw-Am
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:03:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 17F642AAC2;
 Tue, 14 Jun 2022 12:02:55 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 14:02:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0033af6f90a-a2b7-4371-8925-d82564e6d8ce,
 13435030B24A8B4E4D84E163F0172F78FE8A39D7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <eb6b85a6-d70a-aa1c-cde1-ffc5f86b2218@kaod.org>
Date: Tue, 14 Jun 2022 14:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 01/11] ppc/pnv: move root port attach to pnv_phb4_realize()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>,
 <mark.cave-ayland@ilande.co.uk>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-2-danielhb@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220613154456.359674-2-danielhb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2fdcb0d3-2259-4613-a518-5948d08a1f83
X-Ovh-Tracer-Id: 8714183807798709155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhkpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/13/22 17:44, Daniel Henrique Barboza wrote:
> Creating a root port is something related to the PHB, not the PEC. It
> also makes the logic more in line with what pnv-phb3 does.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

So the root port is back where it was.

Could we avoid the pci_new() and use object_initialize_child() instead ?

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c     | 4 ++++
>   hw/pci-host/pnv_phb4_pec.c | 3 ---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 6594016121..23ad8de7ee 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1547,6 +1547,7 @@ static void pnv_phb4_instance_init(Object *obj)
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(dev);
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       XiveSource *xsrc = &phb->xsrc;
>       int nr_irqs;
> @@ -1583,6 +1584,9 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
> +    /* Add a single Root port if running with defaults */
> +    pnv_phb_attach_root_port(pci, pecc->rp_model);
> +
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
>           nr_irqs = PNV_PHB4_MAX_INTs;
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 8b7e823fa5..c9aaf1c28e 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -130,9 +130,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>           return;
>       }
> -
> -    /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)


