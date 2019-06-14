Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68F46368
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 17:53:30 +0200 (CEST)
Received: from localhost ([::1]:52910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hboW9-0003Zy-FB
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 11:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56286)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hboIJ-0003nb-Tp
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:39:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hbo5j-0005qV-Pv
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:26:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41122)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hbo5V-0005NV-SB; Fri, 14 Jun 2019 11:25:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4BD1E368E3;
 Fri, 14 Jun 2019 15:25:22 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E565C29A;
 Fri, 14 Jun 2019 15:25:17 +0000 (UTC)
Date: Fri, 14 Jun 2019 17:25:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190614152516.GI6042@dhcp-200-226.str.redhat.com>
References: <20190605161118.14544-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190605161118.14544-1-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 14 Jun 2019 15:25:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/4] block: Keep track of parent quiescing
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.06.2019 um 18:11 hat Max Reitz geschrieben:
> We currently do not keep track of how many times a child has quiesced
> its parent.  We just guess based on the child=E2=80=99s quiesce_counter=
.  That
> keeps biting us when we try to leave drained sections or detach childre=
n
> (see e.g. commit 5cb2737e925042e).
>=20
> I think we need an explicit counter to keep track of how many times a
> parent has been quiesced (patch 1).  That just makes the code more
> resilient.
>=20
> Actually, no, we don=E2=80=99t need a counter, we need a boolean.  See =
patch 2
> for the explanation.
>=20
> Yes, it is a bit weird to introduce a counter first (patch 1) and then
> immediately make it a boolean (patch 2).  But I believe this to be the
> most logical change set.
>=20
> (=E2=80=9COur current model relies on counting, so adding an explicit c=
ounter
> makes sense.  It then turns out that counting is probably not the best
> idea, so why not make it a boolean?=E2=80=9D)

Trying to summarise an IRC discussion I just had with Max:

The real root problem isn't that the recursion in bdrv_do_drained_end()
doesn't correctly deal with graph changes, but that those graph changes
happen in the first place. The one basic guiding principle in my drain
rewrite was that during the recursion (both to children and parents), no
graph changes are allowed, which means that no aio_poll() calls are
allowed either.

Of course, while I think the principle is right and greatly simplifies
the code (or actually is the only thing that gives us any hope to get
things right), I messed up the implementation because
bdrv_drain_invoke() does use BDRV_POLL_WHILE() for ending a drained
section. This is wrong, and it could still cause crashes after this
series because a recursive call could remove a node that is currently
processed somewhere up the call chain.

The fix for the observed bugs should be to make drained_end completely
symmetric to drained_begin: Just start the bdrv_drain_invoke_entry()
coroutine, do the recursion and call all the callbacks (none of which
may modify the graph) and only after all of this is done, poll once at
the top level drain. (The poll condition could be simplified to just
wait for bdrv_drain_invoke() to be completed, we don't care about other
running requests in drained_end. But this is only an optimisation.)

Despite this being a full fix, we also agreed that patch 1 is a nice
cleanup and we want to keep it even if it doesn't strictly fix a bug any
more.

Kevin

