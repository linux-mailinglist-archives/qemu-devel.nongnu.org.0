Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8328281
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:17:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqP1-0000jl-2g
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:17:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAY-0004k2-EB
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAX-0002Ie-7l
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTqAU-0001mK-4U; Thu, 23 May 2019 12:02:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79147C09AD13;
	Thu, 23 May 2019 16:01:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-143.ams2.redhat.com
	[10.36.116.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66E2A1001E6F;
	Thu, 23 May 2019 16:01:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 23 May 2019 18:00:56 +0200
Message-Id: <20190523160104.21258-8-kwolf@redhat.com>
In-Reply-To: <20190523160104.21258-1-kwolf@redhat.com>
References: <20190523160104.21258-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 23 May 2019 16:01:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 07/15] test-block-iothread: Test adding parent
 to iothread node
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

Opening a new parent node for a node that has already been moved into a
different AioContext must cause the new parent ot move into the same
context.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-block-iothread.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index 2200487d76..38f59999ab 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -663,6 +663,38 @@ static void test_propagate_mirror(void)
     bdrv_unref(target);
 }
=20
+static void test_attach_second_node(void)
+{
+    IOThread *iothread =3D iothread_new();
+    AioContext *ctx =3D iothread_get_aio_context(iothread);
+    AioContext *main_ctx =3D qemu_get_aio_context();
+    BlockBackend *blk;
+    BlockDriverState *bs, *filter;
+    QDict *options;
+
+    blk =3D blk_new(ctx, BLK_PERM_ALL, BLK_PERM_ALL);
+    bs =3D bdrv_new_open_driver(&bdrv_test, "base", BDRV_O_RDWR, &error_=
abort);
+    blk_insert_bs(blk, bs, &error_abort);
+
+    options =3D qdict_new();
+    qdict_put_str(options, "driver", "raw");
+    qdict_put_str(options, "file", "base");
+
+    filter =3D bdrv_open(NULL, NULL, options, BDRV_O_RDWR, &error_abort)=
;
+    g_assert(blk_get_aio_context(blk) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(bs) =3D=3D ctx);
+    g_assert(bdrv_get_aio_context(filter) =3D=3D ctx);
+
+    blk_set_aio_context(blk, main_ctx, &error_abort);
+    g_assert(blk_get_aio_context(blk) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(bs) =3D=3D main_ctx);
+    g_assert(bdrv_get_aio_context(filter) =3D=3D main_ctx);
+
+    bdrv_unref(filter);
+    bdrv_unref(bs);
+    blk_unref(blk);
+}
+
 int main(int argc, char **argv)
 {
     int i;
@@ -678,6 +710,7 @@ int main(int argc, char **argv)
     }
=20
     g_test_add_func("/attach/blockjob", test_attach_blockjob);
+    g_test_add_func("/attach/second_node", test_attach_second_node);
     g_test_add_func("/propagate/basic", test_propagate_basic);
     g_test_add_func("/propagate/diamond", test_propagate_diamond);
     g_test_add_func("/propagate/mirror", test_propagate_mirror);
--=20
2.20.1


