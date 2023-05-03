Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44766F54C6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:32:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8qU-0002JR-Ek; Wed, 03 May 2023 05:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu8qR-0002JH-So
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:32:19 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu8qO-0007Vg-Ra
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:32:19 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QBBXq0GJ3z67qJT;
 Wed,  3 May 2023 17:31:39 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 3 May
 2023 10:32:00 +0100
Date: Wed, 3 May 2023 10:31:59 +0100
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>,
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Dave Jiang <dave.jiang@intel.com>,
 Fan Ni <fan.ni@samsung.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
Message-ID: <20230503103159.000008e5@Huawei.com>
In-Reply-To: <20230503000825-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
 <ZEhzaWpNM+NvZCUw@x1n>
 <20230426021019-mutt-send-email-mst@kernel.org>
 <875y9jglfr.fsf@secure.mitica>
 <109bc1e721e009894bf4b1529fe1904afce1e13e.camel@redhat.com>
 <20230503000825-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 00:08:55 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 02, 2023 at 09:32:34PM -0300, Leonardo Br=C3=A1s wrote:
> > Hello Michael, Juan, Peter,
> >=20
> > On Wed, 2023-04-26 at 09:19 +0200, Juan Quintela wrote: =20
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote: =20
> > > > On Tue, Apr 25, 2023 at 08:42:17PM -0400, Peter Xu wrote: =20
> > > > > Hi, Michael, Jonathan,
> > > > >=20
> > > > > On Tue, Mar 07, 2023 at 08:13:53PM -0500, Michael S. Tsirkin wrot=
e:
> > > > > This breaks the simplest migration from QEMU 8.0->7.2 binaries on=
 all
> > > > > machine types I think as long as the cap is present, e.g. the def=
ault
> > > > > e1000e provided by the default q35 machine can already hit it wit=
h all
> > > > > default cmdline:
> > > > >=20
> > > > >   ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> > > > >=20
> > > > > 7.2 binary will have empty wmask for PCI_ERR_UNCOR_MASK, meanwhil=
e I think
> > > > > it can also see a non-zero value, then the migration will fail at:
> > > > >=20
> > > > > vmstate_load 0000:00:02.0/e1000e, e1000e                         =
                         =20
> > > > > qemu-7.2: get_pci_config_device: Bad config data: i=3D0x10a read:=
 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> > > > > qemu-7.2: Failed to load PCIDevice:config  =20
> > > > > qemu-7.2: Failed to load e1000e:parent_obj                       =
                        =20
> > > > > qemu-7.2: error while loading state for instance 0x0 of device '0=
000:00:02.0/e1000e'     =20
> > > > > qemu-7.2: load of migration failed: Invalid argument
> > > > >=20
> > > > > We probably at least want to have the default value to be still z=
ero, and
> > > > > we'd need to make sure it'll not be modified by the guest, iiuc.
> > > > >=20
> > > > > Below oneliner works for me and makes the migration work again:
> > > > >=20
> > > > > =3D=3D=3D8<=3D=3D=3D
> > > > > diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> > > > > index 103667c368..563a37b79c 100644
> > > > > --- a/hw/pci/pcie_aer.c
> > > > > +++ b/hw/pci/pcie_aer.c
> > > > > @@ -113,7 +113,7 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap=
_ver, uint16_t offset,
> > > > >      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
> > > > >                   PCI_ERR_UNC_SUPPORTED);
> > > > >      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> > > > > -                 PCI_ERR_UNC_MASK_DEFAULT);
> > > > > +                 0/*PCI_ERR_UNC_MASK_DEFAULT*/);
> > > > >      pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> > > > >                   PCI_ERR_UNC_SUPPORTED);
> > > > > =3D=3D=3D8<=3D=3D=3D
> > > > >=20
> > > > > Anyone could have a look on a solid solution from PCI side?
> > > > >=20
> > > > > Copy Juan and Leonardo.
> > > > >=20
> > > > > Thanks, =20
> > > >=20
> > > > My bad, I forgot about this =F0=9F=A4=A6.
> > > > So we need a property and tweak it with compat machinery depending =
on
> > > > machine type. Jonathan, can you work on this pls?
> > > > Or I can revert for now to relieve the time pressure,
> > > > redo the patch at your leasure. =20
> > >=20
> > > I agree with Michael here, the best option is adding a new property.
> > >=20
> > > Later, Juan.
> > >  =20
> >=20
> > I sent a patch implementing the suggested fix:
> > https://lore.kernel.org/qemu-devel/20230503002701.854329-1-leobras@redh=
at.com/T/#u
> >=20
> > Please let me know of anything to improve.
> >=20
> > Best regards,
> > Leo =20
>=20
> Weird, didn't get it for some reason. Pulled it from lore now, thanks!
>=20

Thanks all. Sorry for lack of reply, crazy week at a conference, so I wasn't
successfully keeping up with email and still working through backlog.
Obviously I forgot about migration across versions.  Sorry!

The fix Leo posted looks good to me.  Given in theory a previously loaded
driver /firmware could have set these all to 0, any driver code should not
be assuming they take the defaults in the PCI spec.  Might make a difference
to any testing using errors injected very early (e.g. before drivers load)
but meh, that's a corner case no one has hit previously so I doubt they eve=
r will.

Thanks to all involved.

Jonathan

