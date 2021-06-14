Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02633A5E3E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:18:32 +0200 (CEST)
Received: from localhost ([::1]:49342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshnj-0003y7-SB
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhL-00023O-RX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshhI-0000V5-KJ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5h8obBUwkbowRvrbRyioEvWf7sFSHOHr5u+oUJjy+A=;
 b=APRrmQKlj0OkdqXWSWMZFKwQb7/T7Rd6APYaw+hq7pAAaHGJ5jdcaCl+Dc1Se8tK71xdYC
 ndfnts4eut81zUjLpmQp2o2t7rmaZrV9vBRb/qq4AwX41fEm3PAmt69rVcPPslP7XOyOcS
 Nb6gQ2EIK39ota58QsvspJAd7UusE4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-kdNnAyyrMrubVbfrg5m9RQ-1; Mon, 14 Jun 2021 04:11:48 -0400
X-MC-Unique: kdNnAyyrMrubVbfrg5m9RQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35473A0CD9;
 Mon, 14 Jun 2021 08:11:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E360C5D6A8;
 Mon, 14 Jun 2021 08:11:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 4/5] progressmeter: protect with a mutex
Date: Mon, 14 Jun 2021 10:11:29 +0200
Message-Id: <20210614081130.22134-5-eesposit@redhat.com>
In-Reply-To: <20210614081130.22134-1-eesposit@redhat.com>
References: <20210614081130.22134-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Progressmeter is protected by the AioContext mutex, which
is taken by the block jobs and their caller (like blockdev).

We would like to remove the dependency of block layer code on the
AioContext mutex, since most drivers and the core I/O code are already
not relying on it.

Create a new C file to implement the ProgressMeter API, but keep the
struct as public, to avoid forcing allocation on the heap.

Also add a mutex to be able to provide an accurate snapshot of the
progress values to the caller.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/meson.build             |  1 +
 block/progress_meter.c        | 64 +++++++++++++++++++++++++++++++++++
 blockjob.c                    | 33 +++++++++++++-----
 include/qemu/progress_meter.h | 34 +++++++++++--------
 job-qmp.c                     |  8 +++--
 job.c                         |  3 ++
 qemu-img.c                    |  9 +++--
 7 files changed, 124 insertions(+), 28 deletions(-)
 create mode 100644 block/progress_meter.c

