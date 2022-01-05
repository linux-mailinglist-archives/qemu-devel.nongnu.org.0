Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46184854B2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:36:45 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57PA-00062i-Lt
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sk-0000IE-E6
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sa-0007NS-6r
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6oZW+L+lvCwJy/AK4xp7wKAb/Tfqu+x97oTRYvZuuU=;
 b=Yy92TVDu6IlVxwh40TZZM/k1JB8naW193f6+P1h1wcY0uDg9jPMhjvf6Fsj6YR8vxK8YWb
 OjHefrOwyrgxZBY50tajDBaS+r8lJMdEyw+RO6FQMNSqfLXUMT94624qZft74/TRz+pNPi
 pCa4GMZfPSaWOzdw07XaZfOF+3zq9HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-Pnrt6Mw7OaaCxs6D8FTgnA-1; Wed, 05 Jan 2022 09:03:02 -0500
X-MC-Unique: Pnrt6Mw7OaaCxs6D8FTgnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71F3E94DDB;
 Wed,  5 Jan 2022 14:02:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B5B62BE77;
 Wed,  5 Jan 2022 14:02:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 12/16] jobs: use job locks and helpers also in the unit
 tests
Date: Wed,  5 Jan 2022 09:02:04 -0500
Message-Id: <20220105140208.365608-13-eesposit@redhat.com>
In-Reply-To: <20220105140208.365608-1-eesposit@redhat.com>
References: <20220105140208.365608-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing job synchronization in the unit tests, with
both explicit locks and helpers.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-bdrv-drain.c     | 40 +++++++++++-----------
 tests/unit/test-block-iothread.c |  4 +++
 tests/unit/test-blockjob-txn.c   | 10 ++++++
 tests/unit/test-blockjob.c       | 57 +++++++++++++++++++++-----------
 4 files changed, 72 insertions(+), 39 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 3f344a0d0d..c03560e63d 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -941,61 +941,63 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
         }
     }
 
-    g_assert_cmpint(job->job.pause_count, ==, 0);
-    g_assert_false(job->job.paused);
+    g_assert_cmpint(job_get_pause_count(&job->job), ==, 0);
+    g_assert_false(job_get_paused(&job->job));
     g_assert_true(tjob->running);
-    g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    g_assert_true(job_get_busy(&job->job)); /* We're in qemu_co_sleep_ns() */
 
     do_drain_begin_unlocked(drain_type, drain_bs);
 
     if (drain_type == BDRV_DRAIN_ALL) {
         /* bdrv_drain_all() drains both src and target */
-        g_assert_cmpint(job->job.pause_count, ==, 2);
+        g_assert_cmpint(job_get_pause_count(&job->job), ==, 2);
     } else {
-        g_assert_cmpint(job->job.pause_count, ==, 1);
+        g_assert_cmpint(job_get_pause_count(&job->job), ==, 1);
     }
