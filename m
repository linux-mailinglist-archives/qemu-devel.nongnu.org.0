Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F333314BCD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 16:30:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNed0-0007ea-4Z
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 10:30:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hNeap-0006On-RF
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hNeao-0000cY-PB
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:27:47 -0400
Received: from relay.sw.ru ([185.231.240.75]:45582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hNeao-0000bZ-G2; Mon, 06 May 2019 10:27:46 -0400
Received: from [10.28.8.145] (helo=kvm.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hNeak-000444-Ji; Mon, 06 May 2019 17:27:42 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon,  6 May 2019 17:27:36 +0300
Message-Id: <20190506142741.41731-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190506142741.41731-1-vsementsov@virtuozzo.com>
References: <20190506142741.41731-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6 3/8] qcow2-threads: use thread_pool_submit_co
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
	mreitz@redhat.com, den@openvz.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use thread_pool_submit_co, instead of reinventing it here. Note, that
thread_pool_submit_aio() never returns NULL, so checking it was an
extra thing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-threads.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 85b8034fd2..5a39fdac69 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -144,17 +144,11 @@ static int qcow2_compress_pool_func(void *opaque)
     return 0;
 }
 
-static void qcow2_compress_complete(void *opaque, int ret)
-{
-    qemu_coroutine_enter(opaque);
-}
-
 static ssize_t coroutine_fn
 qcow2_co_do_compress(BlockDriverState *bs, void *dest, size_t dest_size,
                      const void *src, size_t src_size, Qcow2CompressFunc func)
 {
     BDRVQcow2State *s = bs->opaque;
-    BlockAIOCB *acb;
     ThreadPool *pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
     Qcow2CompressData arg = {
         .dest = dest,
@@ -169,16 +163,9 @@ qcow2_co_do_compress(BlockDriverState *bs, void *dest, size_t dest_size,
     }
 
     s->nb_compress_threads++;
-    acb = thread_pool_submit_aio(pool, qcow2_compress_pool_func, &arg,
-                                 qcow2_compress_complete,
-                                 qemu_coroutine_self());
-
-    if (!acb) {
-        s->nb_compress_threads--;
-        return -EINVAL;
-    }
-    qemu_coroutine_yield();
+    thread_pool_submit_co(pool, qcow2_compress_pool_func, &arg);
     s->nb_compress_threads--;
+
     qemu_co_queue_next(&s->compress_wait_queue);
 
     return arg.ret;
-- 
2.18.0