diff --git a/block/meson.build b/block/meson.build
index 01861e1545..ef1ba3d973 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -13,6 +13,7 @@ block_ss.add(files(
   'commit.c',
   'copy-on-read.c',
   'preallocate.c',
+  'progress_meter.c',
   'create.c',
   'crypto.c',
   'dirty-bitmap.c',
diff --git a/block/progress_meter.c b/block/progress_meter.c
new file mode 100644
index 0000000000..aa2e60248c
--- /dev/null
+++ b/block/progress_meter.c
@@ -0,0 +1,64 @@
+/*
+ * Helper functionality for some process progress tracking.
+ *
+ * Copyright (c) 2011 IBM Corp.
+ * Copyright (c) 2012, 2018 Red Hat, Inc.
+ * Copyright (c) 2020 Virtuozzo International GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "qemu/progress_meter.h"
+
+void progress_init(ProgressMeter *pm)
+{
+    qemu_mutex_init(&pm->lock);
+}
+
+void progress_destroy(ProgressMeter *pm)
+{
+    qemu_mutex_destroy(&pm->lock);
+}
+
+void progress_get_snapshot(ProgressMeter *pm, uint64_t *current,
+                           uint64_t *total)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+
+    *current = pm->current;
+    *total = pm->total;
+}
+
+void progress_work_done(ProgressMeter *pm, uint64_t done)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+    pm->current += done;
+}
+
+void progress_set_remaining(ProgressMeter *pm, uint64_t remaining)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+    pm->total = pm->current + remaining;
+}
+
+void progress_increase_remaining(ProgressMeter *pm, uint64_t delta)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+    pm->total += delta;
+}
diff --git a/blockjob.c b/blockjob.c
index 22e5bb9b1f..4bad1408cb 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -306,18 +306,23 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
 {
     BlockJobInfo *info;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         error_setg(errp, "Cannot query QEMU internal jobs");
         return NULL;
     }
+
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     info = g_new0(BlockJobInfo, 1);
     info->type      = g_strdup(job_type_str(&job->job));
     info->device    = g_strdup(job->job.id);
     info->busy      = qatomic_read(&job->job.busy);
     info->paused    = job->job.pause_count > 0;
-    info->offset    = job->job.progress.current;
-    info->len       = job->job.progress.total;
+    info->offset    = progress_current;
+    info->len       = progress_total;
     info->speed     = job->speed;
     info->io_status = job->iostatus;
     info->ready     = job_is_ready(&job->job),
@@ -344,15 +349,19 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
 static void block_job_event_cancelled(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         return;
     }
 
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     qapi_event_send_block_job_cancelled(job_type(&job->job),
                                         job->job.id,
-                                        job->job.progress.total,
-                                        job->job.progress.current,
+                                        progress_total,
+                                        progress_current,
                                         job->speed);
 }
 
@@ -360,6 +369,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     const char *msg = NULL;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         return;
@@ -369,10 +379,13 @@ static void block_job_event_completed(Notifier *n, void *opaque)
         msg = error_get_pretty(job->job.err);
     }
 
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     qapi_event_send_block_job_completed(job_type(&job->job),
                                         job->job.id,
-                                        job->job.progress.total,
-                                        job->job.progress.current,
+                                        progress_total,
+                                        progress_current,
                                         job->speed,
                                         !!msg,
                                         msg);
@@ -393,15 +406,19 @@ static void block_job_event_pending(Notifier *n, void *opaque)
 static void block_job_event_ready(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         return;
     }
 
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     qapi_event_send_block_job_ready(job_type(&job->job),
                                     job->job.id,
-                                    job->job.progress.total,
-                                    job->job.progress.current,
+                                    progress_total,
+                                    progress_current,
                                     job->speed);
 }
 
diff --git a/include/qemu/progress_meter.h b/include/qemu/progress_meter.h
index 9a23ff071c..dadf822bbf 100644
--- a/include/qemu/progress_meter.h
+++ b/include/qemu/progress_meter.h
@@ -27,6 +27,8 @@
 #ifndef QEMU_PROGRESS_METER_H
 #define QEMU_PROGRESS_METER_H
 
+#include "qemu/lockable.h"
+
 typedef struct ProgressMeter {
     /**
      * Current progress. The unit is arbitrary as long as the ratio between
@@ -37,22 +39,24 @@ typedef struct ProgressMeter {
 
     /** Estimated current value at the completion of the process */
     uint64_t total;
+
+    QemuMutex lock; /* protects concurrent access to above fields */
 } ProgressMeter;
 
-static inline void progress_work_done(ProgressMeter *pm, uint64_t done)
-{
-    pm->current += done;
-}
-
-static inline void progress_set_remaining(ProgressMeter *pm, uint64_t remaining)
-{
-    pm->total = pm->current + remaining;
-}
-
-static inline void progress_increase_remaining(ProgressMeter *pm,
-                                               uint64_t delta)
-{
-    pm->total += delta;
-}
+void progress_init(ProgressMeter *pm);
+void progress_destroy(ProgressMeter *pm);
+
+/* Get a snapshot of internal current and total values  */
+void progress_get_snapshot(ProgressMeter *pm, uint64_t *current,
+                           uint64_t *total);
+
+/* Increases the amount of work done so far by @done */
+void progress_work_done(ProgressMeter *pm, uint64_t done);
+
+/* Sets how much work has to be done to complete to @remaining */
+void progress_set_remaining(ProgressMeter *pm, uint64_t remaining);
+
+/* Increases the total work to do by @delta */
+void progress_increase_remaining(ProgressMeter *pm, uint64_t delta);
 
 #endif /* QEMU_PROGRESS_METER_H */
diff --git a/job-qmp.c b/job-qmp.c
index 34c4da094f..829a28aa70 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -144,16 +144,20 @@ void qmp_job_dismiss(const char *id, Error **errp)
 static JobInfo *job_query_single(Job *job, Error **errp)
 {
     JobInfo *info;
+    uint64_t progress_current;
+    uint64_t progress_total;
 
     assert(!job_is_internal(job));
+    progress_get_snapshot(&job->progress, &progress_current,
+                          &progress_total);
 
     info = g_new(JobInfo, 1);
     *info = (JobInfo) {
         .id                 = g_strdup(job->id),
         .type               = job_type(job),
         .status             = job->status,
-        .current_progress   = job->progress.current,
-        .total_progress     = job->progress.total,
+        .current_progress   = progress_current,
+        .total_progress     = progress_total,
         .has_error          = !!job->err,
         .error              = job->err ? \
                               g_strdup(error_get_pretty(job->err)) : NULL,
diff --git a/job.c b/job.c
index 8775c1803b..e7a5d28854 100644
--- a/job.c
+++ b/job.c
@@ -339,6 +339,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     job->cb            = cb;
     job->opaque        = opaque;
 
+    progress_init(&job->progress);
+
     notifier_list_init(&job->on_finalize_cancelled);
     notifier_list_init(&job->on_finalize_completed);
     notifier_list_init(&job->on_pending);
@@ -382,6 +384,7 @@ void job_unref(Job *job)
 
         QLIST_REMOVE(job, job_list);
 
+        progress_destroy(&job->progress);
         error_free(job->err);
         g_free(job->id);
         g_free(job);
diff --git a/qemu-img.c b/qemu-img.c
index a5993682aa..7956a89965 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -900,6 +900,7 @@ static void common_block_job_cb(void *opaque, int ret)
 
 static void run_block_job(BlockJob *job, Error **errp)
 {
+    uint64_t progress_current, progress_total;
     AioContext *aio_context = blk_get_aio_context(job->blk);
     int ret = 0;
 
@@ -908,9 +909,11 @@ static void run_block_job(BlockJob *job, Error **errp)
     do {
         float progress = 0.0f;
         aio_poll(aio_context, true);
-        if (job->job.progress.total) {
-            progress = (float)job->job.progress.current /
-                       job->job.progress.total * 100.f;
+
+        progress_get_snapshot(&job->job.progress, &progress_current,
+                              &progress_total);
+        if (progress_total) {
+            progress = (float)progress_current / progress_total * 100.f;
         }
         qemu_progress_print(progress, 0);
     } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
-- 
2.31.1


