Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D71554298
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 08:23:41 +0200 (CEST)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3tm7-0002CV-Qp
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 02:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o3tjE-0007Vp-8F
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 02:20:40 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:36969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o3tjB-0004Pk-7i
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 02:20:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CB75F10F9C1A5;
 Wed, 22 Jun 2022 08:20:32 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 22 Jun
 2022 08:20:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004dcf010f3-4a7c-4c37-8728-142c7ffe52c2,
 2DC937403B1024A35EC30128D5FB04FD4A6B2553) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7f94006f-8dfd-90eb-c0bc-8a78bfd42526@kaod.org>
Date: Wed, 22 Jun 2022 08:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/8] ppc/pnv: assign pnv-phb-root-port chassis/slot
 earlier
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
 <20220621173436.165912-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220621173436.165912-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 64a103b8-5902-41e6-be77-4bad851b8bb9
X-Ovh-Tracer-Id: 13019906523894877152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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

On 6/21/22 19:34, Daniel Henrique Barboza wrote:
> It is not advisable to execute an object_dynamic_cast() to poke into
> bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
> think we got.
> 
> In fact this is not needed. There is nothing sophisticated being done
> with the PHB object retrieved during root_port_realize() for both
> PHB3 and PHB4. We're retrieving a PHB reference PHB just to access
> phb->chip_id and phb->phb_id and use them to define the chassis/slot
> of the root port.
> 
> phb->phb_id is already being passed to pnv_phb_attach_root_port() via
> the 'index' parameter. Let's also add a 'chip_id' parameter to this
> function and assign chassis and slot right there. This will spare us
> from the hassle of accessing the PHB object inside realize().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb3.c | 18 ++----------------
>   hw/pci-host/pnv_phb4.c | 18 ++----------------
>   hw/ppc/pnv.c           | 15 +++++++++++++--
>   include/hw/ppc/pnv.h   |  3 ++-
>   4 files changed, 19 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 4ba660f8b9..afe5698167 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1052,7 +1052,8 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   
>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>   
> -    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT, phb->phb_id);
> +    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
> +                             phb->phb_id, phb->chip_id);
>   }
>   
>   void pnv_phb3_update_regions(PnvPHB3 *phb)
> @@ -1139,23 +1140,8 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
> -    PnvPHB3 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB3);
> -
> -    if (!phb) {
> -        error_setg(errp,
> -"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
> -        return;
> -    }
> -
> -    /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> -
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ffd9d8a947..725b3d740b 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1585,7 +1585,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
>       /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(pci, pecc->rp_model, phb->phb_id);
> +    pnv_phb_attach_root_port(pci, pecc->rp_model,
> +                             phb->phb_id, phb->chip_id);
>   
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
> @@ -1781,23 +1782,8 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
>   static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> -    PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
> -    PnvPHB4 *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB4);
> -
> -    if (!phb) {
> -        error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
> -        return;
> -    }
> -
> -    /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> -
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 40e0cbd84d..c5e63bede7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1189,8 +1189,15 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>       }
>   }
>   
> -/* Attach a root port device */
> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
> +/*
> + * Attach a root port device.
> + *
> + * 'index' will be used both as a PCIE slot value and to calculate
> + * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> + * root port.
> + */
> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
> +                              int index, int chip_id)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
>       g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
> @@ -1199,6 +1206,10 @@ void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
>       object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
>                                 OBJECT(root));
>   
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
> +    qdev_prop_set_uint16(DEVICE(root), "slot", index);
> +
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 033890a23f..b991194223 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -189,7 +189,8 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                            TYPE_PNV_CHIP_POWER10)
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index);
> +void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
> +                              int index, int chip_id);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;


