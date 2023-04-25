Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CEA6EE2C2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:20:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIZ0-00029Y-6g; Tue, 25 Apr 2023 09:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVT-0006rN-Uc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006an-KU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eOxD0B6t6Kjmv88wWP5XaU39InLoXf99vLZGPp2IDzA=;
 b=hVqbmSSRSXnQH1yto34bR1st7uEDi1tKOixRyM8Z3NsUsUHmE1ug+3ul9cnXwr+ArgSp7E
 XvuA0kwKaLRcAdycF0UTFpFkAOeC0xcLIYx1NyLg/INqPGdagvptryoywkJRaPjMz55+Q+
 6EsqJSMgG6yzs8txA9JYL/cn4sFlKNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-5Es_dXVCM669woBBZbrTcw-1; Tue, 25 Apr 2023 09:14:18 -0400
X-MC-Unique: 5Es_dXVCM669woBBZbrTcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF0C3185A794;
 Tue, 25 Apr 2023 13:14:17 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 004E240C2064;
 Tue, 25 Apr 2023 13:14:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 14/25] thread-pool: use ThreadPool from the running thread
Date: Tue, 25 Apr 2023 15:13:48 +0200
Message-Id: <20230425131359.259007-15-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Use qemu_get_current_aio_context() where possible, since we always
submit work to the current thread anyways.

We want to also be sure that the thread submitting the work is
the same as the one processing the pool, to avoid adding
synchronization to the pool list.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20230203131731.851116-4-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/thread-pool.h |  5 +++++
 block/file-posix.c          | 21 ++++++++++-----------
 block/file-win32.c          |  2 +-
 block/qcow2-threads.c       |  2 +-
 util/thread-pool.c          |  9 ++++-----
 5 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/include/block/thread-pool.h b/include/block/thread-pool.h
index 95ff2b0bdb..c408bde74c 100644
--- a/include/block/thread-pool.h
+++ b/include/block/thread-pool.h
@@ -29,12 +29,17 @@ typedef struct ThreadPool ThreadPool;
 ThreadPool *thread_pool_new(struct AioContext *ctx);
 void thread_pool_free(ThreadPool *pool);
 
+/*
+ * thread_pool_submit* API: submit I/O requests in the thread's
+ * current AioContext.
+ */
 BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
         ThreadPoolFunc *func, void *arg,
         BlockCompletionFunc *cb, void *opaque);
 int coroutine_fn thread_pool_submit_co(ThreadPool *pool,
         ThreadPoolFunc *func, void *arg);
 void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg);
+
 void thread_pool_update_params(ThreadPool *pool, struct AioContext *ctx);
 
 #endif
diff --git a/block/file-posix.c b/block/file-posix.c
index 30cb4ae421..173b3b1653 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2040,11 +2040,10 @@ out:
     return result;
 }
 
-static int coroutine_fn raw_thread_pool_submit(BlockDriverState *bs,
-                                               ThreadPoolFunc func, void *arg)
+static int coroutine_fn raw_thread_pool_submit(ThreadPoolFunc func, void *arg)
 {
     /* @bs can be NULL, bdrv_get_aio_context() returns the main context then */
-    ThreadPool *pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
+    ThreadPool *pool = aio_get_thread_pool(qemu_get_current_aio_context());
     return thread_pool_submit_co(pool, func, arg);
 }
 
@@ -2112,7 +2111,7 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     };
 
     assert(qiov->size == bytes);
-    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
+    return raw_thread_pool_submit(handle_aiocb_rw, &acb);
 }
 
 static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
@@ -2181,7 +2180,7 @@ static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
         return luring_co_submit(bs, s->fd, 0, NULL, QEMU_AIO_FLUSH);
     }
 #endif
-    return raw_thread_pool_submit(bs, handle_aiocb_flush, &acb);
+    return raw_thread_pool_submit(handle_aiocb_flush, &acb);
 }
 
 static void raw_aio_attach_aio_context(BlockDriverState *bs,
@@ -2243,7 +2242,7 @@ raw_regular_truncate(BlockDriverState *bs, int fd, int64_t offset,
         },
     };
 
-    return raw_thread_pool_submit(bs, handle_aiocb_truncate, &acb);
+    return raw_thread_pool_submit(handle_aiocb_truncate, &acb);
 }
 
 static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
@@ -2992,7 +2991,7 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
         acb.aio_type |= QEMU_AIO_BLKDEV;
     }
 
