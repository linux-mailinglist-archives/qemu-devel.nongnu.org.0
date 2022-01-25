Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA749BB16
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 19:18:18 +0100 (CET)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQOX-00072c-2S
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 13:18:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nCQJu-0004sU-SX
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:13:30 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nCQJj-0006E1-Vx
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:13:23 -0500
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjvyP5Jypz689Q8;
 Wed, 26 Jan 2022 02:09:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 25 Jan 2022 19:13:15 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 25 Jan
 2022 18:13:14 +0000
Date: Tue, 25 Jan 2022 18:13:13 +0000
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
Subject: Re: [PATCH v4 31/42] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Message-ID: <20220125181313.0000209c@huawei.com>
In-Reply-To: <87o83zd99r.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-32-Jonathan.Cameron@huawei.com>
 <87o83zd99r.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 25 Jan 2022 17:15:58 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > This adds code to instantiate the slightly extended ACPI root port
> > description in DSDT as per the CXL 2.0 specification.
> >
> > Basically a cut and paste job from the i386/pc code. =20
>=20
> This fails to build on all machines:
>=20
>   FAILED: qemu-system-mips64el=20
>   c++ -m64 -mcx16  -o qemu-system-mips64el qemu-system-mips64el.p/softmmu=
_main.c.o <snip> subprojects/libvhost-user/libvhost-user.a libmigration.fa =
libhwcore.fa libqom.fa libio.fa libcrypto.fa libauthz.fa libblockdev.fa lib=
block.fa libchardev.fa libqmp.fa @block.syms @qemu.syms /usr/lib/x86_64-lin=
ux-gnu/libpixman-1.so -lepoxy /usr/lib/x86_64-linux-gnu/libcapstone.so /usr=
/lib/x86_64-linux-gnu/libspice-server.so -Xlinker --dynamic-list=3D/home/al=
ex/lsrc/qemu.git/plugins/qemu-plugins.symbols /usr/lib/x86_64-linux-gnu/lib=
z.so /usr/lib/x86_64-linux-gnu/libpng16.so /usr/lib/x86_64-linux-gnu/libjpe=
g.so /usr/lib/x86_64-linux-gnu/libgnutls.so -lsasl2 /usr/lib/x86_64-linux-g=
nu/libpmem.so /usr/lib/x86_64-linux-gnu/libseccomp.so -lnuma -lgio-2.0 -lgo=
bject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lrdmacm -libverbs =
-libumad /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/libzstd=
.so /usr/lib/x86_64-linux-gnu/libslirp.so /usr/lib/x86_64-linux-gnu/libglib=
-2.0.so -lvdeplug /usr/lib/x86_64-linux-gnu/libudev.so /usr/lib/x86_64-linu=
x-gnu/libbpf.so /usr/lib/x86_64-linux-gnu/libasound.so /usr/lib/x86_64-linu=
x-gnu/libpulse.so -lbrlapi /usr/lib/x86_64-linux-gnu/libvirglrenderer.so /u=
sr/lib/x86_64-linux-gnu/libusb-1.0.so /usr/lib/x86_64-linux-gnu/libusbredir=
parser.so /usr/lib/x86_64-linux-gnu/libcacard.so -lncursesw -ltinfo -pthrea=
d -lgmodule-2.0 -lglib-2.0 /usr/lib/x86_64-linux-gnu/libgbm.so /usr/lib/x86=
_64-linux-gnu/libgtk-3.so /usr/lib/x86_64-linux-gnu/libgdk-3.so /usr/lib/x8=
6_64-linux-gnu/libpangocairo-1.0.so /usr/lib/x86_64-linux-gnu/libpango-1.0.=
so /usr/lib/x86_64-linux-gnu/libharfbuzz.so /usr/lib/x86_64-linux-gnu/libat=
k-1.0.so /usr/lib/x86_64-linux-gnu/libcairo-gobject.so /usr/lib/x86_64-linu=
x-gnu/libcairo.so /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so /usr/lib/x=
86_64-linux-gnu/libgio-2.0.so /usr/lib/x86_64-linux-gnu/libgobject-2.0.so /=
usr/lib/x86_64-linux-gnu/libvte-2.91.so /usr/lib/x86_64-linux-gnu/libX11.so=
 @block.syms -lutil -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-=
