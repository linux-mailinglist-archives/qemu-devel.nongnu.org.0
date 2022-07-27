Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6178B5830EC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:44:21 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGl52-0005oZ-1j
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkqi-0002WW-Rh; Wed, 27 Jul 2022 13:29:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkqd-0007OE-Iy; Wed, 27 Jul 2022 13:29:31 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHJ0h1003718;
 Wed, 27 Jul 2022 17:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3K/ZbvZ0XI0mXBWYyQHlIVr2SHx40BkvYD2lCcmGcvo=;
 b=aqqMyz9baorwncgPfWNgISgvpDYQduyTPqXHxjExOXN0p3H9SjhK1bYTFUwmgHwNetb1
 HqOxROvanQE0JF82o80Q+2S9IoZXbWdZiO5f08DXX4vksr4qSmf6jqxaFi3JnxEcmYAX
 o80GInVvkphyjpDy2B7yHHhYobn6unO9yoKd8GrQIOKtBJpuZcXjdIs7ljmOcEOYiZFv
 4Ux0t6+AIo4XBKDoxEn2w3wPoISlMuDcM8IK2TMmJso2BaDOrUHVhjGSI2nloe3oLo5Z
 03ZAeAqBmsxfRZM1CzNnvMQmDZzJUznVNPSVPgm2hoxBAjaNe1MB80aNhAP5pB81m/EW 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9ngga8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHLivC017883;
 Wed, 27 Jul 2022 17:29:23 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9ngga7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHLSLX011938;
 Wed, 27 Jul 2022 17:29:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3hg98ndcmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHTJ6n19661218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:29:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03B6911C04C;
 Wed, 27 Jul 2022 17:29:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF3DB11C04A;
 Wed, 27 Jul 2022 17:29:18 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:29:18 +0000 (GMT)
Message-ID: <6f77c0cf-eeac-21e1-7f35-268e2e6a1cca@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/12] ppc/pnv: add PHB3 bus init helper
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-2-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7iK0G4dekNTfMxAke6_qByQwQ1xLbtPx
X-Proofpoint-GUID: oKt12j7DbIXdEI0YUGxK5FBzZARA9tHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
> The PnvPHB3 bus init consists of initializing the pci_io and pci_mmio
> regions, registering it via pci_register_root_bus() and then setup the
> iommu.
> 
> We'll want to init the bus from outside pnv_phb3.c when the bus is
> removed from the PnvPHB3 device and put into a new parent PnvPHB device.
> The new pnv_phb3_bus_init() helper will be used by the parent to init
> the bus when using the PHB3 backend.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred

>   hw/pci-host/pnv_phb3.c         | 39 ++++++++++++++++++++--------------
>   include/hw/pci-host/pnv_phb3.h |  1 +
>   2 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index d58d3c1701..058cbab555 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -986,6 +986,28 @@ static void pnv_phb3_instance_init(Object *obj)
>   
>   }
>   
> +void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
> +{
> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> +
> +    /*
> +     * PHB3 doesn't support IO space. However, qemu gets very upset if
> +     * we don't have an IO region to anchor IO BARs onto so we just
> +     * initialize one which we never hook up to anything
> +     */
> +    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
> +    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
> +                       PCI_MMIO_TOTAL_SIZE);
> +
> +    pci->bus = pci_register_root_bus(dev,
> +                                     dev->id ? dev->id : NULL,
> +                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
> +                                     &phb->pci_mmio, &phb->pci_io,
> +                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
> +
> +    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
> +}
> +
>   static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB3 *phb = PNV_PHB3(dev);
> @@ -1035,22 +1057,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
>                             "phb3-regs", 0x1000);
>   
> -    /*
> -     * PHB3 doesn't support IO space. However, qemu gets very upset if
> -     * we don't have an IO region to anchor IO BARs onto so we just
> -     * initialize one which we never hook up to anything
> -     */
> -    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
> -    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
> -                       PCI_MMIO_TOTAL_SIZE);
> -
> -    pci->bus = pci_register_root_bus(dev,
> -                                     dev->id ? dev->id : NULL,
> -                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
> -                                     &phb->pci_mmio, &phb->pci_io,
> -                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
> -
> -    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
> +    pnv_phb3_bus_init(dev, phb);
>   
>       pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
>                                phb->phb_id, phb->chip_id);
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index af6ec83cf6..1375f18fc1 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -164,5 +164,6 @@ uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
>   void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size);
>   void pnv_phb3_update_regions(PnvPHB3 *phb);
>   void pnv_phb3_remap_irqs(PnvPHB3 *phb);
> +void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb);
>   
>   #endif /* PCI_HOST_PNV_PHB3_H */

