Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF119C7B0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 19:11:31 +0200 (CEST)
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK3NJ-00040F-Tm
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 13:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jK3MH-0003PF-S2
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jK3MF-00018z-QI
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:10:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52021
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jK3MF-00018U-Db
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 13:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585847422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cd0rlUYAL210l2NKVg398+f70O+ZOzJoTLz12KDfRtI=;
 b=OtIDpsnrMiBx8diGTE1Gyw1wtKv8hAfE4b6crtTQgEAjuYeIkGosMKz6N/GCMzELltmpj0
 3GIotKIhR23svGCCO0mkZPnbjZdpnXiIV0lTW57vRDlwIeI9s9dJz40Fl80YICJuOixxiE
 8BqVagMQSvA51AzQ/F18BC9g042Un2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-JMX9tBmePESSZf7tIHT3ZA-1; Thu, 02 Apr 2020 13:10:18 -0400
X-MC-Unique: JMX9tBmePESSZf7tIHT3ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D295210753FC;
 Thu,  2 Apr 2020 17:10:15 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C9A260BF1;
 Thu,  2 Apr 2020 17:10:08 +0000 (UTC)
Date: Thu, 2 Apr 2020 19:10:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Dietmar Maurer <dietmar@proxmox.com>
Subject: Re: bdrv_drained_begin deadlock with io-threads
Message-ID: <20200402171007.GF4006@linux.fritz.box>
References: <20200401103748.GA4680@linux.fritz.box>
 <997901084.0.1585755465486@webmail.proxmox.com>
 <20200401181256.GB27663@linux.fritz.box>
 <1403939459.52.1585765681569@webmail.proxmox.com>
 <20200401184431.GD27663@linux.fritz.box>
 <903538836.29.1585818619688@webmail.proxmox.com>
 <20200402121403.GB4006@linux.fritz.box>
 <20200402142524.GD4006@linux.fritz.box>
 <1043934808.59.1585842050330@webmail.proxmox.com>
 <20200402164744.GE4006@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200402164744.GE4006@linux.fritz.box>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.04.2020 um 18:47 hat Kevin Wolf geschrieben:
> Am 02.04.2020 um 17:40 hat Dietmar Maurer geschrieben:
> > > Can you reproduce the problem with my script, but pointing it to your
> > > Debian image and running stress-ng instead of dd?=20
> >=20
> > yes
> >=20
> > > If so, how long does
> > > it take to reproduce for you?
> >=20
> > I sometimes need up to 130 iterations ...
> >=20
> > Worse, I thought several times the bug is gone, but then it triggered a=
gain (sigh).
> >=20
> > But most times below 30 iteration (if you run "stress-ng -d 5").
> >=20
> > Also note that it can happen at different places, but always inside a d=
rained section ...
>=20
> I got a stracktrace of a hanging coroutine:
>=20
> (gdb) qemu coroutine 0x7fd8c00132c0
> #0  0x00005630e16e9840 in qemu_coroutine_switch (from_=3Dfrom_@entry=3D0x=
7fd8c00132c0, to_=3Dto_@entry=3D0x7fd8cda865b8, action=3Daction@entry=3DCOR=
OUTINE_YIELD) at util/coroutine-ucontext.c:218
> #1  0x00005630e16e8521 in qemu_coroutine_yield () at util/qemu-coroutine.=
c:193
> #2  0x00005630e16e8ba5 in qemu_co_queue_wait_impl (queue=3Dqueue@entry=3D=
0x5630e48ab580, lock=3Dlock@entry=3D0x0) at util/qemu-coroutine-lock.c:56
> #3  0x00005630e161f1ae in blk_wait_while_drained (blk=3Dblk@entry=3D0x563=
0e48ab260) at /home/kwolf/source/qemu/include/qemu/lockable.h:46
> #4  0x00005630e1620600 in blk_wait_while_drained (blk=3D0x5630e48ab260) a=
t block/block-backend.c:1189
> #5  0x00005630e1620600 in blk_co_pwritev_part (blk=3D0x5630e48ab260, offs=
et=3D2922381312, bytes=3D856064, qiov=3Dqiov@entry=3D0x7fd8c002cd70, qiov_o=
ffset=3Dqiov_offset@entry=3D0, flags=3D0)
>     at block/block-backend.c:1189
> #6  0x00005630e16207ce in blk_co_pwritev (flags=3D<optimized out>, qiov=
=3D0x7fd8c002cd70, bytes=3D<optimized out>, offset=3D<optimized out>, blk=
=3D<optimized out>) at block/block-backend.c:1429
> #7  0x00005630e16207ce in blk_aio_write_entry (opaque=3D0x7fd8c002cdc0) a=
t block/block-backend.c:1429
> #8  0x00005630e16e98bb in coroutine_trampoline (i0=3D<optimized out>, i1=
=3D<optimized out>) at util/coroutine-ucontext.c:115
>=20
> So I think this is the bug: Calling blk_wait_while_drained() from
> anywhere between blk_inc_in_flight() and blk_dec_in_flight() is wrong
> because it will deadlock the drain operation.
>=20
> blk_aio_read/write_entry() take care of this and drop their reference
> around blk_wait_while_drained(). But if we hit the race condition that
> drain hasn't yet started there, but it has when we get to
> blk_co_preadv() or blk_co_pwritev_part(), then we're in a buggy code
> path.

