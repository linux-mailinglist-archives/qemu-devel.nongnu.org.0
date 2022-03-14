Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD64D86F0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:27:47 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlfm-0000MW-Cm
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:27:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nTlVA-0000J7-9a; Mon, 14 Mar 2022 10:16:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64316
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nTlV6-0000dq-Bd; Mon, 14 Mar 2022 10:16:46 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EDDIoq013379; 
 Mon, 14 Mar 2022 14:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VjRDkZxtucx3ZJdAE0UP4IJcT+msqx27z1sRsAhLy1Y=;
 b=gtzLjVBHjZVEw4nrwNjdPs+FIgPShTu8+Ul0IDkO0FimYd90RuAKl4CAdV69OBCCO5WH
 83yXmjPSdLkNKifDCFY/yXrEXuMDsiHfWr2qOREh9IL0PKITwYAZATsFVW060u38OVm2
 5308YnD0OTg6wuFuK0sFtBSugPV6Sh5qeeR77yv3/5XSuonuR/tp6xUBOZ614Qo0WkQ3
 nMzKsSLaLHlf4Fy+5NA6Fae8hnvfX/K9Swm/8WnkiQWCy0kJp64Kfi90D9mvMjGzKBwA
 +VdFXWbSozm0WG9kDOuxK8f1N7MUj7AqgCPneW3NiogGZlqWFP02PylGGY9QONQZmfL7 FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d6j0hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 14:16:10 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EDp6n2008247;
 Mon, 14 Mar 2022 14:16:09 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d6j0gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 14:16:09 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EE7VXJ032492;
 Mon, 14 Mar 2022 14:16:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3erk58kqub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 14:16:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22EEG67H40567150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 14:16:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50EEE42093;
 Mon, 14 Mar 2022 14:16:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0225F42270;
 Mon, 14 Mar 2022 14:16:05 +0000 (GMT)
Received: from [9.145.89.89] (unknown [9.145.89.89])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 14:16:04 +0000 (GMT)
Message-ID: <09fba24b-95db-fd77-c687-80119fe4f777@linux.ibm.com>
Date: Mon, 14 Mar 2022 15:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/pnv: Remove user-created PHB{3,4,5} devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220314130514.529931-1-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220314130514.529931-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZSOF4blK1c8-RWNAgJpw-9m-LaW09c7n
X-Proofpoint-ORIG-GUID: lrzgUUrEyMXwaEpGMMuhaJfTgth51pfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_08,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203140089
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/03/2022 14:05, Cédric Le Goater wrote:
> On a real system with POWER{8,9,10} processors, PHBs are sub-units of
> the processor, they can be deactivated by firmware but not plugged in
> or out like a PCI adapter on a slot. Nevertheless, having user-created
> PHBs in QEMU seemed to be a good idea for testing purposes :
> 
>   1. having a limited set of PHBs speedups boot time.
>   2. it is useful to be able to mimic a partially broken topology you
>      some time have to deal with during bring-up.
> 
> PowerNV is also used for distro install tests and having libvirt
> support eases these tasks. libvirt prefers to run the machine with
> -nodefaults to be sure not to drag unexpected devices which would need
> to be defined in the domain file without being specified on the QEMU
> command line. For this reason :
> 
>   3. -nodefaults should not include default PHBs
> 
> User-created PHB{3,4,5} devices satisfied all these needs but reality
> proves to be a bit more complex, internally when modeling such
> devices, and externally when dealing with the user interface.
> 
> Req 1. and 2. can be simply addressed differently with a machine option:
> "phb-mask=<uint>", which QEMU would use to enable/disable PHB device
> nodes when creating the device tree.
> 
> For Req 3., we need to make sure we are taking the right approach. It
> seems that we should expose a new type of user-created PHB device, a
> generic virtualized one, that libvirt would use and not one depending
> on the processor revision. This needs more thinking.
> 
> For now, remove user-created PHB{3,4,5} devices. All the cleanups we
> did are not lost and they will be useful for the next steps.
> 
> Fixes: 5bc67b052b51 ("ppc/pnv: Introduce user creatable pnv-phb4 devices")
> Fixes: 1f6a88fffc75 ("ppc/pnv: Introduce support for user created PHB3 devices")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

