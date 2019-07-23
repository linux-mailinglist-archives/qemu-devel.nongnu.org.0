Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCB71FE6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 21:06:50 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hq07d-0002xX-9Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 15:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hq07Q-0002Uo-Dh
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 15:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hq07P-0001LF-2d
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 15:06:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1hq07N-0001Hz-0H; Tue, 23 Jul 2019 15:06:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D48D81DEB;
 Tue, 23 Jul 2019 19:06:31 +0000 (UTC)
Received: from localhost (ovpn-117-177.ams2.redhat.com [10.36.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 264155B684;
 Tue, 23 Jul 2019 19:06:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jul 2019 20:06:23 +0100
Message-Id: <20190723190623.21537-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 23 Jul 2019 19:06:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] util/async: hold AioContext ref to prevent
 use-after-free
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests/test-bdrv-drain /bdrv-drain/iothread/drain test case does the
following:

1. The preadv coroutine calls aio_bh_schedule_oneshot() and then yields.
2. The one-shot BH executes in another AioContext.  All it does is call
   aio_co_wakeup(preadv_co).
3. The preadv coroutine is re-entered and returns.

There is a race condition in aio_co_wake() where the preadv coroutine
returns and the test case destroys the preadv IOThread.  aio_co_wake()
can still be running in the other AioContext and it performs an access
to the freed IOThread AioContext.

Here is the race in aio_co_schedule():

  QSLIST_INSERT_HEAD_ATOMIC(&ctx->scheduled_coroutines,
                            co, co_scheduled_next);
  <-- race: co may execute before we invoke qemu_bh_schedule()!
  qemu_bh_schedule(ctx->co_schedule_bh);

So if co causes ctx to be freed then we're in trouble.  Fix this problem
by holding a reference to ctx.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/async.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/async.c b/util/async.c
index 8d2105729c..4e4c7af51e 100644
--- a/util/async.c
+++ b/util/async.c
@@ -459,9 +459,17 @@ void aio_co_schedule(AioContext *ctx, Coroutine *co)
         abort();
     }
=20
+    /* The coroutine might run and release the last ctx reference before=
 we
+     * invoke qemu_bh_schedule().  Take a reference to keep ctx alive un=
til
+     * we're done.
+     */
+    aio_context_ref(ctx);
+
     QSLIST_INSERT_HEAD_ATOMIC(&ctx->scheduled_coroutines,
                               co, co_scheduled_next);
     qemu_bh_schedule(ctx->co_schedule_bh);
+
+    aio_context_unref(ctx);
 }
=20
 void aio_co_wake(struct Coroutine *co)
--=20
2.21.0


