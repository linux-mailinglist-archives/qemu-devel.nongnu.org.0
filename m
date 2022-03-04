Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B74CD593
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:54:33 +0100 (CET)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8O8-0007aN-IE
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:54:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQ81N-0006JA-Ur
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:31:03 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQ81L-0007oF-HH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:31:01 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K97xc5kwGz67tJb;
 Fri,  4 Mar 2022 21:29:40 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 14:30:56 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.21; Fri, 4 Mar
 2022 13:30:55 +0000
Date: Fri, 4 Mar 2022 13:30:54 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 .  Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 21/43] hw/cxl/device: Plumb real Label Storage Area
 (LSA) sizing
Message-ID: <20220304133054.000039bd@huawei.com>
In-Reply-To: <871qzkllj1.fsf@linaro.org>
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-22-Jonathan.Cameron@huawei.com>
 <871qzkllj1.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Wed, 02 Mar 2022 10:01:48 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > This should introduce no change. Subsequent work will make use of this
> > new class member.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-mailbox-utils.c  |  3 +++
> >  hw/mem/cxl_type3.c          | 24 +++++++++---------------
> >  include/hw/cxl/cxl_device.h | 29 +++++++++++++++++++++++++++++
> >  3 files changed, 41 insertions(+), 15 deletions(-)
> >
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index d022711b2a..ccf9c3d794 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -278,6 +278,8 @@ static ret_code cmd_identify_memory_device(struct c=
xl_cmd *cmd,
> >      } __attribute__((packed)) *id;
> >      _Static_assert(sizeof(*id) =3D=3D 0x43, "Bad identify size");
> > =20
> > +    CXLType3Dev *ct3d =3D container_of(cxl_dstate, CXLType3Dev, cxl_ds=
tate);
> > +    CXLType3Class *cvc =3D CXL_TYPE3_DEV_GET_CLASS(ct3d);
> >      uint64_t size =3D cxl_dstate->pmem_size;
> > =20
> >      if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> > @@ -292,6 +294,7 @@ static ret_code cmd_identify_memory_device(struct c=
xl_cmd *cmd,
> > =20
> >      id->total_capacity =3D size / (256 << 20);
> >      id->persistent_capacity =3D size / (256 << 20);
> > +    id->lsa_size =3D cvc->get_lsa_size(ct3d);
> > =20
> >      *len =3D sizeof(*id);
> >      return CXL_MBOX_SUCCESS;
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > index da091157f2..b16262d3cc 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c
> > @@ -13,21 +13,6 @@
> >  #include "sysemu/hostmem.h"
> >  #include "hw/cxl/cxl.h"
> > =20
> > -typedef struct cxl_type3_dev {
> > -    /* Private */
> > -    PCIDevice parent_obj;
> > -
> > -    /* Properties */
> > -    uint64_t size;
> > -    HostMemoryBackend *hostmem;
> > -
> > -    /* State */
> > -    CXLComponentState cxl_cstate;
> > -    CXLDeviceState cxl_dstate;
> > -} CXLType3Dev;
> > -
> > -#define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
> > - =20
>=20
> If the structure had been in the header to start with it would be easier
> to see the changes added for this bit.
>=20

Moved.. One other thing below.

>=20
> >  static void build_dvsecs(CXLType3Dev *ct3d)
> >  {
> >      CXLComponentState *cxl_cstate =3D &ct3d->cxl_cstate;
> > @@ -186,10 +171,16 @@ static Property ct3_props[] =3D {
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > =20
> > +static uint64_t get_lsa_size(CXLType3Dev *ct3d)
> > +{
> > +    return 0;
> > +}
> > +
> >  static void ct3_class_init(ObjectClass *oc, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(oc);
> >      PCIDeviceClass *pc =3D PCI_DEVICE_CLASS(oc);
> > +    CXLType3Class *cvc =3D CXL_TYPE3_DEV_CLASS(oc);
> > =20
> >      pc->realize =3D ct3_realize;
> >      pc->class_id =3D PCI_CLASS_STORAGE_EXPRESS;
> > @@ -201,11 +192,14 @@ static void ct3_class_init(ObjectClass *oc, void =
*data)
> >      dc->desc =3D "CXL PMEM Device (Type 3)";
> >      dc->reset =3D ct3d_reset;
> >      device_class_set_props(dc, ct3_props);
> > +
> > +    cvc->get_lsa_size =3D get_lsa_size;
> >  }
> > =20
> >  static const TypeInfo ct3d_info =3D {
> >      .name =3D TYPE_CXL_TYPE3_DEV,
> >      .parent =3D TYPE_PCI_DEVICE,
> > +    .class_size =3D sizeof(struct CXLType3Class),
> >      .class_init =3D ct3_class_init,
> >      .instance_size =3D sizeof(CXLType3Dev),
> >      .instance_finalize =3D ct3_finalize,
> > diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> > index 8102d2a813..ebb391153a 100644
> > --- a/include/hw/cxl/cxl_device.h
> > +++ b/include/hw/cxl/cxl_device.h
> > @@ -230,4 +230,33 @@ REG64(CXL_MEM_DEV_STS, 0)
> >      FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
> >      FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
> > =20
> > +typedef struct cxl_type3_dev {
> > +    /* Private */
> > +    PCIDevice parent_obj;
> > +
> > +    /* Properties */
> > +    uint64_t size;
> > +    HostMemoryBackend *hostmem;
> > +    HostMemoryBackend *lsa;
> > +
> > +    /* State */
> > +    CXLComponentState cxl_cstate;
> > +    CXLDeviceState cxl_dstate;
> > +} CXLType3Dev;
> > +
> > +#ifndef TYPE_CXL_TYPE3_DEV
> > +#define TYPE_CXL_TYPE3_DEV "cxl-type3"
> > +#endif

I'm not sure why the ifndef is needed. Probably a legacy of some
refactoring, so I've dropped that and the other definition of this
in cxl.h

> > +
> > +#define CT3(obj) OBJECT_CHECK(CXLType3Dev, (obj), TYPE_CXL_TYPE3_DEV)
> > +OBJECT_DECLARE_TYPE(CXLType3Device, CXLType3Class, CXL_TYPE3_DEV)
> > +
> > +struct CXLType3Class {
> > +    /* Private */
> > +    PCIDeviceClass parent_class;
> > +
> > +    /* public */
> > +    uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
> > +};
> > +
> >  #endif =20
>=20
>=20


