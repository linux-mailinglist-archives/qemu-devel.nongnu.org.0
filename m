Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440358313A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:51:44 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlCB-0003Zt-6D
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkr5-0003AQ-VE; Wed, 27 Jul 2022 13:29:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGkr3-0007Qw-Ni; Wed, 27 Jul 2022 13:29:55 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHIZW4002691;
 Wed, 27 Jul 2022 17:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=651G6lv4f+5DJMQMtzR1+DGk4EoIkCXa1UVgYdVUV7U=;
 b=L18fMqszPEgEQHrSuA7ohoi9SJO2kv77pPZNma3ImN19ZZXm5Pq1J/+rB3gnQxn5X+PE
 BoWOODg46Ty8QB+0Ck4FWpIcVcd1pGUErVnb+adGyE8rR4XUn+yfho2KmT6qiHdKcmcR
 4UXYfTJGFHV9veEI3Pn6nrG0p1vfSxkV9MDBqcq1Kxv9AOylwgj3sqfHSVOZrgLPfNQf
 4K75dYzCo/RzOcw4CfZoK3fdXU8OupfCGuSSn2py+YHx66gR9ScGL49TW+EE04ilaZgM
 upEt4Eu79thlgOb67b739DL4C41Nc3sznK2y5eemShN6Q3Po5dM32JD7N4Nh68e5bfVL +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9na8cde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHJ71Y005735;
 Wed, 27 Jul 2022 17:29:49 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9na8ccj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:49 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHKFtT003754;
 Wed, 27 Jul 2022 17:29:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3hg95yc1qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:29:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHTiJF25297240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:29:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C03011C04C;
 Wed, 27 Jul 2022 17:29:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3994911C04A;
 Wed, 27 Jul 2022 17:29:44 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:29:44 +0000 (GMT)
