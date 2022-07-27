Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2371583156
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:58:52 +0200 (CEST)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlJ5-0002Cm-Kf
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl4L-0005Wa-QI; Wed, 27 Jul 2022 13:43:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl4J-0000vZ-63; Wed, 27 Jul 2022 13:43:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHf4Qg015047;
 Wed, 27 Jul 2022 17:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Nlgqyn24LgpD/Q09jKt65xprY8vBRzS48UUBcwqxQSc=;
 b=nUGg0h8RvDk3aR4gKXbtDQ9Cb6wRWAz9Og3VOFMp3DqeBmb3qIuIUCk9xvP1h2aUS4rV
 KUgGOxUWESnF5ZNAGzpxuGZsNsj/RfFI5wqV6ST+D9bU7h8x9NjCO1G/HKs8+iOjdSzS
 mmZG7+Yz0KLbAYp2Zv+PPpiZHgTTJIEsuipgxb+qh0GDmu5X7HQWRaTXKxYF4vvMCnKK
 B1mQzvv4AiuKpnU7Fm1613LXXBXhHYxf2/hGrr6GY/qXB/6xJepWhlXmkAIm8bZy8afs
 HCYeuvgs0VCuCtGAfDbhaicf2d5dl2qCY5/BzD0jUfZu21bf/z9WQ3mkpEaqjVifNfrZ qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9j21306-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:23 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHhGEv028932;
 Wed, 27 Jul 2022 17:43:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9j212yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHavvp020283;
 Wed, 27 Jul 2022 17:43:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wnc09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHhIiu21037370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:43:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E339811C04C;
 Wed, 27 Jul 2022 17:43:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A137F11C04A;
 Wed, 27 Jul 2022 17:43:18 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:43:18 +0000 (GMT)
Message-ID: <5a60ae8d-caf2-515a-b695-2af8ba886d74@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/12] ppc/pnv: remove pnv-phb4-root-port
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-9-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-9-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TPZVHw4wY_YawgNwAuWTdYE-vCL42byz
X-Proofpoint-GUID: no-SCbKOUHgAe5RwKaFLzEa2m5takfLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> The unified pnv-phb-root-port can be used instead. The phb4-root-port
> device isn't exposed to the user in any official QEMU release so there's
> no ABI breakage in removing it.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c          |  4 +-
>   hw/pci-host/pnv_phb4.c         | 85 ----------------------------------
>   hw/pci-host/pnv_phb4_pec.c     |  4 +-
>   hw/ppc/pnv.c                   |  2 +
>   include/hw/pci-host/pnv_phb4.h |  9 ----
>   5 files changed, 6 insertions(+), 98 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index cdddc6a389..da729e89e7 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -38,11 +38,11 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           break;
>       case 4:
>           phb_typename = g_strdup(TYPE_PNV_PHB4);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       case 5:
>           phb_typename = g_strdup(TYPE_PNV_PHB5);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       default:
>           g_assert_not_reached();
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 74cf62dc1a..fefdd3ad89 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1741,94 +1741,9 @@ static const TypeInfo pnv_phb4_root_bus_info = {
>       .class_init = pnv_phb4_root_bus_class_init,
>   };
>   
> -static void pnv_phb4_root_port_reset(DeviceState *dev)
> -{
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> -    PCIDevice *d = PCI_DEVICE(dev);
> -    uint8_t *conf = d->config;
> -
> -    rpc->parent_reset(dev);
> -
> -    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
> -                               PCI_IO_RANGE_MASK & 0xff);
> -    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
> -                                 PCI_IO_RANGE_MASK & 0xff);
> -    pci_set_word(conf + PCI_MEMORY_BASE, 0);
> -    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
> -    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
> -    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
> -    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
> -    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
> -    pci_config_set_interrupt_pin(conf, 0);
> -}
> -
> -static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
> -{
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> -    Error *local_err = NULL;
> -
> -    rpc->parent_realize(dev, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -}
> -
> -static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
> -
> -    dc->desc     = "IBM PHB4 PCIE Root Port";
> -    dc->user_creatable = false;
> -
> -    device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
> -                                    &rpc->parent_realize);
> -    device_class_set_parent_reset(dc, pnv_phb4_root_port_reset,
> -                                  &rpc->parent_reset);
> -
> -    k->vendor_id = PCI_VENDOR_ID_IBM;
> -    k->device_id = PNV_PHB4_DEVICE_ID;
> -    k->revision  = 0;
> -
> -    rpc->exp_offset = 0x48;
> -    rpc->aer_offset = 0x100;
> -
> -    dc->reset = &pnv_phb4_root_port_reset;
> -}
> -
> -static const TypeInfo pnv_phb4_root_port_info = {
> -    .name          = TYPE_PNV_PHB4_ROOT_PORT,
> -    .parent        = TYPE_PCIE_ROOT_PORT,
> -    .instance_size = sizeof(PnvPHB4RootPort),
> -    .class_init    = pnv_phb4_root_port_class_init,
> -};
> -
> -static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -
> -    dc->desc     = "IBM PHB5 PCIE Root Port";
> -    dc->user_creatable = false;
> -
> -    k->vendor_id = PCI_VENDOR_ID_IBM;
> -    k->device_id = PNV_PHB5_DEVICE_ID;
> -}
> -
> -static const TypeInfo pnv_phb5_root_port_info = {
> -    .name          = TYPE_PNV_PHB5_ROOT_PORT,
> -    .parent        = TYPE_PNV_PHB4_ROOT_PORT,
> -    .instance_size = sizeof(PnvPHB4RootPort),
> -    .class_init    = pnv_phb5_root_port_class_init,
> -};
> -
>   static void pnv_phb4_register_types(void)
>   {
>       type_register_static(&pnv_phb4_root_bus_info);
> -    type_register_static(&pnv_phb5_root_port_info);
> -    type_register_static(&pnv_phb4_root_port_info);
>       type_register_static(&pnv_phb4_type_info);
>       type_register_static(&pnv_phb5_type_info);
>       type_register_static(&pnv_phb4_iommu_memory_region_info);
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 4a0a9fbe8b..0ef66b9a9b 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -260,7 +260,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->version = PNV_PHB4_VERSION;
>       pecc->phb_type = TYPE_PNV_PHB4;
>       pecc->num_phbs = pnv_pec_num_phbs;
> -    pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
> +    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
> @@ -313,7 +313,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
>       pecc->version = PNV_PHB5_VERSION;
>       pecc->phb_type = TYPE_PNV_PHB5;
>       pecc->num_phbs = pnv_phb5_pec_num_stacks;
> -    pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
> +    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
>   }
>   
>   static const TypeInfo pnv_phb5_pec_type_info = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d82c66ca6f..159899103e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2132,6 +2132,7 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>   
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "4" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "4" },
>       };
>   
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
> @@ -2156,6 +2157,7 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
>   
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "5" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "5" },
>       };
>   
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index f22253358f..29c49ac79c 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -45,16 +45,7 @@ typedef struct PnvPhb4DMASpace {
>       QLIST_ENTRY(PnvPhb4DMASpace) list;
>   } PnvPhb4DMASpace;
>   
> -/*
> - * PHB4 PCIe Root port
> - */
>   #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
> -#define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
> -#define TYPE_PNV_PHB5_ROOT_PORT "pnv-phb5-root-port"
> -
> -typedef struct PnvPHB4RootPort {
> -    PCIESlot parent_obj;
> -} PnvPHB4RootPort;
>   
>   /*
>    * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)

