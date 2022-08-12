Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C960359127C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:48:41 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVxo-0000r7-JS
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVpI-0008Cr-MO; Fri, 12 Aug 2022 10:39:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMVpF-0007si-FW; Fri, 12 Aug 2022 10:39:52 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CEZrOb001840;
 Fri, 12 Aug 2022 14:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eP5tOVKsaoEFYT9vjP4qD1RmphOujLZfoRESozct3wk=;
 b=G7oN7AXB73djDHJ3jwFOWqR+g+o71q8AWikDjwhXSKc8MhqWdb29H8pEYaaTL7lwMJzk
 k5WsZPgLZeEkGWJq4pzP6vxBwDb0rwReVRLNScnuEyL09ld0ZMTTC3af6sZO2WikTGUJ
 yB5c9x+E/ACT/aAWP5WM+3xXZcS2aDccY3/tqAQur2zjioCJMr7eIJw2nsTY725v2WIw
 HU3cEv+ml80dVpCx49zc3ejtNcCx3Oy+IlrNhVDz/WHoNS3/BgT0eqB8dIkQmPohknsZ
 mevFfDQ9srmUqPS57vSNvlWnS6yHrAP5ImdKAIVkPvaKMuKo2VRQf9JhTSbbTaiIOVgY vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrry0b49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:39:39 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CEaQOh005579;
 Fri, 12 Aug 2022 14:39:39 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwrry0ayx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:39:39 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CEaxGQ017281;
 Fri, 12 Aug 2022 14:39:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3huww0tq57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:39:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CEdWfJ36045066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 14:39:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A6414C04A;
 Fri, 12 Aug 2022 14:39:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C01DE4C040;
 Fri, 12 Aug 2022 14:39:31 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 14:39:31 +0000 (GMT)
Message-ID: <c73ae54a-30b9-5eda-059f-71dc76c48eff@linux.ibm.com>
Date: Fri, 12 Aug 2022 16:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 01/11] ppc/pnv: add phb-id/chip-id
 PnvPHB3RootBus properties
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-2-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YKb0WzPge7guuQZnu4vW6jfoz7_p9zZE
X-Proofpoint-ORIG-GUID: 4MO-IT2QBwE7yJJ-OtRw4wYTRJjle1vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_09,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
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
> We rely on the phb-id and chip-id, which are PHB properties, to assign
> chassis and slot to the root port. For default devices this is no big
> deal: the root port is being created under pnv_phb_realize() and the
> values are being passed on via the 'index' and 'chip-id' of the
> pnv_phb_attach_root_port() helper.
> 
> If we want to implement user created root ports we have a problem. The
> user created root port will not be aware of which PHB it belongs to,
> unless we're willing to violate QOM best practices and access the PHB
> via dev->parent_bus->parent. What we can do is to access the root bus
> parent bus.
> 
> Since we're already assigning the root port as QOM child of the bus, and
> the bus is initiated using PHB properties, let's add phb-id and chip-id
> as properties of the bus. This will allow us trivial access to them, for
> both user-created and default root ports, without doing anything too
> shady with QOM.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb3.c         | 50 ++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/pnv_phb3.h |  9 +++++-
>   2 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index d4c04a281a..af8575c007 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1006,6 +1006,11 @@ void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB3_ROOT_BUS);
>   
> +    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
> +                            &error_abort);
> +
>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>   }
>   
> @@ -1105,10 +1110,55 @@ static const TypeInfo pnv_phb3_type_info = {
>       .instance_init = pnv_phb3_instance_init,
>   };
>   
> +static void pnv_phb3_root_bus_get_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +{
> +    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
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
> +static void pnv_phb3_root_bus_set_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +
> +{
> +    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
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
>   static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
>   {
>       BusClass *k = BUS_CLASS(klass);
>   
> +    object_class_property_add(klass, "phb-id", "int",
> +                              pnv_phb3_root_bus_get_prop,
> +                              pnv_phb3_root_bus_set_prop,
> +                              NULL, NULL);
> +
> +    object_class_property_add(klass, "chip-id", "int",
> +                              pnv_phb3_root_bus_get_prop,
> +                              pnv_phb3_root_bus_set_prop,
> +                              NULL, NULL);
> +
>       /*
>        * PHB3 has only a single root complex. Enforce the limit on the
>        * parent bus
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index bff69201d9..4854f6d2f6 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -104,9 +104,16 @@ struct PnvPBCQState {
>   };
>   
>   /*
> - * PHB3 PCIe Root port
> + * PHB3 PCIe Root Bus
>    */
>   #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
> +struct PnvPHB3RootBus {
> +    PCIBus parent;
> +
> +    uint32_t chip_id;
> +    uint32_t phb_id;
> +};
> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3RootBus, PNV_PHB3_ROOT_BUS)
>   
>   /*
>    * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)

