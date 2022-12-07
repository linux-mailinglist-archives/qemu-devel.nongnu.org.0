Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ABC645AF0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uMj-0002Ln-88; Wed, 07 Dec 2022 08:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p2uMg-0002Io-VK
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:21:34 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p2uMc-0007MF-VW
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:21:34 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NRyXK5Tcqz6J6JC;
 Wed,  7 Dec 2022 21:18:25 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 13:21:20 +0000
Date: Wed, 7 Dec 2022 13:21:19 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ben Widawsky
 <ben.widawsky@intel.com>, "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Message-ID: <20221207132119.000036a8@huawei.com>
In-Reply-To: <87y1rlnb28.fsf@linaro.org>
References: <20220616165703.42226-1-mst@redhat.com>
 <20220616165703.42226-3-mst@redhat.com>
 <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
 <06f4e22c-1c30-42a6-6f80-1f04e9d55c96@redhat.com>
 <20221205105403.00003d0f@huawei.com>
 <20221205124516.00006362@huawei.com> <87y1rlnb28.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 05 Dec 2022 14:59:39 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron via <qemu-devel@nongnu.org> writes:
>=20
> > On Mon, 5 Dec 2022 10:54:03 +0000
> > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> > =20
> >> On Sun, 4 Dec 2022 08:23:55 +0100
> >> Thomas Huth <thuth@redhat.com> wrote:
> >>  =20
> >> > On 04/11/2022 07.47, Thomas Huth wrote:   =20
> >> > > On 16/06/2022 18.57, Michael S. Tsirkin wrote:     =20
> >> > >> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> > >>
> >> > >> Emulation of a simple CXL Switch downstream port.
> >> > >> The Device ID has been allocated for this use.
> >> > >>
> >> > >> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> > >> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
> >> > >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> > >> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >> > >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> > >> ---
> >> > >> =A0 hw/cxl/cxl-host.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 43 +++++-
> >> > >> =A0 hw/pci-bridge/cxl_downstream.c | 249 ++++++++++++++++++++++++=
+++++++++
> >> > >> =A0 hw/pci-bridge/meson.build=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> >> > >> =A0 3 files changed, 291 insertions(+), 3 deletions(-)
> >> > >> =A0 create mode 100644 hw/pci-bridge/cxl_downstream.c     =20
> >> > >=20
> >> > >  =A0Hi!
> >> > >=20
> >> > > There is a memory problem somewhere in this new device. I can make=
 QEMU=20
> >> > > crash by running something like this:
> >> > >=20
> >> > > $ MALLOC_PERTURB_=3D59 ./qemu-system-x86_64 -M x-remote \
> >> > >  =A0=A0=A0 -display none -monitor stdio
> >> > > QEMU 7.1.50 monitor - type 'help' for more information
> >> > > (qemu) device_add cxl-downstream
> >> > > ./qemu/qom/object.c:1188:5: runtime error: member access within mi=
saligned=20
> >> > > address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which require=
s 8 byte=20
> >> > > alignment
> >> > > 0x3b3b3b3b3b3b3b3b: note: pointer points here
> >> > > <memory cannot be printed>
> >> > > Bus error (core dumped)
> >> > >=20
> >> > > Could you have a look if you've got some spare minutes?     =20
> >> >=20
> >> > Ping! Jonathan, Michael, any news on this bug?
> >> >=20
> >> > (this breaks one of my local tests, that's why it's annoying for me)=
   =20
> >> Sorry, my email filters ate your earlier message.
> >>=20
> >> Looking into this now. I'll note that it also happens on
> >> device_add xio3130-downstream so not specific to this new device.
> >>=20
> >> So far all I've managed to do is track it to something rcu related
> >> as failing in a call to drain_call_rcu() in qmp_device_add()
> >>=20
> >> Will continue digging. =20
> >
> > Assuming I'm seeing the same thing...
> >
> > Problem is g_free() on the PCIBridge windows:=20
> > https://elixir.bootlin.com/qemu/latest/source/hw/pci/pci_bridge.c#L235
> >
> > Is called before we get an rcu_call() to flatview_destroy() as a
> > result of the final call of flatview_unref() in address_space_set_flatv=
iew()
> > so we get a use after free.
> >
> > As to what the fix is...  Suggestions welcome! =20
>=20
> It sounds like this is the wrong place to free the value then. I guess
> the PCI aliases into &w->alias_io() don't get dealt with until RCU
> clean-up time.
>=20
> I *think* using g_free_rcu() should be enough to ensure the free occurs
> after the rest of the RCU cleanups but maybe you should only be cleaning
> up the windows at device unrealize time? Is this a dynamic piece of
> memory which gets updated during the lifetime of the device?

There is unfortunately code that swaps it for an updated structure
in pci_bridge_update_mappings()

>=20
> If the memory is being cleared with RCU then the access to the base
> pointer should be done with the appropriate qatomic_rcu_[set|read]
> functions.
>

I'm annoyingly snowed under this week with other things, but hopefully
can get to in a few days.  Note we are looking at an old problem
here, just one that's happening for an additional device, not sure
if that really affects urgency of fix though.

Jonathan
=20


