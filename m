Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA1526E5C
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 08:56:32 +0200 (CEST)
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nplhX-0002bU-MB
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 02:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbR-00088K-OE
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nplbO-0007cF-6s
 for qemu-devel@nongnu.org; Sat, 14 May 2022 02:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652511008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdpCdF+M6PFa+6EDCyxAW/GUiqOERlOENgrK/FUuAwg=;
 b=cUzScu2nN2JzkLyzBEZbSPzOtRoz0/oH28ci7joAJ3QSoJvWiubuD2+isjjvx6MGA6Nyi2
 8zgAJrGugxtGKGzQoBAZJH3K8RJM65QW9b55uzQ0G2SAnxA1pkWhV5lOxsmkBAZfA6596y
 haWefFe3v5oxosMyZ+0TBkqkhwsi34M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-Rx5Xes-eMRGGhB8mp_ZCCA-1; Sat, 14 May 2022 02:50:07 -0400
X-MC-Unique: Rx5Xes-eMRGGhB8mp_ZCCA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o13-20020adfa10d000000b0020c6fa5a77cso3288214wro.23
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 23:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sdpCdF+M6PFa+6EDCyxAW/GUiqOERlOENgrK/FUuAwg=;
 b=YvdOpn6XPhfzXMEdqjXT/zVdOVBwlfN1maRbq9WkFZB5cFoR35zYLcj2StzMY88XFt
 WJrKOshFcGQY4t28Zcc0e+Lp4tItAP2fazei9r2/AE3peExtdwEMkMG9+2OZFlCd7QJF
 8yvK31/mzFYtOD7/hJpRfD3bYorBaYErOosFecj42iY6l2hxIeXCVqupC/h2nOs6QgYc
 1WPQ5E3CBhW+shq8lluC+pI6Y4XVaG4AqOxcItU0RQsMZRuKfg+xuXrYyYmsYcw1CpI5
 zoiVu1hnTTgnfHlSxPkLH/yi1ajSrxRlmvh1vTOmXywqWl5Zn4hKS2/Cwit7MEfLPO7q
 T4IA==
X-Gm-Message-State: AOAM531ocYinufrJCnagnVcVc82pIcv6y12HKD1CA2MAKMm0cxSv93nI
 O5nF45IlhOr5hM+Owm/SHkQ0vBc4Re4O3JENNPr5A0Izrf4b3xaoaXGRvyb6hF0XMrMDxd36Ue9
 C1vUY5C6skrohA+rSmlkYXyUudTCeYNG9s2IlTu0AXZ+tXT0hFAIOFsPJ5sMQRl/P6Gw=
X-Received: by 2002:adf:f747:0:b0:20a:d30a:5f08 with SMTP id
 z7-20020adff747000000b0020ad30a5f08mr6611560wrp.278.1652511005651; 
 Fri, 13 May 2022 23:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk4QLgcnpkctR27Mah2qpxF1vybWNZNUu/gBsq3OFXXJJxETZkWkpU9p+/n1plW1qDBIESnA==
X-Received: by 2002:adf:f747:0:b0:20a:d30a:5f08 with SMTP id
 z7-20020adff747000000b0020ad30a5f08mr6611537wrp.278.1652511005288; 
 Fri, 13 May 2022 23:50:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adfc089000000b0020cf071a168sm3322037wrf.29.2022.05.13.23.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 23:50:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, nsaenzju@redhat.com,
 =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>
Subject: [PATCH v3 0/3] thread-pool: fix performance regression
Date: Sat, 14 May 2022 08:50:02 +0200
Message-Id: <20220514065002.1149512-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Together, these two patches fix the performance regression induced by
QemuSemaphore; individually they don't though.

The third patch is a small cleanup on top, that was enabled by the
recent introduction of min_threads/max_threads knobs for the
thread pool.