-    ret = raw_thread_pool_submit(bs, handle_aiocb_discard, &acb);
+    ret = raw_thread_pool_submit(handle_aiocb_discard, &acb);
     raw_account_discard(s, bytes, ret);
     return ret;
 }
@@ -3067,7 +3066,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
         handler = handle_aiocb_write_zeroes;
     }
 
-    return raw_thread_pool_submit(bs, handler, &acb);
+    return raw_thread_pool_submit(handler, &acb);
 }
 
 static int coroutine_fn raw_co_pwrite_zeroes(
@@ -3305,7 +3304,7 @@ raw_co_copy_range_to(BlockDriverState *bs,
         },
     };
 
-    return raw_thread_pool_submit(bs, handle_aiocb_copy_range, &acb);
+    return raw_thread_pool_submit(handle_aiocb_copy_range, &acb);
 }
 
 BlockDriver bdrv_file = {
@@ -3635,7 +3634,7 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
         struct sg_io_hdr *io_hdr = buf;
         if (io_hdr->cmdp[0] == PERSISTENT_RESERVE_OUT ||
             io_hdr->cmdp[0] == PERSISTENT_RESERVE_IN) {
-            return pr_manager_execute(s->pr_mgr, bdrv_get_aio_context(bs),
+            return pr_manager_execute(s->pr_mgr, qemu_get_current_aio_context(),
                                       s->fd, io_hdr);
         }
     }
@@ -3651,7 +3650,7 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
         },
     };
 
-    return raw_thread_pool_submit(bs, handle_aiocb_ioctl, &acb);
+    return raw_thread_pool_submit(handle_aiocb_ioctl, &acb);
 }
 #endif /* linux */
 
diff --git a/block/file-win32.c b/block/file-win32.c
index 1763b8662e..0aedb0875c 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -168,7 +168,7 @@ static BlockAIOCB *paio_submit(BlockDriverState *bs, HANDLE hfile,
     acb->aio_offset = offset;
 
     trace_file_paio_submit(acb, opaque, offset, count, type);
-    pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
+    pool = aio_get_thread_pool(qemu_get_current_aio_context());
     return thread_pool_submit_aio(pool, aio_worker, acb, cb, opaque);
 }
 
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 953bbe6df8..6d2e6b7bf4 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -43,7 +43,7 @@ qcow2_co_process(BlockDriverState *bs, ThreadPoolFunc *func, void *arg)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
-    ThreadPool *pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
+    ThreadPool *pool = aio_get_thread_pool(qemu_get_current_aio_context());
 
     qemu_co_mutex_lock(&s->lock);
     while (s->nb_threads >= QCOW2_MAX_THREADS) {
diff --git a/util/thread-pool.c b/util/thread-pool.c
index 31113b5860..a70abb8a59 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -48,7 +48,7 @@ struct ThreadPoolElement {
     /* Access to this list is protected by lock.  */
     QTAILQ_ENTRY(ThreadPoolElement) reqs;
 
-    /* Access to this list is protected by the global mutex.  */
+    /* This list is only written by the thread pool's mother thread.  */
     QLIST_ENTRY(ThreadPoolElement) all;
 };
 
@@ -175,7 +175,6 @@ static void thread_pool_completion_bh(void *opaque)
     ThreadPool *pool = opaque;
     ThreadPoolElement *elem, *next;
 
-    aio_context_acquire(pool->ctx);
 restart:
     QLIST_FOREACH_SAFE(elem, &pool->head, all, next) {
         if (elem->state != THREAD_DONE) {
@@ -195,9 +194,7 @@ restart:
              */
             qemu_bh_schedule(pool->completion_bh);
 
-            aio_context_release(pool->ctx);
             elem->common.cb(elem->common.opaque, elem->ret);
-            aio_context_acquire(pool->ctx);
 
             /* We can safely cancel the completion_bh here regardless of someone
              * else having scheduled it meanwhile because we reenter the
@@ -211,7 +208,6 @@ restart:
             qemu_aio_unref(elem);
         }
     }
-    aio_context_release(pool->ctx);
 }
 
 static void thread_pool_cancel(BlockAIOCB *acb)
@@ -251,6 +247,9 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
 {
     ThreadPoolElement *req;
 
+    /* Assert that the thread submitting work is the same running the pool */
+    assert(pool->ctx == qemu_get_current_aio_context());
+
     req = qemu_aio_get(&thread_pool_aiocb_info, NULL, cb, opaque);
     req->func = func;
     req->arg = arg;
-- 
2.40.0


