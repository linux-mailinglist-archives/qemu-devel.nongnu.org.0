Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222DB1B13
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 11:47:32 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8iAt-0005Fr-7J
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 05:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i8i9F-0004X1-9g
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 05:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i8i9D-000344-Tw
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 05:45:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i8i9A-00031K-NO; Fri, 13 Sep 2019 05:45:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B55AC8980EE;
 Fri, 13 Sep 2019 09:45:43 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22BB36012A;
 Fri, 13 Sep 2019 09:45:34 +0000 (UTC)
Date: Fri, 13 Sep 2019 11:45:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <20190913094533.GB8312@dhcp-200-226.str.redhat.com>
References: <20190912181924.48539-1-slp@redhat.com>
 <20190912155023-mutt-send-email-mst@kernel.org>
 <20190913090457.GA8312@dhcp-200-226.str.redhat.com>
 <87woecwnmv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <87woecwnmv.fsf@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 13 Sep 2019 09:45:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH] virtio-blk: schedule
 virtio_notify_config to run on main context
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
Cc: mreitz@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 13.09.2019 um 11:28 hat Sergio Lopez geschrieben:
>=20
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
> > Am 12.09.2019 um 21:51 hat Michael S. Tsirkin geschrieben:
> >> On Thu, Sep 12, 2019 at 08:19:25PM +0200, Sergio Lopez wrote:
> >> > Another AioContext-related issue, and this is a tricky one.
> >> >=20
> >> > Executing a QMP block_resize request for a virtio-blk device running
> >> > on an iothread may cause a deadlock involving the following mutexes:
> >> >=20
> >> >  - main thead
> >> >   * Has acquired: qemu_mutex_global.
> >> >   * Is trying the acquire: iothread AioContext lock via
> >> >     AIO_WAIT_WHILE (after aio_poll).
> >> >=20
> >> >  - iothread
> >> >   * Has acquired: AioContext lock.
> >> >   * Is trying to acquire: qemu_mutex_global (via
> >> >     virtio_notify_config->prepare_mmio_access).
> >>=20
> >> Hmm is this really the only case iothread takes qemu mutex?
> >> If any such access can deadlock, don't we need a generic
> >> solution? Maybe main thread can drop qemu mutex
> >> before taking io thread AioContext lock?
> >
> > The rule is that iothreads must not take the qemu mutex. If they do
> > (like in this case), it's a bug.
> >
> > Maybe we could actually assert this in qemu_mutex_lock_iothread()?
> >
> >> > With this change, virtio_blk_resize checks if it's being called from=
 a
> >> > coroutine context running on a non-main thread, and if that's the
> >> > case, creates a new coroutine and schedules it to be run on the main
> >> > thread.
> >> >=20
> >> > This works, but means the actual operation is done
> >> > asynchronously, perhaps opening a window in which a "device_del"
> >> > operation may fit and remove the VirtIODevice before
> >> > virtio_notify_config() is executed.
> >> >=20
> >> > I *think* it shouldn't be possible, as BHs will be processed before
> >> > any new QMP/monitor command, but I'm open to a different approach.
> >> >=20
> >> > RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1744955
> >> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> >> > ---
> >> >  hw/block/virtio-blk.c | 25 ++++++++++++++++++++++++-
> >> >  1 file changed, 24 insertions(+), 1 deletion(-)
> >> >=20
> >> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> >> > index 18851601cb..c763d071f6 100644
> >> > --- a/hw/block/virtio-blk.c
> >> > +++ b/hw/block/virtio-blk.c
> >> > @@ -16,6 +16,7 @@
> >> >  #include "qemu/iov.h"
> >> >  #include "qemu/module.h"
> >> >  #include "qemu/error-report.h"
> >> > +#include "qemu/main-loop.h"
> >> >  #include "trace.h"
> >> >  #include "hw/block/block.h"
> >> >  #include "hw/qdev-properties.h"
> >> > @@ -1086,11 +1087,33 @@ static int virtio_blk_load_device(VirtIODevi=
ce *vdev, QEMUFile *f,
> >> >      return 0;
> >> >  }
> >> > =20
> >> > +static void coroutine_fn virtio_resize_co_entry(void *opaque)
> >> > +{
> >> > +    VirtIODevice *vdev =3D opaque;
> >> > +
> >> > +    assert(qemu_get_current_aio_context() =3D=3D qemu_get_aio_conte=
xt());
> >> > +    virtio_notify_config(vdev);
> >> > +    aio_wait_kick();
> >> > +}
> >> > +
> >> >  static void virtio_blk_resize(void *opaque)
> >> >  {
> >> >      VirtIODevice *vdev =3D VIRTIO_DEVICE(opaque);
> >> > +    Coroutine *co;
> >> > =20
> >> > -    virtio_notify_config(vdev);
> >> > +    if (qemu_in_coroutine() &&
> >> > +        qemu_get_current_aio_context() !=3D qemu_get_aio_context())=
 {
> >> > +        /*
> >> > +         * virtio_notify_config() needs to acquire the global mutex,
> >> > +         * so calling it from a coroutine running on a non-main con=
text
> >> > +         * may cause a deadlock. Instead, create a new coroutine and
> >> > +         * schedule it to be run on the main thread.
> >> > +         */
> >> > +        co =3D qemu_coroutine_create(virtio_resize_co_entry, vdev);
> >> > +        aio_co_schedule(qemu_get_aio_context(), co);
> >> > +    } else {
> >> > +        virtio_notify_config(vdev);
> >> > +    }
> >> >  }
> >
> > Wouldn't a simple BH suffice (aio_bh_schedule_oneshot)? I don't see why
> > you need a coroutine when you never yield.
>=20
> You're right, that's actually simpler, haven't thought of it.
>=20
> Do you see any drawbacks or should I send a non-RFC fixed version of
> this patch?

Sending a fixed non-RFC version sounds good to me.

Kevin

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJde2U9AAoJEH8JsnLIjy/WjpUP/3QjGltLrSVnj/VwO6JBMunr
vYDclQVnHsOELm/YpmwURfERT3A7zzVSl4ErQQGdAENFj6yZqpTf7vSw1ogMViR1
5dK//Dm+bUbvX5HFJiOltFhS1SpZu19gUcVUkaqAYdQxz+dRQBZXFpNMuyFnrN6B
s2ryeVNx7UYhmxsfKRx3HOg4nHUkybfl6hps7S6XGFQsdUkiOZkb/k5yNFHuuF/H
tBmMW9sZx8mqAJIdYesRkpBw4j6PlPjM7e0u0B91KmxyqU0Q8OSbCuqX5vvcWYPQ
cojKiXu5LsJgFLqFR+W52f1Cy66owYRAeN1TN4FZx9NBb66Ub8cmXRsRMnpUTVme
0g386+7sIfuabx31yUuPiS6lvjSwVPDugq3HuodU4tHVOTvlNpksWb+UHwSqUSVR
qWZp9rbNs6g+XMSN0w4qsrMyBdajVLw+atWc18Fgu4csy97FNEca+8X62LztMVtv
JrV9wGDMW4EzvwBgwB1GQFYlBHz60zxmZ5Iw4XNX1SCDgolpR9NKqft5bOIHkYFj
ufzy8/teRgMX+Ilzn2dgndWCIhH+kIV1BqN1FrfovNzus9bwhmFOKNYbFsmZPfJl
cmoAzrPkWvErQPaKEzVMk+Qc14x9CE4hjwBKKmUgWSe8DyveFqSXMrPLsY3aPnkv
RKcZMk+xRoXTgSqkBj6C
=t1Jz
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--

