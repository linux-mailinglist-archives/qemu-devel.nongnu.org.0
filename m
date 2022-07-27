Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9E583179
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:08:25 +0200 (CEST)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlSJ-0000Vn-IO
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl3J-0004oE-J0; Wed, 27 Jul 2022 13:42:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl3H-0000nW-Iv; Wed, 27 Jul 2022 13:42:33 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHfrNl022764;
 Wed, 27 Jul 2022 17:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qvphdyfr4vMcbAVcRKqDtoLIgtSSBABRrLswL6U59iI=;
 b=OatzYpcqnyTCXNe4yrADIIBZxDrjS6zqIqdbRcDXbgNk3xktFjV6DN0JDeViOTrp+hdu
 YKVNh2YyQRB6acNz7SUB1RnrHw8NcZhwPHILretrnlowbZ2kSAU3R7CxDkXoRNN42ain
 sNK5PsFxGBtB0X8OjHzyUg1/0rQryWLefjDUkK885Gx3NSZ5+YmOsHYDm3iaLodvFSYK
 8d9x9xDlX0nWv2z1Vqv/2+quy40K1opQehheex2tos0Q5um45qmAUbSjikNbA8OIapH0
 mvO3eTbkZj6vJWggYs2nYxDwXnC3bDfx2lhQCjZ2YLVWARE/Wt+Tmlq2OSsJmYnsC6rC TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka02r0a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:42:26 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHgQZI027610;
 Wed, 27 Jul 2022 17:42:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka02r09q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:42:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHawjT006156;
 Wed, 27 Jul 2022 17:42:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3hg98fhusp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:42:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHgLrd20775308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:42:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D54411C04C;
 Wed, 27 Jul 2022 17:42:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 539AB11C04A;
 Wed, 27 Jul 2022 17:42:21 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:42:21 +0000 (GMT)
Message-ID: <8e3846c3-9592-1e3c-9709-1290b807b715@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 06/12] ppc/pnv: add pnv-phb-root-port device
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-7-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-7-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I0wMmsvdvQv7LTzjbGjR9CsAL4KDtlm0
X-Proofpoint-ORIG-GUID: DGcWPdyRnVYY1ziSZF5rPaQfIazTiz-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207270074
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
> We have two very similar root-port devices, pnv-phb3-root-port and
> pnv-phb4-root-port. Both consist of a wrapper around the PCIESlot device
> that, until now, has no additional attributes.
> 
> The main difference between the PHB3 and PHB4 root ports is that
> pnv-phb4-root-port has the pnv_phb4_root_port_reset() callback. All
> other differences can be merged in a single device without too much
> trouble.
> 
> This patch introduces the unified pnv-phb-root-port that, in time, will
> be used as the default root port for the pnv-phb device.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c | 115 +++++++++++++++++++++++++++++++++++++++---
>   hw/pci-host/pnv_phb.h |  16 ++++++
>   2 files changed, 123 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index abcbcca445..5e61f85614 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -112,15 +112,114 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
>       dc->user_creatable = false;
>   }
>   
> -static void pnv_phb_register_type(void)
> +static void pnv_phb_root_port_reset(DeviceState *dev)
>   {
> -    static const TypeInfo pnv_phb_type_info = {
> -        .name          = TYPE_PNV_PHB,
> -        .parent        = TYPE_PCIE_HOST_BRIDGE,
> -        .instance_size = sizeof(PnvPHB),
> -        .class_init    = pnv_phb_class_init,
> -    };
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
> +    PCIDevice *d = PCI_DEVICE(dev);
> +    uint8_t *conf = d->config;
>   
> +    rpc->parent_reset(dev);
> +
> +    if (phb_rp->version == 3) {
> +        return;
> +    }
> +
> +    /* PHB4 and later requires these extra reset steps */
> +    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
> +                               PCI_IO_RANGE_MASK & 0xff);
> +    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
> +                                 PCI_IO_RANGE_MASK & 0xff);
> +    pci_set_word(conf + PCI_MEMORY_BASE, 0);
> +    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
> +    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
> +    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
> +    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
> +    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
> +    pci_config_set_interrupt_pin(conf, 0);
> +}
> +
> +static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
> +{
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
> +    PCIDevice *pci = PCI_DEVICE(dev);
> +    uint16_t device_id = 0;
> +    Error *local_err = NULL;
> +
> +    rpc->parent_realize(dev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    switch (phb_rp->version) {
> +    case 3:
> +        device_id = PNV_PHB3_DEVICE_ID;
> +        break;
> +    case 4:
> +        device_id = PNV_PHB4_DEVICE_ID;
> +        break;
> +    case 5:
> +        device_id = PNV_PHB5_DEVICE_ID;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    pci_config_set_device_id(pci->config, device_id);
> +    pci_config_set_interrupt_pin(pci->config, 0);
> +}
> +
> +static Property pnv_phb_root_port_properties[] = {
> +    DEFINE_PROP_UINT32("version", PnvPHBRootPort, version, 0),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
> +
> +    dc->desc     = "IBM PHB PCIE Root Port";
> +
> +    device_class_set_props(dc, pnv_phb_root_port_properties);
> +    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
> +                                    &rpc->parent_realize);
> +    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
> +                                  &rpc->parent_reset);
> +    dc->reset = &pnv_phb_root_port_reset;
> +    dc->user_creatable = false;
> +
> +    k->vendor_id = PCI_VENDOR_ID_IBM;
> +    /* device_id will be written during realize() */
> +    k->device_id = 0;
> +    k->revision  = 0;
> +
> +    rpc->exp_offset = 0x48;
> +    rpc->aer_offset = 0x100;
> +}
> +
> +static const TypeInfo pnv_phb_type_info = {
> +    .name          = TYPE_PNV_PHB,
> +    .parent        = TYPE_PCIE_HOST_BRIDGE,
> +    .instance_size = sizeof(PnvPHB),
> +    .class_init    = pnv_phb_class_init,
> +};
> +
> +static const TypeInfo pnv_phb_root_port_info = {
> +    .name          = TYPE_PNV_PHB_ROOT_PORT,
> +    .parent        = TYPE_PCIE_ROOT_PORT,
> +    .instance_size = sizeof(PnvPHBRootPort),
> +    .class_init    = pnv_phb_root_port_class_init,
> +};
> +
> +static void pnv_phb_register_types(void)
> +{
>       type_register_static(&pnv_phb_type_info);
> +    type_register_static(&pnv_phb_root_port_info);
>   }
> -type_init(pnv_phb_register_type)
> +
> +type_init(pnv_phb_register_types)
> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
> index a7cc8610e2..58ebd6dd0f 100644
> --- a/hw/pci-host/pnv_phb.h
> +++ b/hw/pci-host/pnv_phb.h
> @@ -36,4 +36,20 @@ struct PnvPHB {
>   #define TYPE_PNV_PHB "pnv-phb"
>   OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
>   
> +/*
> + * PHB PCIe Root port
> + */
> +#define PNV_PHB3_DEVICE_ID         0x03dc
> +#define PNV_PHB4_DEVICE_ID         0x04c1
> +#define PNV_PHB5_DEVICE_ID         0x0652
> +
> +typedef struct PnvPHBRootPort {
> +    PCIESlot parent_obj;
> +
> +    uint32_t version;
> +} PnvPHBRootPort;
> +
> +#define TYPE_PNV_PHB_ROOT_PORT "pnv-phb-root-port"
> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHBRootPort, PNV_PHB_ROOT_PORT)
> +
>   #endif /* PCI_HOST_PNV_PHB_H */

