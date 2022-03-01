Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41984C92A1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:12:33 +0100 (CET)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6zA-0004ca-CA
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:12:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6xO-0003Ih-Pj
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:10:43 -0500
Received: from [2a00:1450:4864:20::62d] (port=41719
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6xM-0001SX-DI
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:10:42 -0500
Received: by mail-ej1-x62d.google.com with SMTP id a8so33163162ejc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DGKohEk/r1e6pJXLoIHHgXdz0ebg8y4MKIFUup8WgtQ=;
 b=D6W4TPRxF9D8P4Nt4JRDTQCq7KRhBOpGmWN5JH5kT1OvRueDKUBYdDkzcM/LnsSyBC
 BnJCET9yA73wqpa2TR6vWMgJ5tsE2kax6Fx4PEXkwqkAcX4viEO+tgm43o3czDAuwc3l
 wPLy3TG3X+h0ZsJq95udbJ7MwTbcI5wAYZdyZKo5qe4Xpfev9GeNekXO7yMOwu/VJmPL
 VTQsPiqkQ7+6rcpfsxwEY7dK9dUTvzWjplCL8Wjl5AqAYPscOpD4vr9Mo1PMjpWnCpB5
 VDS9tWUMTpqk8q8M4T+Jot2Ec6xT2nUtUgTfdZ12q3zd9QGO7EJejSK/APrHa+tfmrGh
 ERuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DGKohEk/r1e6pJXLoIHHgXdz0ebg8y4MKIFUup8WgtQ=;
 b=jYeZBvh9sVIwEgWo8fcdl7t3ASWGJ+BHFrRTflx/wepLVEF2WK8+BDma97iR3bsfk5
 xgVno7z5WMbNlgOWsTe/PByiCfDa7bpkI5SqyBi/OSNqYM+27GB4c9IwWSwBTnyMAL0r
 96iBWtPZ2/FT7WDW83CGDV/GB/Yb78l+fEiMgF3l13gQrsfRi7HxOx6Bu22Xs8NNppJm
 DtRNjNjowO30p62R4Yw7gGSBK1K3vvJFsc+y0EMmT5zWvVGwQItnvqXOWsrK762HgBZ3
 oUIFTNdEmqAbHIvFCQsifiwVans6vmrQnMGIhu1pX61M8C9sJFg0mKmRrVyUib4lg309
 Rh/g==
X-Gm-Message-State: AOAM530DDt3dbHD52AsfpkYVpYmscm6oYwtyqoqA7hdZ7Rhjtl2ra0x9
 jppjg3tNn//f7QXwPKyAwA+E8A==
X-Google-Smtp-Source: ABdhPJwjc1gWE8t+UyNxU3MzXRr9QuNdpcpMc9RU8PK5FMOIr00BmvzYoPhnCzSrja33dTuF+qgS8w==
X-Received: by 2002:a17:907:1384:b0:6cd:5c6a:eec0 with SMTP id
 vs4-20020a170907138400b006cd5c6aeec0mr20355395ejb.35.1646158238619; 
 Tue, 01 Mar 2022 10:10:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a50bf4d000000b00410d407da2esm7550232edk.13.2022.03.01.10.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:10:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B65311FFB7;
 Tue,  1 Mar 2022 18:10:36 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-17-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 16/43] hw/cxl/rp: Add a root port
