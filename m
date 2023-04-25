Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18406EE2C5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:20:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIWk-0007yg-Ay; Tue, 25 Apr 2023 09:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVN-0006l4-Fu
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006bj-7X
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7SB5UwcI+Y0Zd37MCHQXQT7/n9ZX98WKUYtdvDD/ms=;
 b=eyw0AIAMLxGEsNmQ4soNWtbSIMpALJTilwiaUSVSEpScLvNsma3I7kLjcPXsUy7BBXao5c
 THcHlfHORzwTNTrn5ji60JZw7n2rBptMizihHEu+bUo9HRdkZHmcv6KN+702yqnAVv+cIh
 7oGxhrsHZJAsOBwDjmJMCmfdrmIhRkA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-egl9LIvdMaKGcqeojm7AgA-1; Tue, 25 Apr 2023 09:14:19 -0400
X-MC-Unique: egl9LIvdMaKGcqeojm7AgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EF6A1C01B3C;
 Tue, 25 Apr 2023 13:14:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E445E40C201F;
 Tue, 25 Apr 2023 13:14:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 15/25] thread-pool: avoid passing the pool parameter every time
Date: Tue, 25 Apr 2023 15:13:49 +0200
Message-Id: <20230425131359.259007-16-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

thread_pool_submit_aio() is always called on a pool taken from
qemu_get_current_aio_context(), and that is the only intended
use: each pool runs only in the same thread that is submitting
work to it, it can't run anywhere else.

Therefore simplify the thread_pool_submit* API and remove the
ThreadPool function parameter.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20230203131731.851116-5-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/thread-pool.h   | 10 ++++------
 backends/tpm/tpm_backend.c    |  4 +---
 block/file-posix.c            |  4 +---
 block/file-win32.c            |  4 +---
 block/qcow2-threads.c         |  3 +--
 hw/9pfs/coth.c                |  3 +--
 hw/ppc/spapr_nvdimm.c         |  6 ++----
 hw/virtio/virtio-pmem.c       |  3 +--
 scsi/pr-manager.c             |  3 +--
 scsi/qemu-pr-helper.c         |  3 +--
 tests/unit/test-thread-pool.c | 12 +++++-------
 util/thread-pool.c            | 16 ++++++++--------
 12 files changed, 27 insertions(+), 44 deletions(-)

diff --git a/include/block/thread-pool.h b/include/block/thread-pool.h
index c408bde74c..948ff5f30c 100644
--- a/include/block/thread-pool.h
+++ b/include/block/thread-pool.h
@@ -33,12 +33,10 @@ void thread_pool_free(ThreadPool *pool);
  * thread_pool_submit* API: submit I/O requests in the thread's
  * current AioContext.
  */
-BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
-        ThreadPoolFunc *func, void *arg,
-        BlockCompletionFunc *cb, void *opaque);
-int coroutine_fn thread_pool_submit_co(ThreadPool *pool,
-        ThreadPoolFunc *func, void *arg);
-void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg);
+BlockAIOCB *thread_pool_submit_aio(ThreadPoolFunc *func, void *arg,
+                                   BlockCompletionFunc *cb, void *opaque);
+int coroutine_fn thread_pool_submit_co(ThreadPoolFunc *func, void *arg);
+void thread_pool_submit(ThreadPoolFunc *func, void *arg);
 
 void thread_pool_update_params(ThreadPool *pool, struct AioContext *ctx);
 
