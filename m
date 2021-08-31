Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BA3FCC55
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:29:40 +0200 (CEST)
Received: from localhost ([::1]:43842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7Zj-0001Da-CV
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL7C3-0001bW-Rf
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:05:06 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:34944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL7C1-00006i-76
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:05:03 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-_YnBTT4JOoGdxbvY5z3gSA-1; Tue, 31 Aug 2021 13:04:57 -0400
X-MC-Unique: _YnBTT4JOoGdxbvY5z3gSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D51B1106F8AA;
 Tue, 31 Aug 2021 17:04:56 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E293C27C2C;
 Tue, 31 Aug 2021 17:04:55 +0000 (UTC)
Date: Tue, 31 Aug 2021 19:04:54 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs: Twalk crash
Message-ID: <20210831190454.5c725f2b@bahia.lan>
In-Reply-To: <1644903.jVc9DcbYlq@silver>
References: <4325838.qn0ATYcOi1@silver> <20210831125749.15c42c33@bahia.lan>
 <1644903.jVc9DcbYlq@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 17:00:32 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 31. August 2021 12:57:49 CEST Greg Kurz wrote:
> > On Mon, 30 Aug 2021 17:55:04 +0200
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Apparently commit 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 '9pfs: red=
uce
> > > latency of Twalk' has introduced occasional crashes.
> > >=20
> > > My first impression after looking at the backtrace: looks like the pa=
tch
> > > itself is probably not causing this, but rather unmasked this issue (=
i.e.
> > > increased the chance to be triggered).
> > >=20
> > > The crash is because of 'elem' is NULL in virtio_pdu_vunmarshal() (fr=
ame
> > > 0).
> > Ouch... this certainly isn't expected to happen :-\
> >=20
> > elem is popped out the vq in handle_9p_output():
> >=20
> >         elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
> >         if (!elem) {
> >             goto out_free_pdu;
> >         }
> > [...]
> >         v->elems[pdu->idx] =3D elem;
> >=20
> > and cleared on PDU completion in virtio_9p_push_and_notify() :
> >=20
> >     v->elems[pdu->idx] =3D NULL;
> >=20
> >=20
> > I can't think of a way where push_and_notify() could collide
> > with handle_output()... both are supposed to be run sequentially
> > by the main event loop.
>=20
> Ok, I made a quick "is same thread" assertion check:
>=20
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index 54ee93b71f..bb6ebd16aa 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -28,12 +28,25 @@
>  #include "qemu/module.h"
>  #include "sysemu/qtest.h"
> =20
> +static void assert_thread(void) {
> +    static QemuThread thread;
> +    static bool calledBefore;
> +    if (!calledBefore) {
> +        calledBefore =3D 1;
> +        qemu_thread_get_self(&thread);
> +        return;
> +    }
> +    assert(qemu_thread_is_self(&thread));
> +}
> +
>  static void virtio_9p_push_and_notify(V9fsPDU *pdu)
>  {
>      V9fsState *s =3D pdu->s;
>      V9fsVirtioState *v =3D container_of(s, V9fsVirtioState, state);
>      VirtQueueElement *elem =3D v->elems[pdu->idx];
> =20
> +    assert_thread();
> +
>      /* push onto queue and notify */
>      virtqueue_push(v->vq, elem, pdu->size);
>      g_free(elem);
> @@ -51,6 +64,8 @@ static void handle_9p_output(VirtIODevice *vdev, VirtQu=
eue=20
> *vq)
>      ssize_t len;
>      VirtQueueElement *elem;
> =20
> +    assert_thread();
> +
>      while ((pdu =3D pdu_alloc(s))) {
>          P9MsgHeader out;
> =20
> @@ -125,6 +140,8 @@ static ssize_t virtio_pdu_vmarshal(V9fsPDU *pdu, size=
_t=20
> offset,
>      VirtQueueElement *elem =3D v->elems[pdu->idx];
>      ssize_t ret;
> =20
> +    assert_thread();
> +
>      ret =3D v9fs_iov_vmarshal(elem->in_sg, elem->in_num, offset, 1, fmt,=
 ap);
>      if (ret < 0) {
>          VirtIODevice *vdev =3D VIRTIO_DEVICE(v);
> @@ -143,6 +160,8 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, si=
ze_t=20
> offset,
>      VirtQueueElement *elem =3D v->elems[pdu->idx];
>      ssize_t ret;
> =20
> +    assert_thread();
> +
>      ret =3D v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, =
fmt,=20
> ap);
>      if (ret < 0) {
>          VirtIODevice *vdev =3D VIRTIO_DEVICE(v);
> @@ -160,6 +179,8 @@ static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu,=
=20
> struct iovec **piov,
>      VirtQueueElement *elem =3D v->elems[pdu->idx];
>      size_t buf_size =3D iov_size(elem->in_sg, elem->in_num);
> =20
> +    assert_thread();
> +
>      if (buf_size < size) {
>          VirtIODevice *vdev =3D VIRTIO_DEVICE(v);
> =20
> @@ -180,6 +201,8 @@ static void virtio_init_out_iov_from_pdu(V9fsPDU *pdu=
,=20
> struct iovec **piov,
>      VirtQueueElement *elem =3D v->elems[pdu->idx];
>      size_t buf_size =3D iov_size(elem->out_sg, elem->out_num);
> =20
> +    assert_thread();
> +
>      if (buf_size < size) {
>          VirtIODevice *vdev =3D VIRTIO_DEVICE(v);
> =20
> And it triggered, however I am not sure if some of those functions I asse=
rted=20
> above are indeed allowed to be executed on a different thread than main=
=20
> thread:
>=20
> Program terminated with signal SIGABRT, Aborted.
> #0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.=
c:50
> 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> [Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]

Based in the thread number, it seems that the signal was raised by
the main event thread...

> (gdb) bt
> #0  0x00007fd3fe6db7bb in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/
> sysv/linux/raise.c:50
> #1  0x00007fd3fe6c6535 in __GI_abort () at abort.c:79
> #2  0x00007fd3fe6c640f in __assert_fail_base
>     (fmt=3D0x7fd3fe828ee0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",=20
> assertion=3D0x563569935704 "qemu_thread_is_self(&thread)", file=3D0x56356=
99356e6 2
> #3  0x00007fd3fe6d4102 in __GI___assert_fail
>     (assertion=3Dassertion@entry=3D0x563569935704 "qemu_thread_is_self(&t=
hread)",=20
> file=3Dfile@entry=3D0x5635699356e6 "../hw/9pfs/virtio-9p-device.c", line1

What is the content of thread then if it isn't pthread_self() ?

> #4  0x00005635695c98aa in assert_thread () at ../hw/9pfs/virtio-9p-device=
.c:39
> #5  0x00005635695c98aa in assert_thread () at ../hw/9pfs/virtio-9p-device=
.c:31
> #6  0x00005635695c9a4b in virtio_9p_push_and_notify (pdu=3D0x56356bc38f38=
) at=20
> ../hw/9pfs/virtio-9p-device.c:48
> #7  0x00005635693c2f28 in pdu_complete (pdu=3Dpdu@entry=3D0x56356bc38f38,=
=20
> len=3D<optimized out>, len@entry=3D-4) at ../hw/9pfs/9p.c:1059
> #8  0x00005635693c49e0 in v9fs_walk (opaque=3D0x56356bc38f38) at ../hw/9p=
fs/
> 9p.c:1868
> #9  0x00005635698256bb in coroutine_trampoline (i0=3D<optimized out>,=20
> i1=3D<optimized out>) at ../util/coroutine-ucontext.c:173
> #10 0x00007fd3fe6f0b50 in __correctly_grouped_prefixwc
>     (begin=3D0x2 <error: Cannot access memory at address 0x2>, end=3D0x0,=
=20
> thousands=3D0 L'\000', grouping=3D0x7fd3fe6db7bb <__GI_raise+267> "H\213\=
214$\b\1
> #11 0x0000000000000000 in  ()
> (gdb)
>=20
> Also there is no official qemu_main_thread() function it seems yet. That =
might=20
> be useful in general.
>=20
> > Maybe active some traces ?
>=20
> I need to read up on how to use traces, then I'll check that as well. But=
=20
> probably ensuring thread sanity in a way proposed above would probably ma=
ke=20
> sense first.
>=20

Yeah and we don't have traces at the virtio-9p device level...=20

Anyway, have a look at hw/9pfs/trace-events to know existing traces
and then just add "-trace v9fs_blabla" to the QEMU command line. You
can add several -trace and I think you can put wildcards, i.e.=20
"-trace v9fs_*"

> I also tried a little retry hack as a test, just in case this was some so=
rt of=20
> "not ready yet" issue, because I saw Philippe was working on some virtio =
queue=20
> not ready issue lately:
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04460.html
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04471.html
>=20
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index 54ee93b71f..ba332c27b6 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -141,6 +141,19 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, s=
ize_t=20
> offset,
>      V9fsState *s =3D pdu->s;
>      V9fsVirtioState *v =3D container_of(s, V9fsVirtioState, state);
>      VirtQueueElement *elem =3D v->elems[pdu->idx];
> +    for (int i =3D 0; !elem; ++i) {
> +        bool in_coroutine =3D qemu_in_coroutine();
> +        printf("TRIGGERED %d (in_coroutine=3D%d)!\n", i, in_coroutine);
> +        fflush(stdout);
> +        if (in_coroutine) {
> +            qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
> +        } else {
> +            g_usleep(100);
> +        }
> +        s =3D pdu->s;
> +        v =3D container_of(s, V9fsVirtioState, state);
> +        elem =3D v->elems[pdu->idx];
> +    }
>      ssize_t ret;
> =20
>      ret =3D v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offset, 1, =
fmt,=20
> ap);
>=20
> But that did not bring much:
>=20
> TRIGGERED 0 (in_coroutine=3D1)!

Well, it proves that virtio_pdu_vunmarshal() is indeed passed
a PDU without an associated queue element which is really a
no go...

> TRIGGERED 1 (in_coroutine=3D1)!
> TRIGGERED 2 (in_coroutine=3D1)!
> ...
> TRIGGERED 43 (in_coroutine=3D1)!
> TRIGGERED 44 (in_coroutine=3D1)!
> qemu_aio_coroutine_enter: Co-routine was already scheduled in=20
> 'qemu_co_sleep_ns'
> Aborted (core dumped)
>=20

Strange...

> > > bt taken with HEAD being 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:
> > >=20
> > > Program terminated with signal SIGSEGV, Segmentation fault.
> > > #0  virtio_pdu_vunmarshal (pdu=3D0x55a93717cde8, offset=3D7,
> > > fmt=3D0x55a9352766d1
> > > "ddw", ap=3D0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
> > > 146         ret =3D v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, =
offset,
> > > 1, fmt, ap);
> > > [Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
> > > (gdb) bt full
> > > #0  0x000055a934dfb9a7 in virtio_pdu_vunmarshal (pdu=3D0x55a93717cde8=
,
> > > offset=3D7, fmt=3D0x55a9352766d1 "ddw", ap=3D0x7f38a9ad9cd0) at
> > > ../hw/9pfs/virtio-9p-device.c: 146
> > >=20
> > >         s =3D 0x55a93717b4b8
> > >         v =3D 0x55a93717aee0
> > >         elem =3D 0x0
> >=20
> > So this is v->elems[pdu->idx]... what's the value of pdu->idx ?
>=20
> In that originally posted core dump it was 113:
>=20
> #0  virtio_pdu_vunmarshal (pdu=3D0x55a93717cde8, offset=3D7, fmt=3D0x55a9=
352766d1=20
> "ddw", ap=3D0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
> 146         ret =3D v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offs=
et, 1,=20
> fmt, ap);
> [Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
> (gdb) p pdu->idx
> $1 =3D 113
>=20

Ok, so it is a valid index (not over MAX_REQ). So it would mean
that someone cleared the slot in our back ?

> > >         ret =3D <optimized out>
> > >=20
> > > #1  0x000055a934bf35e8 in pdu_unmarshal (pdu=3Dpdu@entry=3D0x55a93717=
cde8,
> > > offset=3Doffset@entry=3D7, fmt=3Dfmt@entry=3D0x55a9352766d1 "ddw") at
> > > ../hw/9pfs/9p.c: 71
> > >=20
> > >         ret =3D <optimized out>
> > >         ap =3D {{gp_offset =3D 24, fp_offset =3D 48, overflow_arg_are=
a =3D
> > >=20
> > > 0x7f38a9ad9db0, reg_save_area =3D 0x7f38a9ad9cf0}}
> > > #2  0x000055a934bf68db in v9fs_walk (opaque=3D0x55a93717cde8) at ../h=
w/9pfs/
> > > 9p.c:1720
> > >=20
> > >         name_idx =3D <optimized out>
> > >         qids =3D 0x0
> > >         i =3D <optimized out>
> > >         err =3D 0
> > >         dpath =3D {size =3D 0, data =3D 0x0}
> > >         path =3D {size =3D 0, data =3D 0x0}
> > >         pathes =3D 0x0
> > >         nwnames =3D 1
> > >         stbuf =3D
> > >        =20
> > >             {st_dev =3D 2050, st_ino =3D 1199848, st_nlink =3D 1, st_=
mode =3D
> > >             41471,
> > >=20
> > > st_uid =3D 0, st_gid =3D 0, __pad0 =3D 0, st_rdev =3D 0, st_size =3D =
13, st_blksize
> > > =3D
> > > 4096, st_blocks =3D 16, s}
> > >=20
> > >         fidst =3D
> > >        =20
> > >             {st_dev =3D 2050, st_ino =3D 1198183, st_nlink =3D 3, st_=
mode =3D
> > >             16877,
> > >=20
> > > st_uid =3D 0, st_gid =3D 0, __pad0 =3D 0, st_rdev =3D 0, st_size =3D =
12288,
> > > st_blksize =3D 4096, st_blocks =3D 32}
> > >=20
> > >         stbufs =3D 0x0
> > >         offset =3D 7
> > >         fid =3D 299
> > >         newfid =3D 687
> > >         wnames =3D 0x0
> > >         fidp =3D <optimized out>
> > >         newfidp =3D 0x0
> > >         pdu =3D 0x55a93717cde8
> > >         s =3D 0x55a93717b4b8
> > >         qid =3D {type =3D 2 '\002', version =3D 1556732739, path =3D =
2399697}
> > >=20
> > > #3  0x000055a93505760b in coroutine_trampoline (i0=3D<optimized out>,
> > > i1=3D<optimized out>) at ../util/coroutine-ucontext.c:173
>=20
>=20


