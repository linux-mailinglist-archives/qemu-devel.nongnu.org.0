Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573E57FAA4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 10:00:04 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFt0V-0002M1-FZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 04:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFsgO-00047h-Pk
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFsgG-0003EQ-Ad
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658734747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QvnyYLSuhHSb85IrgBmHFhsYsKdlQJaMf9QRrl55ses=;
 b=JVxKYfD+gr8NA5fN9xW+lZOlhCrt1bcKTRHGPpnKUUTzBbzj2BhqmY6vorhVyXqSb0X8V8
 4sDiOD3FprtS/MUOuKMgy34uPvvlaC1BHlQRFcjGKjHWpuoEG/50/BwNqQvDSIR+2EiOQR
 +8cYuT+04GOR3AzjyBtXfttmi57SBM0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-KLdLwoHYNSOnKP_zVpnziA-1; Mon, 25 Jul 2022 03:39:03 -0400
X-MC-Unique: KLdLwoHYNSOnKP_zVpnziA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD05F800124;
 Mon, 25 Jul 2022 07:39:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7938D2166B26;
 Mon, 25 Jul 2022 07:39:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v10 09/21] jobs: use job locks also in the unit tests
Date: Mon, 25 Jul 2022 03:38:43 -0400
Message-Id: <20220725073855.76049-10-eesposit@redhat.com>
In-Reply-To: <20220725073855.76049-1-eesposit@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing job synchronization in the unit tests, with
explicit locks.

We are deliberately using _locked functions wrapped by a guard
instead of a normal call because the normal call will be removed
in future, as the only usage is limited to the tests.

In other words, if a function like job_pause() is/will be only used
in tests to avoid:

WITH_JOB_LOCK_GUARD(){
    job_pause_locked();
}

then it is not worth keeping job_pause(), and just use the guard.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/unit/test-bdrv-drain.c     |  76 +++++++++++++-------
 tests/unit/test-block-iothread.c |   8 ++-
 tests/unit/test-blockjob-txn.c   |  24 ++++---
 tests/unit/test-blockjob.c       | 116 +++++++++++++++++++------------
 4 files changed, 141 insertions(+), 83 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 36be84ae55..0db056ea63 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -943,61 +943,83 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
         }
     }
 
-    g_assert_cmpint(job->job.pause_count, ==, 0);
-    g_assert_false(job->job.paused);
-    g_assert_true(tjob->running);
-    g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    WITH_JOB_LOCK_GUARD() {
+        g_assert_cmpint(job->job.pause_count, ==, 0);
+        g_assert_false(job->job.paused);
+        g_assert_true(tjob->running);
+        g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    }
 
     do_drain_begin_unlocked(drain_type, drain_bs);
 
