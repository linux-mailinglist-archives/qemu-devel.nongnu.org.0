Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87024E588B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:39:58 +0100 (CET)
Received: from localhost ([::1]:51572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5tl-0001YN-Rl
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:39:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nX5rK-0007pB-PL
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:37:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nX5rG-0005f0-W8
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:37:25 -0400
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KNxrW6Bfcz67Cqn;
 Thu, 24 Mar 2022 02:36:11 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 23 Mar 2022 19:37:19 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 23 Mar
 2022 18:37:19 +0000
Date: Wed, 23 Mar 2022 18:37:17 +0000
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Be?=
 =?ISO-8859-1?Q?nn=E9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, 
 Chris Browy <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, 
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v8 23/46] hw/cxl/component: Implement host bridge MMIO
 (8.2.5, table 142)
Message-ID: <20220323183717.00006c94@huawei.com>
In-Reply-To: <10cae45f-9f3a-c7a5-c834-ae14a5fcbecf@ilande.co.uk>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-24-Jonathan.Cameron@huawei.com>
 <10cae45f-9f3a-c7a5-c834-ae14a5fcbecf@ilande.co.uk>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Sat, 19 Mar 2022 08:35:54 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 18/03/2022 15:06, Jonathan Cameron wrote:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >=20
> > CXL host bridges themselves may have MMIO. Since host bridges don't have
> > a BAR they are treated as special for MMIO.  This patch includes
> > i386/pc support.
> > Also hook up the device reset now that we have have the MMIO
> > space in which the results are visible.
> >=20
> > Note that we duplicate the PCI express case for the aml_build but
> > the implementations will diverge when the CXL specific _OSC is
> > introduced.
> >=20
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>

...

> > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_ex=
pander_bridge.c
> > index f762eb4a6e..b3b5f93650 100644
> > --- a/hw/pci-bridge/pci_expander_bridge.c
> > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > @@ -75,6 +75,9 @@ struct PXBDev {
> >       uint8_t bus_nr;
> >       uint16_t numa_node;
> >       bool bypass_iommu;
> > +    struct cxl_dev {
> > +        CXLHost *cxl_host_bridge;
> > +    } cxl;
> >   };
> >  =20
> >   static PXBDev *convert_to_pxb(PCIDevice *dev)
> > @@ -92,6 +95,9 @@ static GList *pxb_dev_list;
> >  =20
> >   #define TYPE_PXB_HOST "pxb-host"
> >  =20
> > +#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
> > +#define PXB_CXL_HOST(obj) OBJECT_CHECK(CXLHost, (obj), TYPE_PXB_CXL_HO=
ST) =20
>=20
> Again this is a legacy QOM type declaration and should be replaced with=20
> OBJECT_DECLARE_SIMPLE_TYPE(). It should also be located in the associated=
 header file=20
> if it exists (include/hw/cxl/cxl.h in this case).

Sure, though as noted below that means dragging the structure there as well.
I'm not quite sure why we want to put this in a header given it's only
used locally in this file, but fair enough that is best practice.

