Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C941DE4C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:02:06 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyVZ-0001xY-Hd
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1b-00056d-Tr
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1X-0002Tw-OV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2D26EewOJqIyCYvNp9ySn0BwiktPwR3/fD2T227kKc=;
 b=E/d35znt//NIb8UtV3VREfGSAriQI8lshiwYj6nhn/8W8EQkQvOhGzOmBopnBtMHprLEMf
 DCSMxFmjDmDGZXCulHmciMkE378+ZqBIn1hXbSUXy5l/jJoxjirhZ24WLIITt/6QaJtj8F
 OKT5iLQYlhyvgHEXMmdyZ5RjCwSKezg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-fHWYPcAzO96yCB-eh1S0IQ-1; Thu, 30 Sep 2021 11:30:57 -0400
X-MC-Unique: fHWYPcAzO96yCB-eh1S0IQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D54741966320;
 Thu, 30 Sep 2021 15:30:56 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91A855C1D0;
 Thu, 30 Sep 2021 15:30:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 08818228289; Thu, 30 Sep 2021 11:30:48 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 10/13] virtiofsd: Custom threadpool for remote blocking posix
 locks requests
Date: Thu, 30 Sep 2021 11:30:34 -0400
Message-Id: <20210930153037.1194279-11-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
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

The only exception occurs when the lock is of type F_UNLCK. In this case
the request is serviced by the main virtqueue thread or a GThreadPool
thread to avoid a deadlock, when all the threads in the custom threadpool
are blocked.

Then virtiofsd proceeds to cleanup the state of the threads, release
them back to the system and re-initialize.

Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c         |  90 ++++++-
 tools/virtiofsd/meson.build           |   1 +
 tools/virtiofsd/passthrough_seccomp.c |   1 +
 tools/virtiofsd/tpool.c               | 331 ++++++++++++++++++++++++++
 tools/virtiofsd/tpool.h               |  18 ++
 5 files changed, 440 insertions(+), 1 deletion(-)
 create mode 100644 tools/virtiofsd/tpool.c
 create mode 100644 tools/virtiofsd/tpool.h

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 3b720c5d4a..c67c2e0e7a 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -20,6 +20,7 @@
 #include "fuse_misc.h"
 #include "fuse_opt.h"
 #include "fuse_virtio.h"
+#include "tpool.h"
 
 #include <sys/eventfd.h>
 #include <sys/socket.h>
@@ -612,6 +613,60 @@ out:
     free(req);
 }
 
+/*
+ * If the request is a locking request, use a custom locking thread pool.
+ */
+static bool use_lock_tpool(gpointer data, gpointer user_data)
+{
+    struct fv_QueueInfo *qi = user_data;
+    struct fuse_session *se = qi->virtio_dev->se;
+    FVRequest *req = data;
+    VuVirtqElement *elem = &req->elem;
+    struct fuse_buf fbuf = {};
+    struct fuse_in_header *inhp;
+    struct fuse_lk_in *lkinp;
+    size_t lk_req_len;
+    /* The 'out' part of the elem is from qemu */
+    unsigned int out_num = elem->out_num;
+    struct iovec *out_sg = elem->out_sg;
+    size_t out_len = iov_size(out_sg, out_num);
+    bool use_custom_tpool = false;
+
+    /*
+     * If notifications are not enabled, no point in using cusotm lock
+     * thread pool.
+     */
+    if (!se->notify_enabled) {
+        return false;
+    }
+
+    assert(se->bufsize > sizeof(struct fuse_in_header));
+    lk_req_len = sizeof(struct fuse_in_header) + sizeof(struct fuse_lk_in);
+
+    if (out_len < lk_req_len) {
+        return false;
+    }
+
+    fbuf.mem = g_malloc(se->bufsize);
+    copy_from_iov(&fbuf, out_num, out_sg, lk_req_len);
+
+    inhp = fbuf.mem;
+    if (inhp->opcode != FUSE_SETLKW) {
+        goto out;
+    }
+
+    lkinp = fbuf.mem + sizeof(struct fuse_in_header);
+    if (lkinp->lk.type == F_UNLCK) {
+        goto out;
+    }
+
+    /* Its a blocking lock request. Use custom thread pool */
+    use_custom_tpool = true;
+out:
+    g_free(fbuf.mem);
+    return use_custom_tpool;
+}
+
 /* Thread function for individual queues, created when a queue is 'started' */
 static void *fv_queue_thread(void *opaque)
 {
@@ -619,6 +674,7 @@ static void *fv_queue_thread(void *opaque)
     struct VuDev *dev = &qi->virtio_dev->dev;
     struct VuVirtq *q = vu_get_queue(dev, qi->qidx);
     struct fuse_session *se = qi->virtio_dev->se;
+    struct fv_ThreadPool *lk_tpool = NULL;
     GThreadPool *pool = NULL;
     GList *req_list = NULL;
 
@@ -631,6 +687,24 @@ static void *fv_queue_thread(void *opaque)
             fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__);
             return NULL;
         }
