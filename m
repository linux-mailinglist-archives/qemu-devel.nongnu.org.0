Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5714B5F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 15:58:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNe8L-0001p9-IX
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 09:58:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNe7F-0001UI-7B
	for qemu-devel@nongnu.org; Mon, 06 May 2019 09:57:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNe7D-0006D0-Hd
	for qemu-devel@nongnu.org; Mon, 06 May 2019 09:57:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hNe7A-0006B0-Uf; Mon, 06 May 2019 09:57:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E75A30833BE;
	Mon,  6 May 2019 13:57:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-82.ams2.redhat.com
	[10.36.117.82])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2817417152;
	Mon,  6 May 2019 13:57:04 +0000 (UTC)
Date: Mon, 6 May 2019 15:57:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-ID: <20190506135703.GB6288@localhost.localdomain>
References: <57c36dca-c4d6-9b70-7799-0be96325d7c5@yandex-team.ru>
	<20190429103816.GE8492@localhost.localdomain>
	<acda1900-6d9f-e551-6310-4192514be35a@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <acda1900-6d9f-e551-6310-4192514be35a@yandex-team.ru>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 06 May 2019 13:57:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] aio context ownership during bdrv_close()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core =?utf-8?B?KNGA0LDRgdGB0YvQu9C60LAp?= <yc-core@yandex-team.ru>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.05.2019 um 14:47 hat Anton Kuchin geschrieben:
> On 29/04/2019 13:38, Kevin Wolf wrote:
> > Am 26.04.2019 um 14:24 hat Anton Kuchin geschrieben:
> > > I can't figure out ownership of aio context during bdrv_close().
> > >=20
> > > As far as I understand bdrv_unref() shold be called with acquired a=
io
> > > context to prevent concurrent operations (at least most usages in b=
lockdev.c
> > > explicitly acquire and release context, but not all).
> > I think the theory is like this:
> >=20
> > 1. bdrv_unref() can only be called from the main thread
> >=20
> > 2. A block node for which bdrv_close() is called has no references. I=
f
> >     there are no more parents that keep it in a non-default iothread,
> >     they should be in the main AioContext. So no locks need to be tak=
en
> >     during bdrv_close().
> >=20
> > In practice, 2. is not fully true today, even though block devices do
> > stop their dataplane and move the block nodes back to the main
> > AioContext on shutdown. I am currently working on some fixes related =
to
> > this, afterwards the situation should be better.
> >=20
> > > But if refcount reaches zero and bs is going to be deleted in bdrv_=
close()
> > > we need to ensure that drain is finished data is flushed and there =
are no
> > > more pending coroutines and bottomhalves, so drain and flush functi=
ons can
> > > enter coroutine and perform yield in several places. As a result co=
ntrol
> > > returns to coroutine caller that will release aio context and when
> > > completion bh will continue cleanup process it will be executed wit=
hout
> > > ownership of context. Is this a valid situation?
> > Do you have an example where this happens?
> >=20
> > Normally, leaving the coroutine means that the AioContext lock is
> > released, but it is later reentered from the same AioContext, so the
> > lock will be taken again.
> I was wrong. Coroutines do acquire aio context when reentered.
> >=20
> > > Moreover if yield happens bs that is being deleted has zero refcoun=
t but is
> > > still present in lists graph_bdrv_states and all_bdrv_states and ca=
n be
> > > accidentally accessed. Shouldn't we remove it from these lists ASAP=
 when
> > > deletion process starts as we do from monitor_bdrv_states?
> > Hm, I think it should only disappear when the image file is actually
> > closed. But in practice, it probably makes little difference either w=
ay.
>=20
> I'm still worried about a period of time since coroutine yields and unt=
il it
> is reentered, looks like aio context can be grabbed by other code and b=
s can
> be treated as valid.
>=20
> I have no example of such situation too but I see there bdrv_aio_flush =
and
> bdrv_co_flush_to_disk callbacks which are called during flush and can t=
ake
> unpredicable time to complete (e.g. raw_aio_flush in file-win32 uses th=
read
> pool inside to process request and RBD can also be affected but I didn'=
t dig
> deep enough to be sure).
>=20
> If main loop starts processing next qmp command before completion is ca=
lled
> lists will be in inconsistent state and hard to debug use-after-free bu=
gs
> and crashes can happen.

Hm, at the point of flush, bs is actually still valid, so e.g.
query-block would just work. But I think we would indeed have a problem
if a new reference to the node is created.

> Fix seems trivial and shouldn't break any existing code.
>=20
> ---
>=20
> diff --git a/block.c b/block.c
> index 16615bc876..25c3b72520 100644
> --- a/block.c
> +++ b/block.c
> @@ -4083,14 +4083,14 @@ static void bdrv_delete(BlockDriverState *bs)
> =A0=A0=A0=A0 assert(bdrv_op_blocker_is_empty(bs));
> =A0=A0=A0=A0 assert(!bs->refcnt);
>=20
> -=A0=A0=A0 bdrv_close(bs);
> -
> =A0=A0=A0=A0 /* remove from list, if necessary */
> =A0=A0=A0=A0 if (bs->node_name[0] !=3D '\0') {
> =A0=A0=A0=A0=A0=A0=A0=A0 QTAILQ_REMOVE(&graph_bdrv_states, bs, node_lis=
t);
> =A0=A0=A0=A0 }
> =A0=A0=A0=A0 QTAILQ_REMOVE(&all_bdrv_states, bs, bs_list);
>=20
> +=A0=A0=A0 bdrv_close(bs);
> +
> =A0=A0=A0=A0 g_free(bs);
> =A0}

This looks reasonable enough to me.

Kevin

