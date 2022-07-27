Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320BB583067
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:37:38 +0200 (CEST)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkyW-0001Sg-8n
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkt2-0004da-U6; Wed, 27 Jul 2022 13:32:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkt0-0007rH-3j; Wed, 27 Jul 2022 13:31:55 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHGcla031804;
 Wed, 27 Jul 2022 17:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7SScsuijKnzk8jCXXlsaLwwMrtgaoF8lVzw5MYVhc1s=;
 b=OEuDUuX40D8GYKmKbzGfdWAfTKkKwZvUqYLNuu0weVfb+9fs/Tl8GRBzSxIV7lA9pc8j
 17+tjIhTWpjkw3hZZ55Qm+jTl4frmV4luO62C8r7fBz99DgRiXgmFEcInK6c1/e3qnuv
 IyMwEtpy1C+sjUF0XMQ7OGE3TLK/Pen1N5aJBl6tFs2xjY+IzureKBsiwE1rXzuOpcqw
 IM8Lf6lGPyba0++RKcMTXMpYhVjlDzW0idNsJsO3BUmDZ6knSLPsqvXmrbmnOfyaRywq
 3AiFikvWfoxE/VfGLUG2swuU9I3F5Ee7oKzx5nl9jCLJganGvwlfEjUfLzRTJw59bEqX WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9mc8fex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:31:45 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHGjE6032030;
 Wed, 27 Jul 2022 17:31:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9mc8fdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:31:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHLwHt019517;
 Wed, 27 Jul 2022 17:31:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tdasy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:31:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHVdeU5767486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:31:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE91411C04C;
 Wed, 27 Jul 2022 17:31:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B78211C04A;
 Wed, 27 Jul 2022 17:31:39 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:31:39 +0000 (GMT)
Message-ID: <b304e6f7-2894-e966-bfab-ea55178f80bd@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/12] ppc/pnv: turn PnvPHB3 into a PnvPHB backend
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-4-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pgaN4-KOTqKN3kasT7MUSzmYTUbdyMru
X-Proofpoint-GUID: YSM69emND_ygGlGUrplKl6A3Dhoq7_2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=784
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
> We need a handful of changes that needs to be done in a single swoop to
> turn PnvPHB3 into a PnvPHB backend.
> 
> In the PnvPHB3, since the PnvPHB device implements PCIExpressHost and
> will hold the PCI bus, change PnvPHB3 parent to TYPE_DEVICE. There are a
> couple of instances in pnv_phb3.c that needs to access the PCI bus, so a
> phb_base pointer is added to allow access to the parent PnvPHB. The
> PnvPHB3 root port will now be connected to a PnvPHB object.
> 
> In pnv.c, the powernv8 machine chip8 will now hold an array of PnvPHB
> objects.  pnv_get_phb3_child() needs to be adapted to return the PnvPHB3
> backend from the PnvPHB child. A global property is added in
> pnv_machine_power8_class_init() to ensure that all PnvPHBs are created
> with phb->version = 3.
> 
> After all these changes we're still able to boot a powernv8 machine with
> default settings. The real gain will come with user created PnvPHB
> devices, coming up next.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


