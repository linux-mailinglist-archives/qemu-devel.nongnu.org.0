Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B213733320
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:09:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXoa9-00042v-Q3
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:09:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoUV-0000KM-4N
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:03:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoUT-0006nU-Sc
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:03:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoUQ-0006UP-Eq; Mon, 03 Jun 2019 11:03:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABD063107B20;
	Mon,  3 Jun 2019 15:02:54 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85CC961B6A;
	Mon,  3 Jun 2019 15:02:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:06 +0200
Message-Id: <20190603150233.6614-2-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 15:02:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 01/28] block: Drain source node in
 bdrv_replace_node()
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of just asserting that no requests are in flight in
bdrv_replace_node(), which is a requirement that most callers ignore, we
can just drain the source node right there. This fixes at least starting
a commit job while I/O is active on the backing chain, but probably
other callers, too.

Having requests in flight on the target node isn't a problem because the
target just gets new parents, but the call path of running requests
isn't modified. So we can just drop this assertion without a replacement.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1711643
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 1a73e310c1..4c3902508d 100644
--- a/block.c
+++ b/block.c
@@ -4017,13 +4017,13 @@ void bdrv_replace_node(BlockDriverState *from, Bl=
ockDriverState *to,
     uint64_t perm =3D 0, shared =3D BLK_PERM_ALL;
     int ret;
=20
-    assert(!atomic_read(&from->in_flight));
-    assert(!atomic_read(&to->in_flight));
-
     /* Make sure that @from doesn't go away until we have successfully a=
ttached
      * all of its parents to @to. */
     bdrv_ref(from);
=20
+    assert(qemu_get_current_aio_context() =3D=3D qemu_get_aio_context())=
;
+    bdrv_drained_begin(from);
+
     /* Put all parents into @list and calculate their cumulative permiss=
ions */
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs =3D=3D from);
@@ -4064,6 +4064,7 @@ void bdrv_replace_node(BlockDriverState *from, Bloc=
kDriverState *to,
=20
 out:
     g_slist_free(list);
+    bdrv_drained_end(from);
     bdrv_unref(from);
 }
=20
--=20
2.20.1


