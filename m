Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DD583125
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:47:12 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGl7n-0007os-IN
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGktU-0004r7-NL; Wed, 27 Jul 2022 13:32:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17186
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGktR-0007rs-9V; Wed, 27 Jul 2022 13:32:23 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RGDpM6018798;
 Wed, 27 Jul 2022 17:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tBrvD/y94UD9bX6LkxibXGjcqRd1mhkZri/g0mgpajY=;
 b=EEba43EvT4kjAtASWHMuWUusxdtsBCCmMKTzMykxeeAV2nk2LVJOJcA8gcekWVDnwr8s
 ZAzrWxTJnLBxVZpzraz3wJLms/DX4ZDJOw+Qv/PU/lfoyTYWyhaAzVDxNdQnrhf8wxqQ
 H2u4AGlYi30+iW4R90flE+dSk/97P8Lb7n9XY09LyE6kb2zKIjpfJAPN8Ezqt/Tuu4J/
 RHHWWMFk/iWuR2YDkMCsuOs3d6OGgumP62wikmiNzkwT62ehFNuPVs9nXeOjf22oLKN5
 4MYfnu301Cd8Mlw20NDVxRkSqAwOafSMDFfZSLp6oRmzqf3X+zSR+CHYIynYC2CiGLBm Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk8pv2ckn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:32:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RGR5Z6024735;
 Wed, 27 Jul 2022 17:32:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk8pv2ck3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:32:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHLCpk021971;
 Wed, 27 Jul 2022 17:32:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6eum1h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:32:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHW6DH22348098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:32:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E12A711C04A;
 Wed, 27 Jul 2022 17:32:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A93A911C04C;
 Wed, 27 Jul 2022 17:32:06 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:32:06 +0000 (GMT)
Message-ID: <2d0b9a63-825d-8562-bf90-977b99d42883@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 04/12] ppc/pnv: add PHB4 bus init helper
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-5-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ynTWVSjuUHZx8PryVEzxtAYthPnmREaK
X-Proofpoint-ORIG-GUID: pz6TO1hV01nHNJ7mKE2Wynb-Yl6UfCaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207270071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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
> Similar to what we already did for the PnvPHB3 device, let's add a
> helper to init the bus when using a PnvPHB4. This helper will be used by
> PnvPHb when PnvPHB4 turns into a backend.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c          |  2 ++
>   hw/pci-host/pnv_phb4.c         | 39 ++++++++++++++++++++--------------
>   include/hw/pci-host/pnv_phb4.h |  1 +
>   3 files changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 6fefff7d44..abcbcca445 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -69,6 +69,8 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>   
>       if (phb->version == 3) {
>           pnv_phb3_bus_init(dev, PNV_PHB3(phb->backend));
> +    } else {
> +        pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
>       pnv_phb_attach_root_port(pci, phb_rootport_typename,
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index d225ab5b0f..a7a4519f30 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1544,30 +1544,16 @@ static void pnv_phb4_instance_init(Object *obj)
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
>   }
>   
> -static void pnv_phb4_realize(DeviceState *dev, Error **errp)
> +void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
>   {
> -    PnvPHB4 *phb = PNV_PHB4(dev);
> -    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> -    XiveSource *xsrc = &phb->xsrc;
> -    int nr_irqs;
>       char name[32];
>   
> -    /* Set the "big_phb" flag */
> -    phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
> -
> -    /* Controller Registers */
> -    snprintf(name, sizeof(name), "phb4-%d.%d-regs", phb->chip_id,
> -             phb->phb_id);
> -    memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
> -                          name, 0x2000);
> -
>       /*
>        * PHB4 doesn't support IO space. However, qemu gets very upset if
>        * we don't have an IO region to anchor IO BARs onto so we just
>        * initialize one which we never hook up to anything
>        */
> -
>       snprintf(name, sizeof(name), "phb4-%d.%d-pci-io", phb->chip_id,
>                phb->phb_id);
>       memory_region_init(&phb->pci_io, OBJECT(phb), name, 0x10000);
> @@ -1577,12 +1563,33 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       memory_region_init(&phb->pci_mmio, OBJECT(phb), name,
>                          PCI_MMIO_TOTAL_SIZE);
>   
> -    pci->bus = pci_register_root_bus(dev, dev->id,
> +    pci->bus = pci_register_root_bus(dev, dev->id ? dev->id : NULL,
>                                        pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
> +}
> +
> +static void pnv_phb4_realize(DeviceState *dev, Error **errp)
> +{
> +    PnvPHB4 *phb = PNV_PHB4(dev);
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> +    XiveSource *xsrc = &phb->xsrc;
> +    int nr_irqs;
> +    char name[32];
> +
> +    /* Set the "big_phb" flag */
> +    phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
> +
> +    /* Controller Registers */
> +    snprintf(name, sizeof(name), "phb4-%d.%d-regs", phb->chip_id,
> +             phb->phb_id);
> +    memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
> +                          name, 0x2000);
> +
> +    pnv_phb4_bus_init(dev, phb);
>   
>       /* Add a single Root port if running with defaults */
>       pnv_phb_attach_root_port(pci, pecc->rp_model,
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 19dcbd6f87..90843ac3a9 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -157,6 +157,7 @@ struct PnvPHB4 {
>   
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
>   int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
> +void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
>   
>   /*

