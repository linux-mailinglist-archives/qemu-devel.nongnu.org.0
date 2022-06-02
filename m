Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88F953B445
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:22:17 +0200 (CEST)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwf9s-0005rf-Er
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwf6O-0004lJ-Od; Thu, 02 Jun 2022 03:18:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwf6M-00075M-2X; Thu, 02 Jun 2022 03:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nali762lZik9sfTZENAUiBcCDHiPEDi6Rsf1DYmCoBQ=; b=wdmxiFTRl56nMPtyZYONuIvYei
 JCfZa5t6i3tqxKuNtq15/zzqnVrP8grmJL46pw+2oelWi1Ax2c+bShuwUpCqSZC1PvVG8sKELywZb
 DqhnoDQyjHI9OFojroOUC+eXEqddOePkUoUQkFs67yJ56tnsL2h2jRvlb/Felew2YFVoWp285dMgd
 lOLuX3s163+LW077MjpF8A8qYfymr5NMzZyF9YtcfZERjh6hjt7tLuigcQlNVWuosC3Xl4iFb/FXY
 kBQVFbtk76/YBpbngpvTWOjqAgBrj3zaktA4uklA8pu/k8dNRnNG67oLNNqrhf2QvlUgdtYorYhW9
 9HhQ5tr4F30jdzduhwEVMrT+bfpO8/3nn5OB6K68nUaK5ZgfpRb9wbSp1bsijDC8X+AuhKbQ2rcdj
 RAgoRKRhcDC5yKALInFV2zVty719Vep4HsiJWTHhnv/BIM8zgpXoRe9fyOJwpkFO92BFYFv2w8b0D
 cPYoFz3GUKB6yBsctySBEA9fcDQxoCRJOIYw4Rl6e2xTGYMEdYgqh5B/x3CPTSPz74syOh3y7vx7X
 5a/dg409B9HQ2OW+5OTOhc45al4uL1En4yq/kRp2F4AU+tv6Ajlvbycj3MpV2vUScyIhGZ85b1TLE
 G7z1m4jE2rb64uVoHDqvYB2SxkbSOUuqgvT1cUYp8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwf5D-0002sl-5x; Thu, 02 Jun 2022 08:17:31 +0100
Message-ID: <ffd207e6-078c-ef5b-5ebd-a700e4730306@ilande.co.uk>
Date: Thu, 2 Jun 2022 08:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-4-danielhb413@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220531214917.31668-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/16] ppc/pnv: add PnvPHB base/proxy device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 31/05/2022 22:49, Daniel Henrique Barboza wrote:

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

Looks like some odd spacing has crept into the pnv_phb_properties[] array above?

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


ATB,

Mark.

