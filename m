Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F92F9D81
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:05:42 +0100 (CET)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SLt-0000Tl-3y
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l1SK2-0007bb-0a; Mon, 18 Jan 2021 06:03:46 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:46259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l1SJy-0003kj-UX; Mon, 18 Jan 2021 06:03:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 7EECC833632C;
 Mon, 18 Jan 2021 12:03:29 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 18 Jan
 2021 12:03:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c2288891-85d3-4f8d-828f-07c9b31a7f80,
 C55FA5616C381A35358043B9246BB8CC6413A4D0) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Mon, 18 Jan 2021 12:03:20 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
Message-ID: <20210118120320.22018f18@bahia.lan>
In-Reply-To: <20210118011203.GC2089552@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
 <20210115182216.6dccadee@bahia.lan>
 <20210118011203.GC2089552@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ix9u9wDbzq+OWnWjGHJ_hUS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4b3bb3c5-2064-4b91-b029-1d5691789292
X-Ovh-Tracer-Id: 7710162565509650851
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduveehvdduffdufffguddvgedtudfgkefgieffuedvgeeufffftdehvdevffekgeenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeiguhhmrgesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Xujun Ma <xuma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ix9u9wDbzq+OWnWjGHJ_hUS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Jan 2021 12:12:03 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 15, 2021 at 06:22:16PM +0100, Greg Kurz wrote:
> > On Thu, 14 Jan 2021 15:06:28 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >=20
> > > The only restriction we have when unplugging CPUs is to forbid unplug=
 of
> > > the boot cpu core. spapr_core_unplug_possible() does not contemplate =
the
> >=20
> > I can't remember why this restriction was introduced in the first place=
...
> > This should be investigated and documented if the limitation still stan=
ds.
> >=20
> > > possibility of some cores being offlined by the guest, meaning that w=
e're
> > > rolling the dice regarding on whether we're unplugging the last online
> > > CPU core the guest has.
> > >=20
> >=20
> > Trying to unplug the last CPU is obviously something that deserves
> > special care. LoPAPR is quite explicit on the outcome : this should
> > terminate the partition.
> >=20
> > 13.7.4.1.1. Isolation of CPUs
> >=20
> > The isolation of a CPU, in all cases, is preceded by the stop-self
> > RTAS function for all processor threads, and the OS insures that all
> > the CPU=E2=80=99s threads are in the RTAS stopped state prior to isolat=
ing the
> > CPU. Isolation of a processor that is not stopped produces unpredictable
> > results. The stopping of the last processor thread of a LPAR partition
> > effectively kills the partition, and at that point, ownership of all
> > partition resources reverts to the platform firmware.
> >=20
> > R1-13.7.4.1.1-1. For the LRDR option: Prior to issuing the RTAS
> > set-indicator specifying isolate isolation-state of a CPU DR
> > connector type, all the CPU threads must be in the RTAS stopped
> > state.
> >=20
> > R1-13.7.4.1.1-2. For the LRDR option: Stopping of the last processor
> > thread of a LPAR partition with the stop-self RTAS function, must kill
> > the partition, with ownership of all partition resources reverting to
> > the platform firmware.
> >=20
> > This is clearly not how things work today : linux doesn't call
> > "stop-self" on the last vCPU and even if it did, QEMU doesn't
> > terminate the VM.
>=20
> > If there's a valid reason to not implement this PAPR behavior, I'd like
> > it to be documented.
>=20
> So, we should implement this in QEMU - if you stop-self the last
> thread, it should be the equivalent of a power off.  Linux not ever
> doing that probably makes sense - it wants you to encourage you to
> shut down properly for data safety.
>=20

Yes I agree it's fine if linux enforces some safeguard to prevent
a brutal shutdown when writing 0 to /sys/devices/system/cpu/cpu?/online
within the guest. But in this case, off-lining is part of the usual CPU
unplug sequence, which was requested by the host : I don't think the
safeguard is relevant in this case. This PAPR _feature_ is just another
way of uncleanly shutting down the guest.

> > > If we hit the jackpot, we're going to detach the core DRC and pulse t=
he
> > > hotplug IRQ, but the guest OS will refuse to release the CPU. Our
> > > spapr_core_unplug() DRC release callback will never be called and the=
 CPU
