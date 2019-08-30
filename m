Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C677A3BDB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 18:22:11 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3jf8-0006Ti-3P
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 12:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i3jWB-00007a-Kz
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 12:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i3jWA-0004Xj-5A
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 12:12:55 -0400
Received: from relay.sw.ru ([185.231.240.75]:60604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i3jVw-0004Fh-TG; Fri, 30 Aug 2019 12:12:42 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i3jVm-0001X0-S9; Fri, 30 Aug 2019 19:12:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri, 30 Aug 2019 19:12:26 +0300
Message-Id: <20190830161228.54238-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190830161228.54238-1-vsementsov@virtuozzo.com>
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v10 12/14] block: add lock/unlock range
 functions
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce lock/unlock range functionality, based on serialized
requests. This is needed to refactor backup, dropping local
tracked-request-like synchronization.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  4 ++++
 block/io.c                | 44 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index ceec8c2f56..0307cc78c6 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -65,6 +65,7 @@ enum BdrvTrackedRequestType {
     BDRV_TRACKED_WRITE,
     BDRV_TRACKED_DISCARD,
     BDRV_TRACKED_TRUNCATE,
+    BDRV_TRACKED_LOCK,
 };
 
 typedef struct BdrvTrackedRequest {
@@ -947,6 +948,9 @@ int coroutine_fn bdrv_co_preadv(BdrvChild *child,
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
     int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
+void *coroutine_fn bdrv_co_try_lock(BlockDriverState *bs,
+                                    int64_t offset, unsigned int bytes);
+void coroutine_fn bdrv_co_unlock(void *opaque);
 
 static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
     int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
diff --git a/block/io.c b/block/io.c
index 378180b274..cd88b17e6b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -785,6 +785,15 @@ void bdrv_dec_in_flight(BlockDriverState *bs)
     bdrv_wakeup(bs);
 }
 
+static bool ignore_intersection(BdrvTrackedRequest *a, BdrvTrackedRequest *b)
+{
+    return a == b || (!a->serialising && !b->serialising) ||
+        (a->type == BDRV_TRACKED_LOCK && b->type == BDRV_TRACKED_READ &&
+         !b->serialising) ||
+        (b->type == BDRV_TRACKED_LOCK && a->type == BDRV_TRACKED_READ &&
+         !a->serialising);
+}
+
 static bool coroutine_fn do_wait_serialising_requests(BdrvTrackedRequest *self,
                                                       bool wait)
 {
@@ -801,7 +810,7 @@ static bool coroutine_fn do_wait_serialising_requests(BdrvTrackedRequest *self,
         retry = false;
         qemu_co_mutex_lock(&bs->reqs_lock);
         QLIST_FOREACH(req, &bs->tracked_requests, list) {
-            if (req == self || (!req->serialising && !self->serialising)) {
+            if (ignore_intersection(self, req)) {
                 continue;
             }
             if (tracked_request_overlaps(req, self->overlap_offset,
@@ -839,6 +848,12 @@ static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
     return do_wait_serialising_requests(self, true);
 }
 
+static bool coroutine_fn should_wait_serialising_requests(
+        BdrvTrackedRequest *self)
+{
+    return do_wait_serialising_requests(self, false);
+}
+
 static int bdrv_check_byte_request(BlockDriverState *bs, int64_t offset,
                                    size_t size)
 {
@@ -3271,3 +3286,30 @@ int bdrv_truncate(BdrvChild *child, int64_t offset, PreallocMode prealloc,
 
     return tco.ret;
 }
+
+void *coroutine_fn bdrv_co_try_lock(BlockDriverState *bs,
+                                    int64_t offset, unsigned int bytes)
+{
+    BdrvTrackedRequest *req = g_new(BdrvTrackedRequest, 1);
+
+    tracked_request_begin(req, bs, offset, bytes, BDRV_TRACKED_LOCK);
+    mark_request_serialising(req, bdrv_get_cluster_size(bs));
+
+    if (should_wait_serialising_requests(req)) {
+        tracked_request_end(req);
+        g_free(req);
+        return NULL;
+    }
+
+    return req;
+}
+
+void coroutine_fn bdrv_co_unlock(void *opaque)
+{
+    BdrvTrackedRequest *req = opaque;
+
+    assert(req->type == BDRV_TRACKED_LOCK);
+
+    tracked_request_end(req);
+    g_free(req);
+}
-- 
2.18.0


