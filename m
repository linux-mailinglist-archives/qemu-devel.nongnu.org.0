Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5E28242
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:13:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqL1-00064E-Lz
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:13:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAJ-0004T3-Us
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:02:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hTqAI-00026x-Fa
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:01:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hTqAE-0001ul-Uz; Thu, 23 May 2019 12:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9482A307D984;
	Thu, 23 May 2019 16:01:43 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-143.ams2.redhat.com
	[10.36.116.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 817091001E6F;
	Thu, 23 May 2019 16:01:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 23 May 2019 18:01:03 +0200
Message-Id: <20190523160104.21258-15-kwolf@redhat.com>
In-Reply-To: <20190523160104.21258-1-kwolf@redhat.com>
References: <20190523160104.21258-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 23 May 2019 16:01:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 14/15] test-bdrv-drain: Use
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason to use the unchecked version in tests, even more so when these
are the last callers of bdrv_set_aio_context() outside of block.c.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-bdrv-drain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 2ff04db07a..fb7866efbd 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -1515,16 +1515,16 @@ static void test_set_aio_context(void)
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


