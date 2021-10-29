Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88184400A6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:54:07 +0200 (CEST)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV8o-0003Yv-Ms
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvC-0006m7-Bl
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv2-0003WU-Et
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ej4w4id2oIvNpWP8bETfoA2U8uTAohXxo7FV0unjmOE=;
 b=cvHeNTvUwKz9r+4WrkfjNcnNwA4McMykUT23j7Yj/Ig0d5ywe9dNypBFqfM3cf4wU9M32y
 0U0O4NzOPQfEKNiC5caEIlfqAWCm4C38eNmpdE1so+tiM4bTQg0noryoqgPRappokd32Ah
 tBOTqMqYgkTSCwWb/yBlX7JfQoUR7B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-JAwvG79UMCOE1M6WZZxBbw-1; Fri, 29 Oct 2021 12:39:44 -0400
X-MC-Unique: JAwvG79UMCOE1M6WZZxBbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D711D362F9;
 Fri, 29 Oct 2021 16:39:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E751569117;
 Fri, 29 Oct 2021 16:39:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 07/15] job-driver.h: add helper functions
Date: Fri, 29 Oct 2021 12:39:06 -0400
Message-Id: <20211029163914.4044794-8-eesposit@redhat.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

These functions will be useful when job_lock is globally applied,
as they will allow drivers to access the job struct fields
without worrying about the job lock.

Now that we are done with the job API header split, update also
the comments in blockjob.c (and move them in job.c).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job-driver.h |  21 +++++++
 blockjob.c                |  20 -------
 job.c                     | 116 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 135 insertions(+), 22 deletions(-)

diff --git a/include/qemu/job-driver.h b/include/qemu/job-driver.h
index 1efd196da8..19ae5ce8f0 100644
--- a/include/qemu/job-driver.h
+++ b/include/qemu/job-driver.h
@@ -149,4 +149,25 @@ void job_early_fail(Job *job);
 /** Moves the @job from RUNNING to READY */
 void job_transition_to_ready(Job *job);
 
+/** Enters the @job if it is not paused */
+void job_enter_not_paused(Job *job);
+
+/** returns @job->ret */
+bool job_has_failed(Job *job);
+
+/** Returns the @job->status */
+JobStatus job_get_status(Job *job);
+
+/** Returns the @job->pause_count */
+int job_get_pause_count(Job *job);
+
+/** Returns @job->paused */
+bool job_get_paused(Job *job);
+
+/** Returns @job->busy */
+bool job_get_busy(Job *job);
+
+/** Return true if @job not paused and not cancelled */
+bool job_not_paused_nor_cancelled(Job *job);
+
 #endif /* JOB_DRIVER_H */
diff --git a/blockjob.c b/blockjob.c
index 4982f6a2b5..53c1e9c406 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -36,21 +36,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 
-/*
- * The block job API is composed of two categories of functions.
- *
- * The first includes functions used by the monitor.  The monitor is
- * peculiar in that it accesses the block job list with block_job_get, and
- * therefore needs consistency across block_job_get and the actual operation
- * (e.g. block_job_set_speed).  The consistency is achieved with
- * aio_context_acquire/release.  These functions are declared in blockjob.h.
- *
- * The second includes functions used by the block job drivers and sometimes
- * by the core block layer.  These do not care about locking, because the
- * whole coroutine runs under the AioContext lock, and are declared in
- * blockjob_int.h.
- */
-
 static bool is_block_job(Job *job)
 {
     return job_type(job) == JOB_TYPE_BACKUP ||
@@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n, void *opaque)
 }
 
 
-/*
- * API for block job drivers and the block layer.  These functions are
- * declared in blockjob_int.h.
- */
-
 void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        JobTxn *txn, BlockDriverState *bs, uint64_t perm,
                        uint64_t shared_perm, int64_t speed, int flags,
diff --git a/job.c b/job.c
index b66d59b746..db7ad79745 100644
--- a/job.c
+++ b/job.c
@@ -32,6 +32,23 @@
 #include "trace/trace-root.h"
 #include "qapi/qapi-events-job.h"
 
+/*
+ * The job API is composed of two categories of functions.
+ *
+ * The first includes functions used by the monitor.  The monitor is
+ * peculiar in that it accesses the block job list with job_get, and
+ * therefore needs consistency across job_get and the actual operation
+ * (e.g. job_user_cancel). To achieve this consistency, the caller
+ * calls job_lock/job_unlock itself around the whole operation.
+ * These functions are declared in job-monitor.h.
+ *
+ *
+ * The second includes functions used by the block job drivers and sometimes
+ * by the core block layer. These delegate the locking to the callee instead,
+ * and are declared in job-driver.h.
+ */
+
+
 /* job_mutex protects the jobs list, but also makes the job API thread-safe. */
 static QemuMutex job_mutex;
 
@@ -213,18 +230,94 @@ const char *job_type_str(const Job *job)
     return JobType_str(job_type(job));
 }
 
-bool job_is_cancelled(Job *job)
+JobStatus job_get_status(Job *job)
+{
+    JobStatus status;
+    job_lock();
+    status = job->status;
+    job_unlock();
+    return status;
+}
+
+int job_get_pause_count(Job *job)
+{
+    int ret;
+    job_lock();
+    ret = job->pause_count;
+    job_unlock();
+    return ret;
+}
+
+bool job_get_paused(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job->paused;
+    job_unlock();
+    return ret;
+}
+
+bool job_get_busy(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job->busy;
+    job_unlock();
+    return ret;
+}
+
+bool job_has_failed(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job->ret < 0;
+    job_unlock();
+    return ret;
+}
+
+/* Called with job_mutex held. */
+static bool job_is_cancelled_locked(Job *job)
 {
     /* force_cancel may be true only if cancelled is true, too */
     assert(job->cancelled || !job->force_cancel);
     return job->force_cancel;
 }
 
-bool job_cancel_requested(Job *job)
+/* Called with job_mutex *not* held. */
+bool job_is_cancelled(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job_is_cancelled_locked(job);
+    job_unlock();
+    return ret;
+}
+
+bool job_not_paused_nor_cancelled(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = !job->paused && !job_is_cancelled_locked(job);
+    job_unlock();
+    return ret;
+}
+
+/* Called with job_mutex held. */
+static bool job_cancel_requested_locked(Job *job)
 {
     return job->cancelled;
 }
 
+/* Called with job_mutex *not* held. */
+bool job_cancel_requested(Job *job)
+{
+    bool ret;
+    job_lock();
+    ret = job_cancel_requested_locked(job);
+    job_unlock();
+    return ret;
+}
+
 /* Called with job_mutex held. */
 bool job_is_ready_locked(Job *job)
 {
@@ -280,6 +373,16 @@ bool job_is_completed(Job *job)
     return false;
 }
 
+/* Called with job_mutex lock *not* held */
+static bool job_is_completed_unlocked(Job *job)
+{
+    bool res;
+    job_lock();
+    res = job_is_completed(job);
+    job_unlock();
+    return res;
+}
+
 static bool job_started(Job *job)
 {
     return job->co;
@@ -579,6 +682,15 @@ void job_pause(Job *job)
     }
 }
 
+void job_enter_not_paused(Job *job)
+{
+    job_lock();
+    if (!job->paused) {
+        job_enter_cond(job, NULL);
+    }
+    job_unlock();
+}
+
 void job_resume(Job *job)
 {
     assert(job->pause_count > 0);
-- 
2.27.0