Message-ID: <4bae728d-3653-cff8-3dbb-1dbaa94bc4ff@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/12] ppc/pnv: add PnvPHB base/proxy device
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-3-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q-xBXXBi2ay0ZBStrzrZme3pf-Ef6i5Z
X-Proofpoint-ORIG-GUID: YPFYWdLyfcCRdakzrZNAzgjHSNTkKA4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270071
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
> The PnvPHB device is going to be the base device for all other powernv
> PHBs. It consists of a device that has the same user API as the other
> PHB, namely being a PCIHostBridge and having chip-id and index
> properties. It also has a 'backend' pointer that will be initialized
> with the PHB implementation that the device is going to use.
> 
> The initialization of the PHB backend is done by checking the PHB
> version via a 'version' attribute that can be set via a global machine
> property.  The 'version' field will be used to make adjustments based on
> the running version, e.g. PHB3 uses a 'chip' reference while PHB4 uses
> 'pec'. To init the PnvPHB bus we'll rely on helpers for each version.
> The version 3 helper is already added (pnv_phb3_bus_init), the PHB4
> helper will be added later on.
> 
> For now let's add the basic logic of the PnvPHB object, which consists
> mostly of pnv_phb_realize() doing all the work of checking the
> phb->version set, initializing the proper backend, passing through its
> attributes to the chosen backend, finalizing the backend realize and
> adding a root port in the end.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/meson.build |   3 +-
>   hw/pci-host/pnv_phb.c   | 124 ++++++++++++++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb.h   |  39 +++++++++++++
>   3 files changed, 165 insertions(+), 1 deletion(-)
>   create mode 100644 hw/pci-host/pnv_phb.c
>   create mode 100644 hw/pci-host/pnv_phb.h
> 
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index c07596d0d1..e832babc9d 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -35,5 +35,6 @@ specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
>     'pnv_phb3_msi.c',
>     'pnv_phb3_pbcq.c',
>     'pnv_phb4.c',
> -  'pnv_phb4_pec.c'
> +  'pnv_phb4_pec.c',
> +  'pnv_phb.c',
>   ))
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> new file mode 100644
> index 0000000000..6fefff7d44
> --- /dev/null
> +++ b/hw/pci-host/pnv_phb.c
> @@ -0,0 +1,124 @@
> +/*
> + * QEMU PowerPC PowerNV Proxy PHB model
> + *
> + * Copyright (c) 2022, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/visitor.h"
> +#include "qapi/error.h"
> +#include "hw/pci-host/pnv_phb.h"
> +#include "hw/pci-host/pnv_phb3.h"
> +#include "hw/pci-host/pnv_phb4.h"
> +#include "hw/ppc/pnv.h"
> +#include "hw/qdev-properties.h"
> +#include "qom/object.h"
> +
> +
> +static void pnv_phb_realize(DeviceState *dev, Error **errp)
> +{
> +    PnvPHB *phb = PNV_PHB(dev);
> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> +    g_autofree char *phb_typename = NULL;
> +    g_autofree char *phb_rootport_typename = NULL;
> +
> +    if (!phb->version) {
> +        error_setg(errp, "version not specified");
> +        return;
> +    }
> +
> +    switch (phb->version) {
> +    case 3:
> +        phb_typename = g_strdup(TYPE_PNV_PHB3);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
> +        break;
> +    case 4:
> +        phb_typename = g_strdup(TYPE_PNV_PHB4);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
> +        break;
> +    case 5:
> +        phb_typename = g_strdup(TYPE_PNV_PHB5);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    phb->backend = object_new(phb_typename);
> +    object_property_add_child(OBJECT(dev), "phb-backend", phb->backend);
> +
> +    /* Passthrough child device properties to the proxy device */
> +    object_property_set_uint(phb->backend, "index", phb->phb_id, errp);
> +    object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
> +    object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
> +
> +    if (phb->version == 3) {
> +        object_property_set_link(phb->backend, "chip",
> +                                 OBJECT(phb->chip), errp);
> +    } else {
> +        object_property_set_link(phb->backend, "pec", OBJECT(phb->pec), errp);
> +    }
> +
> +    if (!qdev_realize(DEVICE(phb->backend), NULL, errp)) {
> +        return;
> +    }
> +
> +    if (phb->version == 3) {
> +        pnv_phb3_bus_init(dev, PNV_PHB3(phb->backend));
> +    }
> +
> +    pnv_phb_attach_root_port(pci, phb_rootport_typename,
> +                             phb->phb_id, phb->chip_id);
> +}
> +
> +static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> +                                         PCIBus *rootbus)
> +{
> +    PnvPHB *phb = PNV_PHB(host_bridge);
> +
> +    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
> +             phb->chip_id, phb->phb_id);
> +    return phb->bus_path;
> +}
> +
> +static Property pnv_phb_properties[] = {
> +    DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
> +    DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
> +    DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
> +
> +    DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
> +
> +    DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
> +                     PnvPhb4PecState *),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pnv_phb_class_init(ObjectClass *klass, void *data)
> +{
> +    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    hc->root_bus_path = pnv_phb_root_bus_path;
> +    dc->realize = pnv_phb_realize;
> +    device_class_set_props(dc, pnv_phb_properties);
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->user_creatable = false;
> +}
> +
> +static void pnv_phb_register_type(void)
> +{
> +    static const TypeInfo pnv_phb_type_info = {
> +        .name          = TYPE_PNV_PHB,
> +        .parent        = TYPE_PCIE_HOST_BRIDGE,
> +        .instance_size = sizeof(PnvPHB),
> +        .class_init    = pnv_phb_class_init,
> +    };
> +
> +    type_register_static(&pnv_phb_type_info);
> +}
> +type_init(pnv_phb_register_type)
> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
> new file mode 100644
> index 0000000000..a7cc8610e2
> --- /dev/null
> +++ b/hw/pci-host/pnv_phb.h
> @@ -0,0 +1,39 @@
> +/*
> + * QEMU PowerPC PowerNV Proxy PHB model
> + *
> + * Copyright (c) 2022, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef PCI_HOST_PNV_PHB_H
> +#define PCI_HOST_PNV_PHB_H
> +
> +#include "hw/pci/pcie_host.h"
> +#include "hw/pci/pcie_port.h"
> +#include "qom/object.h"
> +
> +typedef struct PnvChip PnvChip;
> +typedef struct PnvPhb4PecState PnvPhb4PecState;
> +
> +struct PnvPHB {
> +    PCIExpressHost parent_obj;
> +
> +    uint32_t chip_id;
> +    uint32_t phb_id;
> +    uint32_t version;
> +    char bus_path[8];
> +
> +    PnvChip *chip;
> +
> +    PnvPhb4PecState *pec;
> +
> +    /* The PHB backend (PnvPHB3, PnvPHB4 ...) being used */
> +    Object *backend;
> +};
> +
> +#define TYPE_PNV_PHB "pnv-phb"
> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
> +
> +#endif /* PCI_HOST_PNV_PHB_H */

