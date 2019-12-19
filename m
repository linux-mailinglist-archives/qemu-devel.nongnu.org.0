Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC561125E73
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 11:03:49 +0100 (CET)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihseq-0002CZ-RC
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 05:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihsdo-0001jX-Mz
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihsdk-0002xe-8I
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:02:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46114
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihsdj-0002uD-4V
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 05:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576749757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWGa+7rrJON0iGrb2dsvD1EDzoCzeNraDmoSnM3jkaE=;
 b=KfSDq14hBIUP7QzSUkzj/usLIXMPZiOOXitR9tw+JiYfAX9Bj9BC4d1PVuVAl7GU0j7qsZ
 j7kwSJXF1fQ4N6J8VxKQCBqrFokXCnG+p6GLGRvVe3C5wtuaQfdgVV+w6hSY8wmPHaUl3q
 tn+0quj4YXh+RhFMA6ATbOWCYTzw2U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-6w915Mo-MoGheKTn8YDmyg-1; Thu, 19 Dec 2019 05:02:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108A410054E3;
 Thu, 19 Dec 2019 10:02:33 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE18A68890;
 Thu, 19 Dec 2019 10:02:31 +0000 (UTC)
Date: Thu, 19 Dec 2019 11:02:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: qcow2 api not secured by mutex lock
Message-ID: <20191219100230.GC5230@linux.fritz.box>
References: <1ea7f93d-8f48-d565-70e7-0d66f1b80c1e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <1ea7f93d-8f48-d565-70e7-0d66f1b80c1e@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6w915Mo-MoGheKTn8YDmyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Denis Lunev <den@virtuozzo.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.12.2019 um 11:28 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi!
>=20
> Some time ago, we've faced and fixed the fact that qcow2 bitmap api doesn=
't
> call qcow2_co_mutex_lock, before accessing qcow2 metadata. This was solve=
d by
> moving qcow2_co_remove_persistent_dirty_bitmap and
> qcow2_co_can_store_new_dirty_bitmap to coroutine and call qcow2_co_mutex_=
lock.
>=20
> Now I decided to look at big picture (it is attached).
>=20
> Boxes are qcow2 driver api, green border means that function calls qcow2_=
co_mutex_lock
> (it doesn't guarantee, that exactly child node call is locked, but it is =
something).
>=20
> In the picture there are just all functions, calling qcow2_cache_get/put.=
. Not all the
> functions, that needs locking, but again, it is something.
>=20
> So, accordingly to the picture, it seems that the following functions lac=
ks locking:
>=20
> qcow2_co_create

This should be easy to fix. It's also relatively harmless because it's
unlikely that the image that is being created is accessed by someone
else (the user would have to query the auto-generated node name and
start something on it - at which point they deserve what they get).

> qcow2_snapshot_*
>    (but it is both drained and aio context locked, so should be safe, yes=
?)

If you checked that these conditions are true, it should be safe.

> qcow2_reopen_bitmaps_rw
> qcow2_store_persistent_dirty_bitmaps

Reopen drains the image, so I think this is safe in practice.

If we want to do something about it anyway (e.g. move it to a coroutine
so it can take a lock) the question is where to do that. Maybe even for
.bdrv_reopen_* in general?

> qcow2_amend_options

Only qemu-img so far, so no concurrency. We're about to add
blockdev-amend in QMP, though, so this looks like something that should
take the lock.

In fact, is taking the lock enough or should it actually drain the node,
too?

> qcow2_make_empty

This one should certainly drain. It is used not only in qemu-img, but
also in HMP commit and apparently also in replication.

This one might be a bug that could become visible in practice. Unlikely
for HMP commit (because it takes a while and is holding the BQL, so no
new guest requests will be processed), except maybe for cases where
there is nothing to commit.

> =3D=3D=3D
>=20
> Checking green nodes:
>=20
> qcow2_co_invalidate_cache actually calls qcow2_close unlocked, it's
> another reason to fix qcow2_store_persistent_dirty_bitmaps

Might be. Do we want a .bdrv_co_close?

> qcow2_write_snapshots actually called unlocked from
> qcow2_check_fix_snapshot_table.. It seems unsafe.

This is curious, I'm not sure why you would drop the lock there. Max?

bdrv_flush() calls would have to replaced with qcow2_write_caches() to
avoid a deadlock, but otherwise I don't see why we would want to drop
the lock.

Of course, this should only be called from qemu-img check, so in
practice it's probably not a bug.

Kevin