-    if (drain_type == BDRV_DRAIN_ALL) {
-        /* bdrv_drain_all() drains both src and target */
-        g_assert_cmpint(job->job.pause_count, ==, 2);
-    } else {
-        g_assert_cmpint(job->job.pause_count, ==, 1);
+    WITH_JOB_LOCK_GUARD() {
+        if (drain_type == BDRV_DRAIN_ALL) {
+            /* bdrv_drain_all() drains both src and target */
+            g_assert_cmpint(job->job.pause_count, ==, 2);
+        } else {
+            g_assert_cmpint(job->job.pause_count, ==, 1);
+        }
+        g_assert_true(job->job.paused);
+        g_assert_false(job->job.busy); /* The job is paused */
     }
-    g_assert_true(job->job.paused);
-    g_assert_false(job->job.busy); /* The job is paused */
 
     do_drain_end_unlocked(drain_type, drain_bs);
 
     if (use_iothread) {
-        /* paused is reset in the I/O thread, wait for it */
+        /*
+         * Here we are waiting for the paused status to change,
+         * so don't bother protecting the read every time.
+         *
+         * paused is reset in the I/O thread, wait for it
+         */
         while (job->job.paused) {
             aio_poll(qemu_get_aio_context(), false);
         }
     }
 
-    g_assert_cmpint(job->job.pause_count, ==, 0);
-    g_assert_false(job->job.paused);
-    g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    WITH_JOB_LOCK_GUARD() {
+        g_assert_cmpint(job->job.pause_count, ==, 0);
+        g_assert_false(job->job.paused);
+        g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    }
 
     do_drain_begin_unlocked(drain_type, target);
 
-    if (drain_type == BDRV_DRAIN_ALL) {
-        /* bdrv_drain_all() drains both src and target */
-        g_assert_cmpint(job->job.pause_count, ==, 2);
-    } else {
-        g_assert_cmpint(job->job.pause_count, ==, 1);
+    WITH_JOB_LOCK_GUARD() {
+        if (drain_type == BDRV_DRAIN_ALL) {
+            /* bdrv_drain_all() drains both src and target */
+            g_assert_cmpint(job->job.pause_count, ==, 2);
+        } else {
+            g_assert_cmpint(job->job.pause_count, ==, 1);
+        }
+        g_assert_true(job->job.paused);
+        g_assert_false(job->job.busy); /* The job is paused */
     }
-    g_assert_true(job->job.paused);
-    g_assert_false(job->job.busy); /* The job is paused */
 
     do_drain_end_unlocked(drain_type, target);
 
     if (use_iothread) {
-        /* paused is reset in the I/O thread, wait for it */
+        /*
+         * Here we are waiting for the paused status to change,
+         * so don't bother protecting the read every time.
+         *
+         * paused is reset in the I/O thread, wait for it
+         */
         while (job->job.paused) {
             aio_poll(qemu_get_aio_context(), false);
         }
     }
 
-    g_assert_cmpint(job->job.pause_count, ==, 0);
-    g_assert_false(job->job.paused);
-    g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    WITH_JOB_LOCK_GUARD() {
+        g_assert_cmpint(job->job.pause_count, ==, 0);
+        g_assert_false(job->job.paused);
+        g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    }
 
     aio_context_acquire(ctx);
-    ret = job_complete_sync(&job->job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        ret = job_complete_sync_locked(&job->job, &error_abort);
+    }
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
     if (use_iothread) {
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 94718c9319..89e7f0fffb 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -456,7 +456,9 @@ static void test_attach_blockjob(void)
     }
 
     aio_context_acquire(ctx);
-    job_complete_sync(&tjob->common.job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        job_complete_sync_locked(&tjob->common.job, &error_abort);
+    }
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx);
 
@@ -630,7 +632,9 @@ static void test_propagate_mirror(void)
                  BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPORT,
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
-    job = job_get("job0");
+    WITH_JOB_LOCK_GUARD() {
+        job = job_get_locked("job0");
+    }
     filter = bdrv_find_node("filter_node");
 
     /* Change the AioContext of src */
diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index c69028b450..d3b0bb24be 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -116,8 +116,10 @@ static void test_single_job(int expected)
     job = test_block_job_start(1, true, expected, &result, txn);
     job_start(&job->job);
 
-    if (expected == -ECANCELED) {
-        job_cancel(&job->job, false);
+    WITH_JOB_LOCK_GUARD() {
+        if (expected == -ECANCELED) {
+            job_cancel_locked(&job->job, false);
+        }
     }
 
     while (result == -EINPROGRESS) {
@@ -160,13 +162,15 @@ static void test_pair_jobs(int expected1, int expected2)
     /* Release our reference now to trigger as many nice
      * use-after-free bugs as possible.
      */
-    job_txn_unref(txn);
+    WITH_JOB_LOCK_GUARD() {
+        job_txn_unref_locked(txn);
 
-    if (expected1 == -ECANCELED) {
-        job_cancel(&job1->job, false);
-    }
-    if (expected2 == -ECANCELED) {
-        job_cancel(&job2->job, false);
+        if (expected1 == -ECANCELED) {
+            job_cancel_locked(&job1->job, false);
+        }
+        if (expected2 == -ECANCELED) {
+            job_cancel_locked(&job2->job, false);
+        }
     }
 
     while (result1 == -EINPROGRESS || result2 == -EINPROGRESS) {
@@ -219,7 +223,9 @@ static void test_pair_jobs_fail_cancel_race(void)
     job_start(&job1->job);
     job_start(&job2->job);
 
-    job_cancel(&job1->job, false);
+    WITH_JOB_LOCK_GUARD() {
+        job_cancel_locked(&job1->job, false);
+    }
 
     /* Now make job2 finish before the main loop kicks jobs.  This simulates
      * the race between a pending kick and another job completing.
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index 4c9e1bf1e5..b0cd06c529 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -211,8 +211,11 @@ static CancelJob *create_common(Job **pjob)
     bjob = mk_job(blk, "Steve", &test_cancel_driver, true,
                   JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
     job = &bjob->job;
-    job_ref(job);
-    assert(job->status == JOB_STATUS_CREATED);
+    WITH_JOB_LOCK_GUARD() {
+        job_ref_locked(job);
+        assert(job->status == JOB_STATUS_CREATED);
+    }
+
     s = container_of(bjob, CancelJob, common);
     s->blk = blk;
 
@@ -231,12 +234,14 @@ static void cancel_common(CancelJob *s)
     aio_context_acquire(ctx);
 
     job_cancel_sync(&job->job, true);
-    if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
-        Job *dummy = &job->job;
-        job_dismiss(&dummy, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
+            Job *dummy = &job->job;
+            job_dismiss_locked(&dummy, &error_abort);
+        }
+        assert(job->job.status == JOB_STATUS_NULL);
+        job_unref_locked(&job->job);
     }
-    assert(job->job.status == JOB_STATUS_NULL);
-    job_unref(&job->job);
     destroy_blk(blk);
 
     aio_context_release(ctx);
@@ -251,6 +256,13 @@ static void test_cancel_created(void)
     cancel_common(s);
 }
 
+static void assert_job_status_is(Job *job, int status)
+{
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->status == status);
+    }
+}
+
 static void test_cancel_running(void)
 {
     Job *job;
@@ -259,7 +271,7 @@ static void test_cancel_running(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert_job_status_is(job, JOB_STATUS_RUNNING);
 
     cancel_common(s);
 }
@@ -272,11 +284,12 @@ static void test_cancel_paused(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
-
-    job_user_pause(job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->status == JOB_STATUS_RUNNING);
+        job_user_pause_locked(job, &error_abort);
+    }
     job_enter(job);
-    assert(job->status == JOB_STATUS_PAUSED);
+    assert_job_status_is(job, JOB_STATUS_PAUSED);
 
     cancel_common(s);
 }
@@ -289,11 +302,11 @@ static void test_cancel_ready(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert_job_status_is(job, JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
+    assert_job_status_is(job, JOB_STATUS_READY);
 
     cancel_common(s);
 }
@@ -306,15 +319,16 @@ static void test_cancel_standby(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert_job_status_is(job, JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
-
-    job_user_pause(job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->status == JOB_STATUS_READY);
+        job_user_pause_locked(job, &error_abort);
+    }
     job_enter(job);
-    assert(job->status == JOB_STATUS_STANDBY);
+    assert_job_status_is(job, JOB_STATUS_STANDBY);
 
     cancel_common(s);
 }
@@ -327,20 +341,21 @@ static void test_cancel_pending(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert_job_status_is(job, JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
-
-    job_complete(job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->status == JOB_STATUS_READY);
+        job_complete_locked(job, &error_abort);
+    }
     job_enter(job);
     while (!job->deferred_to_main_loop) {
         aio_poll(qemu_get_aio_context(), true);
     }
-    assert(job->status == JOB_STATUS_READY);
+    assert_job_status_is(job, JOB_STATUS_READY);
     aio_poll(qemu_get_aio_context(), true);
-    assert(job->status == JOB_STATUS_PENDING);
+    assert_job_status_is(job, JOB_STATUS_PENDING);
 
     cancel_common(s);
 }
@@ -353,25 +368,28 @@ static void test_cancel_concluded(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert_job_status_is(job, JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
-
-    job_complete(job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        assert(job->status == JOB_STATUS_READY);
+        job_complete_locked(job, &error_abort);
+    }
     job_enter(job);
     while (!job->deferred_to_main_loop) {
         aio_poll(qemu_get_aio_context(), true);
     }
-    assert(job->status == JOB_STATUS_READY);
+    assert_job_status_is(job, JOB_STATUS_READY);
     aio_poll(qemu_get_aio_context(), true);
-    assert(job->status == JOB_STATUS_PENDING);
+    assert_job_status_is(job, JOB_STATUS_PENDING);
 
     aio_context_acquire(job->aio_context);
-    job_finalize(job, &error_abort);
+    WITH_JOB_LOCK_GUARD() {
+        job_finalize_locked(job, &error_abort);
+    }
     aio_context_release(job->aio_context);
-    assert(job->status == JOB_STATUS_CONCLUDED);
+    assert_job_status_is(job, JOB_STATUS_CONCLUDED);
 
     cancel_common(s);
 }
@@ -459,36 +477,44 @@ static void test_complete_in_standby(void)
     bjob = mk_job(blk, "job", &test_yielding_driver, true,
                   JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
     job = &bjob->job;
-    assert(job->status == JOB_STATUS_CREATED);
+    /* Job did not start, so status is safe to read*/
+    assert_job_status_is(job, JOB_STATUS_CREATED);
 
     /* Wait for the job to become READY */
     job_start(job);
     aio_context_acquire(ctx);
+    /*
+     * Here we are waiting for the status to change, so don't bother
+     * protecting the read every time.
+     */
     AIO_WAIT_WHILE(ctx, job->status != JOB_STATUS_READY);
     aio_context_release(ctx);
 
     /* Begin the drained section, pausing the job */
     bdrv_drain_all_begin();
-    assert(job->status == JOB_STATUS_STANDBY);
+    assert_job_status_is(job, JOB_STATUS_STANDBY);
+
     /* Lock the IO thread to prevent the job from being run */
     aio_context_acquire(ctx);
     /* This will schedule the job to resume it */
     bdrv_drain_all_end();
 
-    /* But the job cannot run, so it will remain on standby */
-    assert(job->status == JOB_STATUS_STANDBY);
+    WITH_JOB_LOCK_GUARD() {
+        /* But the job cannot run, so it will remain on standby */
+        assert(job->status == JOB_STATUS_STANDBY);
 
-    /* Even though the job is on standby, this should work */
-    job_complete(job, &error_abort);
+        /* Even though the job is on standby, this should work */
+        job_complete_locked(job, &error_abort);
 
-    /* The test is done now, clean up. */
-    job_finish_sync(job, NULL, &error_abort);
-    assert(job->status == JOB_STATUS_PENDING);
+        /* The test is done now, clean up. */
+        job_finish_sync_locked(job, NULL, &error_abort);
+        assert(job->status == JOB_STATUS_PENDING);
 
-    job_finalize(job, &error_abort);
-    assert(job->status == JOB_STATUS_CONCLUDED);
+        job_finalize_locked(job, &error_abort);
+        assert(job->status == JOB_STATUS_CONCLUDED);
 
-    job_dismiss(&job, &error_abort);
+        job_dismiss_locked(&job, &error_abort);
+    }
 
     destroy_blk(blk);
     aio_context_release(ctx);
-- 
2.31.1


