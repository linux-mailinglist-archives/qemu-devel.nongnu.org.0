Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFEF51D70B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 13:50:14 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmwTM-0004PI-UZ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 07:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmwQd-0002KW-Iw
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:47:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:36596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmwQZ-0008KV-Pg
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651837637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYPejR+xm7AfJPjZe039oam3tIUkevBzq5/pi33NtEc=;
 b=DpOLcAas61ha68DYs1NUYTz0PDQuWQCRAlnzfbSzVAi23+9AAWHUi6DfxLgOp8frTWU2YB
 R402HPGA/YMBSMSKUtqLpimQE54Bcib12RpWwZhVlKak3Kzz3DhCJ1ojHiQPUXnAHHxnPp
 9QKWwJOFsPWDCwFe4qZy2rU3XNqB/J8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-eG9koSJIMWWzw3v4Vfunhg-1; Fri, 06 May 2022 07:47:15 -0400
X-MC-Unique: eG9koSJIMWWzw3v4Vfunhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FE5318A6582
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 11:47:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FCB29E75;
 Fri,  6 May 2022 11:47:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	ldoktor@redhat.com
Subject: [PATCH 2/2] thread-pool: replace semaphore with condition variable
Date: Fri,  6 May 2022 07:47:11 -0400
Message-Id: <20220506114711.1398662-3-pbonzini@redhat.com>
In-Reply-To: <20220506114711.1398662-1-pbonzini@redhat.com>
References: <20220506114711.1398662-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit f9fc8932b1 ("thread-posix: remove the posix semaphore
support", 2022-04-06) QemuSemaphore has its own mutex and condition
variable; this adds unnecessary overhead on I/O with small block sizes.

Check the QTAILQ directly instead of adding the indirection of a
semaphore's count.  Using a semaphore has not been necessary since
qemu_cond_timedwait was introduced; the new code has to be careful about
spurious wakeups but it is simpler, for example thread_pool_cancel does
not have to worry about synchronizing the semaphore count with the number
of elements of pool->request_list.

Note that the return value of qemu_cond_timedwait (0 for timeout, 1 for
signal or spurious wakeup) is different from that of qemu_sem_timedwait
(-1 for timeout, 0 for success).

Reported-by: Lukáš Doktor <ldoktor@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 7e9e2c178b..5511706de8 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -57,7 +57,7 @@ struct ThreadPool {
     QEMUBH *completion_bh;
     QemuMutex lock;
     QemuCond worker_stopped;
-    QemuSemaphore sem;
+    QemuCond request_cond;
     int max_threads;
     QEMUBH *new_thread_bh;
 
@@ -85,15 +85,14 @@ static void *worker_thread(void *opaque)
         ThreadPoolElement *req;
         int ret;
 
-        do {
+        if (QTAILQ_EMPTY(&pool->request_list)) {
             pool->idle_threads++;
-            qemu_mutex_unlock(&pool->lock);
-            ret = qemu_sem_timedwait(&pool->sem, 10000);
-            qemu_mutex_lock(&pool->lock);
+            ret = qemu_cond_timedwait(&pool->request_cond, &pool->lock, 10000);
             pool->idle_threads--;
-        } while (ret == -1 && !QTAILQ_EMPTY(&pool->request_list));
-        if (ret == -1 || pool->stopping) {
-            break;
+            if (!ret && QTAILQ_EMPTY(&pool->request_list)) {
+                break;
+            }
+            continue;
         }
 
         req = QTAILQ_FIRST(&pool->request_list);
@@ -210,13 +209,7 @@ static void thread_pool_cancel(BlockAIOCB *acb)
     trace_thread_pool_cancel(elem, elem->common.opaque);
 
     QEMU_LOCK_GUARD(&pool->lock);
-    if (elem->state == THREAD_QUEUED &&
-        /* No thread has yet started working on elem. we can try to "steal"
-         * the item from the worker if we can get a signal from the
-         * semaphore.  Because this is non-blocking, we can do it with
-         * the lock taken and ensure that elem will remain THREAD_QUEUED.
-         */
-        qemu_sem_timedwait(&pool->sem, 0) == 0) {
+    if (elem->state == THREAD_QUEUED) {
         QTAILQ_REMOVE(&pool->request_list, elem, reqs);
         qemu_bh_schedule(pool->completion_bh);
 
@@ -261,7 +254,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
     }
     QTAILQ_INSERT_TAIL(&pool->request_list, req, reqs);
     qemu_mutex_unlock(&pool->lock);
-    qemu_sem_post(&pool->sem);
+    qemu_cond_signal(&pool->request_cond);
     return &req->common;
 }
 
@@ -304,7 +297,7 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     pool->completion_bh = aio_bh_new(ctx, thread_pool_completion_bh, pool);
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
-    qemu_sem_init(&pool->sem, 0);
+    qemu_cond_init(&pool->request_cond);
     pool->max_threads = 64;
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
@@ -336,15 +329,15 @@ void thread_pool_free(ThreadPool *pool)
 
     /* Wait for worker threads to terminate */
     pool->stopping = true;
+    qemu_cond_broadcast(&pool->request_cond);
     while (pool->cur_threads > 0) {
-        qemu_sem_post(&pool->sem);
         qemu_cond_wait(&pool->worker_stopped, &pool->lock);
     }
 
     qemu_mutex_unlock(&pool->lock);
 
     qemu_bh_delete(pool->completion_bh);
-    qemu_sem_destroy(&pool->sem);
+    qemu_cond_destroy(&pool->request_cond);
     qemu_cond_destroy(&pool->worker_stopped);
     qemu_mutex_destroy(&pool->lock);
     g_free(pool);
-- 
2.31.1


