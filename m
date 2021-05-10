Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE22377EEB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:05:46 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1rF-000336-Tx
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1lz-00044T-69
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1lx-0005wC-7v
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pB1gUVEJLGXCbwQ9saUHJhCgpt3dW+ZVZpBbS0d+GM=;
 b=PE16iaOt0zHj3r/aqGiAMqw9f9N62tFwqhTOrAB2y7DXWhQZWxEjvN8Yyvh7c+r1Lv/GuU
 sAabb14IdU38FrvOt6d38ExBehnVYIYYq0Fk3nUtGZ4zIyM0mBtEuq9Bj4yKdn5ark2tq3
 03heqT8PbF+jZAan3AsSg5yEFbmX/nA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-oNoXE0F4N0qdB6fVND2J1w-1; Mon, 10 May 2021 05:00:15 -0400
X-MC-Unique: oNoXE0F4N0qdB6fVND2J1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 208478189DA;
 Mon, 10 May 2021 09:00:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B03BB62499;
 Mon, 10 May 2021 09:00:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 6/6] aiopool: protect with a mutex
Date: Mon, 10 May 2021 10:59:41 +0200
Message-Id: <20210510085941.22769-7-eesposit@redhat.com>
In-Reply-To: <20210510085941.22769-1-eesposit@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Divide the fields in AioTaskPool in IN and Status, and
introduce a CoQueue instead of .wait to take care of suspending
and resuming the calling coroutine, and a lock to protect the
busy_tasks counter accesses and the AioTask .ret field.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/aio_task.c         | 63 ++++++++++++++++++++++++----------------
 include/block/aio_task.h |  2 +-
 2 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/block/aio_task.c b/block/aio_task.c
index 88989fa248..7ac6b5dd72 100644
--- a/block/aio_task.c
+++ b/block/aio_task.c
@@ -27,62 +27,70 @@
 #include "block/aio_task.h"
 
 struct AioTaskPool {
-    Coroutine *main_co;
-    int status;
+    /* IN: just set in aio_task_pool_new and never modified */
     int max_busy_tasks;
+
+    /* Status: either atomic or protected by the lock */
+    int status;
     int busy_tasks;
-    bool waiting;
+    CoQueue queue;
+    CoMutex lock;
 };
 
 static void coroutine_fn aio_task_co(void *opaque)
 {
+    int ret;
     AioTask *task = opaque;
     AioTaskPool *pool = task->pool;
 
-    assert(pool->busy_tasks < pool->max_busy_tasks);
-    pool->busy_tasks++;
+    WITH_QEMU_LOCK_GUARD(&pool->lock) {
+        assert(pool->busy_tasks < pool->max_busy_tasks);
+        pool->busy_tasks++;
 
-    task->ret = task->func(task);
+        ret = task->func(task);
+        task->ret = ret;
 
-    pool->busy_tasks--;
+        pool->busy_tasks--;
+    }
 
-    if (task->ret < 0 && pool->status == 0) {
-        pool->status = task->ret;
+    if (ret < 0) {
+        qatomic_cmpxchg(&pool->status, 0, ret);
     }
 
     g_free(task);
 
-    if (pool->waiting) {
-        pool->waiting = false;
-        aio_co_wake(pool->main_co);
-    }
+    qemu_co_queue_next(&pool->queue);
 }
 
-void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
+/* Called with lock held */
+static void coroutine_fn aio_task_pool_wait_one_unlocked(AioTaskPool *pool)
 {
     assert(pool->busy_tasks > 0);
-    assert(qemu_coroutine_self() == pool->main_co);
-
-    pool->waiting = true;
-    qemu_coroutine_yield();
-
-    assert(!pool->waiting);
+    qemu_co_queue_wait(&pool->queue, &pool->lock);
     assert(pool->busy_tasks < pool->max_busy_tasks);
 }
 
+void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
+{
+    QEMU_LOCK_GUARD(&pool->lock);
+    aio_task_pool_wait_one_unlocked(pool);
+}
+
 void coroutine_fn aio_task_pool_wait_slot(AioTaskPool *pool)
 {
+    QEMU_LOCK_GUARD(&pool->lock);
     if (pool->busy_tasks < pool->max_busy_tasks) {
         return;
     }
 
-    aio_task_pool_wait_one(pool);
+    aio_task_pool_wait_one_unlocked(pool);
 }
 
 void coroutine_fn aio_task_pool_wait_all(AioTaskPool *pool)
 {
+    QEMU_LOCK_GUARD(&pool->lock);
     while (pool->busy_tasks > 0) {
-        aio_task_pool_wait_one(pool);
+        aio_task_pool_wait_one_unlocked(pool);
     }
 }
 
@@ -98,8 +106,8 @@ AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks)
 {
     AioTaskPool *pool = g_new0(AioTaskPool, 1);
 
-    pool->main_co = qemu_coroutine_self();
     pool->max_busy_tasks = max_busy_tasks;
+    qemu_co_queue_init(&pool->queue);
 
     return pool;
 }
@@ -115,10 +123,15 @@ int aio_task_pool_status(AioTaskPool *pool)
         return 0; /* Sugar for lazy allocation of aio pool */
     }
 
-    return pool->status;
+    return qatomic_read(&pool->status);
 }
 
 bool aio_task_pool_empty(AioTaskPool *pool)
 {
-    return pool->busy_tasks == 0;
+    int tasks;
+
+    qemu_co_mutex_lock(&pool->lock);
+    tasks = pool->busy_tasks;
+    qemu_co_mutex_unlock(&pool->lock);
+    return tasks == 0;
 }
diff --git a/include/block/aio_task.h b/include/block/aio_task.h
index 50bc1e1817..b22a4310aa 100644
--- a/include/block/aio_task.h
+++ b/include/block/aio_task.h
@@ -33,7 +33,7 @@ typedef int coroutine_fn (*AioTaskFunc)(AioTask *task);
 struct AioTask {
     AioTaskPool *pool;
     AioTaskFunc func;
-    int ret;
+    int ret; /* atomic */
 };
 
 AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks);
-- 
2.30.2


