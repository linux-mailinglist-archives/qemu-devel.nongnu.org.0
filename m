Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598942E198
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:50:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0q7-0005or-HN
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:50:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n8-0004V3-Sb
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hW0n7-00053Q-RW
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:47:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:43132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n7-00051r-JQ; Wed, 29 May 2019 11:47:01 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hW0n2-0004iP-KH; Wed, 29 May 2019 18:46:56 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 29 May 2019 18:46:52 +0300
Message-Id: <20190529154654.95870-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190529154654.95870-1-vsementsov@virtuozzo.com>
References: <20190529154654.95870-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 5/7] block/io: refactor
 wait_serialising_requests
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out do_wait_serialising_requests with additional possibility to
not actually wait but just check, that there is something to wait for.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/block/io.c b/block/io.c
index 3134a60a48..c347f90722 100644
--- a/block/io.c
+++ b/block/io.c
@@ -720,12 +720,13 @@ void bdrv_dec_in_flight(BlockDriverState *bs)
     bdrv_wakeup(bs);
 }
 
-static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
+static bool coroutine_fn do_wait_serialising_requests(BdrvTrackedRequest *self,
+                                                      bool wait)
 {
     BlockDriverState *bs = self->bs;
     BdrvTrackedRequest *req;
     bool retry;
-    bool waited = false;
+    bool found = false;
 
     if (!atomic_read(&bs->serialising_in_flight)) {
         return false;
@@ -751,11 +752,13 @@ static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
                  * will wait for us as soon as it wakes up, then just go on
                  * (instead of producing a deadlock in the former case). */
                 if (!req->waiting_for) {
-                    self->waiting_for = req;
-                    qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
-                    self->waiting_for = NULL;
-                    retry = true;
-                    waited = true;
+                    found = true;
+                    if (wait) {
+                        self->waiting_for = req;
+                        qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
+                        self->waiting_for = NULL;
+                        retry = true;
+                    }
                     break;
                 }
             }
@@ -763,7 +766,12 @@ static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
         qemu_co_mutex_unlock(&bs->reqs_lock);
     } while (retry);
 
-    return waited;
+    return found;
+}
+
+static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
+{
+    return do_wait_serialising_requests(self, true);
 }
 
 static int bdrv_check_byte_request(BlockDriverState *bs, int64_t offset,
-- 
2.18.0


