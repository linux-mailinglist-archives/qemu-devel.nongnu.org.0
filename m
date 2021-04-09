Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9935A335
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:26:04 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtxL-00041i-7l
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnx-0007rj-PW
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnq-0003Pc-Oh
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7fEMgeVW9+T+3j6ePfNv+7W9IpovBjHExMzjPaNj4g=;
 b=isUioF4E65irCV7rq49t7QeSavJwAOHHbLctokWFp3XwrmudjMQfAbHPK9kTZA2DtNrMch
 IgjYzepTHkCkMvzdn2YsdNLzEF7/aXHks3rtC45BV6fif42OxdahDG2kt6U1Tl9LC72POd
 TlBqt0TFwQbqo5m3tQn0a8yRyfHWkLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-N0dk7AR2MtiqsuOsz2Udgw-1; Fri, 09 Apr 2021 12:16:11 -0400
X-MC-Unique: N0dk7AR2MtiqsuOsz2Udgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8460087A826;
 Fri,  9 Apr 2021 16:16:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9036A5D6A1;
 Fri,  9 Apr 2021 16:16:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/10] test-blockjob: Test job_wait_unpaused()
Date: Fri,  9 Apr 2021 18:15:48 +0200
Message-Id: <20210409161548.341297-11-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Create a job that remains on STANDBY after a drained section, and see
that invoking job_wait_unpaused() will get it unstuck.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210409120422.144040-5-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-blockjob.c | 121 +++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index 7519847912..dcacfa6c7c 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -16,6 +16,7 @@
 #include "block/blockjob_int.h"
 #include "sysemu/block-backend.h"
 #include "qapi/qmp/qdict.h"
+#include "iothread.h"
 
 static const BlockJobDriver test_block_job_driver = {
     .job_driver = {
@@ -375,6 +376,125 @@ static void test_cancel_concluded(void)
     cancel_common(s);
 }
 
+/* (See test_yielding_driver for the job description) */
+typedef struct YieldingJob {
+    BlockJob common;
+    bool should_complete;
+} YieldingJob;
+
+static void yielding_job_complete(Job *job, Error **errp)
+{
+    YieldingJob *s = container_of(job, YieldingJob, common.job);
+    s->should_complete = true;
+    job_enter(job);
+}
+
+static int coroutine_fn yielding_job_run(Job *job, Error **errp)
+{
+    YieldingJob *s = container_of(job, YieldingJob, common.job);
+
+    job_transition_to_ready(job);
+
+    while (!s->should_complete) {
+        job_yield(job);
+    }
+
+    return 0;
+}
+
+/*
+ * This job transitions immediately to the READY state, and then
+ * yields until it is to complete.
+ */
+static const BlockJobDriver test_yielding_driver = {
+    .job_driver = {
+        .instance_size  = sizeof(YieldingJob),
+        .free           = block_job_free,
+        .user_resume    = block_job_user_resume,
+        .run            = yielding_job_run,
+        .complete       = yielding_job_complete,
+    },
+};
+
+/*
+ * Test that job_complete() works even on jobs that are in a paused
+ * state (i.e., STANDBY).
+ *
+ * To do this, run YieldingJob in an IO thread, get it into the READY
+ * state, then have a drained section.  Before ending the section,
+ * acquire the context so the job will not be entered and will thus
+ * remain on STANDBY.
+ *
+ * job_complete() should still work without error.
+ *
+ * Note that on the QMP interface, it is impossible to lock an IO
+ * thread before a drained section ends.  In practice, the
+ * bdrv_drain_all_end() and the aio_context_acquire() will be
+ * reversed.  However, that makes for worse reproducibility here:
+ * Sometimes, the job would no longer be in STANDBY then but already
+ * be started.  We cannot prevent that, because the IO thread runs
+ * concurrently.  We can only prevent it by taking the lock before
+ * ending the drained section, so we do that.
+ *
+ * (You can reverse the order of operations and most of the time the
+ * test will pass, but sometimes the assert(status == STANDBY) will
+ * fail.)
+ */
+static void test_complete_in_standby(void)
+{
+    BlockBackend *blk;
+    IOThread *iothread;
+    AioContext *ctx;
+    Job *job;
+    BlockJob *bjob;
+
+    /* Create a test drive, move it to an IO thread */
+    blk = create_blk(NULL);
+    iothread = iothread_new();
+
+    ctx = iothread_get_aio_context(iothread);
+    blk_set_aio_context(blk, ctx, &error_abort);
+
+    /* Create our test job */
+    bjob = mk_job(blk, "job", &test_yielding_driver, true,
+                  JOB_MANUAL_FINALIZE | JOB_MANUAL_DISMISS);
+    job = &bjob->job;
+    assert(job->status == JOB_STATUS_CREATED);
+
+    /* Wait for the job to become READY */
+    job_start(job);
+    aio_context_acquire(ctx);
+    AIO_WAIT_WHILE(ctx, job->status != JOB_STATUS_READY);
+    aio_context_release(ctx);
+
+    /* Begin the drained section, pausing the job */
+    bdrv_drain_all_begin();
+    assert(job->status == JOB_STATUS_STANDBY);
+    /* Lock the IO thread to prevent the job from being run */
+    aio_context_acquire(ctx);
+    /* This will schedule the job to resume it */
+    bdrv_drain_all_end();
+
+    /* But the job cannot run, so it will remain on standby */
+    assert(job->status == JOB_STATUS_STANDBY);
+
+    /* Even though the job is on standby, this should work */
+    job_complete(job, &error_abort);
+
+    /* The test is done now, clean up. */
+    job_finish_sync(job, NULL, &error_abort);
+    assert(job->status == JOB_STATUS_PENDING);
+
+    job_finalize(job, &error_abort);
+    assert(job->status == JOB_STATUS_CONCLUDED);
+
+    job_dismiss(&job, &error_abort);
+
+    destroy_blk(blk);
+    aio_context_release(ctx);
+    iothread_join(iothread);
+}
+
 int main(int argc, char **argv)
 {
     qemu_init_main_loop(&error_abort);
@@ -389,5 +509,6 @@ int main(int argc, char **argv)
     g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
     g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
     g_test_add_func("/blockjob/cancel/concluded", test_cancel_concluded);
+    g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
     return g_test_run();
 }
-- 
2.30.2


