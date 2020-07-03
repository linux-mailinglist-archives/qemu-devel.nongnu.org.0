Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6C213D95
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:31:00 +0200 (CEST)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrOaZ-0000e7-6T
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jrOHx-0001Om-D5; Fri, 03 Jul 2020 12:11:46 -0400
Received: from relay.sw.ru ([185.231.240.75]:48370 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jrOHq-0002cp-VU; Fri, 03 Jul 2020 12:11:43 -0400
Received: from [192.168.15.23] (helo=iris.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1jrOHf-0005Rg-IH; Fri, 03 Jul 2020 19:11:27 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/7] block/aio_task: drop aio_task_pool_wait_one() helper
Date: Fri,  3 Jul 2020 19:11:26 +0300
Message-Id: <20200703161130.23772-4-den@openvz.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703161130.23772-1-den@openvz.org>
References: <20200703161130.23772-1-den@openvz.org>
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 12:11:34
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
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not used outside the module.

Actually there are 2 kind of waiters:
- for a slot and
- for all tasks to finish
This patch limits external API to listed types.

Signed-off-by: Denis V. Lunev <den@openvz.org>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 block/aio_task.c         | 13 ++-----------
 include/block/aio_task.h |  1 -
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/block/aio_task.c b/block/aio_task.c
index cf62e5c58b..7ba15ff41f 100644
--- a/block/aio_task.c
+++ b/block/aio_task.c
@@ -54,26 +54,17 @@ static void coroutine_fn aio_task_co(void *opaque)
     qemu_co_queue_restart_all(&pool->waiters);
 }
 
-void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
-{
-    assert(pool->busy_tasks > 0);
-
-    qemu_co_queue_wait(&pool->waiters, NULL);
-
-    assert(pool->busy_tasks < pool->max_busy_tasks);
-}
-
 void coroutine_fn aio_task_pool_wait_slot(AioTaskPool *pool)
 {
     while (pool->busy_tasks >= pool->max_busy_tasks) {
-        aio_task_pool_wait_one(pool);
+        qemu_co_queue_wait(&pool->waiters, NULL);
     }
 }
 
 void coroutine_fn aio_task_pool_wait_all(AioTaskPool *pool)
 {
     while (pool->busy_tasks > 0) {
-        aio_task_pool_wait_one(pool);
+        qemu_co_queue_wait(&pool->waiters, NULL);
     }
 }
 
diff --git a/include/block/aio_task.h b/include/block/aio_task.h
index 50bc1e1817..50b1c036c5 100644
--- a/include/block/aio_task.h
+++ b/include/block/aio_task.h
@@ -48,7 +48,6 @@ bool aio_task_pool_empty(AioTaskPool *pool);
 void coroutine_fn aio_task_pool_start_task(AioTaskPool *pool, AioTask *task);
 
 void coroutine_fn aio_task_pool_wait_slot(AioTaskPool *pool);
-void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool);
 void coroutine_fn aio_task_pool_wait_all(AioTaskPool *pool);
 
 #endif /* BLOCK_AIO_TASK_H */
-- 
2.17.1


