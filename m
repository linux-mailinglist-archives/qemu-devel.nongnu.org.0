Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B549E42A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:08:17 +0100 (CET)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5Rg-0006Jg-0d
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5MN-0003g4-LA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:02:47 -0500
Received: from [2a00:1450:4864:20::331] (port=56134
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5ML-0000c7-Au
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:02:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id r7so2003354wmq.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tkqUQB+Z68LqsV8nNXr4aY67heT2gE+llsiDXPUiMtY=;
 b=pNyuYNDxW9tov4xwsdczD5QbZrIMAC3gBeUox/KkolEghTFCVwjb4FyNNAR8b1/w/f
 OwIltt1a2O7WjwgaQ1Ufuk2bQp2ICcXZplYkCstpBTT6dXkEH4A0FT3rhpdpuZrfDVXc
 tgn9UIaeGdvspZPtXqbv2w91sLiP2U/6V7YY74/kyosgtn44Xh7Uwz4TcPgdGwK2hY/X
 tmBTaFG3d7wU2dQs/u57d5XiqwgEdF7lS8xlRCNo1rK0pLWlcgzTacWlPqoOop8uz9iT
 yoooMFej2VYwhbuWATxnn1YyPT8yE+pHoje4D1vZ0VmLxOcUyk9LA9dCvHnHIK8toRtV
 cCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tkqUQB+Z68LqsV8nNXr4aY67heT2gE+llsiDXPUiMtY=;
 b=WtlChusuKx1AIiyWw5sOJvnNkaIFYD0glt6mEr5SnRx25czJ5O/SpDfP7nlgQubW44
 Cmlf9D6BLitcRLwpjJoaoEEUdzA/IW2cavk/k84RRWp9dBnaCJ9xTGEUU7PCdDYzsfOT
 SiQBosfUHSCXQv3hItSyFfGCjXMji0VSP8uJp8TyjPr0NbteJYmVCaD28fQtb3PGEmlm
 +zl5rukkjrL2pkRmZOgwFAsDGhBARIbs2+289nxyYLPVcORUJjrn4OpPm2+WoXp22j9R
 B9wQ4VEValtiTDEgrxjP9BdEEgk42scgXbvUNbL2FFp38f4OfK6xV81+nBW7xcVyUb7R
 qCTg==
X-Gm-Message-State: AOAM530rUkDY0dbm/BXexZzm80PuOoVj0qZUu7P1TxrC2aylvxUr7XaX
 JCypr0TH1qm3kYXSk/V63HbOYg==
X-Google-Smtp-Source: ABdhPJxPo5tYIKAQV7rja4QAjgj6D07+0MHuJ+TT11lF5j7OGFRQt5k2MJ0chDg+cxi0Rsw9YJSzhQ==
X-Received: by 2002:a05:600c:a06:: with SMTP id
 z6mr11675850wmp.9.1643292163790; 
 Thu, 27 Jan 2022 06:02:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm2049590wma.22.2022.01.27.06.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:02:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47FD21FFB7;
 Thu, 27 Jan 2022 14:02:42 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-14-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 13/42] hw/pxb: Allow creation of a CXL PXB (host bridge)
