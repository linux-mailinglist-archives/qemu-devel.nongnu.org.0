Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783653B4CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 10:12:24 +0200 (CEST)
Received: from localhost ([::1]:59654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwfwN-0004m1-5k
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 04:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwfnN-0002bX-3g; Thu, 02 Jun 2022 04:03:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwfnK-00080P-VU; Thu, 02 Jun 2022 04:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T225n0yA9+gPrSg2bTSAeoXQ3VTwVOTSPVxjlwFuz3Y=; b=kUHl7SHVxusYNDmbtaKZ+D6ZAR
 /El+QGQcmpvzzS6/sfsWGmNnhO3mozYn3HbYEJ3K1k4aj0XJ98UHpUtEyqMhXdnFYed260GOkS+it
 6caeWr6KA7YTSQ8SUiqWy7ZzL3EXga/eyYJOl/LvWnzCsmH/gyMobPJXi8EI2GrSGfRwE2wF4Zf1G
 Amd9u8HcXgyvw/OMJm6VxnEwtyQODE6IyIxrsZQSYYgU64XQcegnbLRuQuqAFGrBXfEzUuLWAAQ4a
 XAS7rboakaNrHXJBnkcq7zD6rs9sgLSkJ6seenBZz4mqCJXPYNxA01KohvRjCfcu09XhIwhARlIHU
 V2UKxvl9IerobpYqm1J8dQ/ZuqIp0RcfkO1ICMSGysCnzAizOyYLZREMFR1DQzyWoxhZ5gTRlxGm9
 SM8GBUZFn/bP3UKSfhihiUoOznuNHKDB46EwwUeMx1iYrnZtZFSMbScLppsSROZJ47mwM0StEyaeY
 FjAfFwfOzIkQWxERqeHDBO+7suQcpRJBp+gJIAdBXLJqsP0FkQHFLT40aUMrjKhVr+1xEs5m0MCWE
 H8rq2hmCBock7IJvkGKpmccDn0QRjly8NLk/p3ApuFYD2mHhWuGzjbAHa6WYOEc0JZNNN+jx6Atpw
 1fsHVc3NbOasHpU0uYVYsqdglWfcqT0BjDMUBST6k=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwfmF-00039P-MS; Thu, 02 Jun 2022 09:01:56 +0100
Message-ID: <21243b3a-cfdd-d109-5a31-9b30e6062f27@ilande.co.uk>
Date: Thu, 2 Jun 2022 09:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-8-danielhb413@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220531214917.31668-8-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 07/16] ppc/pnv: change PnvPHB4 to be a PnvPHB backend
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 31/05/2022 22:49, Daniel Henrique Barboza wrote:

