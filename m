Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131A1FBB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:22:13 +0200 (CEST)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlELk-0006oa-J1
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jlEKM-0004vl-Oi; Tue, 16 Jun 2020 12:20:46 -0400
Received: from relay.sw.ru ([185.231.240.75]:43694 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jlEKJ-0006a0-63; Tue, 16 Jun 2020 12:20:46 -0400
Received: from [192.168.15.172] (helo=iris.lishka.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1jlEK1-0003Pf-6T; Tue, 16 Jun 2020 19:20:25 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] block/aio_task: allow start/wait task from any coroutine
Date: Tue, 16 Jun 2020 19:20:32 +0300
Message-Id: <20200616162035.29857-3-den@openvz.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616162035.29857-1-den@openvz.org>
References: <20200616162035.29857-1-den@openvz.org>
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 12:20:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Currently, aio task pool assumes that there is a main coroutine, which
creates tasks and wait for them. Let's remove the restriction by using
CoQueue. Code becomes clearer, interface more obvious.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
CC: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 block/aio_task.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/block/aio_task.c b/block/aio_task.c
index 88989fa248..cf62e5c58b 100644
--- a/block/aio_task.c
+++ b/block/aio_task.c
@@ -27,11 +27,10 @@
 #include "block/aio_task.h"
 
 struct AioTaskPool {
-    Coroutine *main_co;
     int status;
     int max_busy_tasks;
     int busy_tasks;
-    bool waiting;
+    CoQueue waiters;
 };
 
 static void coroutine_fn aio_task_co(void *opaque)
@@ -52,31 +51,23 @@ static void coroutine_fn aio_task_co(void *opaque)
 
     g_free(task);
 
-    if (pool->waiting) {
-        pool->waiting = false;
-        aio_co_wake(pool->main_co);
-    }
+    qemu_co_queue_restart_all(&pool->waiters);
 }
 
 void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
 {
     assert(pool->busy_tasks > 0);
-    assert(qemu_coroutine_self() == pool->main_co);
 
-    pool->waiting = true;
-    qemu_coroutine_yield();
+    qemu_co_queue_wait(&pool->waiters, NULL);
 
-    assert(!pool->waiting);
     assert(pool->busy_tasks < pool->max_busy_tasks);
 }
 
 void coroutine_fn aio_task_pool_wait_slot(AioTaskPool *pool)
 {
-    if (pool->busy_tasks < pool->max_busy_tasks) {
-        return;
+    while (pool->busy_tasks >= pool->max_busy_tasks) {
+        aio_task_pool_wait_one(pool);
     }
-
-    aio_task_pool_wait_one(pool);
 }
 
 void coroutine_fn aio_task_pool_wait_all(AioTaskPool *pool)
@@ -98,8 +89,8 @@ AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks)
 {
     AioTaskPool *pool = g_new0(AioTaskPool, 1);
 
-    pool->main_co = qemu_coroutine_self();
     pool->max_busy_tasks = max_busy_tasks;
+    qemu_co_queue_init(&pool->waiters);
 
     return pool;
 }
-- 
2.17.1