With the following patch, it seems to survive for now. I'll give it some
more testing tomorrow (also qemu-iotests to check that I didn't
accidentally break something else.)

Kevin


diff --git a/block/block-backend.c b/block/block-backend.c
index 8b8f2a80a0..634acd1541 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1143,7 +1143,9 @@ static int blk_check_byte_request(BlockBackend *blk, =
int64_t offset,
 static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 {
     if (blk->quiesce_counter && !blk->disable_request_queuing) {
+        blk_dec_in_flight(blk);
         qemu_co_queue_wait(&blk->queued_requests, NULL);
+        blk_inc_in_flight(blk);
     }
 }
=20
@@ -1154,8 +1156,6 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int=
64_t offset,
     int ret;
     BlockDriverState *bs;
=20
-    blk_wait_while_drained(blk);
-
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs =3D blk_bs(blk);
     trace_blk_co_preadv(blk, bs, offset, bytes, flags);
@@ -1186,8 +1186,6 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *bl=
k, int64_t offset,
     int ret;
     BlockDriverState *bs;
=20
-    blk_wait_while_drained(blk);
-
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs =3D blk_bs(blk);
     trace_blk_co_pwritev(blk, bs, offset, bytes, flags);
@@ -1262,6 +1260,7 @@ static int blk_prw(BlockBackend *blk, int64_t offset,=
 uint8_t *buf,
         .ret    =3D NOT_DONE,
     };
=20
+    blk_inc_in_flight(blk);
     if (qemu_in_coroutine()) {
         /* Fast-path if already in coroutine context */
         co_entry(&rwco);
@@ -1270,6 +1269,7 @@ static int blk_prw(BlockBackend *blk, int64_t offset,=
 uint8_t *buf,
         bdrv_coroutine_enter(blk_bs(blk), co);
         BDRV_POLL_WHILE(blk_bs(blk), rwco.ret =3D=3D NOT_DONE);
     }
+    blk_dec_in_flight(blk);
=20
     return rwco.ret;
 }
@@ -1388,9 +1388,7 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov =3D rwco->iobuf;
=20
     if (rwco->blk->quiesce_counter) {
-        blk_dec_in_flight(rwco->blk);
         blk_wait_while_drained(rwco->blk);
-        blk_inc_in_flight(rwco->blk);
     }
=20
     assert(qiov->size =3D=3D acb->bytes);
@@ -1406,9 +1404,7 @@ static void blk_aio_write_entry(void *opaque)
     QEMUIOVector *qiov =3D rwco->iobuf;
=20
     if (rwco->blk->quiesce_counter) {
-        blk_dec_in_flight(rwco->blk);
         blk_wait_while_drained(rwco->blk);
-        blk_inc_in_flight(rwco->blk);
     }
=20
     assert(!qiov || qiov->size =3D=3D acb->bytes);


