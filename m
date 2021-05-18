Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B833876E0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:47:40 +0200 (CEST)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixGF-0004ti-60
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweZ-00033S-9Z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweR-0007ny-4v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hH0KaJLTuxEGlx+BcDzKz/h562Ra2sccX4igiEtrYOA=;
 b=aVgXB7O5H987YB7f9mK9sQ6t1nuovBq3I7ACt62us0SaGSSwKD+1ehcNSgdD8sybpoxENT
 o84ZjDvRiRPuz5yDUs1VRLUPU0qf5pDKkSWuoX2Q85AOqA18fOwOXIUiys/L56dAR5jqKQ
 tz7u0VRSSoOAYq1lfvOWbTgjfNxTR5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-xxyx_3V9PFWOrFUrkVoeUg-1; Tue, 18 May 2021 06:08:28 -0400
X-MC-Unique: xxyx_3V9PFWOrFUrkVoeUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D8180006E;
 Tue, 18 May 2021 10:08:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64F2D50FA1;
 Tue, 18 May 2021 10:08:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
Date: Tue, 18 May 2021 12:07:54 +0200
Message-Id: <20210518100757.31243-5-eesposit@redhat.com>
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
References: <20210518100757.31243-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the list of tasks is only modified by coroutine
functions, add a CoMutex in order to protect them.

Use the same mutex to protect also BlockCopyState in_flight_bytes
field to avoid adding additional syncronization primitives.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 55 +++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 2e610b4142..3a949fab64 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -83,7 +83,7 @@ typedef struct BlockCopyTask {
      */
     bool zeroes;
 
-    /* State */
+    /* State. Protected by tasks_lock */
     CoQueue wait_queue; /* coroutines blocked on this task */
 
     /* To reference all call states from BlockCopyState */
@@ -106,8 +106,9 @@ typedef struct BlockCopyState {
     BdrvChild *target;
 
     /* State */
-    int64_t in_flight_bytes;
+    int64_t in_flight_bytes; /* protected by tasks_lock */
     BlockCopyMethod method;
+    CoMutex tasks_lock;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QLIST_HEAD(, BlockCopyCallState) calls;
     /* State fields that use a thread-safe API */
@@ -142,8 +143,10 @@ typedef struct BlockCopyState {
     bool skip_unallocated;
 } BlockCopyState;
 
-static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
-                                            int64_t offset, int64_t bytes)
+/* Called with lock held */
+static BlockCopyTask *find_conflicting_task_locked(BlockCopyState *s,
+                                                   int64_t offset,
+                                                   int64_t bytes)
 {
     BlockCopyTask *t;
 
@@ -163,13 +166,16 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
 static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
                                              int64_t bytes)
 {
-    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
+    BlockCopyTask *task;
+
+    QEMU_LOCK_GUARD(&s->tasks_lock);
+    task = find_conflicting_task_locked(s, offset, bytes);
 
     if (!task) {
         return false;
     }
 
-    qemu_co_queue_wait(&task->wait_queue, NULL);
+    qemu_co_queue_wait(&task->wait_queue, &s->tasks_lock);
 
     return true;
 }
@@ -213,11 +219,7 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
 
-    /* region is dirty, so no existent tasks possible in it */
-    assert(!find_conflicting_task(s, offset, bytes));
-
     bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-    s->in_flight_bytes += bytes;
 
     task = g_new(BlockCopyTask, 1);
     *task = (BlockCopyTask) {
@@ -228,7 +230,13 @@ static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         .bytes = bytes,
     };
     qemu_co_queue_init(&task->wait_queue);
-    QLIST_INSERT_HEAD(&s->tasks, task, list);
+
+    WITH_QEMU_LOCK_GUARD(&s->tasks_lock) {
+        s->in_flight_bytes += bytes;
+        /* region is dirty, so no existent tasks possible in it */
+        assert(!find_conflicting_task_locked(s, offset, bytes));
+        QLIST_INSERT_HEAD(&s->tasks, task, list);
+    }
 
     return task;
 }
@@ -249,25 +257,29 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
 
     assert(new_bytes > 0 && new_bytes < task->bytes);
 
-    task->s->in_flight_bytes -= task->bytes - new_bytes;
     bdrv_set_dirty_bitmap(task->s->copy_bitmap,
                           task->offset + new_bytes, task->bytes - new_bytes);
 
-    task->bytes = new_bytes;
-    qemu_co_queue_restart_all(&task->wait_queue);
+    WITH_QEMU_LOCK_GUARD(&task->s->tasks_lock) {
+        task->s->in_flight_bytes -= task->bytes - new_bytes;
+        task->bytes = new_bytes;
+        qemu_co_queue_restart_all(&task->wait_queue);
+    }
 }
 
 static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
 {
-    task->s->in_flight_bytes -= task->bytes;
     if (ret < 0) {
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
     }
-    QLIST_REMOVE(task, list);
-    progress_set_remaining(task->s->progress,
-                           bdrv_get_dirty_count(task->s->copy_bitmap) +
-                           task->s->in_flight_bytes);
-    qemu_co_queue_restart_all(&task->wait_queue);
+    WITH_QEMU_LOCK_GUARD(&task->s->tasks_lock) {
+        task->s->in_flight_bytes -= task->bytes;
+        QLIST_REMOVE(task, list);
+        progress_set_remaining(task->s->progress,
+                               bdrv_get_dirty_count(task->s->copy_bitmap) +
+                               task->s->in_flight_bytes);
+        qemu_co_queue_restart_all(&task->wait_queue);
+    }
 }
 
 void block_copy_state_free(BlockCopyState *s)
@@ -336,6 +348,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     ratelimit_init(&s->rate_limit);
+    qemu_co_mutex_init(&s->tasks_lock);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
@@ -586,9 +599,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 
     if (!ret) {
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+        qemu_co_mutex_lock(&s->tasks_lock);
         progress_set_remaining(s->progress,
                                bdrv_get_dirty_count(s->copy_bitmap) +
                                s->in_flight_bytes);
+        qemu_co_mutex_unlock(&s->tasks_lock);
     }
 
     *count = bytes;
-- 
2.30.2


