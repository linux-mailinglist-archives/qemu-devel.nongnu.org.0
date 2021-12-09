Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4646EC28
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:48:48 +0100 (CET)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLf5-0007U4-Ed
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mvLdp-00067m-DA
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:47:30 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mvLdm-0002RT-J2
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:47:29 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4J8z0G3KvTz67DYv;
 Thu,  9 Dec 2021 23:46:06 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 16:47:19 +0100
Received: from localhost (10.52.124.110) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 15:47:18 +0000
Date: Thu, 9 Dec 2021 15:47:15 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: RFC: x86 memory map, where to put CXL ranges?
Message-ID: <20211209154715.0000054c@Huawei.com>
In-Reply-To: <877dcdlurx.fsf@linaro.org>
References: <20211203175734.00002212@Huawei.com>
	<877dcdlurx.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.52.124.110]
X-ClientProxiedBy: lhreml749-chm.china.huawei.com (10.201.108.199) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 09 Dec 2021 14:19:59 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:
>=20
> > Hi All,
> >
> > For CXL emulation we require a couple of types of memory range that
> > are then provided to the OS via the CEDT ACPI table.
> >
> > 1) CXL Host Bridge Structures point to CXL Host Bridge Component Regist=
ers.
> > Small regions for each CXL Host bridge that are mapped into the memory =
space.
> > 64k each.  In theory we may have a huge number of these but in reality I
> > think 16 will do for any reasonable system.
> >
> > 2) CXL Fixed Memory Window Structures (CFMWS)
> > Large PA space ranges (multiple TB) to which various CXL devices can be=
 assigned
> > and their address decoders appropriately programmed.
> > Each such CFMWS will have particular characteristics such as interleavi=
ng across
> > multiple host bridges.  The can potentially be huge but are a system
> > characteristic.  For emulation purposes it won't matter if they move ar=
ound
> > dependent on what else is the machine has configured. So I'd like to
> > just configure their size rather than fully specify them at the command=
 line
> > and possibly clash on PA space with something else.  Alternatively could
> > leave them as fully specified at the command line (address and size) an=
d just
> > error out if the hit memory already in use for something else.
> >
> > Now unfortunately there are no systems out there yet that we can just
> > copy the memory map from...
> >
> > Coming form an Arm background I have only a vague idea of how this shou=
ld be
> > done for x86 so apologies if it is a stupid question.
> >
> > My current approach is to put these above device_memory and moving
> > the pci hole up appropriately. =20
>=20
> Which board model would be be talking about here? virt? Or maybe we need
> a new one?

Initially at least the plan is virt because all the acpi table building sup=
port
is there which makes things nice and easy.  It's not very invasive and there
has to be a machine level cxl=3Don to enable it so shouldn't be a maintenan=
ce problem
and doesn't justify new board model.

>=20
> If it's virt I would look at extended_memmap which floats above the
> configured RAM size and means less shuffling around of the relatively
> crowded lower address space.

I'll give that a go.

There are two types of regions to find space for.
1) Root complex control registers.  Those can go in the memory map.  Curren=
tly
I have them fitted in a gap in the low memory map but I'll move them to the=
 extended
one as doesn't matter if they are at a fixed address or not.
2) Fixed memory windows described in CEDT/CFMWS entries.
These are less obvious.  They are PA ranges with associated interleaving
(across host bridges) and peformance properties (related to platform QoS
control etc). They act as PA ranges into which we can assign particular dev=
ices.

For an initial patch set I plan to support no interleaving and just have
one such region per host bridge (currently pxb instance).
For these regions, my current choice is to put them above device_memory.
So at the command line you can specify a set of region sizes and we
then lay them out appropriately and describe those in CFMWS entries.
Ben's earlier code had these fully specified as base + size, but I don't
think there is any advantage in doing that as the info is presented to
the OS etc anyway so it doesn't matter if it changes. If it is
figured out at runtime we will have less problem with accidental clashes.

>=20
> I have no idea about how this is handled on x86 though.

I'll go with the show the code for that :)

Thanks,

Jonathan

>=20
> > Is that the right choice?
> >
> > On Arm I currently have the Host Bridge Structures low down in the MemM=
ap and the CFMWS
> > can go above the device memory.  Comments on that also welcome.
> >
> > In Ben's RFC the host bridge component register location was marked as =
a TODO
> > and a arbitrary address used in the meantime so time to figure out how =
to clean
> > that up.
> >
> > Thanks,
> >
> > Jonathan =20
>=20
>=20