>=20
> >   static int pxb_bus_num(PCIBus *bus)
> >   {
> >       PXBDev *pxb =3D convert_to_pxb(bus->parent_dev);
> > @@ -197,6 +203,52 @@ static const TypeInfo pxb_host_info =3D {
> >       .class_init    =3D pxb_host_class_init,
> >   };
> >  =20
> > +static void pxb_cxl_realize(DeviceState *dev, Error **errp)
> > +{
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +    CXLHost *cxl =3D PXB_CXL_HOST(dev);
> > +    CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> > +    struct MemoryRegion *mr =3D &cxl_cstate->crb.component_registers;
> > +    hwaddr offset;
> > +
> > +    cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
> > +                                      TYPE_PXB_CXL_HOST);
> > +    sysbus_init_mmio(sbd, mr);
> > +
> > +    offset =3D memory_region_size(mr) * ms->cxl_devices_state->next_mr=
_idx;
> > +    if (offset > memory_region_size(&ms->cxl_devices_state->host_mr)) {
> > +        error_setg(errp, "Insufficient space for pxb cxl host register=
 space");
> > +        return;
> > +    }
> > +
> > +    memory_region_add_subregion(&ms->cxl_devices_state->host_mr, offse=
t, mr);
> > +    ms->cxl_devices_state->next_mr_idx++;
> > +}
> > +
> > +static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(class);
> > +    PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(class);
> > +
> > +    hc->root_bus_path =3D pxb_host_root_bus_path;
> > +    dc->fw_name =3D "cxl";
> > +    dc->realize =3D pxb_cxl_realize;
> > +    /* Reason: Internal part of the pxb/pxb-pcie device, not usable by=
 itself */
> > +    dc->user_creatable =3D false;
> > +}
> > +
> > +/*
> > + * This is a device to handle the MMIO for a CXL host bridge. It does =
nothing
> > + * else.
> > + */
> > +static const TypeInfo cxl_host_info =3D {
> > +    .name          =3D TYPE_PXB_CXL_HOST,
> > +    .parent        =3D TYPE_PCI_HOST_BRIDGE,
> > +    .instance_size =3D sizeof(CXLHost),
> > +    .class_init    =3D pxb_cxl_host_class_init,
> > +};
> > +
> >   /*
> >    * Registers the PXB bus as a child of pci host root bus.
> >    */
> > @@ -245,6 +297,12 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int =
pin)
> >  =20
> >   static void pxb_dev_reset(DeviceState *dev)
> >   {
> > +    CXLHost *cxl =3D PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
> > +    CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> > +    uint32_t *reg_state =3D cxl_cstate->crb.cache_mem_registers;
> > +
> > +    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COU=
NT, 8);
> >   }
> >  =20
> >   static gint pxb_compare(gconstpointer a, gconstpointer b)
> > @@ -281,12 +339,13 @@ static void pxb_dev_realize_common(PCIDevice *dev=
, enum BusType type,
> >           dev_name =3D dev->qdev.id;
> >       }
> >  =20
> > -    ds =3D qdev_new(TYPE_PXB_HOST);
> > +    ds =3D qdev_new(type =3D=3D CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOS=
T);
> >       if (type =3D=3D PCIE) {
> >           bus =3D pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PX=
B_PCIE_BUS);
> >       } else if (type =3D=3D CXL) {
> >           bus =3D pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PX=
B_CXL_BUS);
> >           bus->flags |=3D PCI_BUS_CXL;
> > +        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge =3D PXB_CXL_HOST(ds);
> >       } else {
> >           bus =3D pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, T=
YPE_PXB_BUS);
> >           bds =3D qdev_new("pci-bridge");
> > @@ -475,6 +534,7 @@ static void pxb_register_types(void)
> >       type_register_static(&pxb_pcie_bus_info);
> >       type_register_static(&pxb_cxl_bus_info);
> >       type_register_static(&pxb_host_info);
> > +    type_register_static(&cxl_host_info);
> >       type_register_static(&pxb_dev_info);
> >       type_register_static(&pxb_pcie_dev_info);
> >       type_register_static(&pxb_cxl_dev_info);
> > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > index 31af92fd5e..75e5bf71e1 100644
> > --- a/include/hw/cxl/cxl.h
> > +++ b/include/hw/cxl/cxl.h
> > @@ -17,8 +17,12 @@
> >   #define CXL_COMPONENT_REG_BAR_IDX 0
> >   #define CXL_DEVICE_REG_BAR_IDX 2
> >  =20
> > +#define CXL_WINDOW_MAX 10
> > +
> >   typedef struct CXLState {
> >       bool is_enabled;
> > +    MemoryRegion host_mr;
> > +    unsigned int next_mr_idx;
> >   } CXLState; =20
>=20
> ... so simply drop the typedef and place OBJECT_DECLARE_SIMPLE_TYPE here =
instead.

This isn't the right structure.

I've dragged the
struct CXLHost definition to here.

which need an additional include but that's fine.
>=20
> >   #endif =20
>=20
>=20
> ATB,
>=20
> Mark.


