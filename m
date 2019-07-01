Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B862628244
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqLD-0006FG-UW
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:13:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAL-0004V8-D5
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAK-00028r-2B
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTqAF-0001eX-C6; Thu, 23 May 2019 12:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C59A7317915F;
	Thu, 23 May 2019 16:01:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-143.ams2.redhat.com
	[10.36.116.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49B9F1001E84;
	Thu, 23 May 2019 16:01:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 23 May 2019 18:00:50 +0200
Message-Id: <20190523160104.21258-2-kwolf@redhat.com>
In-Reply-To: <20190523160104.21258-1-kwolf@redhat.com>
References: <20190523160104.21258-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 23 May 2019 16:01:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 01/15] test-block-iothread: Check filter node
 in test_propagate_mirror
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just make the test cover the AioContext of the filter node as well.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-block-iothread.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index 59f692892e..e424d360c8 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -593,7 +593,7 @@ static void test_propagate_mirror(void)
     IOThread *iothread =3D iothread_new();
     AioContext *ctx =3D iothread_get_aio_context(iothread);
     AioContext *main_ctx =3D qemu_get_aio_context();
-    BlockDriverState *src, *target;
+    BlockDriverState *src, *target, *filter;
     BlockBackend *blk;
     Job *job;
     Error *local_err =3D NULL;
@@ -610,11 +610,13 @@ static void test_propagate_mirror(void)
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
     job =3D job_get("job0");
+    filter =3D bdrv_find_node("filter_node");
=20
     /* Change the AioContext of src */
     bdrv_try_set_aio_context(src, ctx, &error_abort);
     g_assert(bdrv_get_aio_context(src) =3D=3D ctx);
     g_assert(bdrv_get_aio_context(target) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(filter) =3D=3D ctx);
     g_assert(job->aio_context =3D=3D ctx);
=20
     /* Change the AioContext of target */
@@ -623,6 +625,7 @@ static void test_propagate_mirror(void)
     aio_context_release(ctx);
     g_assert(bdrv_get_aio_context(src) =3D=3D main_ctx);
     g_assert(bdrv_get_aio_context(target) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(filter) =3D=3D main_ctx);
=20
     /* With a BlockBackend on src, changing target must fail */
     blk =3D blk_new(0, BLK_PERM_ALL);
@@ -635,6 +638,7 @@ static void test_propagate_mirror(void)
     g_assert(blk_get_aio_context(blk) =3D=3D main_ctx);
     g_assert(bdrv_get_aio_context(src) =3D=3D main_ctx);
     g_assert(bdrv_get_aio_context(target) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(filter) =3D=3D main_ctx);
=20
     /* ...unless we explicitly allow it */
     aio_context_acquire(ctx);
@@ -645,6 +649,7 @@ static void test_propagate_mirror(void)
     g_assert(blk_get_aio_context(blk) =3D=3D ctx);
     g_assert(bdrv_get_aio_context(src) =3D=3D ctx);
     g_assert(bdrv_get_aio_context(target) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(filter) =3D=3D ctx);
=20
     job_cancel_sync_all();
=20
--=20
2.20.1