A very minor indentation issue below, but other than that:
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   hw/pci-host/pnv_phb3.c         | 27 +++++----------------------
>   hw/ppc/pnv.c                   | 21 +++++++++++++++------
>   include/hw/pci-host/pnv_phb3.h |  5 ++++-
>   include/hw/ppc/pnv.h           |  3 ++-
>   4 files changed, 26 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 058cbab555..ad5d67a8e8 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -11,6 +11,7 @@
>   #include "qapi/visitor.h"
>   #include "qapi/error.h"
>   #include "hw/pci-host/pnv_phb3_regs.h"
> +#include "hw/pci-host/pnv_phb.h"
>   #include "hw/pci-host/pnv_phb3.h"
>   #include "hw/pci/pcie_host.h"
>   #include "hw/pci/pcie_port.h"
> @@ -26,7 +27,7 @@
>   
>   static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
>   {
> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>       uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
>       uint8_t bus, devfn;
>   
> @@ -590,7 +591,7 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
>   uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
>   {
>       PnvPHB3 *phb = opaque;
> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>       uint64_t val;
>   
>       if ((off & 0xfffc) == PHB_CONFIG_DATA) {
> @@ -1011,7 +1012,6 @@ void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
>   static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB3 *phb = PNV_PHB3(dev);
> -    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>       int i;
>   
> @@ -1056,11 +1056,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       /* Controller Registers */
>       memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
>                             "phb3-regs", 0x1000);
> -
> -    pnv_phb3_bus_init(dev, phb);
> -
> -    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
> -                             phb->phb_id, phb->chip_id);
>   }
>   
>   void pnv_phb3_update_regions(PnvPHB3 *phb)
> @@ -1085,38 +1080,26 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
>       pnv_phb3_check_all_m64s(phb);
>   }
>   
> -static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
> -                                          PCIBus *rootbus)
> -{
> -    PnvPHB3 *phb = PNV_PHB3(host_bridge);
> -
> -    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
> -             phb->chip_id, phb->phb_id);
> -    return phb->bus_path;
> -}
> -
>   static Property pnv_phb3_properties[] = {
>       DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
>       DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
>       DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
> +    DEFINE_PROP_LINK("phb-base", PnvPHB3, phb_base, TYPE_PNV_PHB, PnvPHB *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
>   static void pnv_phb3_class_init(ObjectClass *klass, void *data)
>   {
> -    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
> -    hc->root_bus_path = pnv_phb3_root_bus_path;
>       dc->realize = pnv_phb3_realize;
>       device_class_set_props(dc, pnv_phb3_properties);
> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>       dc->user_creatable = false;
>   }
>   
>   static const TypeInfo pnv_phb3_type_info = {
>       .name          = TYPE_PNV_PHB3,
> -    .parent        = TYPE_PCIE_HOST_BRIDGE,
> +    .parent = TYPE_DEVICE,

Missing spaces here ^^
   Fred


>       .instance_size = sizeof(PnvPHB3),
>       .class_init    = pnv_phb3_class_init,
>       .instance_init = pnv_phb3_instance_init,
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d3f77c8367..1df91971b8 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -43,6 +43,7 @@
>   #include "hw/ipmi/ipmi.h"
>   #include "target/ppc/mmu-hash64.h"
>   #include "hw/pci/msi.h"
> +#include "hw/pci-host/pnv_phb.h"
>   
>   #include "hw/ppc/xics.h"
>   #include "hw/qdev-properties.h"
> @@ -660,7 +661,8 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>       ics_pic_print_info(&chip8->psi.ics, mon);
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB3 *phb3 = &chip8->phbs[i];
> +        PnvPHB *phb = &chip8->phbs[i];
> +        PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>           pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
>           ics_pic_print_info(&phb3->lsis, mon);
> @@ -1149,7 +1151,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
>       chip8->num_phbs = pcc->num_phbs;
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
> +        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
>       }
>   
>   }
> @@ -1287,9 +1289,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip),
>                                   &chip8->homer.regs);
>   
> -    /* PHB3 controllers */
> +    /* PHB controllers */
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB3 *phb = &chip8->phbs[i];
> +        PnvPHB *phb = &chip8->phbs[i];
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
> @@ -1957,7 +1959,8 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>           }
>   
>           for (j = 0; j < chip8->num_phbs; j++) {
> -            PnvPHB3 *phb3 = &chip8->phbs[j];
> +            PnvPHB *phb = &chip8->phbs[j];
> +            PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>               if (ics_valid_irq(&phb3->lsis, irq)) {
>                   return &phb3->lsis;
> @@ -1995,7 +1998,8 @@ static void pnv_ics_resend(XICSFabric *xi)
>           ics_resend(&chip8->psi.ics);
>   
>           for (j = 0; j < chip8->num_phbs; j++) {
> -            PnvPHB3 *phb3 = &chip8->phbs[j];
> +            PnvPHB *phb = &chip8->phbs[j];
> +            PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>               ics_resend(&phb3->lsis);
>               ics_resend(ICS(&phb3->msis));
> @@ -2095,8 +2099,13 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>       static const char compat[] = "qemu,powernv8\0qemu,powernv\0ibm,powernv";
>   
> +    static GlobalProperty phb_compat[] = {
> +        { TYPE_PNV_PHB, "version", "3" },
> +    };
> +
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>   
>       xic->icp_get = pnv_icp_get;
>       xic->ics_get = pnv_ics_get;
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index 1375f18fc1..3b9ff1096a 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -14,6 +14,7 @@
>   #include "hw/pci/pcie_port.h"
>   #include "hw/ppc/xics.h"
>   #include "qom/object.h"
> +#include "hw/pci-host/pnv_phb.h"
>   
>   typedef struct PnvPHB3 PnvPHB3;
>   typedef struct PnvChip PnvChip;
> @@ -127,7 +128,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
>   #define PCI_MMIO_TOTAL_SIZE   (0x1ull << 60)
>   
>   struct PnvPHB3 {
> -    PCIExpressHost parent_obj;
> +    DeviceState parent;
> +
> +    PnvPHB *phb_base;
>   
>       uint32_t chip_id;
>       uint32_t phb_id;
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index b991194223..33b7b52f45 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -32,6 +32,7 @@
>   #include "hw/ppc/pnv_core.h"
>   #include "hw/pci-host/pnv_phb3.h"
>   #include "hw/pci-host/pnv_phb4.h"
> +#include "hw/pci-host/pnv_phb.h"
>   #include "qom/object.h"
>   
>   #define TYPE_PNV_CHIP "pnv-chip"
> @@ -80,7 +81,7 @@ struct Pnv8Chip {
>       PnvHomer     homer;
>   
>   #define PNV8_CHIP_PHB3_MAX 4
> -    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
> +    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
>       uint32_t     num_phbs;
>   
>       XICSFabric    *xics;