+
+    }
+
+    /*
+     * Create the custom thread pool to handle blocking locking requests.
+     * Do not create for hiprio queue (qidx=0).
+     */
+    if (qi->qidx) {
+        fuse_log(FUSE_LOG_DEBUG, "%s: Creating a locking thread pool for"
+                 " Queue %d with size %d\n", __func__, qi->qidx, 4);
+        lk_tpool = fv_thread_pool_init(4);
+        if (!lk_tpool) {
+            fuse_log(FUSE_LOG_ERR, "%s: fv_thread_pool failed\n", __func__);
+            if (pool) {
+                g_thread_pool_free(pool, FALSE, TRUE);
+            }
+            return NULL;
+        }
     }
 
     fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func__,
@@ -703,7 +777,17 @@ static void *fv_queue_thread(void *opaque)
 
             req->reply_sent = false;
 
-            if (!se->thread_pool_size) {
+            /*
+             * In every case we get the opcode of the request and check if it
+             * is a locking request. If yes, we assign the request to the
+             * custom thread pool, with the exception when the lock is of type
+             * F_UNCLK. In this case to avoid a deadlock when all the custom
+             * threads are blocked, the request is serviced by the main
+             * virtqueue thread or a thread in GThreadPool
+             */
+            if (use_lock_tpool(req, qi)) {
+                fv_thread_pool_push(lk_tpool, fv_queue_worker, req, qi);
+            } else if (!se->thread_pool_size) {
                 req_list = g_list_prepend(req_list, req);
             } else {
                 g_thread_pool_push(pool, req, NULL);
@@ -726,6 +810,10 @@ static void *fv_queue_thread(void *opaque)
         g_thread_pool_free(pool, FALSE, TRUE);
     }
 
+    if (lk_tpool) {
+        fv_thread_pool_destroy(lk_tpool);
+    }
+
     return NULL;
 }
 
diff --git a/tools/virtiofsd/meson.build b/tools/virtiofsd/meson.build
index c134ba633f..203cd5613a 100644
--- a/tools/virtiofsd/meson.build
+++ b/tools/virtiofsd/meson.build
@@ -6,6 +6,7 @@ executable('virtiofsd', files(
   'fuse_signals.c',
   'fuse_virtio.c',
   'helper.c',
+  'tpool.c',
   'passthrough_ll.c',
   'passthrough_seccomp.c'),
   dependencies: [seccomp, qemuutil, libcap_ng, vhost_user],
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index a3ce9f898d..cd24b40b78 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -116,6 +116,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(write),
     SCMP_SYS(writev),
     SCMP_SYS(umask),
+    SCMP_SYS(nanosleep),
 };
 
 /* Syscalls used when --syslog is enabled */
