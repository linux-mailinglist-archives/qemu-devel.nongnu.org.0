Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB694F2937
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 10:50:10 +0200 (CEST)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbet7-0004kE-Jl
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 04:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nbeoF-0002AV-1i
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:45:07 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nbeo9-000366-MJ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:45:06 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KXh2z4DRYz686y1;
 Tue,  5 Apr 2022 16:42:03 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 5 Apr 2022 10:44:57 +0200
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 5 Apr
 2022 09:44:56 +0100
Date: Tue, 5 Apr 2022 09:44:54 +0100
To: Tong Zhang <ztong0001@gmail.com>
CC: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Benn?=
 =?ISO-8859-1?Q?=E9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, <linux-cxl@vger.kernel.org>, Ben Widawsky
 <ben.widawsky@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, "k . jensen @ samsung . com"
 <k.jensen@samsung.com>, Tong Zhang <t.zhang2@samsung.com>,
 <dave@stgolabs.net>, Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH v9 18/45] hw/cxl/device: Implement MMIO HDM decoding
 (8.2.5.12)
Message-ID: <20220405094454.00006ee7@Huawei.com>
In-Reply-To: <FC543734-8626-4F14-8449-E22969D18A7D@gmail.com>
References: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
 <20220404151445.10955-19-Jonathan.Cameron@huawei.com>
 <FC543734-8626-4F14-8449-E22969D18A7D@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml737-chm.china.huawei.com (10.201.108.187) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 4 Apr 2022 12:19:07 -0700
Tong Zhang <ztong0001@gmail.com> wrote:

> > On Apr 4, 2022, at 8:14 AM, Jonathan Cameron via <qemu-devel@nongnu.org=
> wrote:
> >=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >=20
> > A device's volatile and persistent memory are known Host Defined Memory
> > (HDM) regions. The mechanism by which the device is programmed to claim
> > the addresses associated with those regions is through dedicated logic
> > known as the HDM decoder. In order to allow the OS to properly program
> > the HDMs, the HDM decoders must be modeled.
> >=20
> > There are two ways the HDM decoders can be implemented, the legacy
> > mechanism is through the PCIe DVSEC programming from CXL 1.1 (8.1.3.8),
> > and MMIO is found in 8.2.5.12 of the spec. For now, 8.1.3.8 is not
> > implemented.
> >=20
> > Much of CXL device logic is implemented in cxl-utils. The HDM decoder
> > however is implemented directly by the device implementation.
> > Whilst the implementation currently does no validity checks on the
> > encoder set up, future work will add sanity checking specific to
> > the type of cxl component.
> >=20
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> > hw/mem/cxl_type3.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 55 insertions(+)
> >=20
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > index 329a6ea2a9..5c93fbbd9b 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c

...

> > +
> > +static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> > +                           unsigned size)
> > +{
> > +    CXLComponentState *cxl_cstate =3D opaque;
> > +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> > +    CXLType3Dev *ct3d =3D container_of(cxl_cstate, CXLType3Dev, cxl_cs=
tate);
> > +    uint32_t *cache_mem =3D cregs->cache_mem_registers;
> > +    bool should_commit =3D false;
> > +    int which_hdm =3D -1;
> > +
> > +    assert(size =3D=3D 4);
> > +    g_assert(offset <=3D CXL2_COMPONENT_CM_REGION_SIZE);
> > + =20
>=20
> Looks like this will allow offset =3D=3D CXL2_COMPONENT_CM_REGION_SIZE to=
 pass the check, and cause a buffer overrun.
> Shouldn=E2=80=99t this be g_assert(offset< CXL2_COMPONENT_CM_REGION_SIZE)?

Good point.  Silly mistake.  I'll fix for v10.

> We also need to make sure (offset + 4<=3D CXL2_COMPONENT_CM_REGION_SIZE).

> Or maybe we just need offset +4 <=3D CXL2_COMPONENT_CM_REGION_SIZE here, =
if offset < CXL2_COMPONENT_CM_REGION_SIZE is already checked somewhere else.

I think we are fine without these two because in cxl-components-utils we
restrict the accesses to aligned only.

Jonathan


>=20
> > +    switch (offset) {
> > +    case A_CXL_HDM_DECODER0_CTRL:
> > +        should_commit =3D FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COM=
MIT);
> > +        which_hdm =3D 0;
> > +        break;
> > +    default:
> > +        break;
> > +    }
> > +
> > +    stl_le_p((uint8_t *)cache_mem + offset, value);
> > +    if (should_commit) {
> > +        hdm_decoder_commit(ct3d, which_hdm);
> > +    }
> > +}


