Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41001492BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:57:33 +0100 (CET)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rnY-0005Vs-Bz
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUa-00064C-Ps
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUY-0005zx-6J
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIS+nEi2zL0K3rc9EeZsqcQV+p5qmb4EJ5SeDrUI3VU=;
 b=WegK+I8FlcSwm+DQwEql4QAsRiGaIbAXi8Lsv1ng99ikOaLn9ar99KAWA94KlvUi/2RJ94
 ymowuj5p07KUcVMsyknLhhD/WZv5lL96UZW4O2IToahAb+L+rnfWMG8DNvBF6lhu96Rfci
 ILlRitQ/jN8rWgmpzS6ESFZ+Ux/zNDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-UDJw0UwdMaq-ODb60sCRmQ-1; Tue, 18 Jan 2022 11:37:52 -0500
X-MC-Unique: UDJw0UwdMaq-ODb60sCRmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF57C1856EE1;
 Tue, 18 Jan 2022 16:28:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D79934D44;
 Tue, 18 Jan 2022 16:28:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 09/12] jobs: ensure sleep in job_sleep_ns is fully performed
Date: Tue, 18 Jan 2022 11:27:35 -0500
Message-Id: <20220118162738.1366281-10-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a drain happens while a job is sleeping, the timeout
gets cancelled and the job continues once the drain ends.
This is especially bad for the sleep performed in commit and stream
jobs, since that is dictated by ratelimit to maintain a certain speed.

Basically the execution path is the followig:
1. job calls job_sleep_ns, and yield with a timer in @ns ns.
2. meanwhile, a drain is executed, and
   child_job_drained_{begin/end} could be executed as ->drained_begin()
   and ->drained_end() callbacks.
   Therefore child_job_drained_begin() enters the job, that continues
   execution in job_sleep_ns() and calls job_pause_point_locked().
3. job_pause_point_locked() detects that we are in the middle of a
   drain, and firstly deletes any existing timer and then yields again,
   waiting for ->drained_end().
4. Once draining is finished, child_job_drained_end() runs and resumes
   the job. At this point, the timer has been lost and we just resume
   without checking if enough time has passed.

This fix implies that from now onwards, job_sleep_ns will force the job
to sleep @ns, even if it is wake up (purposefully or not) in the middle
of the sleep. Therefore qemu-iotests test might run a little bit slower,
depending on the speed of the job. Setting a job speed to values like "1"
is not allowed anymore (unless you want to wait forever).

Because of this fix, test_stream_parallel() in tests/qemu-iotests/030
takes too long, since speed of stream job is just 1024 and before
it was skipping all the wait thanks to the drains. Increase the
speed to 256 * 1024. Exactly the same happens for test 151.

Instead we need to sleep less in test_cancel_ready() test-blockjob.c,
so that the job will be able to exit the sleep and transition to ready
before the main loop asserts.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c                      | 28 +++++++++++++++++-----------
 tests/qemu-iotests/030     |  2 +-
 tests/qemu-iotests/151     |  4 ++--
 tests/unit/test-blockjob.c |  2 +-
 4 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/job.c b/job.c
index 83921dd79b..6ef2adead4 100644
--- a/job.c
+++ b/job.c
@@ -584,17 +584,15 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
     assert(job->busy);
 }
 
-void coroutine_fn job_pause_point(Job *job)
+/* Called with job_mutex held, but releases it temporarly. */
+static void coroutine_fn job_pause_point_locked(Job *job)
 {
     assert(job && job_started(job));
 
-    job_lock();
     if (!job_should_pause_locked(job)) {
-        job_unlock();
         return;
     }
     if (job_is_cancelled_locked(job)) {
-        job_unlock();
         return;
     }
 
@@ -614,13 +612,20 @@ void coroutine_fn job_pause_point(Job *job)
         job->paused = false;
         job_state_transition_locked(job, status);
     }
-    job_unlock();
 
     if (job->driver->resume) {
+        job_unlock();
         job->driver->resume(job);
+        job_lock();
     }
 }
 
+void coroutine_fn job_pause_point(Job *job)
+{
+    JOB_LOCK_GUARD();
+    job_pause_point_locked(job);
+}
+
 void job_yield(Job *job)
 {
     WITH_JOB_LOCK_GUARD() {
@@ -641,21 +646,22 @@ void job_yield(Job *job)
 
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
 {
-    WITH_JOB_LOCK_GUARD() {
-        assert(job->busy);
+    int64_t end_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns;
+    JOB_LOCK_GUARD();
+    assert(job->busy);
 
+    do {
         /* Check cancellation *before* setting busy = false, too!  */
         if (job_is_cancelled_locked(job)) {
             return;
         }
 
         if (!job_should_pause_locked(job)) {
-            job_do_yield_locked(job,
-                                qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
+            job_do_yield_locked(job, end_ns);
         }
-    }
 
-    job_pause_point(job);
+        job_pause_point_locked(job);
+    } while (qemu_clock_get_ns(QEMU_CLOCK_REALTIME) < end_ns);
 }
 
 /* Assumes the job_mutex is held */
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 567bf1da67..969b246d0f 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -248,7 +248,7 @@ class TestParallelOps(iotests.QMPTestCase):
             pending_jobs.append(job_id)
             result = self.vm.qmp('block-stream', device=node_name,
                                  job_id=job_id, bottom=f'node{i-1}',
-                                 speed=1024)
+                                 speed=256*1024)
             self.assert_qmp(result, 'return', {})
 
         # Do this in reverse: After unthrottling them, some jobs may finish
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 93d14193d0..5998beb5c4 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -129,7 +129,7 @@ class TestActiveMirror(iotests.QMPTestCase):
                              sync='full',
                              copy_mode='write-blocking',
                              buf_size=(1048576 // 4),
-                             speed=1)
+                             speed=1024*1024)
         self.assert_qmp(result, 'return', {})
 
         # Start an unaligned request to a dirty area
@@ -154,7 +154,7 @@ class TestActiveMirror(iotests.QMPTestCase):
                              target='target-node',
                              sync='full',
                              copy_mode='write-blocking',
-                             speed=1)
+                             speed=1024*1024)
 
         self.vm.hmp_qemu_io('source', 'break write_aio A')
         self.vm.hmp_qemu_io('source', 'aio_write 0 1M')  # 1
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index c926db7b5d..0b3010b94d 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -184,7 +184,7 @@ static int coroutine_fn cancel_job_run(Job *job, Error **errp)
             job_transition_to_ready(&s->common.job);
         }
 
-        job_sleep_ns(&s->common.job, 100000);
+        job_sleep_ns(&s->common.job, 100);
     }
 
     return 0;
-- 
2.31.1