Date: Thu, 27 Jan 2022 13:59:56 +0000
In-reply-to: <20220124171705.10432-14-Jonathan.Cameron@huawei.com>
Message-ID: <87ee4t9szh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> This works like adding a typical pxb device, except the name is
> 'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
> follows:
>   -device pxb-cxl,id=3Dcxl.0,bus=3D"pcie.0",bus_nr=3D1
>
> A CXL PXB is backward compatible with PCIe. What this means in practice
> is that an operating system that is unaware of CXL should still be able
> to enumerate this topology as if it were PCIe.
>
> One can create multiple CXL PXB host bridges, but a host bridge can only
> be connected to the main root bus. Host bridges cannot appear elsewhere
> in the topology.
>
> Note that as of this patch, the ACPI tables needed for the host bridge
> (specifically, an ACPI object in _SB named ACPI0016 and the CEDT) aren't
> created. So while this patch internally creates it, it cannot be
> properly used by an operating system or other system software.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan.Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/pci-bridge/pci_expander_bridge.c | 98 ++++++++++++++++++++++++++++-
>  hw/pci/pci.c                        |  7 +++
>  include/hw/pci/pci.h                |  6 ++
>  3 files changed, 109 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expa=
nder_bridge.c
> index a6caa1e7b5..7009b541de 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -17,6 +17,7 @@
>  #include "hw/pci/pci_host.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/pci/pci_bridge.h"
> +#include "hw/cxl/cxl.h"
>  #include "qemu/range.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> @@ -56,6 +57,10 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
>  DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
>                           TYPE_PXB_PCIE_DEVICE)
>=20=20
> +#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> +                         TYPE_PXB_CXL_DEVICE)
> +
>  struct PXBDev {
>      /*< private >*/
>      PCIDevice parent_obj;
> @@ -66,8 +71,19 @@ struct PXBDev {
>      bool bypass_iommu;
>  };
>=20=20
> +typedef struct CXLHost {
> +    PCIHostState parent_obj;
> +
> +    CXLComponentState cxl_cstate;
> +} CXLHost;
> +
>  static PXBDev *convert_to_pxb(PCIDevice *dev)
>  {
> +    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
> +        return PXB_CXL_DEV(dev);
> +    }
> +
>      return pci_bus_is_express(pci_get_bus(dev))
>          ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
>  }
> @@ -76,6 +92,9 @@ static GList *pxb_dev_list;
>=20=20
>  #define TYPE_PXB_HOST "pxb-host"
>=20=20
> +#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
> +#define PXB_CXL_HOST(obj) OBJECT_CHECK(CXLHost, (obj), TYPE_PXB_CXL_HOST)
> +
>  static int pxb_bus_num(PCIBus *bus)
>  {
>      PXBDev *pxb =3D convert_to_pxb(bus->parent_dev);
> @@ -112,11 +131,20 @@ static const TypeInfo pxb_pcie_bus_info =3D {
>      .class_init    =3D pxb_bus_class_init,
>  };
>=20=20
> +static const TypeInfo pxb_cxl_bus_info =3D {
> +    .name          =3D TYPE_PXB_CXL_BUS,
> +    .parent        =3D TYPE_CXL_BUS,
> +    .instance_size =3D sizeof(PXBBus),
> +    .class_init    =3D pxb_bus_class_init,
> +};
> +
>  static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
>                                            PCIBus *rootbus)
>  {
> -    PXBBus *bus =3D pci_bus_is_express(rootbus) ?
> -                  PXB_PCIE_BUS(rootbus) : PXB_BUS(rootbus);
> +    PXBBus *bus =3D pci_bus_is_cxl(rootbus) ?
> +                      PXB_CXL_BUS(rootbus) :
> +                      pci_bus_is_express(rootbus) ? PXB_PCIE_BUS(rootbus=
) :
> +                                                    PXB_BUS(rootbus);
>=20=20
>      snprintf(bus->bus_path, 8, "0000:%02x", pxb_bus_num(rootbus));
>      return bus->bus_path;
> @@ -218,6 +246,16 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pi=
n)
>      return pin - PCI_SLOT(pxb->devfn);
>  }
>=20=20
> +static void pxb_dev_reset(DeviceState *dev)
> +{
> +    CXLHost *cxl =3D PXB_CXL_HOST(dev);
> +    CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> +    uint32_t *reg_state =3D cxl_cstate->crb.cache_mem_registers;
> +
> +    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
> +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT=
, 8);
> +}
> +
>  static gint pxb_compare(gconstpointer a, gconstpointer b)
>  {
>      const PXBDev *pxb_a =3D a, *pxb_b =3D b;
> @@ -290,6 +328,11 @@ static void pxb_dev_realize_common(PCIDevice *dev, e=
num BusType type,
>      pci_config_set_class(dev->config, PCI_CLASS_BRIDGE_HOST);
>=20=20
>      pxb_dev_list =3D g_list_insert_sorted(pxb_dev_list, pxb, pxb_compare=
);
> +
> +    if (type =3D=3D CXL) {
> +        pxb_dev_reset(ds);
> +    }
> +

Couldn't this just be done in the cxl realize function after it calls the
common code?

>      return;
>=20=20
>  err_register_bus:
> @@ -338,6 +381,12 @@ static void pxb_dev_class_init(ObjectClass *klass, v=
oid *data)
>      device_class_set_props(dc, pxb_dev_properties);
>      dc->hotpluggable =3D false;
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +
> +    /*
> +     * Reset doesn't seem to actually be called, but maybe it will in the
> +     * future?
> +     */
> +    dc->reset =3D pxb_dev_reset;

Surely because this should be in pxb_cxl_dev_class_init?

>  }
>=20=20
>  static const TypeInfo pxb_dev_info =3D {
> @@ -389,13 +438,58 @@ static const TypeInfo pxb_pcie_dev_info =3D {
>      },
>  };
>=20=20
> +static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
> +{
> +    /* A CXL PXB's parent bus is still PCIe */
> +    if (!pci_bus_is_express(pci_get_bus(dev))) {
> +        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
> +        return;
> +    }
> +
> +    pxb_dev_realize_common(dev, CXL, errp);
> +}
> +
> +static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc   =3D DEVICE_CLASS(klass);
> +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> +
> +    k->realize             =3D pxb_cxl_dev_realize;
> +    k->exit                =3D pxb_dev_exitfn;
> +    /*
> +     * XXX: These types of bridges don't actually show up in the hierarc=
hy so
> +     * vendor, device, class, etc. ids are intentionally left out.
> +     */
> +
> +    dc->desc =3D "CXL Host Bridge";
> +    device_class_set_props(dc, pxb_dev_properties);
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +
> +    /* Host bridges aren't hotpluggable. FIXME: spec reference */
> +    dc->hotpluggable =3D false;
> +}
> +
> +static const TypeInfo pxb_cxl_dev_info =3D {
> +    .name          =3D TYPE_PXB_CXL_DEVICE,
> +    .parent        =3D TYPE_PCI_DEVICE,
> +    .instance_size =3D sizeof(PXBDev),
> +    .class_init    =3D pxb_cxl_dev_class_init,
> +    .interfaces =3D
> +        (InterfaceInfo[]){
> +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +            {},
> +        },
> +};
> +
>  static void pxb_register_types(void)
>  {
>      type_register_static(&pxb_bus_info);
>      type_register_static(&pxb_pcie_bus_info);
> +    type_register_static(&pxb_cxl_bus_info);
>      type_register_static(&pxb_host_info);
>      type_register_static(&pxb_dev_info);
>      type_register_static(&pxb_pcie_dev_info);
> +    type_register_static(&pxb_cxl_dev_info);
>  }
>=20=20
>  type_init(pxb_register_types)
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 474ea98c1d..cafebf6f59 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -229,6 +229,12 @@ static const TypeInfo pcie_bus_info =3D {
>      .class_init =3D pcie_bus_class_init,
>  };
>=20=20
> +static const TypeInfo cxl_bus_info =3D {
> +    .name       =3D TYPE_CXL_BUS,
> +    .parent     =3D TYPE_PCIE_BUS,
> +    .class_init =3D pcie_bus_class_init,
> +};
> +
>  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
>  static void pci_update_mappings(PCIDevice *d);
>  static void pci_irq_handler(void *opaque, int irq_num, int level);
> @@ -2892,6 +2898,7 @@ static void pci_register_types(void)
>  {
>      type_register_static(&pci_bus_info);
>      type_register_static(&pcie_bus_info);
> +    type_register_static(&cxl_bus_info);
>      type_register_static(&conventional_pci_interface_info);
>      type_register_static(&cxl_interface_info);
>      type_register_static(&pcie_interface_info);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 908896ebe8..97cbbad375 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -409,6 +409,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque=
, int pin);
>  #define TYPE_PCI_BUS "PCI"
>  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
> +#define TYPE_CXL_BUS "CXL"
>=20=20
>  typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
>  typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
> @@ -768,6 +769,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
>      pci_irq_deassert(pci_dev);
>  }
>=20=20
> +static inline int pci_is_cxl(const PCIDevice *d)
> +{
> +    return d->cap_present & QEMU_PCIE_CAP_CXL;
> +}
> +
>  static inline int pci_is_express(const PCIDevice *d)
>  {
>      return d->cap_present & QEMU_PCI_CAP_EXPRESS;


--=20
Alex Benn=C3=A9e