-    g_assert_true(job->job.paused);
-    g_assert_false(job->job.busy); /* The job is paused */
+    g_assert_true(job_get_paused(&job->job));
+    g_assert_false(job_get_busy(&job->job)); /* The job is paused */
 
     do_drain_end_unlocked(drain_type, drain_bs);
 
     if (use_iothread) {
         /* paused is reset in the I/O thread, wait for it */
-        while (job->job.paused) {
+        while (job_get_paused(&job->job)) {
             aio_poll(qemu_get_aio_context(), false);
         }
     }
 
-    g_assert_cmpint(job->job.pause_count, ==, 0);
-    g_assert_false(job->job.paused);
-    g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    g_assert_cmpint(job_get_pause_count(&job->job), ==, 0);
+    g_assert_false(job_get_paused(&job->job));
+    g_assert_true(job_get_busy(&job->job)); /* We're in qemu_co_sleep_ns() */
 
     do_drain_begin_unlocked(drain_type, target);
 
     if (drain_type == BDRV_DRAIN_ALL) {
         /* bdrv_drain_all() drains both src and target */
-        g_assert_cmpint(job->job.pause_count, ==, 2);
+        g_assert_cmpint(job_get_pause_count(&job->job), ==, 2);
     } else {
-        g_assert_cmpint(job->job.pause_count, ==, 1);
+        g_assert_cmpint(job_get_pause_count(&job->job), ==, 1);
     }
-    g_assert_true(job->job.paused);
-    g_assert_false(job->job.busy); /* The job is paused */
+    g_assert_true(job_get_paused(&job->job));
+    g_assert_false(job_get_busy(&job->job)); /* The job is paused */
 
     do_drain_end_unlocked(drain_type, target);
 
     if (use_iothread) {
         /* paused is reset in the I/O thread, wait for it */
-        while (job->job.paused) {
+        while (job_get_paused(&job->job)) {
             aio_poll(qemu_get_aio_context(), false);
         }
     }
 
-    g_assert_cmpint(job->job.pause_count, ==, 0);
-    g_assert_false(job->job.paused);
-    g_assert_true(job->job.busy); /* We're in qemu_co_sleep_ns() */
+    g_assert_cmpint(job_get_pause_count(&job->job), ==, 0);
+    g_assert_false(job_get_paused(&job->job));
+    g_assert_true(job_get_busy(&job->job)); /* We're in qemu_co_sleep_ns() */
 
     aio_context_acquire(ctx);
+    job_lock();
     ret = job_complete_sync_locked(&job->job, &error_abort);
+    job_unlock();
     g_assert_cmpint(ret, ==, (result == TEST_JOB_SUCCESS ? 0 : -EIO));
 
     if (use_iothread) {
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 7e1b521d61..b9309beec2 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -456,7 +456,9 @@ static void test_attach_blockjob(void)
     }
 
     aio_context_acquire(ctx);
+    job_lock();
     job_complete_sync_locked(&tjob->common.job, &error_abort);
+    job_unlock();
     blk_set_aio_context(blk, qemu_get_aio_context(), &error_abort);
     aio_context_release(ctx);
 
@@ -630,7 +632,9 @@ static void test_propagate_mirror(void)
                  BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPORT,
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
+    job_lock();
     job = job_get_locked("job0");
+    job_unlock();
     filter = bdrv_find_node("filter_node");
 
     /* Change the AioContext of src */
diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 5396fcef10..bd69076300 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -124,16 +124,20 @@ static void test_single_job(int expected)
     job = test_block_job_start(1, true, expected, &result, txn);
     job_start(&job->job);
 
+    job_lock();
     if (expected == -ECANCELED) {
         job_cancel_locked(&job->job, false);
     }
+    job_unlock();
 
     while (result == -EINPROGRESS) {
         aio_poll(qemu_get_aio_context(), true);
     }
     g_assert_cmpint(result, ==, expected);
 
+    job_lock();
     job_txn_unref_locked(txn);
+    job_unlock();
 }
 
 static void test_single_job_success(void)
@@ -168,6 +172,7 @@ static void test_pair_jobs(int expected1, int expected2)
     /* Release our reference now to trigger as many nice
      * use-after-free bugs as possible.
      */
+    job_lock();
     job_txn_unref_locked(txn);
 
     if (expected1 == -ECANCELED) {
@@ -176,6 +181,7 @@ static void test_pair_jobs(int expected1, int expected2)
     if (expected2 == -ECANCELED) {
         job_cancel_locked(&job2->job, false);
     }
+    job_unlock();
 
     while (result1 == -EINPROGRESS || result2 == -EINPROGRESS) {
         aio_poll(qemu_get_aio_context(), true);
@@ -227,7 +233,9 @@ static void test_pair_jobs_fail_cancel_race(void)
     job_start(&job1->job);
     job_start(&job2->job);
 
+    job_lock();
     job_cancel_locked(&job1->job, false);
+    job_unlock();
 
     /* Now make job2 finish before the main loop kicks jobs.  This simulates
      * the race between a pending kick and another job completing.
@@ -242,7 +250,9 @@ static void test_pair_jobs_fail_cancel_race(void)
     g_assert_cmpint(result1, ==, -ECANCELED);
     g_assert_cmpint(result2, ==, -ECANCELED);
 
+    job_lock();
     job_txn_unref_locked(txn);
+    job_unlock();
 }
 
 int main(int argc, char **argv)
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index 2beed3623e..ec9128dbb5 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -211,8 +211,11 @@ static CancelJob *create_common(Job **pjob)
     bjob = mk_job(blk, "Steve", &test_cancel_driver, true,
                   JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
     job = &bjob->job;
+    job_lock();
     job_ref_locked(job);
     assert(job->status == JOB_STATUS_CREATED);
+    job_unlock();
+
     s = container_of(bjob, CancelJob, common);
     s->blk = blk;
 
@@ -230,6 +233,7 @@ static void cancel_common(CancelJob *s)
     ctx = job->job.aio_context;
     aio_context_acquire(ctx);
 
+    job_lock();
     job_cancel_sync_locked(&job->job, true);
     if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
         Job *dummy = &job->job;
@@ -237,6 +241,7 @@ static void cancel_common(CancelJob *s)
     }
     assert(job->job.status == JOB_STATUS_NULL);
     job_unref_locked(&job->job);
+    job_unlock();
     destroy_blk(blk);
 
     aio_context_release(ctx);
@@ -259,7 +264,7 @@ static void test_cancel_running(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert(job_get_status(job) == JOB_STATUS_RUNNING);
 
     cancel_common(s);
 }
@@ -272,11 +277,13 @@ static void test_cancel_paused(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert(job_get_status(job) == JOB_STATUS_RUNNING);
 
+    job_lock();
     job_user_pause_locked(job, &error_abort);
+    job_unlock();
     job_enter(job);
-    assert(job->status == JOB_STATUS_PAUSED);
+    assert(job_get_status(job) == JOB_STATUS_PAUSED);
 
     cancel_common(s);
 }
@@ -289,11 +296,11 @@ static void test_cancel_ready(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert(job_get_status(job) == JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
+    assert(job_get_status(job) == JOB_STATUS_READY);
 
     cancel_common(s);
 }
@@ -306,15 +313,17 @@ static void test_cancel_standby(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert(job_get_status(job) == JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
+    assert(job_get_status(job) == JOB_STATUS_READY);
 
+    job_lock();
     job_user_pause_locked(job, &error_abort);
+    job_unlock();
     job_enter(job);
-    assert(job->status == JOB_STATUS_STANDBY);
+    assert(job_get_status(job) == JOB_STATUS_STANDBY);
 
     cancel_common(s);
 }
@@ -327,20 +336,22 @@ static void test_cancel_pending(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert(job_get_status(job) == JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
+    assert(job_get_status(job) == JOB_STATUS_READY);
 
+    job_lock();
     job_complete_locked(job, &error_abort);
+    job_unlock();
     job_enter(job);
     while (!job->deferred_to_main_loop) {
         aio_poll(qemu_get_aio_context(), true);
     }
-    assert(job->status == JOB_STATUS_READY);
+    assert(job_get_status(job) == JOB_STATUS_READY);
     aio_poll(qemu_get_aio_context(), true);
-    assert(job->status == JOB_STATUS_PENDING);
+    assert(job_get_status(job) == JOB_STATUS_PENDING);
 
     cancel_common(s);
 }
@@ -353,25 +364,29 @@ static void test_cancel_concluded(void)
     s = create_common(&job);
 
     job_start(job);
-    assert(job->status == JOB_STATUS_RUNNING);
+    assert(job_get_status(job) == JOB_STATUS_RUNNING);
 
     s->should_converge = true;
     job_enter(job);
-    assert(job->status == JOB_STATUS_READY);
+    assert(job_get_status(job) == JOB_STATUS_READY);
 
+    job_lock();
     job_complete_locked(job, &error_abort);
+    job_unlock();
     job_enter(job);
     while (!job->deferred_to_main_loop) {
         aio_poll(qemu_get_aio_context(), true);
     }
-    assert(job->status == JOB_STATUS_READY);
+    assert(job_get_status(job) == JOB_STATUS_READY);
     aio_poll(qemu_get_aio_context(), true);
-    assert(job->status == JOB_STATUS_PENDING);
+    assert(job_get_status(job) == JOB_STATUS_PENDING);
 
     aio_context_acquire(job->aio_context);
+    job_lock();
     job_finalize_locked(job, &error_abort);
+    job_unlock();
     aio_context_release(job->aio_context);
-    assert(job->status == JOB_STATUS_CONCLUDED);
+    assert(job_get_status(job) == JOB_STATUS_CONCLUDED);
 
     cancel_common(s);
 }
@@ -459,22 +474,23 @@ static void test_complete_in_standby(void)
     bjob = mk_job(blk, "job", &test_yielding_driver, true,
                   JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
     job = &bjob->job;
-    assert(job->status == JOB_STATUS_CREATED);
+    assert(job_get_status(job) == JOB_STATUS_CREATED);
 
     /* Wait for the job to become READY */
     job_start(job);
     aio_context_acquire(ctx);
-    AIO_WAIT_WHILE(ctx, job->status != JOB_STATUS_READY);
+    AIO_WAIT_WHILE(ctx, job_get_status(job) != JOB_STATUS_READY);
     aio_context_release(ctx);
 
     /* Begin the drained section, pausing the job */
     bdrv_drain_all_begin();
-    assert(job->status == JOB_STATUS_STANDBY);
+    assert(job_get_status(job) == JOB_STATUS_STANDBY);
     /* Lock the IO thread to prevent the job from being run */
     aio_context_acquire(ctx);
     /* This will schedule the job to resume it */
     bdrv_drain_all_end();
 
+    job_lock();
     /* But the job cannot run, so it will remain on standby */
     assert(job->status == JOB_STATUS_STANDBY);
 
@@ -489,6 +505,7 @@ static void test_complete_in_standby(void)
     assert(job->status == JOB_STATUS_CONCLUDED);
 
     job_dismiss_locked(&job, &error_abort);
+    job_unlock();
 
     destroy_blk(blk);
     aio_context_release(ctx);
-- 
2.31.1


