Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE933376
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:25:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXoqR-0001aD-CF
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:25:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoW6-0001aQ-3A
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoW4-0001XX-5u
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoVw-0001HK-LE; Mon, 03 Jun 2019 11:04:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D2773082212;
	Mon,  3 Jun 2019 15:04:39 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4942467279;
	Mon,  3 Jun 2019 15:04:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:29 +0200
Message-Id: <20190603150233.6614-25-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 15:04:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 24/28] test-bdrv-drain: Use
 bdrv_try_set_aio_context()
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

No reason to use the unchecked version in tests, even more so when these
are the last callers of bdrv_set_aio_context() outside of block.c.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-bdrv-drain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 44e658bde0..12e2ecf517 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -1509,16 +1509,16 @@ static void test_set_aio_context(void)
                               &error_abort);
=20
     bdrv_drained_begin(bs);
-    bdrv_set_aio_context(bs, ctx_a);
+    bdrv_try_set_aio_context(bs, ctx_a, &error_abort);
=20
     aio_context_acquire(ctx_a);
     bdrv_drained_end(bs);
=20
     bdrv_drained_begin(bs);
-    bdrv_set_aio_context(bs, ctx_b);
+    bdrv_try_set_aio_context(bs, ctx_b, &error_abort);
     aio_context_release(ctx_a);
     aio_context_acquire(ctx_b);
-    bdrv_set_aio_context(bs, qemu_get_aio_context());
+    bdrv_try_set_aio_context(bs, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx_b);
     bdrv_drained_end(bs);
=20
--=20
2.20.1


