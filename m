Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40F23D34
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:27:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSl8F-00014a-LC
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:27:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwx-0008Nq-Tl
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkww-0003dP-UY
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwu-0003bu-Ff; Mon, 20 May 2019 12:15:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDF8B9D51C;
	Mon, 20 May 2019 16:15:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11F76601A0;
	Mon, 20 May 2019 16:15:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:45 +0200
Message-Id: <20190520161453.30723-17-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 20 May 2019 16:15:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 16/24] test-block-iothread: Test AioContext
 propagation for block jobs
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-block-iothread.c | 71 +++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index 938831c9bd..59f692892e 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -588,6 +588,76 @@ static void test_propagate_diamond(void)
     bdrv_unref(bs_a);
 }
=20
+static void test_propagate_mirror(void)
+{
+    IOThread *iothread =3D iothread_new();
+    AioContext *ctx =3D iothread_get_aio_context(iothread);
+    AioContext *main_ctx =3D qemu_get_aio_context();
+    BlockDriverState *src, *target;
+    BlockBackend *blk;
+    Job *job;
+    Error *local_err =3D NULL;
+
+    /* Create src and target*/
+    src =3D bdrv_new_open_driver(&bdrv_test, "src", BDRV_O_RDWR, &error_=
abort);
+    target =3D bdrv_new_open_driver(&bdrv_test, "target", BDRV_O_RDWR,
+                                  &error_abort);
+
+    /* Start a mirror job */
+    mirror_start("job0", src, target, NULL, JOB_DEFAULT, 0, 0, 0,
+                 MIRROR_SYNC_MODE_NONE, MIRROR_OPEN_BACKING_CHAIN,
+                 BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPORT,
+                 false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
+                 &error_abort);
+    job =3D job_get("job0");
+
+    /* Change the AioContext of src */
+    bdrv_try_set_aio_context(src, ctx, &error_abort);
+    g_assert(bdrv_get_aio_context(src) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(target) =3D=3D ctx);
+    g_assert(job->aio_context =3D=3D ctx);
+
+    /* Change the AioContext of target */
+    aio_context_acquire(ctx);
+    bdrv_try_set_aio_context(target, main_ctx, &error_abort);
+    aio_context_release(ctx);
+    g_assert(bdrv_get_aio_context(src) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(target) =3D=3D main_ctx);
+
+    /* With a BlockBackend on src, changing target must fail */
+    blk =3D blk_new(0, BLK_PERM_ALL);
+    blk_insert_bs(blk, src, &error_abort);
+
+    bdrv_try_set_aio_context(target, ctx, &local_err);
+    g_assert(local_err);
+    error_free(local_err);
+
+    g_assert(blk_get_aio_context(blk) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(src) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(target) =3D=3D main_ctx);
+
+    /* ...unless we explicitly allow it */
+    aio_context_acquire(ctx);
+    blk_set_allow_aio_context_change(blk, true);
+    bdrv_try_set_aio_context(target, ctx, &error_abort);
+    aio_context_release(ctx);
+
+    g_assert(blk_get_aio_context(blk) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(src) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(target) =3D=3D ctx);
+
+    job_cancel_sync_all();
+
+    aio_context_acquire(ctx);
+    blk_set_aio_context(blk, main_ctx);
+    bdrv_try_set_aio_context(target, main_ctx, &error_abort);
+    aio_context_release(ctx);
+
+    blk_unref(blk);
+    bdrv_unref(src);
+    bdrv_unref(target);
+}
+
 int main(int argc, char **argv)
 {
     int i;
@@ -605,6 +675,7 @@ int main(int argc, char **argv)
     g_test_add_func("/attach/blockjob", test_attach_blockjob);
     g_test_add_func("/propagate/basic", test_propagate_basic);
     g_test_add_func("/propagate/diamond", test_propagate_diamond);
+    g_test_add_func("/propagate/mirror", test_propagate_mirror);
=20
     return g_test_run();
 }
--=20
2.20.1


