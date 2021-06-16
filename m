Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681B3A918F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:01:30 +0200 (CEST)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltOcD-0001cE-0X
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@fastmail.com.au>)
 id 1ltLwI-0000Pt-CS
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 23:10:02 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58442)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@fastmail.com.au>) id 1ltLwG-0006tz-EU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 23:10:02 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id BBBDB2BB06;
 Tue, 15 Jun 2021 23:09:53 -0400 (EDT)
Date: Wed, 16 Jun 2021 13:09:52 +1000 (AEST)
From: Finn Thain <fthain@fastmail.com.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 0/5] dp8393x: fixes for MacOS toolbox ROM
In-Reply-To: <2a2fff87-6e6f-3362-24e3-760f1aea4573@ilande.co.uk>
Message-ID: <17f0917-de30-6771-26d0-7a10214221ca@nippy.intranet>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
 <20a706c7-9b44-13cc-b294-1ee0f3cff6bb@amsat.org>
 <2a2fff87-6e6f-3362-24e3-760f1aea4573@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1492748151-1623812992=:6"
Received-SPF: neutral client-ip=98.124.60.144;
 envelope-from=fthain@fastmail.com.au; helo=kvm5.telegraphics.com.au
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 02:00:00 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aurelien@aurel32.net,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1492748151-1623812992=:6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 14 Jun 2021, Mark Cave-Ayland wrote:

> On 14/06/2021 06:36, Philippe Mathieu-Daud=C3=A9 wrote:
>=20
> > Cc'ing Finn & Laurent.
> >=20
> > On 6/13/21 6:37 PM, Mark Cave-Ayland wrote:
> > > Here is the next set of patches from my attempts to boot MacOS under=
=20
> > > QEMU's Q800 machine related to the Sonic network adapter.
> > >=20
> > > Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros=
=20
> > > to trace-events.
> > >=20
> > > Patch 3 fixes the PROM checksum and MAC address storage format as=20
> > > found by stepping through the MacOS toolbox.
> > >=20
> > > Patch 4 ensures that the CPU loads/stores are correctly converted to=
=20
> > > 16-bit accesses for the network card and patch 5 fixes a bug when=20
> > > selecting the index specified for CAM entries.
> > >=20
> > > NOTE TO MIPS MAINTAINERS:
> > >=20
> > > - The Sonic network adapter is used as part of the MIPS jazz machine,=
 however
> > >    I don't have a working kernel and system to test it with. Any=20
> > >    pointers to test images would be appreciated.
> > >=20
> > > - The changes to the PROM checksum in patch 3 were determined by step=
ping
> > >    through the MacOS toolbox, and is different from the existing=20
> > >    algorithm. Has the current PROM checksum algorithm been validated=
=20
> > >    on a MIPS guest or was it just a guess? It might be that 2=20
> > >    different algorithms are needed for the Q800 vs. Jazz machine.
> > >=20
> > > - My current guess is the jazzsonic driver is broken since the last s=
et of
> > >    dp8393x changes as the MIPS jazz machine does not set the "big_end=
ian"
> > >    property on the dp8393x device. I'd expect that the following diff=
 would
> > >    be needed, but I can't confirm this without a suitable test image.
> > >=20
> > > diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> > > index 1e1cf8154e..1df67035aa 100644
> > > --- a/hw/mips/jazz.c
> > > +++ b/hw/mips/jazz.c
> > > @@ -280,6 +280,7 @@ static void mips_jazz_init(MachineState *machine,
> > >               dev =3D qdev_new("dp8393x");
> > >               qdev_set_nic_properties(dev, nd);
> > >               qdev_prop_set_uint8(dev, "it_shift", 2);
> > > +             qdev_prop_set_bit(dev, "big_endian", true);
> > >               object_property_set_link(OBJECT(dev), "dma_mr",
> > >                                        OBJECT(rc4030_dma_mr), &error_=
abort);
> > >               sysbus =3D SYS_BUS_DEVICE(dev);
> > >=20
> > > Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > >=20
> > > [q800-macos-upstream patchset series: 3]
> > >=20
> > > Mark Cave-Ayland (5):
> > >    dp8393x: checkpatch fixes
> > >    dp8393x: convert to trace-events
> > >    dp8393x: fix PROM checksum and MAC address storage
> > >    dp8393x: don't force 32-bit register access
> > >    dp8393x: fix CAM descriptor entry index
> > >=20
> > >   hw/net/dp8393x.c    | 332 ++++++++++++++++++++++++-----------------=
---
> > >   hw/net/trace-events |  17 +++
> > >   2 files changed, 198 insertions(+), 151 deletions(-)
>=20
> Just to add that I've done a large amount of testing on the q800 machine=
=20
> with Linux/MacOS so I'm happy that these patches do the right thing=20
> there.
>=20
> The part I'm struggling with is testing against MIPS jazz since I don't=
=20
> have a Linux test image to hand, and there is no documentation in the=20
> original commit message as to where the existing PROM checksum algorithm=
=20
> came from.
>=20
> Herv=C3=A9, can you provide some more information on this? It looks like =
it=20
> was introduced in one of your commits:
>=20
> commit 89ae0ff9b73ee74c9ba707a09a07ad77b9fdccb4
> Author: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Date:   Wed Jun 3 22:45:46 2015 +0200
>=20
>     net/dp8393x: add PROM to store MAC address
>=20
>     Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>     Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>     Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
>     Signed-off-by: Leon Alrae <leon.alrae@imgtec.com>
>=20

With "qemu-system-mips -M magnum ..." I was able to boot both Linux and=20
NetBSD. That was after commit 89ae0ff9b7 ("net/dp8393x: add PROM to store=
=20
MAC address"). But that's not to say that the MAC address was decoded=20
correctly.

Please see,=20
https://lore.kernel.org/qemu-devel/alpine.LNX.2.21.1.1912241504560.11@nippy=
=2Eintranet/

The Linux/mips (jazzsonic) testing that I did back in 2019 used a custom=20
busybox initramfs. The NetBSD/mips testing used the official CD ISO image.=
=20
I will look into reviving those test harnesses because I think patch 4/5=20
and the proposed big-endian flag will need some regression testing.
---1463811774-1492748151-1623812992=:6--