> Change the parent type of the PnvPHB4 device to TYPE_PARENT since the
> PCI bus is going to be initialized by the PnvPHB parent. Functions that
> needs to access the bus via a PnvPHB4 object can do so via the
> phb4->phb_base pointer.
> 
> pnv_phb4_pec now creates a PnvPHB object.
> 
> The powernv9 machine class will create PnvPHB devices with version '4'.
> powernv10 will create using version '5'. Both are using global machine
> properties in their class_init() to do that.
> 
> These changes will benefit us when adding PnvPHB user creatable devices
> for powernv9 and powernv10.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c         | 29 +++++++++--------------------
>   hw/pci-host/pnv_phb4_pec.c     |  6 +-----
>   hw/ppc/pnv.c                   | 20 +++++++++++++++++++-
>   include/hw/pci-host/pnv_phb4.h |  5 ++++-
>   4 files changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ae5494fe72..22cf1c2a5e 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -49,7 +49,7 @@ static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
>   
>   static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
>   {
> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>       uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
>       uint8_t bus, devfn;
>   
> @@ -145,7 +145,7 @@ static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
>   static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
>                                        unsigned size, uint64_t val)
>   {
> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>       PCIDevice *pdev;
>   
>       if (size != 4) {
> @@ -166,7 +166,7 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
>   static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
>                                           unsigned size)
>   {
> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>       PCIDevice *pdev;
>       uint64_t val;
>   
> @@ -1608,16 +1608,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pnv_phb4_xscom_realize(phb);
>   }
>   
> -static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
> -                                          PCIBus *rootbus)
> -{
> -    PnvPHB4 *phb = PNV_PHB4(host_bridge);
> -
> -    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
> -             phb->chip_id, phb->phb_id);
> -    return phb->bus_path;
> -}
> -
>   /*
>    * Address base trigger mode (POWER10)
>    *
> @@ -1702,19 +1692,18 @@ static Property pnv_phb4_properties[] = {
>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>           DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
>                            PnvPhb4PecState *),
> +        DEFINE_PROP_LINK("phb-base", PnvPHB4, phb_base,
> +                         TYPE_PNV_PHB, PnvPHB *),
>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
>   static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>   {
> -    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       XiveNotifierClass *xfc = XIVE_NOTIFIER_CLASS(klass);
>   
> -    hc->root_bus_path   = pnv_phb4_root_bus_path;
>       dc->realize         = pnv_phb4_realize;
>       device_class_set_props(dc, pnv_phb4_properties);
> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>       dc->user_creatable  = false;
>   
>       xfc->notify         = pnv_phb4_xive_notify;
> @@ -1722,7 +1711,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>   
>   static const TypeInfo pnv_phb4_type_info = {
>       .name          = TYPE_PNV_PHB4,
> -    .parent        = TYPE_PCIE_HOST_BRIDGE,
> +    .parent        = TYPE_DEVICE,
>       .instance_init = pnv_phb4_instance_init,
>       .instance_size = sizeof(PnvPHB4),
>       .class_init    = pnv_phb4_class_init,
> @@ -1785,11 +1774,11 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PCIDevice *pci = PCI_DEVICE(dev);
>       PCIBus *bus = pci_get_bus(pci);
> -    PnvPHB4 *phb = NULL;
> +    PnvPHB *phb = NULL;
>       Error *local_err = NULL;
>   
> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                          TYPE_PNV_PHB4);
> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> +                                         TYPE_PNV_PHB);

Same comment here re: accessing bus->qbus directly.

>       if (!phb) {
>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 61bc0b503e..888ecbe8f3 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -115,8 +115,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>                                           int stack_no,
>                                           Error **errp)
>   {
> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> -    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
> +    PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>   
>       object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
> @@ -130,9 +129,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>           return;
>       }
> -
> -    /* Add a single Root port if running with defaults */
> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
>   }
>   
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 081b6839cc..3b0b230e49 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -688,7 +688,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>   static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
>   {
>       Monitor *mon = opaque;
> -    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
> +    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);

I'm sure this could just be:

     PnvPHB *phb = PNV_PHB(child);

> +    PnvPHB4 *phb4;
> +
> +    if (!phb) {
> +        return 0;
> +    }
> +
> +    phb4 = (PnvPHB4 *)phb->backend;

and you should be able to do:

     phb4 = PNV_PHB4(phb->backend);

My preference for using the QOM macros where possible is that they also include a 
type check that assert()s if you assign the wrong type of QOM object, which a direct 
C cast would miss.

>       if (phb4) {
>           pnv_phb4_pic_print_info(phb4, mon);
> @@ -2164,8 +2171,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>       static const char compat[] = "qemu,powernv9\0ibm,powernv";
>   
> +    static GlobalProperty phb_compat[] = {
> +        { TYPE_PNV_PHB, "version", "4" },
> +    };
> +
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
> +
>       xfc->match_nvt = pnv_match_nvt;
>   
>       mc->alias = "powernv";
> @@ -2182,8 +2195,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>       XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
>       static const char compat[] = "qemu,powernv10\0ibm,powernv";
>   
> +    static GlobalProperty phb_compat[] = {
> +        { TYPE_PNV_PHB, "version", "5" },
> +    };
> +
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 90843ac3a9..f22253358f 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -18,6 +18,7 @@
>   typedef struct PnvPhb4PecState PnvPhb4PecState;
>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>   typedef struct PnvPHB4 PnvPHB4;
> +typedef struct PnvPHB PnvPHB;
>   typedef struct PnvChip PnvChip;
>   
>   /*
> @@ -78,7 +79,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
>   #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
>   
>   struct PnvPHB4 {
> -    PCIExpressHost parent_obj;
> +    DeviceState parent;
> +
> +    PnvPHB *phb_base;
>   
>       uint32_t chip_id;
>       uint32_t phb_id;


ATB,

Mark.

