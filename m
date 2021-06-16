Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F943AA585
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:44:10 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcOP-0007xS-26
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbQL-0003wy-FL
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iangelak@redhat.com>)
 id 1ltbQI-0002AO-UJ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJNS8kNhEM+NjI/cgj/GZ9ARp+JMy1k7vfyRMRJq5zU=;
 b=E8Sq6l+SC6L6PSYoJSMOUOnnF67QnkKeYl99+KzsZVFJVCIHv5+SWbVDUyGXLlPnjRpbka
 /0o3HnLD1Twym25Eau6i30zWjkmUP7DsKdhWVeBlMe9TguOUBOBc+renPxrNojjrd63aWV
 zALcjreTexmGZ/MHGXNX+09z0HbGAg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-zAmvOGtfPzqEJRYgWouroA-1; Wed, 16 Jun 2021 15:40:23 -0400
X-MC-Unique: zAmvOGtfPzqEJRYgWouroA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310261084F41
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:40:23 +0000 (UTC)
Received: from iangelak.remote.csb (ovpn-113-44.rdu2.redhat.com [10.10.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D733460BF1;
 Wed, 16 Jun 2021 19:40:15 +0000 (UTC)
From: Ioannis Angelakopoulos <iangelak@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 6/6] virtiofsd: Custom threadpool for remote blocking posix
 locks requests
Date: Wed, 16 Jun 2021 15:39:21 -0400
Message-Id: <20210616193921.608720-7-iangelak@redhat.com>
In-Reply-To: <20210616193921.608720-1-iangelak@redhat.com>
References: <20210616193921.608720-1-iangelak@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=iangelak@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=iangelak@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Jun 2021 16:41:48 -0400
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
Cc: iangelak@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new custom threadpool using posix threads that specifically
service locking requests.

In the case of a fcntl(SETLKW) request, if the guest is waiting
for a lock or locks and issues a hard-reboot through SYSRQ then virtiofsd
unblocks the blocked threads by sending a signal to them and waking
them up.

The current threadpool (GThreadPool) is not adequate to service the
locking requests that result in a thread blocking. That is because
GLib does not provide an API to cancel the request while it is
serviced by a thread. In addition, a user might be running virtiofsd
without a threadpool (--thread-pool-size=0), thus a locking request
that blocks, will block the main virtqueue thread that services requests
from servicing any other requests.

Then virtiofsd proceeds to cleanup the state of the threads, release
them back to the system and re-initialize.

Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 407 +++++++++++++++++++++++++++++++++-
 1 file changed, 403 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 7efaf9ae68..b23aff5a50 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -29,6 +29,45 @@
 #include "libvhost-user.h"
 
 struct fv_VuDev;
+
+/*
+ * Create a separate thread pool for handling locking requests. This way we
+ * can safely monitor, wake up and clean the threads during a hard-reboot
+ */
+
+struct fv_LockReq {
+    struct fv_LockReq *next;                        /* pointer to next task */
+    void (*worker_func)(void *arg1, void *arg2);    /* worker function */
+    void *arg1;                                     /* 1st arg: Request */
+    void *arg2;                                     /* 2nd arg: Virtqueue */
+} fv_LockReq;
+
+struct fv_LockReqQueue {
+    pthread_mutex_t lock;
+    struct fv_LockReq *head;                        /* Front of the queue */
+    struct fv_LockReq *tail;                        /* Back of the queue */
+    pthread_cond_t notify;                         /* Conditional variable */
+    int size;                                       /* Size of the queue */
+
+} fv_LockTaskQueue;
+
+struct fv_LockThread {
+    pthread_t pthread;
+    int alive;
+    int id;
+    struct fv_LockThreadPool *lock_t_pool;
+};
+
+struct fv_LockThreadPool {
+    struct fv_LockThread **threads;
+    struct fv_LockReqQueue *lreq_queue;              /* Locking Request Queue*/
+    pthread_mutex_t tp_lock;
+
+    int num_threads;                                 /* Total threads */
+    int created;                                     /* Threads created */
+    int destroy_pool;                                /* Destroy pool flag */
+};
+
 struct fv_QueueInfo {
     pthread_t thread;
     /*
@@ -710,6 +749,325 @@ out:
     free(req);
 }
 
+/* Reuse of code in fv fv_queue_worker. Need to clean up */
+static int fv_get_request_opcode(gpointer data, gpointer user_data)
+{
+    struct fv_QueueInfo *qi = user_data;
+    struct fuse_session *se = qi->virtio_dev->se;
+    FVRequest *req = data;
+    VuVirtqElement *elem = &req->elem;
+    struct fuse_buf fbuf = {};
+    struct fuse_in_header inh;
+
+    assert(se->bufsize > sizeof(struct fuse_in_header));
+
+    /*
+     * An element contains one request and the space to send our response
+     * They're spread over multiple descriptors in a scatter/gather set
+     * and we can't trust the guest to keep them still; so copy in/out.
+     */
+    fbuf.mem = g_malloc(se->bufsize);
+
+    /* The 'out' part of the elem is from qemu */
+    unsigned int out_num = elem->out_num;
+    struct iovec *out_sg = elem->out_sg;
+    size_t out_len = iov_size(out_sg, out_num);
+    fuse_log(FUSE_LOG_DEBUG,
+             "%s: elem %d: with %d out desc of length %zd\n",
+             __func__, elem->index, out_num, out_len);
+
+    /*
+     * The elem should contain a 'fuse_in_header' (in to fuse)
+     * plus the data based on the len in the header.
+     */
+    if (out_len < sizeof(struct fuse_in_header)) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for in_header\n",
+                 __func__, elem->index);
+        assert(0); /* TODO */
+    }
+    if (out_len > se->bufsize) {
+        fuse_log(FUSE_LOG_ERR, "%s: elem %d too large for buffer\n", __func__,
+                 elem->index);
+        assert(0); /* TODO */
+    }
+    /* Copy just the fuse_in_header and get the request opcode */
+    copy_from_iov(&fbuf, out_num, out_sg,
+                  sizeof(struct fuse_in_header));
+    memcpy(&inh, fbuf.mem, sizeof(struct fuse_in_header));
+
+    g_free(fbuf.mem);
+    /* Return the request opcode */
+    return inh.opcode;
+}
+
+/* Initialize the Locking Request Queue */
+static struct fv_LockReqQueue *fv_lock_request_queue_init(void)
+{
+    struct fv_LockReqQueue *lock_req_queue;
+
+    lock_req_queue = g_new(struct fv_LockReqQueue, 1);
+    lock_req_queue->size = 0;
+    lock_req_queue->head = NULL;
+    lock_req_queue->tail = NULL;
+
+    pthread_mutex_init(&(lock_req_queue->lock), NULL);
+    pthread_cond_init(&(lock_req_queue->notify), NULL);
+
+    return lock_req_queue;
+}
+
+/* Push a new locking request to the queue*/
+static void fv_lock_tpool_push(struct fv_LockThreadPool *tpool,
+                        void (*worker_func)(void *, void *),
+                        void *arg1, void *arg2)
+{
+    struct fv_LockReq *newreq;
+
+    newreq = g_new(struct fv_LockReq, 1);
+    newreq->worker_func = worker_func;
+    newreq->arg1 = arg1;
+    newreq->arg2 = arg2;
+    newreq->next = NULL;
+
+    /* Now add the request to the queue */
+    pthread_mutex_lock(&tpool->lreq_queue->lock);
+
+    if (tpool->lreq_queue->size == 0) {
+        tpool->lreq_queue->head = newreq;
+        tpool->lreq_queue->tail = newreq;
+    } else {
+        tpool->lreq_queue->tail->next = newreq;
+        tpool->lreq_queue->tail = tpool->lreq_queue->tail->next;
+    }
+
+    tpool->lreq_queue->size++;
+
+    /* Notify the threads that a request is available */
+    pthread_cond_signal(&tpool->lreq_queue->notify);
+
+    pthread_mutex_unlock(&tpool->lreq_queue->lock);
+
+}
+
+/* Pop a locking request from the queue*/
+static struct fv_LockReq *fv_lock_tpool_pop(struct fv_LockThreadPool *tpool)
+{
+    struct fv_LockReq *lock_req;
+
+    pthread_mutex_lock(&tpool->lreq_queue->lock);
+
+    lock_req = tpool->lreq_queue->head;
+
+    /* Must remove the element from the queue */
+    if (!tpool->lreq_queue->size) {
+        ;
+    } else if (tpool->lreq_queue->size == 1) {
+        tpool->lreq_queue->head = NULL;
+        tpool->lreq_queue->tail = NULL;
+        tpool->lreq_queue->size--;
+    } else {
+        tpool->lreq_queue->head = tpool->lreq_queue->head->next;
+        tpool->lreq_queue->size--;
+        /*
+         * Notify the rest of the threads
+         * that a request is available
+         */
+        pthread_cond_signal(&tpool->lreq_queue->notify);
+    }
+
+    pthread_mutex_unlock(&tpool->lreq_queue->lock);
+
+    return lock_req;
+
+}
+
+static void fv_lock_request_queue_destroy(struct fv_LockThreadPool *tpool)
+{
+    while (tpool->lreq_queue->size) {
+        g_free(fv_lock_tpool_pop(tpool));
+    }
+
+    /* Now free the actual queue itself */
+    g_free(tpool->lreq_queue);
+}
+
+/*
+ * Signal handler for blcking threads that wait on a remote lock to be released
+ * Called when virtiofsd does cleanup and wants to wake up these threads
+ */
+static void fv_thread_unblock_handler(int signal)
+{
+    fuse_log(FUSE_LOG_INFO, "Thread received a wake up signal...unblocking\n");
+    return;
+}
+
+static void *fv_lock_thread_do_work(void *thread)
+{
+    struct fv_LockThread *lk_thread = (struct fv_LockThread *)thread;
+    struct fv_LockThreadPool *tpool = lk_thread->lock_t_pool;
+    struct fv_LockReq *lock_request;
+    /* Actual worker function and arguments. Same as non locking requests */
+    void (*worker_func)(void*, void*);
+    void *arg1;
+    void *arg2;
+
+    /*
+     * Register a signal handler to wake up the thread when it is blocking on
+     * waiting for a lock
+     */
+    struct sigaction sa;
+    sigemptyset(&sa.sa_mask);
+    sa.sa_flags = 0;
+    sa.sa_handler = fv_thread_unblock_handler;
+    if (sigaction(SIGUSR1, &sa, NULL) == -1) {
+        fuse_log(FUSE_LOG_ERR, "Cannot register the signal handler for"
+                 " thread %d\n", lk_thread->id);
+    }
+
+    while (!tpool->destroy_pool) {
+        /*
+         * Get the queue lock first so that we can wait on the conditional
+         * variable afterwards
+         */
+        pthread_mutex_lock(&tpool->lreq_queue->lock);
+
+        /* Wait on the condition variable until it is available */
+        while (tpool->lreq_queue->size == 0 && !tpool->destroy_pool) {
+            pthread_cond_wait(&tpool->lreq_queue->notify,
+                            &tpool->lreq_queue->lock);
+        }
+
+        /* Unlock the queue for other threads */
+        pthread_mutex_unlock(&tpool->lreq_queue->lock);
+
+        if (tpool->destroy_pool) {
+            break;
+        }
+
+        /* Now the request must be serviced */
+        lock_request = fv_lock_tpool_pop(tpool);
+
+        if (lock_request && !tpool->destroy_pool) {
+            fuse_log(FUSE_LOG_DEBUG, "%s: Locking Thread:%d handling"
+                    " a request\n", __func__, lk_thread->id);
+            worker_func = lock_request->worker_func;
+            arg1 = lock_request->arg1;
+            arg2 = lock_request->arg2;
+            worker_func(arg1, arg2);
+            g_free(lock_request);
+        }
+    }
+
+    /* Mark the thread as inactive */
+    pthread_mutex_lock(&tpool->tp_lock);
+    tpool->threads[lk_thread->id]->alive = 0;
+    tpool->created--;
+    pthread_mutex_unlock(&tpool->tp_lock);
+
+    return NULL;
+}
+
+/* Create a single thread that handles locking requests */
+static void fv_lock_thread_init(struct fv_LockThreadPool *tpool,
+                                struct fv_LockThread **l_thread, int id)
+{
+    *l_thread = g_new(struct fv_LockThread, 1);
+    (*l_thread)->lock_t_pool = tpool;
+    (*l_thread)->id = id;
+    (*l_thread)->alive = 1;
+
+    pthread_create(&(*l_thread)->pthread, NULL,
+                fv_lock_thread_do_work, (*l_thread));
+    pthread_detach((*l_thread)->pthread);
+}
+
+/* Initialize the thread pool for the locking posix threads */
+static struct fv_LockThreadPool *fv_lock_thread_pool_init(int thread_num)
+{
+    struct fv_LockThreadPool *tpool = NULL;
+    int i;
+
+    if (thread_num < 0) {
+        thread_num = 0;
+    }
+
+    tpool = g_new(struct fv_LockThreadPool, 1);
+    tpool->num_threads = 0;
+    tpool->destroy_pool = 0;
+    tpool->created = 0;
+    pthread_mutex_init(&(tpool->tp_lock), NULL);
+
+    /* Initialize the Lock Request Queue */
+    tpool->lreq_queue = fv_lock_request_queue_init();
+
+    /* Create the threads in the pool */
+    tpool->threads = g_new(struct fv_LockThread *, thread_num);
+
+    for (i = 0; i < thread_num; i++) {
+        fv_lock_thread_init(tpool, &tpool->threads[i], i);
+        tpool->num_threads++;
+        tpool->created++;
+    }
+
+    return tpool;
+}
+
+static void fv_lock_thread_pool_destroy(struct fv_LockThreadPool *tpool)
+{
+    int i, tmp;
+
+    if (!tpool) {
+        return;
+    }
+
+     /*Get the lock to the queue */
+    pthread_mutex_lock(&tpool->lreq_queue->lock);
+
+    /* We want to destroy the pool */
+    pthread_mutex_lock(&tpool->tp_lock);
+    tpool->destroy_pool = 1;
+    pthread_mutex_unlock(&tpool->tp_lock);
+
+    /* Wake up threads waiting for requests */
+    pthread_cond_broadcast(&tpool->lreq_queue->notify);
+    pthread_mutex_unlock(&tpool->lreq_queue->lock);
+
+    for (i = 0; i < tpool->num_threads; i++) {
+        /*
+         * Even though the threads are notified about the conditional variable
+         * there still might be blocking threads on a request. Signal them to
+         * wake up
+         */
+        if (tpool->threads[i]->alive) {
+            pthread_kill(tpool->threads[i]->pthread, SIGUSR1);
+        }
+    }
+
+    /*
+     * Now wait for the threads to exit before releasing the pool resources
+     * back to the system
+     */
+    while (1) {
+        pthread_mutex_lock(&tpool->tp_lock);
+        tmp = tpool->created;
+        pthread_mutex_unlock(&tpool->tp_lock);
+        if (tmp == 0) {
+            break;
+        }
+    }
+
+    /* Destroy the locking request queue */
+    fv_lock_request_queue_destroy(tpool);
+    for (i = 0; i < tpool->num_threads; i++) {
+        g_free(tpool->threads[i]);
+    }
+
+    /* Now free the threadpool */
+    g_free(tpool->threads);
+    g_free(tpool);
+
+}
+
 /* Thread function for individual queues, created when a queue is 'started' */
 static void *fv_queue_thread(void *opaque)
 {
@@ -717,18 +1075,36 @@ static void *fv_queue_thread(void *opaque)
     struct VuDev *dev = &qi->virtio_dev->dev;
     struct VuVirtq *q = vu_get_queue(dev, qi->qidx);
     struct fuse_session *se = qi->virtio_dev->se;
+    struct fv_LockThreadPool *lk_tpool = NULL;
+    int request_opcode;
     GThreadPool *pool = NULL;
     GList *req_list = NULL;
 
     if (se->thread_pool_size) {
+        /* Create the GThreadPool to handle normal requests */
         fuse_log(FUSE_LOG_DEBUG, "%s: Creating thread pool for Queue %d\n",
-                 __func__, qi->qidx);
+             __func__, qi->qidx);
         pool = g_thread_pool_new(fv_queue_worker, qi, se->thread_pool_size,
-                                 FALSE, NULL);
+                     FALSE, NULL);
         if (!pool) {
             fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__);
             return NULL;
         }
