Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3760959126C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:44:26 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVth-0004pW-2a
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVpQ-0008Rp-4W; Fri, 12 Aug 2022 10:40:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVpO-0007u3-Eo; Fri, 12 Aug 2022 10:39:59 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CEZqN1001544;
 Fri, 12 Aug 2022 14:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6n8o+YDJS5x8y3FdmlU7JkYCbHWauIFE1f8P+OQocL4=;
 b=rp1vHFFndg96dh0iikXv8wfa+AdnFwci+G3rilPJTmeNfIJbNKnVKG52oqStb4Mtfviz
 JJWUEGTb7ersrSGq09SxK1BCpSey8d8IhB/AhNWwxVfZ6QfDD+QLXT/8brX/a9Vf1Evt
 TwYHNJPFPhxJNURkMsO5l3142N+p3LuqpxcbLp37EzqiKu+ykdvv60LlvVpkE87OJg03
 I8qVgatNerThQQVK3uS7PFUAtMCSY1p+YPdwqWwj91CCxZWJmswWNnZ277hzCYY6eaze
 5Sn2NhX0RCNrQPlraNaMeZVD9UzKb6jzOxKZEssfJaOD8yZZtHJq5RIIoeqB6q1zufhL Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrry0bmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:39:55 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CEaMYC005309;
 Fri, 12 Aug 2022 14:39:53 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrry0bj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:39:53 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CEaUD5024330;
 Fri, 12 Aug 2022 14:39:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3huwvjjgun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:39:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CEdm8t25428326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 14:39:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 941034C046;
 Fri, 12 Aug 2022 14:39:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 336CA4C064;
 Fri, 12 Aug 2022 14:39:48 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 14:39:48 +0000 (GMT)
Message-ID: <4eef0123-3a83-4e64-4e58-c4edabeecf2d@linux.ibm.com>
Date: Fri, 12 Aug 2022 16:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 02/11] ppc/pnv: add phb-id/chip-id
 PnvPHB4RootBus properties
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-3-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B2zMWpjMXdnu1JXwmJYRpdy_8jvmJg31
X-Proofpoint-ORIG-GUID: dkx-FqZRQkBoAa2eBVJNGfC6X_sjZFJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_09,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxscore=0
 mlxlogscore=973 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208120040
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



On 11/08/2022 18:39, Daniel Henrique Barboza wrote:
> The same rationale provided in the PHB3 bus case applies here.
> 
> Note: we could have merged both buses in a single object, like we did
> with the root ports, and spare some boilerplate. The reason we opted to
> preserve both buses objects is twofold:
> 
> - there's not user side advantage in doing so. Unifying the root ports
> presents a clear user QOL change when we enable user created devices back.
> The buses objects, aside from having a different QOM name, is transparent
> to the user;
> 
> - we leave a door opened in case we want to increase the root port limit
> for phb4/5 later on without having to deal with phb3 code.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb4.c         | 51 ++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/pnv_phb4.h | 10 +++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index b98c394713..824e1a73fb 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1551,6 +1551,12 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
>                                        pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
> +
> +    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
> +                            &error_abort);
> +
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   }
> @@ -1708,10 +1714,55 @@ static const TypeInfo pnv_phb5_type_info = {
>       .instance_size = sizeof(PnvPHB4),
>   };
>   
> +static void pnv_phb4_root_bus_get_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +{
> +    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
> +    uint64_t value = 0;
> +
> +    if (strcmp(name, "phb-id") == 0) {
> +        value = bus->phb_id;
> +    } else {
> +        value = bus->chip_id;
> +    }
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void pnv_phb4_root_bus_set_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +
> +{
> +    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
> +    uint64_t value;
> +
> +    if (!visit_type_size(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (strcmp(name, "phb-id") == 0) {
> +        bus->phb_id = value;
> +    } else {
> +        bus->chip_id = value;
> +    }
> +}
> +
>   static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
>   {
>       BusClass *k = BUS_CLASS(klass);
>   
> +    object_class_property_add(klass, "phb-id", "int",
> +                              pnv_phb4_root_bus_get_prop,
> +                              pnv_phb4_root_bus_set_prop,
> +                              NULL, NULL);
> +
> +    object_class_property_add(klass, "chip-id", "int",
> +                              pnv_phb4_root_bus_get_prop,
> +                              pnv_phb4_root_bus_set_prop,
> +                              NULL, NULL);
> +
>       /*
>        * PHB4 has only a single root complex. Enforce the limit on the
>        * parent bus
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 20aa4819d3..50d4faa001 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -45,7 +45,17 @@ typedef struct PnvPhb4DMASpace {
>       QLIST_ENTRY(PnvPhb4DMASpace) list;
>   } PnvPhb4DMASpace;
>   
> +/*
> + * PHB4 PCIe Root Bus
> + */
>   #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
> +struct PnvPHB4RootBus {
> +    PCIBus parent;
> +
> +    uint32_t chip_id;
> +    uint32_t phb_id;
> +};
> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4RootBus, PNV_PHB4_ROOT_BUS)
>   
>   /*
>    * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)