> > > core object will keep existing in QEMU. No error message will be sent
> > > to the user, but the CPU core wasn't unplugged from the guest.
> > >=20
> > > If the guest OS onlines the CPU core again we won't be able to hotunp=
lug it
> > > either. 'dmesg' inside the guest will report a failed attempt to offl=
ine an
> > > unknown CPU:
> > >=20
> > > [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc:=
 -16
> > >=20
> > > This is the result of stopping the DRC state transition in the middle=
 in the
> > > first failed attempt.
> > >=20
> >=20
> > Yes, at this point only a machine reset can fix things up.
> >=20
> > Given this is linux's choice not to call "stop-self" as it should do, I=
'm not
> > super fan of hardcoding this logic in QEMU, unless there are really good
> > reasons to do so.
>=20
> Uh.. sorry I don't follow how linux is doing something wrong here.
>=20

Well... it doesn't finalize the hot-unplug sequence, and we have no
way to cope with that except a machine reset. So I would nearly say
this is working as expected : CPU hot unplug was requested and we
wait for the guest to release the CPU. Linux not wanting to release
the CPU until next reboot for some reason isn't really our concern.

> > > We can avoid this, and potentially other bad things from happening, i=
f we
> > > avoid to attempt the unplug altogether in this scenario. Let's check =
for
> > > the online/offline state of the CPU cores in the guest before allowing
> > > the hotunplug, and forbid removing a CPU core if it's the last one on=
line
> > > in the guest.
> > >=20

An unplug request can be accepted but its handling can still race with some
manual off-lining in the guest, which would leave us in the very same situa=
tion.
So I don't think this patch fixes anything actually (TOCTOU).

I tend to think that mixing manual CPU off-lining and CPU hot-unplug
is probably not the best thing to do in the first place, unless one
really knows what they're doing. Maybe we should rather document the
caveats instead of adding workarounds for what remains a corner case ?

> > > Reported-by: Xujun Ma <xuma@redhat.com>
> > > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1911414
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >  hw/ppc/spapr.c | 39 ++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index a2f01c21aa..d269dcd102 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -3709,9 +3709,16 @@ static void spapr_core_unplug(HotplugHandler *=
hotplug_dev, DeviceState *dev)
> > >  static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, C=
PUCore *cc,
> > >                                        Error **errp)
> > >  {
> > > +    CPUArchId *core_slot;
> > > +    SpaprCpuCore *core;
> > > +    PowerPCCPU *cpu;
> > > +    CPUState *cs;
> > > +    bool last_cpu_online =3D true;
> > >      int index;
> > > =20
> > > -    if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &ind=
ex)) {
> > > +    core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core=
_id,
> > > +                                    &index);
> > > +    if (!core_slot) {
> > >          error_setg(errp, "Unable to find CPU core with core-id: %d",
> > >                     cc->core_id);
> > >          return -1;
> > > @@ -3722,6 +3729,36 @@ static int spapr_core_unplug_possible(HotplugH=
andler *hotplug_dev, CPUCore *cc,
> > >          return -1;
> > >      }
> > > =20
> > > +    /* Allow for any non-boot CPU core to be unplugged if already of=
fline */
> > > +    core =3D SPAPR_CPU_CORE(core_slot->cpu);
> > > +    cs =3D CPU(core->threads[0]);
> > > +    if (cs->halted) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    /*
> > > +     * Do not allow core unplug if it's the last core online.
> > > +     */
> > > +    cpu =3D POWERPC_CPU(cs);
> > > +    CPU_FOREACH(cs) {
> > > +        PowerPCCPU *c =3D POWERPC_CPU(cs);
> > > +
> > > +        if (c =3D=3D cpu) {
> > > +            continue;
> > > +        }
> > > +
> > > +        if (!cs->halted) {
> > > +            last_cpu_online =3D false;
> > > +            break;
> > > +        }
> > > +    }
> > > +
> > > +    if (last_cpu_online) {
> > > +        error_setg(errp, "Unable to unplug CPU core with core-id %d:=
 it is "
> > > +                   "the only CPU core online in the guest", cc->core=
_id);
> > > +        return -1;
> > > +    }
> > > +
> > >      return 0;
> > >  }
> > > =20
> >=20
>=20


--Sig_/ix9u9wDbzq+OWnWjGHJ_hUS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmAFavgACgkQcdTV5YIv
c9YGqRAAkKxbMDAMSE/8hZyxiKQyv9PW+ibS57fDS6mFpxCbseq0XvdbAtggYXfi
7KOy9RhfHPCIsuGvsYALuG4F6TE76AlA40pXEXWywtydoY3or0wBoXKNWBXjfvCJ
dGY+86YBTLy1D+Ss/x0y8V+SMD+3ysmWscu3gyQaDkiOudwmoHBzokjc9AqSruTP
O3DNwVfP1dbhAuRcudJznB0VSN+eEu9GNhPiyFQ/LF+/ql8UaGIN26xXFAuDn4vn
lS4aLJS6Mv5HF0UNHiu1if07AHvxA/YOPCaJ716P9cs0kvQtotb4au8mfiHljstG
1ZV4wJPPob5Cs6rbF+nrNiJCmV2mYhOhfMj5V4RSNd4uyGdXVmsOy/4rTYDfKr5n
XmM3GR0DgRorsOH2l3M6npveeFw5xLcf4vK6aOVDEs7wT9dyPlO7yYsLeZM7uILB
X3ZJUsnet5tMFV6y0hRItkizr5bd1oOKVUXF1MjdN2NHyLlOMHyUJcb99xGOGxK6
fg47tVYk/JBTnrqaS2rAT92bonBvlqkeFkBmw/eIvSosjyHgeZjyf+/9Pcl8hDa4
CHPZZCF+dCxSYd69yRIUUgp4nM0Dip1aCyZOiAC2n/RtFQmGhKIdJBJG/JHvq3hN
O6VuurSbhvD/NKKWZZU5KWEiupgg1F2w7zC7a6BlKKZzbVbSsyA=
=W6xM
-----END PGP SIGNATURE-----

--Sig_/ix9u9wDbzq+OWnWjGHJ_hUS--

