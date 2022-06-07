Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D108B53F607
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 08:24:24 +0200 (CEST)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nySdb-0007dO-Ml
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 02:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nySXC-0003Nd-Ob
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:17:49 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:53411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nySX9-0007PI-E5
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 02:17:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1000021FBE;
 Tue,  7 Jun 2022 06:17:39 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 08:17:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054878c3f3-ac65-43ec-b4b8-2396757a5e5f,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a1d4dc88-58e6-d764-1a27-7a2312db67bd@kaod.org>
Date: Tue, 7 Jun 2022 08:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 07/16] ppc/pnv: change PnvPHB4 to be a PnvPHB backend
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <david@gibson.dropbear.id.au>,
 <fbarrat@linux.ibm.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-8-danielhb413@gmail.com>
 <21243b3a-cfdd-d109-5a31-9b30e6062f27@ilande.co.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <21243b3a-cfdd-d109-5a31-9b30e6062f27@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bef57122-aa86-4335-ab55-1d2b2f39ada0
X-Ovh-Tracer-Id: 17114241534150150950
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddtgedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
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

On 6/2/22 10:02, Mark Cave-Ayland wrote:
> On 31/05/2022 22:49, Daniel Henrique Barboza wrote:
> 
>> Change the parent type of the PnvPHB4 device to TYPE_PARENT since the
>> PCI bus is going to be initialized by the PnvPHB parent. Functions that
>> needs to access the bus via a PnvPHB4 object can do so via the
>> phb4->phb_base pointer.
>>
>> pnv_phb4_pec now creates a PnvPHB object.
>>
>> The powernv9 machine class will create PnvPHB devices with version '4'.
>> powernv10 will create using version '5'. Both are using global machine
>> properties in their class_init() to do that.
>>
>> These changes will benefit us when adding PnvPHB user creatable devices
>> for powernv9 and powernv10.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb4.c         | 29 +++++++++--------------------
>>   hw/pci-host/pnv_phb4_pec.c     |  6 +-----
>>   hw/ppc/pnv.c                   | 20 +++++++++++++++++++-
>>   include/hw/pci-host/pnv_phb4.h |  5 ++++-
>>   4 files changed, 33 insertions(+), 27 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index ae5494fe72..22cf1c2a5e 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -49,7 +49,7 @@ static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
>>   static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
>>   {
>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>       uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
>>       uint8_t bus, devfn;
>> @@ -145,7 +145,7 @@ static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
>>   static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
>>                                        unsigned size, uint64_t val)
>>   {
>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>       PCIDevice *pdev;
>>       if (size != 4) {
>> @@ -166,7 +166,7 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
>>   static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
>>                                           unsigned size)
>>   {
>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>       PCIDevice *pdev;
>>       uint64_t val;
>> @@ -1608,16 +1608,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>>       pnv_phb4_xscom_realize(phb);
>>   }
>> -static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
>> -                                          PCIBus *rootbus)
>> -{
>> -    PnvPHB4 *phb = PNV_PHB4(host_bridge);
>> -
>> -    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
>> -             phb->chip_id, phb->phb_id);
>> -    return phb->bus_path;
>> -}
>> -
>>   /*
>>    * Address base trigger mode (POWER10)
>>    *
>> @@ -1702,19 +1692,18 @@ static Property pnv_phb4_properties[] = {
>>           DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
>>           DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
>>                            PnvPhb4PecState *),
>> +        DEFINE_PROP_LINK("phb-base", PnvPHB4, phb_base,
>> +                         TYPE_PNV_PHB, PnvPHB *),
>>           DEFINE_PROP_END_OF_LIST(),
>>   };
>>   static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>>   {
>> -    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>>       XiveNotifierClass *xfc = XIVE_NOTIFIER_CLASS(klass);
>> -    hc->root_bus_path   = pnv_phb4_root_bus_path;
>>       dc->realize         = pnv_phb4_realize;
>>       device_class_set_props(dc, pnv_phb4_properties);
>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>       dc->user_creatable  = false;
>>       xfc->notify         = pnv_phb4_xive_notify;
>> @@ -1722,7 +1711,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>>   static const TypeInfo pnv_phb4_type_info = {
>>       .name          = TYPE_PNV_PHB4,
>> -    .parent        = TYPE_PCIE_HOST_BRIDGE,
>> +    .parent        = TYPE_DEVICE,
>>       .instance_init = pnv_phb4_instance_init,
>>       .instance_size = sizeof(PnvPHB4),
>>       .class_init    = pnv_phb4_class_init,
>> @@ -1785,11 +1774,11 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>>       PCIBus *bus = pci_get_bus(pci);
>> -    PnvPHB4 *phb = NULL;
>> +    PnvPHB *phb = NULL;
>>       Error *local_err = NULL;
>> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> -                                          TYPE_PNV_PHB4);
>> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> +                                         TYPE_PNV_PHB);
> 
> Same comment here re: accessing bus->qbus directly.
> 
>>       if (!phb) {
>>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 61bc0b503e..888ecbe8f3 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
>> @@ -115,8 +115,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>                                           int stack_no,
>>                                           Error **errp)
>>   {
>> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>> -    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
>> +    PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
>>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>>       object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
>> @@ -130,9 +129,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>>           return;
>>       }
>> -
>> -    /* Add a single Root port if running with defaults */
>> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
>>   }
>>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 081b6839cc..3b0b230e49 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -688,7 +688,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>>   static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
>>   {
>>       Monitor *mon = opaque;
>> -    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
>> +    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
> 
> I'm sure this could just be:
> 
>      PnvPHB *phb = PNV_PHB(child);

But it would assert if child is not of the correct type. The routine
above is called from a object_child_foreach() which loops on all
children.

I think it could be improved by using directly &chip*->phbs[i].

C.

> 
>> +    PnvPHB4 *phb4;
>> +
>> +    if (!phb) {
>> +        return 0;
>> +    }
>> +
>> +    phb4 = (PnvPHB4 *)phb->backend;
> 
> and you should be able to do:
> 
>      phb4 = PNV_PHB4(phb->backend);
> 
> My preference for using the QOM macros where possible is that they also include a type check that assert()s if you assign the wrong type of QOM object, which a direct C cast would miss.
> 
>>       if (phb4) {
>>           pnv_phb4_pic_print_info(phb4, mon);
>> @@ -2164,8 +2171,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>>       static const char compat[] = "qemu,powernv9\0ibm,powernv";
>> +    static GlobalProperty phb_compat[] = {
>> +        { TYPE_PNV_PHB, "version", "4" },
>> +    };
>> +
>>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
>>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
>> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>> +
>>       xfc->match_nvt = pnv_match_nvt;
>>       mc->alias = "powernv";
>> @@ -2182,8 +2195,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>>       XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
>>       static const char compat[] = "qemu,powernv10\0ibm,powernv";
>> +    static GlobalProperty phb_compat[] = {
>> +        { TYPE_PNV_PHB, "version", "5" },
>> +    };
>> +
>>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
>>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
>> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>>       pmc->compat = compat;
>>       pmc->compat_size = sizeof(compat);
>> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
>> index 90843ac3a9..f22253358f 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -18,6 +18,7 @@
>>   typedef struct PnvPhb4PecState PnvPhb4PecState;
>>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>>   typedef struct PnvPHB4 PnvPHB4;
>> +typedef struct PnvPHB PnvPHB;
>>   typedef struct PnvChip PnvChip;
>>   /*
>> @@ -78,7 +79,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
>>   #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
>>   struct PnvPHB4 {
>> -    PCIExpressHost parent_obj;
>> +    DeviceState parent;
>> +
>> +    PnvPHB *phb_base;
>>       uint32_t chip_id;
>>       uint32_t phb_id;
> 
> 
> ATB,
> 
> Mark.