6.2:
   iops        : min=58051, max=62260, avg=60282.57, stdev=1081.18, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  775]
   iops        : min=59401, max=61290, avg=60651.27, stdev=468.24, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  717]
   iops        : min=59583, max=60816, avg=60353.43, stdev=282.69, samples=30
    clat percentiles (usec):   1.00th=[  490],   99.99th=[  701]
   iops        : min=58099, max=60713, avg=59739.53, stdev=755.49, samples=30
    clat percentiles (usec):   1.00th=[  494],   99.99th=[  717]
	
patched:
   iops        : min=60616, max=62522, avg=61654.37, stdev=555.67, samples=30
    clat percentiles (usec):   1.00th=[  474],   99.99th=[ 1303]
   iops        : min=61841, max=63600, avg=62878.47, stdev=442.40, samples=30
    clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]
   iops        : min=62976, max=63910, avg=63531.60, stdev=261.05, samples=30
    clat percentiles (usec):   1.00th=[  461],   99.99th=[  693]
   iops        : min=60803, max=63623, avg=62653.37, stdev=808.76, samples=30
    clat percentiles (usec):   1.00th=[  465],   99.99th=[  685]
	
Paolo

v1->v2: support min_threads/max_threads

v2->v3: fix NULL pointer dereference [Nicolas]

Paolo Bonzini (3):
  thread-pool: optimize scheduling of completion bottom half
  thread-pool: replace semaphore with condition variable
  thread-pool: remove stopping variable

 util/thread-pool.c | 74 +++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 44 deletions(-)

-- 
2.36.0

From c7468d98055a6fccb126f514457ae35e689117d2 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 6 May 2022 07:47:10 -0400
Subject: [PATCH v3 1/3] thread-pool: optimize scheduling of completion bottom
 half
Content-Type: text/plain

The completion bottom half was scheduled within the pool->lock
critical section.  That actually results in worse performance,
because the worker thread can run its own small critical section
and go to sleep before the bottom half starts running.

Note that this simple change does not produce an improvement without
changing the thread pool QemuSemaphore to a condition variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 196835b4d3..4979f30ca3 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -127,9 +127,8 @@ static void *worker_thread(void *opaque)
         smp_wmb();
         req->state = THREAD_DONE;
 
-        qemu_mutex_lock(&pool->lock);
-
         qemu_bh_schedule(pool->completion_bh);
+        qemu_mutex_lock(&pool->lock);
     }
 
     pool->cur_threads--;
-- 
2.36.0


From c7f6d706e524402aacec5f825de599b0938fe3ef Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 May 2022 12:27:41 +0200
Subject: [PATCH v3 2/3] thread-pool: replace semaphore with condition variable
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 68 +++++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 4979f30ca3..6bbf24754a 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -57,7 +57,7 @@ struct ThreadPool {
     QEMUBH *completion_bh;
     QemuMutex lock;
     QemuCond worker_stopped;
-    QemuSemaphore sem;
+    QemuCond request_cond;
     QEMUBH *new_thread_bh;
 
     /* The following variables are only accessed from one AioContext. */
@@ -74,23 +74,6 @@ struct ThreadPool {
     int max_threads;
 };
 
-static inline bool back_to_sleep(ThreadPool *pool, int ret)
-{
-    /*
-     * The semaphore timed out, we should exit the loop except when:
-     *  - There is work to do, we raced with the signal.
-     *  - The max threads threshold just changed, we raced with the signal.
-     *  - The thread pool forces a minimum number of readily available threads.
-     */
-    if (ret == -1 && (!QTAILQ_EMPTY(&pool->request_list) ||
-            pool->cur_threads > pool->max_threads ||
-            pool->cur_threads <= pool->min_threads)) {
-            return true;
-    }
-
-    return false;
-}
-
 static void *worker_thread(void *opaque)
 {
     ThreadPool *pool = opaque;
@@ -99,20 +82,25 @@ static void *worker_thread(void *opaque)
     pool->pending_threads--;
     do_spawn_thread(pool);
 
-    while (!pool->stopping) {
+    while (!pool->stopping && pool->cur_threads <= pool->max_threads) {
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
-        } while (back_to_sleep(pool, ret));
-        if (ret == -1 || pool->stopping ||
-            pool->cur_threads > pool->max_threads) {
-            break;
+            if (ret == 0 &&
+                QTAILQ_EMPTY(&pool->request_list) &&
+                pool->cur_threads > pool->min_threads) {
+                /* Timed out + no work to do + no need for warm threads = exit.  */
+                break;
+            }
+            /*
+             * Even if there was some work to do, check if there aren't
+             * too many worker threads before picking it up.
+             */
+            continue;
         }
 
         req = QTAILQ_FIRST(&pool->request_list);
@@ -134,6 +122,12 @@ static void *worker_thread(void *opaque)
     pool->cur_threads--;
     qemu_cond_signal(&pool->worker_stopped);
     qemu_mutex_unlock(&pool->lock);
+
+    /*
+     * Wake up another thread, in case we got a wakeup but decided
+     * to exit due to pool->cur_threads > pool->max_threads.
+     */
+    qemu_cond_signal(&pool->worker_stopped);
     return NULL;
 }
 
@@ -229,13 +223,7 @@ static void thread_pool_cancel(BlockAIOCB *acb)
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
 
@@ -280,7 +268,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
     }
     QTAILQ_INSERT_TAIL(&pool->request_list, req, reqs);
     qemu_mutex_unlock(&pool->lock);
-    qemu_sem_post(&pool->sem);
+    qemu_cond_signal(&pool->request_cond);
     return &req->common;
 }
 