Date: Tue, 01 Mar 2022 18:08:31 +0000
In-reply-to: <20220211120747.3074-17-Jonathan.Cameron@huawei.com>
Message-ID: <87lextlf1f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 .  Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
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
> This adds just enough of a root port implementation to be able to
> enumerate root ports (creating the required DVSEC entries). What's not
> here yet is the MMIO nor the ability to write some of the DVSEC entries.
>
> This can be added with the qemu commandline by adding a rootport to a
> specific CXL host bridge. For example:
>   -device cxl-rp,id=3Drp0,bus=3D"cxl.0",addr=3D0.0,chassis=3D4
>
> Like the host bridge patch, the ACPI tables aren't generated at this
> point and so system software cannot use it.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/pci-bridge/Kconfig          |   5 +
>  hw/pci-bridge/cxl_root_port.c  | 231 +++++++++++++++++++++++++++++++++
>  hw/pci-bridge/meson.build      |   1 +
>  hw/pci-bridge/pcie_root_port.c |   6 +-
>  hw/pci/pci.c                   |   4 +-
>  5 files changed, 245 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
> index f8df4315ba..02614f49aa 100644
> --- a/hw/pci-bridge/Kconfig
> +++ b/hw/pci-bridge/Kconfig
> @@ -27,3 +27,8 @@ config DEC_PCI
>=20=20
>  config SIMBA
>      bool
> +
> +config CXL
> +    bool
> +    default y if PCI_EXPRESS && PXB
> +    depends on PCI_EXPRESS && MSI_NONBROKEN && PXB
> diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
> new file mode 100644
> index 0000000000..dd714db836
> --- /dev/null
> +++ b/hw/pci-bridge/cxl_root_port.c
> @@ -0,0 +1,231 @@
> +/*
> + * CXL 2.0 Root Port Implementation
> + *
> + * Copyright(C) 2020 Intel Corporation.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/range.h"
> +#include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pcie_port.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "qapi/error.h"
> +#include "hw/cxl/cxl.h"
> +
> +#define CXL_ROOT_PORT_DID 0x7075
> +
> +/* Copied from the gen root port which we derive */
> +#define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
> +#define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
> +    (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
> +#define CXL_ROOT_PORT_DVSEC_OFFSET \
> +    (GEN_PCIE_ROOT_PORT_ACS_OFFSET + PCI_ACS_SIZEOF)
> +
> +typedef struct CXLRootPort {
> +    /*< private >*/
> +    PCIESlot parent_obj;
> +
> +    CXLComponentState cxl_cstate;
> +    PCIResReserve res_reserve;
> +} CXLRootPort;
> +
> +#define TYPE_CXL_ROOT_PORT "cxl-rp"
> +DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_PORT)
> +
> +static void latch_registers(CXLRootPort *crp)
> +{
> +    uint32_t *reg_state =3D crp->cxl_cstate.crb.cache_mem_registers;
> +
> +    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
> +}
> +
> +static void build_dvsecs(CXLComponentState *cxl)
> +{
> +    uint8_t *dvsec;
> +
> +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_port_extensions){ 0 };
> +    cxl_component_create_dvsec(cxl, EXTENSIONS_PORT_DVSEC_LENGTH,
> +                               EXTENSIONS_PORT_DVSEC,
> +                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
> +
> +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_port_gpf){
> +        .rsvd        =3D 0,
> +        .phase1_ctrl =3D 1, /* 1=CE=BCs timeout */
> +        .phase2_ctrl =3D 1, /* 1=CE=BCs timeout */
> +    };
> +    cxl_component_create_dvsec(cxl, GPF_PORT_DVSEC_LENGTH, GPF_PORT_DVSE=
C,
> +                               GPF_PORT_DVSEC_REVID, dvsec);
> +
> +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_port_flexbus){
> +        .cap                     =3D 0x26, /* IO, Mem, non-MLD */
> +        .ctrl                    =3D 0,
> +        .status                  =3D 0x26, /* same */
> +        .rcvd_mod_ts_data_phase1 =3D 0xef, /* WTF? */
> +    };
> +    cxl_component_create_dvsec(cxl, PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
> +                               PCIE_FLEXBUS_PORT_DVSEC,
> +                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
> +
> +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_register_locator){
> +        .rsvd         =3D 0,
> +        .reg0_base_lo =3D RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
> +        .reg0_base_hi =3D 0,
> +    };
> +    cxl_component_create_dvsec(cxl, REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
> +                               REG_LOC_DVSEC_REVID, dvsec);
> +}
> +
> +static void cxl_rp_realize(DeviceState *dev, Error **errp)
> +{
> +    PCIDevice *pci_dev     =3D PCI_DEVICE(dev);
> +    PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLASS(dev);
> +    CXLRootPort *crp       =3D CXL_ROOT_PORT(dev);
> +    CXLComponentState *cxl_cstate =3D &crp->cxl_cstate;
> +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> +    MemoryRegion *component_bar =3D &cregs->component_registers;
> +    Error *local_err =3D NULL;
> +
> +    rpc->parent_realize(dev, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    int rc =3D
> +        pci_bridge_qemu_reserve_cap_init(pci_dev, 0, crp->res_reserve, e=
rrp);
> +    if (rc < 0) {
> +        rpc->parent_class.exit(pci_dev);
> +        return;
> +    }
> +
> +    if (!crp->res_reserve.io || crp->res_reserve.io =3D=3D -1) {
> +        pci_word_test_and_clear_mask(pci_dev->wmask + PCI_COMMAND,
> +                                     PCI_COMMAND_IO);
> +        pci_dev->wmask[PCI_IO_BASE]  =3D 0;
> +        pci_dev->wmask[PCI_IO_LIMIT] =3D 0;
> +    }
> +
> +    cxl_cstate->dvsec_offset =3D CXL_ROOT_PORT_DVSEC_OFFSET;
> +    cxl_cstate->pdev =3D pci_dev;
> +    build_dvsecs(&crp->cxl_cstate);
> +
> +    cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
> +                                      TYPE_CXL_ROOT_PORT);
> +
> +    pci_register_bar(pci_dev, CXL_COMPONENT_REG_BAR_IDX,
> +                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> +                     component_bar);
> +}
> +
> +static void cxl_rp_reset(DeviceState *dev)
> +{
> +    PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLASS(dev);
> +    CXLRootPort *crp =3D CXL_ROOT_PORT(dev);
> +
> +    rpc->parent_reset(dev);
> +
> +    latch_registers(crp);
> +}
> +
> +static Property gen_rp_props[] =3D {
> +    DEFINE_PROP_UINT32("bus-reserve", CXLRootPort, res_reserve.bus, -1),
> +    DEFINE_PROP_SIZE("io-reserve", CXLRootPort, res_reserve.io, -1),
> +    DEFINE_PROP_SIZE("mem-reserve", CXLRootPort, res_reserve.mem_non_pre=
f, -1),
> +    DEFINE_PROP_SIZE("pref32-reserve", CXLRootPort, res_reserve.mem_pref=
_32,
> +                     -1),
> +    DEFINE_PROP_SIZE("pref64-reserve", CXLRootPort, res_reserve.mem_pref=
_64,
> +                     -1),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
> +static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
> +                                      uint32_t val, int len)
> +{
> +    CXLRootPort *crp =3D CXL_ROOT_PORT(dev);
> +
> +    if (range_contains(&crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC], a=
ddr)) {
> +        uint8_t *reg =3D &dev->config[addr];
> +        addr -=3D crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC].lob;
> +        if (addr =3D=3D PORT_CONTROL_OFFSET) {
> +            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
> +                /* unmask SBR */
> +            }
> +            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
> +                /* Alt Memory & ID Space Enable */
> +            }

