Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACAA54B037
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:16:12 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15St-0004db-1I
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o15N2-00014Q-Gq
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:10:08 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o15Mz-0006IV-Gv
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:10:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.170])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B7D1A10BDEA79;
 Tue, 14 Jun 2022 14:10:02 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 14:10:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0039497bc94-28da-4fd0-a777-b9545595cacc,
 13435030B24A8B4E4D84E163F0172F78FE8A39D7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f3612399-e5d4-9631-ef7f-59aeeeabadac@kaod.org>
Date: Tue, 14 Jun 2022 14:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 03/11] ppc/pnv: use dev->parent_bus->parent to get the PHB
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>,
 <mark.cave-ayland@ilande.co.uk>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-4-danielhb@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220613154456.359674-4-danielhb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e5a67fcc-0c63-477d-a43b-56e6e8632454
X-Ovh-Tracer-Id: 8834373620492503971
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
> It is not advisable to execute an object_dynamic_cast() to poke into
> bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
> think we got.
> 
> A better way is to access the PnvPHB object via a QOM macro accessing
> the existing parent links of the DeviceState. For a given
> pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
> and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
> assert the type, and keep the NULL check in case we didn't get the
> object we were expecting.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
> ---
>   hw/pci-host/pnv_phb3.c | 10 +++++++---
>   hw/pci-host/pnv_phb4.c | 10 +++++++---
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 4ba660f8b9..7901d8172c 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
>       PnvPHB3 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB3);
> +    /*
> +     * dev->parent_bus gives access to the pnv-phb-root bus.
> +     * The PnvPHB3 is the owner (parent) of the bus.
> +     */
> +    if (dev && dev->parent_bus) {
> +        phb = PNV_PHB3(dev->parent_bus->parent);
> +    }
>

Couldn't we simply use :

       phb = PNV_PHB3(bus);

?

Thanks,

C.

>       if (!phb) {
>           error_setg(errp,
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ffd9d8a947..bae9398d86 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
>       PnvPHB4 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB4);
> +    /*
> +     * dev->parent_bus gives access to the pnv-phb-root bus.
> +     * The PnvPHB4 is the owner (parent) of the bus.
> +     */
> +    if (dev && dev->parent_bus) {
> +        phb = PNV_PHB4(dev->parent_bus->parent);
> +    }
>   
>       if (!phb) {
>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);


