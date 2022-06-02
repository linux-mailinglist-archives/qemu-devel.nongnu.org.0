Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C958653BC54
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:19:43 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnXy-00018V-3p
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwnVO-0007AZ-Gq; Thu, 02 Jun 2022 12:17:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwnVL-00042q-7r; Thu, 02 Jun 2022 12:17:01 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252EMH2I006116;
 Thu, 2 Jun 2022 16:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=g9/MSR8xKTiwNxAUBoIqpL5WwSqRzGWZnSg+4v5G5JQ=;
 b=bex9g6PbC09Q/4PuShM+vNOfwUnlv8mT8Z6AY6cVy6qmBgH/xwLk0pQDu0A6+cqYdb9+
 kr+D3r9sclUxFZv4iEWA81FezOuqMukTqDIIgW1kzxVRyxN/PV7QEVURQ+Ray0Uya6mr
 axDKvXGqj0Z1+/voTZR2O+6eYrSi/EkE58zNivnhSFn6JMMeSoWueEBi9dOjkyDqR2Sg
 RaKYaTYYG9kZhsQuQrFouDzP1SmDZjfFVvSEtPtct5DE45BB8KVBCrVe5s50zHbQ0wa2
 aivkjV/4b3rvwNuWy4AOgpAJSkp3fq7Q7D4wVus2wWhXIPJFAbiOkyYZZA7wSfGVdXf0 KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevdknn2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:16:44 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252GE7I7026289;
 Thu, 2 Jun 2022 16:16:43 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevdknn1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:16:43 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252G6vpO012346;
 Thu, 2 Jun 2022 16:16:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3gbc97dhu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:16:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 252GGeWU25100740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 16:16:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89620AE045;
 Thu,  2 Jun 2022 16:16:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4026CAE04D;
 Thu,  2 Jun 2022 16:16:39 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jun 2022 16:16:39 +0000 (GMT)
Message-ID: <fd2aa961-6f79-3628-ef3c-f22ac23e5052@linux.ibm.com>
Date: Thu, 2 Jun 2022 18:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 03/16] ppc/pnv: add PnvPHB base/proxy device
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-4-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220531214917.31668-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5i0yuEdRSauae8g0CdXBY9Nlonup5ayS
X-Proofpoint-GUID: Hb4_HF2ei97rpiMYaQ8S7M2WamFUjBOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_04,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206020067
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



On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
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
>   hw/pci-host/meson.build |   3 +-
>   hw/pci-host/pnv_phb.c   | 123 ++++++++++++++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb.h   |  39 +++++++++++++
>   3 files changed, 164 insertions(+), 1 deletion(-)
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
> index 0000000000..fa8472622f
> --- /dev/null
> +++ b/hw/pci-host/pnv_phb.c
> @@ -0,0 +1,123 @@
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
> +    object_property_add_child(OBJECT(dev), "phb-device", phb->backend);
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


The patch is fine, but it just highlights that we're doing something 
wrong. I don't believe there's any reason for the chip/pec/phb 
relationship to be different between P8 and P9/P10. One day, a brave 
soul could try to unify the models, it would avoid test like that.
It would be a good cleanup series to do if we ever extend the model with 
yet another version :-)



> +
> +    if (!qdev_realize(DEVICE(phb->backend), NULL, errp)) {
> +        return;
> +    }
> +
> +    if (phb->version == 3) {
> +        pnv_phb3_bus_init(dev, (PnvPHB3 *)phb->backend);
> +    }
> +
> +    pnv_phb_attach_root_port(pci, phb_rootport_typename);



After we've removed the other instances (done in later patches), we 
could move pnv_phb_attach_root_port() to pnv_phb.c instead of pnv.c. It 
would be the perfect home for it as it starts looking off in pnv.c

   Fred



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
> +        DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
> +        DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
> +        DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
> +
> +        DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
> +
> +        DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
> +                         PnvPhb4PecState *),
> +
> +        DEFINE_PROP_END_OF_LIST(),
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
> +    dc->user_creatable = true;
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

