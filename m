Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BD55454B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:31:21 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xdo-0008Pv-CJ
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3xFp-0005D6-Vu; Wed, 22 Jun 2022 06:06:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3xFn-0006eg-Rn; Wed, 22 Jun 2022 06:06:33 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M9gc3j018546;
 Wed, 22 Jun 2022 10:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=s1hj8pk2HZqnbqe7+TGNgUShF3y7rAXqXKbcw811xKQ=;
 b=d/abreYytc2NSg7PVcn9CFlmc2O+/eZ3Hsahio2PZvkgjLp4e0GKtoTiscUKK80r3ZYW
 rwO1oGx9vK+fxGDPYgouoQUAe5ztAh9apKDJiHiBptftP88t49UvkSWvL6yaDXjKfYE6
 Yqd6ubcapFOzlfq/3z8M34VllL5VfbcCOp4Nd1dt1diDqstFqWus7cOF0zXh/HNOSQeI
 q9oU/Oqcu3cTCv93TkyhoZKAkdi+StAzZJBBpUWA6DeygTNOcpOGMva+ON9g7+Kbqnye
 mWGzddHrJMiFL/eLHtpNChPTjm7zC1QvwEe9utuUGCd5ni/3RZYmSLnYBBRL2+gueSEx fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv0pa0tjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 10:06:20 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25M9iqba025350;
 Wed, 22 Jun 2022 10:06:20 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv0pa0tgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 10:06:20 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25MA6A3h030399;
 Wed, 22 Jun 2022 10:06:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3gs6b95ea2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 10:06:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25MA6F9B19399108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 10:06:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E1DFA4040;
 Wed, 22 Jun 2022 10:06:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14EDCA404D;
 Wed, 22 Jun 2022 10:06:15 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jun 2022 10:06:14 +0000 (GMT)
Message-ID: <2ca914f6-2b86-89b6-d596-d03536dd12e8@linux.ibm.com>
Date: Wed, 22 Jun 2022 12:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/8] ppc/pnv: assign pnv-phb-root-port chassis/slot
 earlier
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220621173436.165912-1-danielhb413@gmail.com>
 <20220621173436.165912-4-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220621173436.165912-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rDtu4w8ilOkE82GH2IS3PvM2PveHXc1y
X-Proofpoint-GUID: -KScAyZXQ7TPca9bS2ucvcjPGZhmVnIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-22_02,2022-06-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220046
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



On 21/06/2022 19:34, Daniel Henrique Barboza wrote:
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
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


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

