Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D65FE000
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 15:25:10 +0100 (CET)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVcX7-0006B7-Aw
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 09:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iVcNK-0004dF-Oe
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 09:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iVcNJ-0001xS-Gk
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 09:15:02 -0500
Received: from relay.sw.ru ([185.231.240.75]:47452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iVcNG-0001rs-J4; Fri, 15 Nov 2019 09:14:58 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iVcN5-0006WW-Ad; Fri, 15 Nov 2019 17:14:47 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [RFC 12/24] block/block-copy: move block_copy_task_create down
Date: Fri, 15 Nov 2019 17:14:32 +0300
Message-Id: <20191115141444.24155-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191115141444.24155-1-vsementsov@virtuozzo.com>
References: <20191115141444.24155-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, armbru@redhat.com,
 qemu-devel@nongnu.org, jsnow@redhat.com, crosa@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple movement without any change. It's needed for the following
patch, as this function will need to use some staff which is currently
below it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 64 +++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 0525a9fcd5..4e8c64a45d 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -111,38 +111,6 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t start,
     return true;
 }
 
-static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
-                                             int64_t offset, int64_t bytes)
-{
-    int64_t next_zero;
-    BlockCopyTask *task = g_new(BlockCopyTask, 1);
-
-    assert(bdrv_dirty_bitmap_get(s->copy_bitmap, offset));
-
-    bytes = MIN(bytes, s->copy_size);
-    next_zero = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, offset, bytes);
-    if (next_zero >= 0) {
-        assert(next_zero > offset); /* offset is dirty */
-        assert(next_zero < offset + bytes); /* no need to do MIN() */
-        bytes = next_zero - offset;
-    }
-
-    /* region is dirty, so no existent tasks possible in it */
-    assert(!block_copy_find_task(s, offset, bytes));
-
-    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-
-    *task = (BlockCopyTask) {
-        .s = s,
-        .offset = offset,
-        .bytes = bytes,
-    };
-    qemu_co_queue_init(&task->wait_queue);
-    QLIST_INSERT_HEAD(&s->tasks, task, list);
-
-    return task;
-}
-
 static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
                                                 int64_t new_bytes)
 {
@@ -348,6 +316,38 @@ out:
     return ret;
 }
 
+static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
+                                             int64_t offset, int64_t bytes)
+{
+    int64_t next_zero;
+    BlockCopyTask *task = g_new(BlockCopyTask, 1);
+
+    assert(bdrv_dirty_bitmap_get(s->copy_bitmap, offset));
+
+    bytes = MIN(bytes, s->copy_size);
+    next_zero = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, offset, bytes);
+    if (next_zero >= 0) {
+        assert(next_zero > offset); /* offset is dirty */
+        assert(next_zero < offset + bytes); /* no need to do MIN() */
+        bytes = next_zero - offset;
+    }
+
+    /* region is dirty, so no existent tasks possible in it */
+    assert(!block_copy_find_task(s, offset, bytes));
+
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+
+    *task = (BlockCopyTask) {
+        .s = s,
+        .offset = offset,
+        .bytes = bytes,
+    };
+    qemu_co_queue_init(&task->wait_queue);
+    QLIST_INSERT_HEAD(&s->tasks, task, list);
+
+    return task;
+}
+
 static int block_copy_block_status(BlockCopyState *s, int64_t offset,
                                    int64_t bytes, int64_t *pnum)
 {
-- 
2.21.0