2.0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lm -lgmodule-2.0 -lglib-2.0 /usr/l=
ib/x86_64-linux-gnu/libiscsi.so -laio /usr/lib/x86_64-linux-gnu/libcurl.so =
-lgmodule-2.0 -lglib-2.0 -lbz2 /usr/lib/x86_64-linux-gnu/libacl.so /usr/lib=
/x86_64-linux-gnu/libgfapi.so /usr/lib/x86_64-linux-gnu/libglusterfs.so /us=
r/lib/x86_64-linux-gnu/libgfrpc.so /usr/lib/x86_64-linux-gnu/libgfxdr.so /u=
sr/lib/x86_64-linux-gnu/libuuid.so /usr/lib/x86_64-linux-gnu/libnfs.so -lrb=
d -lrados /usr/lib/x86_64-linux-gnu/libssh.so -lstdc++ -Wl,--end-group
>   /usr/bin/ld: /lib/x86_64-linux-gnu/libtirpc.so.3: warning: common of `r=
pc_createerr@@GLIBC_2.2.5' overridden by definition from /lib/x86_64-linux-=
gnu/libc.so.6
>   /usr/bin/ld: libcommon.fa.p/hw_pci-host_gpex-acpi.c.o: in function `acp=
i_dsdt_add_gpex':
>   /home/alex/lsrc/qemu.git/builds/all/../../hw/pci-host/gpex-acpi.c:191: =
undefined reference to `build_cxl_osc_method'
>   collect2: error: ld returned 1 exit status
>   [1600/2203] Linking target qemu-system-or1k
>=20
>=20
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > ---
> >  hw/arm/Kconfig          |  1 +
> >  hw/pci-host/gpex-acpi.c | 22 +++++++++++++++++++---
> >  2 files changed, 20 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 2e0049196d..3df419fa6d 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -29,6 +29,7 @@ config ARM_VIRT
> >      select ACPI_APEI
> >      select ACPI_VIOT
> >      select VIRTIO_MEM_SUPPORTED
> > +    select ACPI_CXL
> > =20
> >  config CHEETAH
> >      bool
> > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > index e7e162a00a..fb60aa517f 100644
> > --- a/hw/pci-host/gpex-acpi.c
> > +++ b/hw/pci-host/gpex-acpi.c
> > @@ -5,6 +5,7 @@
> >  #include "hw/pci/pci_bus.h"
> >  #include "hw/pci/pci_bridge.h"
> >  #include "hw/pci/pcie_host.h"
> > +#include "hw/acpi/cxl.h"
> > =20
> >  static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
> >  {
> > @@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConf=
ig *cfg)
> >          QLIST_FOREACH(bus, &bus->child, sibling) {
> >              uint8_t bus_num =3D pci_bus_num(bus);
> >              uint8_t numa_node =3D pci_bus_numa_node(bus);
> > +            bool is_cxl;
> > =20
> >              if (!pci_bus_is_root(bus)) {
> >                  continue;
> > @@ -153,9 +155,19 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXCon=
fig *cfg)
> >                  nr_pcie_buses =3D bus_num;
> >              }
> > =20
> > +            is_cxl =3D pci_bus_is_cxl(bus);
> > +
> >              dev =3D aml_device("PC%.02X", bus_num);
> > -            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08"=
)));
> > -            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03"=
)));
> > +            if (is_cxl) {
> > +                struct Aml *pkg =3D aml_package(2);
> > +                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI=
0016")));
> > +                aml_append(pkg, aml_eisaid("PNP0A08"));
> > +                aml_append(pkg, aml_eisaid("PNP0A03"));
> > +                aml_append(dev, aml_name_decl("_CID", pkg));
> > +            } else {
> > +                aml_append(dev, aml_name_decl("_HID", aml_string("PNP0=
A08")));
> > +                aml_append(dev, aml_name_decl("_CID", aml_string("PNP0=
A03")));
> > +            }
> >              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
> >              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
> >              aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Dev=
ice")));
> > @@ -175,7 +187,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXCon=
fig *cfg)
> >                              cfg->pio.base, 0, 0, 0);
> >              aml_append(dev, aml_name_decl("_CRS", crs));
> > =20
> > -            acpi_dsdt_add_pci_osc(dev);
> > +            if (is_cxl) {
> > +                build_cxl_osc_method(dev); =20
>=20
> Either we need an #ifdef gate on CONFIG_ACPI_CXL

 error: attempt to use poisoned "CONFIG_ACPI_CXL"

> or possibly a stub
> implementation (with a g_assert_not_reached()).
That works.

Turns out I was too lazy thinking riscv was enough to exercise the
not CXL support case.

Lesson learned - mips64el now in my standard config :)
I'd not realized there were ACPI supporting MIPS machines...

Thanks,

Jonathan



>=20
> > +            } else {
> > +                acpi_dsdt_add_pci_osc(dev);
> > +            }
> > =20
> >              aml_append(scope, dev);
> >          } =20
>=20
>=20