diff --git a/tools/virtiofsd/tpool.c b/tools/virtiofsd/tpool.c
new file mode 100644
index 0000000000..f9aa41b0c5
--- /dev/null
+++ b/tools/virtiofsd/tpool.c
@@ -0,0 +1,331 @@
+/*
+ * custom threadpool for virtiofsd
+ *
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * Authors:
+ *     Ioannis Angelakopoulos <iangelak@redhat.com>
+ *     Vivek Goyal <vgoyal@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <pthread.h>
+#include <glib.h>
+#include <stdbool.h>
+#include <errno.h>
+#include "tpool.h"
+#include "fuse_log.h"
+
+struct fv_PoolReq {
+    struct fv_PoolReq *next;                        /* pointer to next task */
+    void (*worker_func)(void *arg1, void *arg2);    /* worker function */
+    void *arg1;                                     /* 1st arg: Request */
+    void *arg2;                                     /* 2nd arg: Virtqueue */
+};
+
+struct fv_PoolReqQueue {
+    pthread_mutex_t lock;
+    GQueue queue;
+    pthread_cond_t notify;                         /* Conditional variable */
+};
+
+struct fv_PoolThread {
+    pthread_t pthread;
+    int alive;
+    int id;
+    struct fv_ThreadPool *tpool;
+};
+
+struct fv_ThreadPool {
+    struct fv_PoolThread **threads;
+    struct fv_PoolReqQueue *req_queue;
+    pthread_mutex_t tp_lock;
+
+    /* Total number of threads created */
+    int num_threads;
+
+    /* Number of threads running now */
+    int nr_running;
+    int destroy_pool;
+};
+
+/* Initialize the Locking Request Queue */
+static struct fv_PoolReqQueue *fv_pool_request_queue_init(void)
+{
+    struct fv_PoolReqQueue *rq;
+
+    rq = g_new0(struct fv_PoolReqQueue, 1);
+    pthread_mutex_init(&(rq->lock), NULL);
+    pthread_cond_init(&(rq->notify), NULL);
+    g_queue_init(&rq->queue);
+    return rq;
+}
+
+/* Push a new locking request to the queue*/
+void fv_thread_pool_push(struct fv_ThreadPool *tpool,
+                         void (*worker_func)(void *, void *),
+                         void *arg1, void *arg2)
+{
+    struct fv_PoolReq *newreq;
+    struct fv_PoolReqQueue *rq = tpool->req_queue;
+
+    newreq = g_new(struct fv_PoolReq, 1);
+    newreq->worker_func = worker_func;
+    newreq->arg1 = arg1;
+    newreq->arg2 = arg2;
+    newreq->next = NULL;
+
+    /* Now add the request to the queue */
+    pthread_mutex_lock(&rq->lock);
+    g_queue_push_tail(&rq->queue, newreq);
+
+    /* Notify the threads that a request is available */
+    pthread_cond_signal(&rq->notify);
+    pthread_mutex_unlock(&rq->lock);
+
+}
+
+/* Pop a locking request from the queue*/
+static struct fv_PoolReq *fv_tpool_pop(struct fv_ThreadPool *tpool)
+{
+    struct fv_PoolReq *pool_req = NULL;
+    struct fv_PoolReqQueue *rq = tpool->req_queue;
+
+    pthread_mutex_lock(&rq->lock);
+
+    pool_req = g_queue_pop_head(&rq->queue);
+
+    if (!g_queue_is_empty(&rq->queue)) {
+        pthread_cond_signal(&rq->notify);
+    }
+    pthread_mutex_unlock(&rq->lock);
+
+    return pool_req;
+}
+
+static void fv_pool_request_queue_destroy(struct fv_ThreadPool *tpool)
+{
+    struct fv_PoolReq *pool_req;
+
+    while ((pool_req = fv_tpool_pop(tpool))) {
+        g_free(pool_req);
+    }
+
+    /* Now free the actual queue itself */
+    g_free(tpool->req_queue);
+}
+
+/*
+ * Signal handler for blcking threads that wait on a remote lock to be released
+ * Called when virtiofsd does cleanup and wants to wake up these threads
+ */
+static void fv_thread_signal_handler(int signal)
+{
+    fuse_log(FUSE_LOG_DEBUG, "Thread received a signal.\n");
+    return;
+}
+
+static bool is_pool_stopping(struct fv_ThreadPool *tpool)
+{
+    bool destroy = false;
+
+    pthread_mutex_lock(&tpool->tp_lock);
+    destroy = tpool->destroy_pool;
+    pthread_mutex_unlock(&tpool->tp_lock);
+
+    return destroy;
+}
+
+static void *fv_thread_do_work(void *thread)
+{
+    struct fv_PoolThread *worker = (struct fv_PoolThread *)thread;
+    struct fv_ThreadPool *tpool = worker->tpool;
+    struct fv_PoolReq *pool_request;
+    /* Actual worker function and arguments. Same as non locking requests */
+    void (*worker_func)(void*, void*);
+    void *arg1;
+    void *arg2;
+
+    while (1) {
+        if (is_pool_stopping(tpool)) {
+            break;
+        }
+
+        /*
+         * Get the queue lock first so that we can wait on the conditional
+         * variable afterwards
+         */
+        pthread_mutex_lock(&tpool->req_queue->lock);
+
+        /* Wait on the condition variable until it is available */
+        while (g_queue_is_empty(&tpool->req_queue->queue) &&
+               !is_pool_stopping(tpool)) {
+            pthread_cond_wait(&tpool->req_queue->notify,
+                              &tpool->req_queue->lock);
+        }
+
+        /* Unlock the queue for other threads */
+        pthread_mutex_unlock(&tpool->req_queue->lock);
+
+        if (is_pool_stopping(tpool)) {
+            break;
+        }
+
+        /* Now the request must be serviced */
+        pool_request = fv_tpool_pop(tpool);
+        if (pool_request) {
+            fuse_log(FUSE_LOG_DEBUG, "%s: Locking Thread:%d handling"
+                    " a request\n", __func__, worker->id);
+            worker_func = pool_request->worker_func;
+            arg1 = pool_request->arg1;
+            arg2 = pool_request->arg2;
+            worker_func(arg1, arg2);
+            g_free(pool_request);
+        }
+    }
+
+    /* Mark the thread as inactive */
+    pthread_mutex_lock(&tpool->tp_lock);
+    tpool->threads[worker->id]->alive = 0;
+    tpool->nr_running--;
+    pthread_mutex_unlock(&tpool->tp_lock);
+
+    return NULL;
+}
+
+/* Create a single thread that handles locking requests */
+static int fv_worker_thread_init(struct fv_ThreadPool *tpool,
+                                 struct fv_PoolThread **thread, int id)
+{
+    struct fv_PoolThread *worker;
+    int ret;
+
+    worker = g_new(struct fv_PoolThread, 1);
+    worker->tpool = tpool;
+    worker->id = id;
+    worker->alive = 1;
+
+    ret = pthread_create(&worker->pthread, NULL, fv_thread_do_work,
+                         worker);
+    if (ret) {
+        fuse_log(FUSE_LOG_ERR, "pthread_create() failed with err=%d\n", ret);
+        g_free(worker);
+        return ret;
+    }
+    pthread_detach(worker->pthread);
+    *thread = worker;
+    return 0;
+}
+
+static void send_signal_all(struct fv_ThreadPool *tpool)
+{
+    int i;
+
+    pthread_mutex_lock(&tpool->tp_lock);
+    for (i = 0; i < tpool->num_threads; i++) {
+        if (tpool->threads[i]->alive) {
+            pthread_kill(tpool->threads[i]->pthread, SIGUSR1);
+        }
+    }
+    pthread_mutex_unlock(&tpool->tp_lock);
+}
+
+static void do_pool_destroy(struct fv_ThreadPool *tpool, bool send_signal)
+{
+    int i, nr_running;
+
+    /* We want to destroy the pool */
+    pthread_mutex_lock(&tpool->tp_lock);
+    tpool->destroy_pool = 1;
+    pthread_mutex_unlock(&tpool->tp_lock);
+
+    /* Wake up threads waiting for requests */
+    pthread_mutex_lock(&tpool->req_queue->lock);
+    pthread_cond_broadcast(&tpool->req_queue->notify);
+    pthread_mutex_unlock(&tpool->req_queue->lock);
+
+    /* Send Signal and wait for all threads to exit. */
+    while (1) {
+        if (send_signal) {
+            send_signal_all(tpool);
+        }
+        pthread_mutex_lock(&tpool->tp_lock);
+        nr_running = tpool->nr_running;
+        pthread_mutex_unlock(&tpool->tp_lock);
+        if (!nr_running) {
+            break;
+        }
+        g_usleep(10000);
+    }
+
+    /* Destroy the locking request queue */
+    fv_pool_request_queue_destroy(tpool);
+    for (i = 0; i < tpool->num_threads; i++) {
+        g_free(tpool->threads[i]);
+    }
+
+    /* Now free the threadpool */
+    g_free(tpool->threads);
+    g_free(tpool);
+}
+
+void fv_thread_pool_destroy(struct fv_ThreadPool *tpool)
+{
+    if (!tpool) {
+        return;
+    }
+    do_pool_destroy(tpool, true);
+}
+
+static int register_sig_handler(void)
+{
+    struct sigaction sa;
+    sigemptyset(&sa.sa_mask);
+    sa.sa_flags = 0;
+    sa.sa_handler = fv_thread_signal_handler;
+    if (sigaction(SIGUSR1, &sa, NULL) == -1) {
+        fuse_log(FUSE_LOG_ERR, "Cannot register the signal handler:%s\n",
+                 strerror(errno));
+        return 1;
+    }
+    return 0;
+}
+
+/* Initialize the thread pool for the locking posix threads */
+struct fv_ThreadPool *fv_thread_pool_init(unsigned int thread_num)
+{
+    struct fv_ThreadPool *tpool = NULL;
+    int i, ret;
+
+    if (!thread_num) {
+        thread_num = 1;
+    }
+
+    if (register_sig_handler()) {
+        return NULL;
+    }
+    tpool = g_new0(struct fv_ThreadPool, 1);
+    pthread_mutex_init(&(tpool->tp_lock), NULL);
+
+    /* Initialize the Lock Request Queue */
+    tpool->req_queue = fv_pool_request_queue_init();
+
+    /* Create the threads in the pool */
+    tpool->threads = g_new(struct fv_PoolThread *, thread_num);
+
+    for (i = 0; i < thread_num; i++) {
+        ret = fv_worker_thread_init(tpool, &tpool->threads[i], i);
+        if (ret) {
+            goto out_err;
+        }
+        tpool->num_threads++;
+        tpool->nr_running++;
+    }
+
+    return tpool;
+out_err:
+    /* An error occurred. Cleanup and return NULL */
+    do_pool_destroy(tpool, false);
+    return NULL;
+}
diff --git a/tools/virtiofsd/tpool.h b/tools/virtiofsd/tpool.h
new file mode 100644
index 0000000000..48d67e9a50
--- /dev/null
+++ b/tools/virtiofsd/tpool.h
@@ -0,0 +1,18 @@
+/*
+ * custom threadpool for virtiofsd
+ *
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * Authors:
+ *     Ioannis Angelakopoulos <iangelak@redhat.com>
+ *     Vivek Goyal <vgoyal@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+struct fv_ThreadPool;
+
+struct fv_ThreadPool *fv_thread_pool_init(unsigned int thread_num);
+void fv_thread_pool_destroy(struct fv_ThreadPool *tpool);
+void fv_thread_pool_push(struct fv_ThreadPool *tpool,
+                   void (*worker_func)(void *, void *), void *arg1, void *arg2);
-- 
2.31.1


