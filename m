Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B8649FD69
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:59:42 +0100 (CET)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTf3-0004YZ-Ep
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDSz3-00038s-Ew
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:16:18 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDSz0-0004BS-NO
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:16:17 -0500
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JlgsY6yDMz67xJ8;
 Fri, 28 Jan 2022 23:11:45 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Fri, 28 Jan 2022 16:16:11 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 15:16:09 +0000
Date: Fri, 28 Jan 2022 15:16:07 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 05/42] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Message-ID: <20220128151607.000022b7@huawei.com>
In-Reply-To: <87tudqbbr7.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-6-Jonathan.Cameron@huawei.com>
 <87tudqbbr7.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
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

On Wed, 26 Jan 2022 18:17:12 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > This implements all device MMIO up to the first capability. That
> > includes the CXL Device Capabilities Array Register, as well as all of
> > the CXL Device Capability Header Registers. The latter are filled in as
> > they are implemented in the following patches.
> >
> > Endianness and alignment are managed by softmmu memory core.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-device-utils.c   | 105 ++++++++++++++++++++++++++++++++++++
> >  hw/cxl/meson.build          |   1 +
> >  include/hw/cxl/cxl_device.h |  28 +++++++++-
> >  3 files changed, 133 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > new file mode 100644
> > index 0000000000..cb1b0a8217
> > --- /dev/null
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -0,0 +1,105 @@
> > +/*
> > + * CXL Utility library for devices
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/cxl/cxl.h"
> > +
> > +/*
> > + * Device registers have no restrictions per the spec, and so fall bac=
k to the
> > + * default memory mapped register rules in 8.2:
> > + *   Software shall use CXL.io Memory Read and Write to access memory =
mapped
> > + *   register defined in this section. Unless otherwise specified, sof=
tware
> > + *   shall restrict the accesses width based on the following:
> > + *   =E2=80=A2 A 32 bit register shall be accessed as a 1 Byte, 2 Byte=
s or 4 Bytes
> > + *     quantity.
> > + *   =E2=80=A2 A 64 bit register shall be accessed as a 1 Byte, 2 Byte=
s, 4 Bytes or 8
> > + *     Bytes
> > + *   =E2=80=A2 The address shall be a multiple of the access width, e.=
g. when
> > + *     accessing a register as a 4 Byte quantity, the address shall be
> > + *     multiple of 4.
> > + *   =E2=80=A2 The accesses shall map to contiguous bytes.If these rul=
es are not
> > + *     followed, the behavior is undefined
> > + */
> > +
> > +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned si=
ze)
> > +{
> > +    CXLDeviceState *cxl_dstate =3D opaque;
> > +
> > +    return cxl_dstate->caps_reg_state32[offset / 4];
> > +}
> > +
> > +static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned siz=
e)
> > +{
> > +    return 0;
> > +}
> > +
> > +static const MemoryRegionOps dev_ops =3D {
> > +    .read =3D dev_reg_read,
> > +    .write =3D NULL, /* status register is read only */
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 8,
> > +        .unaligned =3D false,
> > +    },
> > +    .impl =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 8,
> > +    },
> > +}; =20
>=20
> I think for >64 bit registers you need to use the read_with_attrs=20

I don't follow this comment.  Max access to registers is 64 bits.
A few are documented as 128 bit or indeed larger in the spec, but the
access is as if they were multiple 64 bit registers accesses.
It's not permissible to do a single 128bit access for example.

The F4 errata clarified that - previously it was rather unclear what
the restrictions on access to the larger registers were.

I've updated a few comments on this to reflect the errata.

Thanks,

Jonathan