diff --git a/backends/tpm/tpm_backend.c b/backends/tpm/tpm_backend.c
index 375587e743..485a20b9e0 100644
--- a/backends/tpm/tpm_backend.c
+++ b/backends/tpm/tpm_backend.c
@@ -100,8 +100,6 @@ bool tpm_backend_had_startup_error(TPMBackend *s)
 
 void tpm_backend_deliver_request(TPMBackend *s, TPMBackendCmd *cmd)
 {
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
-
     if (s->cmd != NULL) {
         error_report("There is a TPM request pending");
         return;
@@ -109,7 +107,7 @@ void tpm_backend_deliver_request(TPMBackend *s, TPMBackendCmd *cmd)
 
     s->cmd = cmd;
     object_ref(OBJECT(s));
-    thread_pool_submit_aio(pool, tpm_backend_worker_thread, s,
+    thread_pool_submit_aio(tpm_backend_worker_thread, s,
                            tpm_backend_request_completed, s);
 }
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 173b3b1653..c7b723368e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2042,9 +2042,7 @@ out:
 
 static int coroutine_fn raw_thread_pool_submit(ThreadPoolFunc func, void *arg)
 {
-    /* @bs can be NULL, bdrv_get_aio_context() returns the main context then */
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_current_aio_context());
-    return thread_pool_submit_co(pool, func, arg);
+    return thread_pool_submit_co(func, arg);
 }
 
 /*
diff --git a/block/file-win32.c b/block/file-win32.c
index 0aedb0875c..48b790d917 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -153,7 +153,6 @@ static BlockAIOCB *paio_submit(BlockDriverState *bs, HANDLE hfile,
         BlockCompletionFunc *cb, void *opaque, int type)
 {
     RawWin32AIOData *acb = g_new(RawWin32AIOData, 1);
-    ThreadPool *pool;
 
     acb->bs = bs;
     acb->hfile = hfile;
@@ -168,8 +167,7 @@ static BlockAIOCB *paio_submit(BlockDriverState *bs, HANDLE hfile,
     acb->aio_offset = offset;
 
     trace_file_paio_submit(acb, opaque, offset, count, type);
-    pool = aio_get_thread_pool(qemu_get_current_aio_context());
-    return thread_pool_submit_aio(pool, aio_worker, acb, cb, opaque);
+    return thread_pool_submit_aio(aio_worker, acb, cb, opaque);
 }
 
 int qemu_ftruncate64(int fd, int64_t length)
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 6d2e6b7bf4..d6071a1eae 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -43,7 +43,6 @@ qcow2_co_process(BlockDriverState *bs, ThreadPoolFunc *func, void *arg)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_current_aio_context());
 
     qemu_co_mutex_lock(&s->lock);
     while (s->nb_threads >= QCOW2_MAX_THREADS) {
@@ -52,7 +51,7 @@ qcow2_co_process(BlockDriverState *bs, ThreadPoolFunc *func, void *arg)
     s->nb_threads++;
     qemu_co_mutex_unlock(&s->lock);
 
-    ret = thread_pool_submit_co(pool, func, arg);
+    ret = thread_pool_submit_co(func, arg);
 
     qemu_co_mutex_lock(&s->lock);
     s->nb_threads--;
diff --git a/hw/9pfs/coth.c b/hw/9pfs/coth.c
index 2802d41cce..598f46add9 100644
--- a/hw/9pfs/coth.c
+++ b/hw/9pfs/coth.c
@@ -41,6 +41,5 @@ static int coroutine_enter_func(void *arg)
 void co_run_in_worker_bh(void *opaque)
 {
     Coroutine *co = opaque;
-    thread_pool_submit_aio(aio_get_thread_pool(qemu_get_aio_context()),
-                           coroutine_enter_func, co, coroutine_enter_cb, co);
+    thread_pool_submit_aio(coroutine_enter_func, co, coroutine_enter_cb, co);
 }
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 04a64cada3..a8688243a6 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -496,7 +496,6 @@ static int spapr_nvdimm_flush_post_load(void *opaque, int version_id)
 {
     SpaprNVDIMMDevice *s_nvdimm = (SpaprNVDIMMDevice *)opaque;
     SpaprNVDIMMDeviceFlushState *state;
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
     HostMemoryBackend *backend = MEMORY_BACKEND(PC_DIMM(s_nvdimm)->hostmem);
     bool is_pmem = object_property_get_bool(OBJECT(backend), "pmem", NULL);
     bool pmem_override = object_property_get_bool(OBJECT(s_nvdimm),
@@ -517,7 +516,7 @@ static int spapr_nvdimm_flush_post_load(void *opaque, int version_id)
     }
 
     QLIST_FOREACH(state, &s_nvdimm->pending_nvdimm_flush_states, node) {
-        thread_pool_submit_aio(pool, flush_worker_cb, state,
+        thread_pool_submit_aio(flush_worker_cb, state,
                                spapr_nvdimm_flush_completion_cb, state);
     }
 
@@ -664,7 +663,6 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
     PCDIMMDevice *dimm;
     HostMemoryBackend *backend = NULL;
     SpaprNVDIMMDeviceFlushState *state;
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
     int fd;
 
     if (!drc || !drc->dev ||
@@ -699,7 +697,7 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
         state->drcidx = drc_index;
 
-        thread_pool_submit_aio(pool, flush_worker_cb, state,
+        thread_pool_submit_aio(flush_worker_cb, state,
                                spapr_nvdimm_flush_completion_cb, state);
 
         continue_token = state->continue_token;
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index dff402f08f..c3512c2dae 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -70,7 +70,6 @@ static void virtio_pmem_flush(VirtIODevice *vdev, VirtQueue *vq)
     VirtIODeviceRequest *req_data;
     VirtIOPMEM *pmem = VIRTIO_PMEM(vdev);
     HostMemoryBackend *backend = MEMORY_BACKEND(pmem->memdev);
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
 
     trace_virtio_pmem_flush_request();
     req_data = virtqueue_pop(vq, sizeof(VirtIODeviceRequest));
@@ -88,7 +87,7 @@ static void virtio_pmem_flush(VirtIODevice *vdev, VirtQueue *vq)
     req_data->fd   = memory_region_get_fd(&backend->mr);
     req_data->pmem = pmem;
     req_data->vdev = vdev;
-    thread_pool_submit_aio(pool, worker_cb, req_data, done_cb, req_data);
+    thread_pool_submit_aio(worker_cb, req_data, done_cb, req_data);
 }
 
 static void virtio_pmem_get_config(VirtIODevice *vdev, uint8_t *config)
diff --git a/scsi/pr-manager.c b/scsi/pr-manager.c
index 2098d7e759..fb5fc29730 100644
--- a/scsi/pr-manager.c
+++ b/scsi/pr-manager.c
@@ -51,7 +51,6 @@ static int pr_manager_worker(void *opaque)
 int coroutine_fn pr_manager_execute(PRManager *pr_mgr, AioContext *ctx, int fd,
                                     struct sg_io_hdr *hdr)
 {
-    ThreadPool *pool = aio_get_thread_pool(ctx);
     PRManagerData data = {
         .pr_mgr = pr_mgr,
         .fd     = fd,
@@ -62,7 +61,7 @@ int coroutine_fn pr_manager_execute(PRManager *pr_mgr, AioContext *ctx, int fd,
 
     /* The matching object_unref is in pr_manager_worker.  */
     object_ref(OBJECT(pr_mgr));
-    return thread_pool_submit_co(pool, pr_manager_worker, &data);
+    return thread_pool_submit_co(pr_manager_worker, &data);
 }
 
 bool pr_manager_is_connected(PRManager *pr_mgr)
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 199227a556..e9b3ad259a 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -180,7 +180,6 @@ static int do_sgio_worker(void *opaque)
 static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
                     uint8_t *buf, int *sz, int dir)
 {
-    ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
     int r;
 
     PRHelperSGIOData data = {
@@ -192,7 +191,7 @@ static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
         .dir = dir,
     };
 
-    r = thread_pool_submit_co(pool, do_sgio_worker, &data);
+    r = thread_pool_submit_co(do_sgio_worker, &data);
     *sz = data.sz;
     return r;
 }
diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
index 6020e65d69..448fbf7e5f 100644
--- a/tests/unit/test-thread-pool.c
+++ b/tests/unit/test-thread-pool.c
@@ -8,7 +8,6 @@
 #include "qemu/main-loop.h"
 
 static AioContext *ctx;
-static ThreadPool *pool;
 static int active;
 
 typedef struct {
@@ -47,7 +46,7 @@ static void done_cb(void *opaque, int ret)
 static void test_submit(void)
 {
     WorkerTestData data = { .n = 0 };
-    thread_pool_submit(pool, worker_cb, &data);
+    thread_pool_submit(worker_cb, &data);
     while (data.n == 0) {
         aio_poll(ctx, true);
     }
@@ -57,7 +56,7 @@ static void test_submit(void)
 static void test_submit_aio(void)
 {
     WorkerTestData data = { .n = 0, .ret = -EINPROGRESS };
-    data.aiocb = thread_pool_submit_aio(pool, worker_cb, &data,
+    data.aiocb = thread_pool_submit_aio(worker_cb, &data,
                                         done_cb, &data);
 
     /* The callbacks are not called until after the first wait.  */
@@ -78,7 +77,7 @@ static void co_test_cb(void *opaque)
     active = 1;
     data->n = 0;
     data->ret = -EINPROGRESS;
-    thread_pool_submit_co(pool, worker_cb, data);
+    thread_pool_submit_co(worker_cb, data);
 
     /* The test continues in test_submit_co, after qemu_coroutine_enter... */
 
@@ -122,7 +121,7 @@ static void test_submit_many(void)
     for (i = 0; i < 100; i++) {
         data[i].n = 0;
         data[i].ret = -EINPROGRESS;
-        thread_pool_submit_aio(pool, worker_cb, &data[i], done_cb, &data[i]);
+        thread_pool_submit_aio(worker_cb, &data[i], done_cb, &data[i]);
     }
 
     active = 100;
@@ -150,7 +149,7 @@ static void do_test_cancel(bool sync)
     for (i = 0; i < 100; i++) {
         data[i].n = 0;
         data[i].ret = -EINPROGRESS;
-        data[i].aiocb = thread_pool_submit_aio(pool, long_cb, &data[i],
+        data[i].aiocb = thread_pool_submit_aio(long_cb, &data[i],
                                                done_cb, &data[i]);
     }
 
@@ -235,7 +234,6 @@ int main(int argc, char **argv)
 {
     qemu_init_main_loop(&error_abort);
     ctx = qemu_get_current_aio_context();
-    pool = aio_get_thread_pool(ctx);
 
     g_test_init(&argc, &argv, NULL);
     g_test_add_func("/thread-pool/submit", test_submit);
diff --git a/util/thread-pool.c b/util/thread-pool.c
index a70abb8a59..0d97888df0 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -241,11 +241,12 @@ static const AIOCBInfo thread_pool_aiocb_info = {
     .get_aio_context    = thread_pool_get_aio_context,
 };
 
-BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
-        ThreadPoolFunc *func, void *arg,
-        BlockCompletionFunc *cb, void *opaque)
+BlockAIOCB *thread_pool_submit_aio(ThreadPoolFunc *func, void *arg,
+                                   BlockCompletionFunc *cb, void *opaque)
 {
     ThreadPoolElement *req;
+    AioContext *ctx = qemu_get_current_aio_context();
+    ThreadPool *pool = aio_get_thread_pool(ctx);
 
     /* Assert that the thread submitting work is the same running the pool */
     assert(pool->ctx == qemu_get_current_aio_context());
@@ -283,19 +284,18 @@ static void thread_pool_co_cb(void *opaque, int ret)
     aio_co_wake(co->co);
 }
 
-int coroutine_fn thread_pool_submit_co(ThreadPool *pool, ThreadPoolFunc *func,
-                                       void *arg)
+int coroutine_fn thread_pool_submit_co(ThreadPoolFunc *func, void *arg)
 {
     ThreadPoolCo tpc = { .co = qemu_coroutine_self(), .ret = -EINPROGRESS };
     assert(qemu_in_coroutine());
-    thread_pool_submit_aio(pool, func, arg, thread_pool_co_cb, &tpc);
+    thread_pool_submit_aio(func, arg, thread_pool_co_cb, &tpc);
     qemu_coroutine_yield();
     return tpc.ret;
 }
 
-void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg)
+void thread_pool_submit(ThreadPoolFunc *func, void *arg)
 {
-    thread_pool_submit_aio(pool, func, arg, NULL, NULL);
+    thread_pool_submit_aio(func, arg, NULL, NULL);
 }
 
 void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
-- 
2.40.0