+
+    }
+
+    fuse_log(FUSE_LOG_DEBUG, "%s: Creating a locking thread pool for"
+            " Queue %d with size %d\n", __func__, qi->qidx, 4);
+    /*
+     * Create the custom thread pool to handle locking requests
+     * TODO: Add or remove threads dynamically from the queue depending on
+     * the number of locking requests that are pending
+     */
+    lk_tpool = fv_lock_thread_pool_init(4);
+    if (!lk_tpool) {
+        fuse_log(FUSE_LOG_ERR, "%s: fv_lock_thread_pool"
+                " failed\n", __func__);
+        return NULL;
     }
 
     fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func__,
@@ -801,10 +1177,28 @@ static void *fv_queue_thread(void *opaque)
 
             req->reply_sent = false;
 
+            /*
+             * In every case we get the opcode of the request and check if it
+             * is a locking request. If yes, we assign the request to the
+             * custom thread pool
+             */
+            request_opcode = fv_get_request_opcode(req, qi);
             if (!se->thread_pool_size) {
-                req_list = g_list_prepend(req_list, req);
+                if (request_opcode == FUSE_GETLK ||
+                        request_opcode == FUSE_SETLK ||
+                        request_opcode == FUSE_SETLKW) {
+                    fv_lock_tpool_push(lk_tpool, fv_queue_worker, req, qi);
+                } else {
+                    req_list = g_list_prepend(req_list, req);
+                }
             } else {
-                g_thread_pool_push(pool, req, NULL);
+                if (request_opcode == FUSE_GETLK ||
+                        request_opcode == FUSE_SETLK ||
+                        request_opcode == FUSE_SETLKW) {
+                    fv_lock_tpool_push(lk_tpool, fv_queue_worker, req, qi);
+                } else {
+                    g_thread_pool_push(pool, req, NULL);
+                }
             }
         }
 
@@ -819,10 +1213,15 @@ static void *fv_queue_thread(void *opaque)
         }
     }
 
+    /* Free the pools */
     if (pool) {
         g_thread_pool_free(pool, FALSE, TRUE);
     }
 
+    if (lk_tpool) {
+        fv_lock_thread_pool_destroy(lk_tpool);
+    }
+
     return NULL;
 }
 
-- 
2.27.0


