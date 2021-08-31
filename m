Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6B3FC5C9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 12:59:50 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1Ub-00069h-Ce
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 06:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL1Sx-0005Fo-F2
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:58:07 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL1Sv-0001n3-1k
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:58:07 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-4OT-d12iMaGv9KKJsNZSrA-1; Tue, 31 Aug 2021 06:57:53 -0400
X-MC-Unique: 4OT-d12iMaGv9KKJsNZSrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A108801B3D;
 Tue, 31 Aug 2021 10:57:52 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F44D60C9F;
 Tue, 31 Aug 2021 10:57:51 +0000 (UTC)
Date: Tue, 31 Aug 2021 12:57:49 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs: Twalk crash
Message-ID: <20210831125749.15c42c33@bahia.lan>
In-Reply-To: <4325838.qn0ATYcOi1@silver>
References: <4325838.qn0ATYcOi1@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Mon, 30 Aug 2021 17:55:04 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Apparently commit 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 '9pfs: reduce=
=20
> latency of Twalk' has introduced occasional crashes.
>=20
> My first impression after looking at the backtrace: looks like the patch=
=20
> itself is probably not causing this, but rather unmasked this issue (i.e.=
=20
> increased the chance to be triggered).
>=20
> The crash is because of 'elem' is NULL in virtio_pdu_vunmarshal() (frame =
0).
>=20

Ouch... this certainly isn't expected to happen :-\

elem is popped out the vq in handle_9p_output():

        elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
        if (!elem) {
            goto out_free_pdu;
        }
[...]
        v->elems[pdu->idx] =3D elem;

and cleared on PDU completion in virtio_9p_push_and_notify() :

    v->elems[pdu->idx] =3D NULL;


I can't think of a way where push_and_notify() could collide
with handle_output()... both are supposed to be run sequentially
by the main event loop. Maybe active some traces ?

> bt taken with HEAD being 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:
>=20
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  virtio_pdu_vunmarshal (pdu=3D0x55a93717cde8, offset=3D7, fmt=3D0x55a9=
352766d1=20
> "ddw", ap=3D0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-device.c:146
> 146         ret =3D v9fs_iov_vunmarshal(elem->out_sg, elem->out_num, offs=
et, 1,=20
> fmt, ap);
> [Current thread is 1 (Thread 0x7f3bddd2ac40 (LWP 7811))]
> (gdb) bt full
> #0  0x000055a934dfb9a7 in virtio_pdu_vunmarshal (pdu=3D0x55a93717cde8, of=
fset=3D7,=20
> fmt=3D0x55a9352766d1 "ddw", ap=3D0x7f38a9ad9cd0) at ../hw/9pfs/virtio-9p-=
device.c:
> 146
>         s =3D 0x55a93717b4b8
>         v =3D 0x55a93717aee0
>         elem =3D 0x0

So this is v->elems[pdu->idx]... what's the value of pdu->idx ?

>         ret =3D <optimized out>
> #1  0x000055a934bf35e8 in pdu_unmarshal (pdu=3Dpdu@entry=3D0x55a93717cde8=
,=20
> offset=3Doffset@entry=3D7, fmt=3Dfmt@entry=3D0x55a9352766d1 "ddw") at ../=
hw/9pfs/9p.c:
> 71
>         ret =3D <optimized out>
>         ap =3D {{gp_offset =3D 24, fp_offset =3D 48, overflow_arg_area =
=3D=20
> 0x7f38a9ad9db0, reg_save_area =3D 0x7f38a9ad9cf0}}
> #2  0x000055a934bf68db in v9fs_walk (opaque=3D0x55a93717cde8) at ../hw/9p=
fs/
> 9p.c:1720
>         name_idx =3D <optimized out>
>         qids =3D 0x0
>         i =3D <optimized out>
>         err =3D 0
>         dpath =3D {size =3D 0, data =3D 0x0}
>         path =3D {size =3D 0, data =3D 0x0}
>         pathes =3D 0x0
>         nwnames =3D 1
>         stbuf =3D=20
>             {st_dev =3D 2050, st_ino =3D 1199848, st_nlink =3D 1, st_mode=
 =3D 41471,=20
> st_uid =3D 0, st_gid =3D 0, __pad0 =3D 0, st_rdev =3D 0, st_size =3D 13, =
st_blksize =3D=20
> 4096, st_blocks =3D 16, s}
>         fidst =3D=20
>             {st_dev =3D 2050, st_ino =3D 1198183, st_nlink =3D 3, st_mode=
 =3D 16877,=20
> st_uid =3D 0, st_gid =3D 0, __pad0 =3D 0, st_rdev =3D 0, st_size =3D 1228=
8, st_blksize =3D=20
> 4096, st_blocks =3D 32}
>         stbufs =3D 0x0
>         offset =3D 7
>         fid =3D 299
>         newfid =3D 687
>         wnames =3D 0x0
>         fidp =3D <optimized out>
>         newfidp =3D 0x0
>         pdu =3D 0x55a93717cde8
>         s =3D 0x55a93717b4b8
>         qid =3D {type =3D 2 '\002', version =3D 1556732739, path =3D 2399=
697}
> #3  0x000055a93505760b in coroutine_trampoline (i0=3D<optimized out>,=20
> i1=3D<optimized out>) at ../util/coroutine-ucontext.c:173
>=20
>=20
>=20
>=20


