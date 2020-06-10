Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36871F56F1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 16:42:47 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj1wE-0000cw-Mu
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 10:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jj1v7-0007wo-CM; Wed, 10 Jun 2020 10:41:37 -0400
Received: from relay.sw.ru ([185.231.240.75]:60328 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jj1v6-0001WO-3B; Wed, 10 Jun 2020 10:41:36 -0400
Received: from [192.168.15.9] (helo=iris.lishka.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1jj1v0-0004Xb-Gm; Wed, 10 Jun 2020 17:41:30 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] aio: allow to wait for coroutine pool from different
 coroutine
Date: Wed, 10 Jun 2020 17:41:28 +0300
Message-Id: <20200610144129.27659-2-den@openvz.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610144129.27659-1-den@openvz.org>
References: <20200610144129.27659-1-den@openvz.org>
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 10:41:32
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch preserves the constraint that the only waiter is allowed.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
CC: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 block/aio_task.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/aio_task.c b/block/aio_task.c
index 88989fa248..f338049147 100644
--- a/block/aio_task.c
+++ b/block/aio_task.c
@@ -27,7 +27,7 @@
 #include "block/aio_task.h"
 
 struct AioTaskPool {
-    Coroutine *main_co;
+    Coroutine *wake_co;
     int status;
     int max_busy_tasks;
     int busy_tasks;
@@ -54,15 +54,15 @@ static void coroutine_fn aio_task_co(void *opaque)
 
     if (pool->waiting) {
         pool->waiting = false;
-        aio_co_wake(pool->main_co);
+        aio_co_wake(pool->wake_co);
     }
 }
 
 void coroutine_fn aio_task_pool_wait_one(AioTaskPool *pool)
 {
     assert(pool->busy_tasks > 0);
-    assert(qemu_coroutine_self() == pool->main_co);
 
+    pool->wake_co = qemu_coroutine_self();
     pool->waiting = true;
     qemu_coroutine_yield();
 
@@ -98,7 +98,7 @@ AioTaskPool *coroutine_fn aio_task_pool_new(int max_busy_tasks)
 {
     AioTaskPool *pool = g_new0(AioTaskPool, 1);
 
-    pool->main_co = qemu_coroutine_self();
+    pool->wake_co = NULL;
     pool->max_busy_tasks = max_busy_tasks;
 
     return pool;
-- 
2.17.1