Can we have LOG_UNIMPs for these null implementations please.

> +        }
> +    }
> +}
> +
> +static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t=
 val,
> +                                int len)
> +{
> +    uint16_t slt_ctl, slt_sta;
> +
> +    pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
> +    pci_bridge_write_config(d, address, val, len);
> +    pcie_cap_flr_write_config(d, address, val, len);
> +    pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
> +    pcie_aer_write_config(d, address, val, len);
> +
> +    cxl_rp_dvsec_write_config(d, address, val, len);
> +}
> +
> +static void cxl_root_port_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc        =3D DEVICE_CLASS(oc);
> +    PCIDeviceClass *k      =3D PCI_DEVICE_CLASS(oc);
> +    PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_CLASS(oc);
> +
> +    k->vendor_id =3D PCI_VENDOR_ID_INTEL;
> +    k->device_id =3D CXL_ROOT_PORT_DID;
> +    dc->desc     =3D "CXL Root Port";
> +    k->revision  =3D 0;
> +    device_class_set_props(dc, gen_rp_props);
> +    k->config_write =3D cxl_rp_write_config;
> +
> +    device_class_set_parent_realize(dc, cxl_rp_realize, &rpc->parent_rea=
lize);
> +    device_class_set_parent_reset(dc, cxl_rp_reset, &rpc->parent_reset);
> +
> +    rpc->aer_offset =3D GEN_PCIE_ROOT_PORT_AER_OFFSET;
> +    rpc->acs_offset =3D GEN_PCIE_ROOT_PORT_ACS_OFFSET;
> +
> +    /*
> +     * Explain
> +     */

You might as well either expand the comment or drop it, the code makes
it clear it is not hot pluggable (although an explanation would be
better - given it's PCIe like roots isn't hotplug a thing you see on CXL?)

> +    dc->hotpluggable =3D false;
> +}
> +
> +static const TypeInfo cxl_root_port_info =3D {
> +    .name =3D TYPE_CXL_ROOT_PORT,
> +    .parent =3D TYPE_PCIE_ROOT_PORT,
> +    .instance_size =3D sizeof(CXLRootPort),
> +    .class_init =3D cxl_root_port_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { INTERFACE_CXL_DEVICE },
> +        { }
> +    },
> +};
> +
> +static void cxl_register(void)
> +{
> +    type_register_static(&cxl_root_port_info);
> +}
> +
> +type_init(cxl_register);
> diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
> index daab8acf2a..b6d26a03d5 100644
> --- a/hw/pci-bridge/meson.build
> +++ b/hw/pci-bridge/meson.build
> @@ -5,6 +5,7 @@ pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh342=
0.c'))
>  pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', =
'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
>  pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
>  pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', =
'xio3130_downstream.c'))
> +pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
>=20=20
>  # NewWorld PowerMac
>  pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
> diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_por=
t.c
> index f1cfe9d14a..460e48269d 100644
> --- a/hw/pci-bridge/pcie_root_port.c
> +++ b/hw/pci-bridge/pcie_root_port.c
> @@ -67,7 +67,11 @@ static void rp_realize(PCIDevice *d, Error **errp)
>      int rc;
>=20=20
>      pci_config_set_interrupt_pin(d->config, 1);
> -    pci_bridge_initfn(d, TYPE_PCIE_BUS);
> +    if (d->cap_present & QEMU_PCIE_CAP_CXL) {
> +        pci_bridge_initfn(d, TYPE_CXL_BUS);
> +    } else {
> +        pci_bridge_initfn(d, TYPE_PCIE_BUS);
> +    }
>      pcie_port_init_reg(d);
>=20=20
>      rc =3D pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id,
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index cafebf6f59..cc4f06937d 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2708,7 +2708,9 @@ static void pci_device_class_base_init(ObjectClass =
*klass, void *data)
>              object_class_dynamic_cast(klass, INTERFACE_CONVENTIONAL_PCI_=
DEVICE);
>          ObjectClass *pcie =3D
>              object_class_dynamic_cast(klass, INTERFACE_PCIE_DEVICE);
> -        assert(conventional || pcie);
> +        ObjectClass *cxl =3D
> +            object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE);
> +        assert(conventional || pcie || cxl);
>      }
>  }

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