@@ -323,7 +311,7 @@ void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
      * We either have to:
      *  - Increase the number available of threads until over the min_threads
      *    threshold.
-     *  - Decrease the number of available threads until under the max_threads
+     *  - Bump the worker threads so that they exit, until under the max_threads
      *    threshold.
      *  - Do nothing. The current number of threads fall in between the min and
      *    max thresholds. We'll let the pool manage itself.
@@ -333,7 +321,7 @@ void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
     }
 
     for (int i = pool->cur_threads; i > pool->max_threads; i--) {
-        qemu_sem_post(&pool->sem);
+        qemu_cond_signal(&pool->request_cond);
     }
 
     qemu_mutex_unlock(&pool->lock);
@@ -350,7 +338,7 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     pool->completion_bh = aio_bh_new(ctx, thread_pool_completion_bh, pool);
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
-    qemu_sem_init(&pool->sem, 0);
+    qemu_cond_init(&pool->request_cond);
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
@@ -383,15 +371,15 @@ void thread_pool_free(ThreadPool *pool)
 
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
2.36.0


From 98cebebe9380fda00491de1ad68fdbe0a5a98bc6 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 May 2022 12:36:28 +0200
Subject: [PATCH v3 3/3] thread-pool: remove stopping variable
Content-Type: text/plain

Just setting the max threads to 0 is enough to stop all workers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/thread-pool.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/thread-pool.c b/util/thread-pool.c
index 6bbf24754a..507c998827 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -69,7 +69,6 @@ struct ThreadPool {
     int idle_threads;
     int new_threads;     /* backlog of threads we need to create */
     int pending_threads; /* threads created but not running yet */
-    bool stopping;
     int min_threads;
     int max_threads;
 };
@@ -82,7 +81,7 @@ static void *worker_thread(void *opaque)
     pool->pending_threads--;
     do_spawn_thread(pool);
 
-    while (!pool->stopping && pool->cur_threads <= pool->max_threads) {
+    while (pool->cur_threads <= pool->max_threads) {
         ThreadPoolElement *req;
         int ret;
 
@@ -370,7 +369,7 @@ void thread_pool_free(ThreadPool *pool)
     pool->new_threads = 0;
 
     /* Wait for worker threads to terminate */
-    pool->stopping = true;
+    pool->max_threads = 0;
     qemu_cond_broadcast(&pool->request_cond);
     while (pool->cur_threads > 0) {
         qemu_cond_wait(&pool->worker_stopped, &pool->lock);
-- 
2.36.0