So with this patch, -nodefaults has basically no effect on the PHBs and 
root ports creation. They are always there. It makes sense, since we are 
removing the capability to add a subset of them.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   include/hw/ppc/pnv.h       |  1 -
>   hw/pci-host/pnv_phb3.c     | 33 ++------------------
>   hw/pci-host/pnv_phb4.c     | 62 ++------------------------------------
>   hw/pci-host/pnv_phb4_pec.c |  7 ++---
>   hw/ppc/pnv.c               | 25 +--------------
>   5 files changed, 10 insertions(+), 118 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 1e34ddd502d8..86cb7d7f971b 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -190,7 +190,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
>   void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
> -void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index aafd46b635e8..ac801ac83582 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -994,30 +994,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
>       int i;
>   
> -    /* User created devices */
> -    if (!phb->chip) {
> -        Error *local_err = NULL;
> -        BusState *s;
> -
> -        phb->chip = pnv_get_chip(pnv, phb->chip_id);
> -        if (!phb->chip) {
> -            error_setg(errp, "invalid chip id: %d", phb->chip_id);
> -            return;
> -        }
> -
> -        /*
> -         * Reparent user created devices to the chip to build
> -         * correctly the device tree.
> -         */
> -        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
> -
> -        s = qdev_get_parent_bus(DEVICE(phb->chip));
> -        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
>       if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
>           error_setg(errp, "invalid PHB index: %d", phb->phb_id);
>           return;
> @@ -1077,10 +1053,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   
>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>   
> -    if (defaults_enabled()) {
> -        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> -                                 TYPE_PNV_PHB3_ROOT_PORT);
> -    }
> +    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
>   }
>   
>   void pnv_phb3_update_regions(PnvPHB3 *phb)
> @@ -1131,7 +1104,7 @@ static void pnv_phb3_class_init(ObjectClass *klass, void *data)
>       dc->realize = pnv_phb3_realize;
>       device_class_set_props(dc, pnv_phb3_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable = true;
> +    dc->user_creatable = false;
>   }
>   
>   static const TypeInfo pnv_phb3_type_info = {
> @@ -1201,7 +1174,7 @@ static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
>   
>       device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
>                                       &rpc->parent_realize);
> -    dc->user_creatable = true;
> +    dc->user_creatable = false;
>   
>       k->vendor_id = PCI_VENDOR_ID_IBM;
>       k->device_id = 0x03dc;
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index d1a911f988b7..b30176209303 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1545,70 +1545,14 @@ static void pnv_phb4_instance_init(Object *obj)
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>   }
>   
> -static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
> -                                         Error **errp)
> -{
> -    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -    int chip_id = phb->chip_id;
> -    int index = phb->phb_id;
> -    int i, j;
> -
> -    for (i = 0; i < chip->num_pecs; i++) {
> -        /*
> -         * For each PEC, check the amount of phbs it supports
> -         * and see if the given phb4 index matches an index.
> -         */
> -        PnvPhb4PecState *pec = &chip9->pecs[i];
> -
> -        for (j = 0; j < pec->num_phbs; j++) {
> -            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> -                return pec;
> -            }
> -        }
> -    }
> -
> -    error_setg(errp,
> -               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> -               chip_id, index);
> -
> -    return NULL;
> -}
> -
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(dev);
> -    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> -    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       XiveSource *xsrc = &phb->xsrc;
> -    BusState *s;
> -    Error *local_err = NULL;
>       int nr_irqs;
>       char name[32];
>   
> -    if (!chip) {
> -        error_setg(errp, "invalid chip id: %d", phb->chip_id);
> -        return;
> -    }
> -
> -    /* User created PHBs need to be assigned to a PEC */
> -    if (!phb->pec) {
> -        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
> -    /* Reparent the PHB to the chip to build the device tree */
> -    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
> -
> -    s = qdev_get_parent_bus(DEVICE(chip));
> -    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
>       /* Set the "big_phb" flag */
>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
>   
> @@ -1766,7 +1710,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
>       dc->realize         = pnv_phb4_realize;
>       device_class_set_props(dc, pnv_phb4_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> -    dc->user_creatable  = true;
> +    dc->user_creatable  = false;
>   
>       xfc->notify         = pnv_phb4_xive_notify;
>   }
> @@ -1864,7 +1808,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>   
>       dc->desc     = "IBM PHB4 PCIE Root Port";
> -    dc->user_creatable = true;
> +    dc->user_creatable = false;
>   
>       device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
>                                       &rpc->parent_realize);
> @@ -1894,7 +1838,7 @@ static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data)
>       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>   
>       dc->desc     = "IBM PHB5 PCIE Root Port";
> -    dc->user_creatable = true;
> +    dc->user_creatable = false;
>   
>       k->vendor_id = PCI_VENDOR_ID_IBM;
>       k->device_id = PNV_PHB5_DEVICE_ID;
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index a0dfa77c8432..6f1121a9489a 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -120,6 +120,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>   
> +    object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
>       object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
>                                &error_abort);
>       object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
> @@ -150,10 +151,8 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       pec->num_phbs = pecc->num_phbs[pec->index];
>   
>       /* Create PHBs if running with defaults */
> -    if (defaults_enabled()) {
> -        for (i = 0; i < pec->num_phbs; i++) {
> -            pnv_pec_default_phb_realize(pec, i, errp);
> -        }
> +    for (i = 0; i < pec->num_phbs; i++) {
> +        pnv_pec_default_phb_realize(pec, i, errp);
>       }
>   
>       /* Initialize the XSCOM regions for the PEC registers */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index e7cd8b62ca43..00f57c9678e6 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1141,9 +1141,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
>   
> -    if (defaults_enabled()) {
> -        chip8->num_phbs = pcc->num_phbs;
> -    }
> +    chip8->num_phbs = pcc->num_phbs;
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
>           object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
> @@ -1974,23 +1972,6 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>       return NULL;
>   }
>   
> -void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
> -{
> -    Object *parent = OBJECT(chip);
> -    g_autofree char *default_id =
> -        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
> -
> -    if (obj->parent == parent) {
> -        return;
> -    }
> -
> -    object_ref(obj);
> -    object_unparent(obj);
> -    object_property_add_child(
> -        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
> -    object_unref(obj);
> -}
> -
>   PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>   {
>       int i;
> @@ -2130,8 +2111,6 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> -
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
>   }
>   
>   static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
> @@ -2150,8 +2129,6 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
>       pmc->dt_power_mgt = pnv_dt_power_mgt;
> -
> -    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB4);
>   }
>   
>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)

