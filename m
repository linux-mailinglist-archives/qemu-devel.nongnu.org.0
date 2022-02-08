Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC64AE08B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:18:48 +0100 (CET)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHV4h-0001O0-AX
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:18:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYb-0000SG-Vq
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYH-0002ei-QX
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ScGcYB9BhOfQXboStI0hGCZ92n6rkbvzVu2F1ND7Z0=;
 b=SLPx/R2XU+JUmoF1LFKfaexP94Vy3kMnmx0AfEzKxwCF7tlb7CbrPCXFz+Zl5us+sRKx3I
 7XRQRso1RRSznOKEj05U44YAxDDrHkiencu33bGrXkwTSRP3lXJvGCo5Natdi/2TvRhEQC
 LIQuAiqkuwzhy+n2uxsUDtjv9Bv2fzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-D7b9JGZQNZGoibbzlnwd4w-1; Tue, 08 Feb 2022 10:37:05 -0500
X-MC-Unique: D7b9JGZQNZGoibbzlnwd4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02ADD1091DA1;
 Tue,  8 Feb 2022 15:37:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EEAB7D473;
 Tue,  8 Feb 2022 15:37:03 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 6/6] jobs: ensure sleep in job_sleep_ns is fully performed
Date: Tue,  8 Feb 2022 10:36:55 -0500
Message-Id: <20220208153655.1251658-7-eesposit@redhat.com>
In-Reply-To: <20220208153655.1251658-1-eesposit@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Basically the execution path is the following:
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
 job.c                      | 19 +++++++++++--------
 tests/qemu-iotests/030     |  2 +-
 tests/qemu-iotests/151     |  4 ++--
 tests/unit/test-blockjob.c |  2 +-
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/job.c b/job.c
index c7a41d88d6..72d6c462ed 100644
--- a/job.c
+++ b/job.c
@@ -639,19 +639,22 @@ void job_yield(Job *job)
 
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns)
 {
+    int64_t end_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns;
     JOB_LOCK_GUARD();
     assert(job->busy);
 
-    /* Check cancellation *before* setting busy = false, too!  */
-    if (job_is_cancelled_locked(job)) {
-        return;
-    }
+    do {
+        /* Check cancellation *before* setting busy = false, too!  */
+        if (job_is_cancelled_locked(job)) {
+            return;
+        }
 
-    if (!job_should_pause_locked(job)) {
-        job_do_yield_locked(job, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + ns);
-    }
+        if (!job_should_pause_locked(job)) {
+            job_do_yield_locked(job, end_ns);
+        }
 
-    job_pause_point_locked(job);
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
index d6fc52f80a..81ebc7d154 100644
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


