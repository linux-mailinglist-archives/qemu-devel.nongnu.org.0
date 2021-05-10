Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D272377EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:04:12 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1pj-0007lN-CO
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1lo-0003iG-8I
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1ll-0005nH-G8
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5A3PWmvRr078VtKbQJIPm7JEvimpSh2QCeF5BIEr6Y=;
 b=GbohMu0lc1XtWovV3pO9tpA+hGiVIdI90X46L/Qd5hp5NRHV2XOOzlxdsTAPGdL/2tA5Go
 0qNmkwNFVUX2pRsHIbvh70aco7zHXHBluFeH3d+9J0LFYlsMonP5WawJYtCpG7kIR0H9JH
 Gtv2y45EMQUxnh8XFpG11p9bLY4koUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-d2Z0R5AUPcWEvtcqby3b0w-1; Mon, 10 May 2021 04:59:59 -0400
X-MC-Unique: d2Z0R5AUPcWEvtcqby3b0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D590B800D62;
 Mon, 10 May 2021 08:59:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99C726267D;
 Mon, 10 May 2021 08:59:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/6] progressmeter: protect with a mutex
Date: Mon, 10 May 2021 10:59:39 +0200
Message-Id: <20210510085941.22769-5-eesposit@redhat.com>
In-Reply-To: <20210510085941.22769-1-eesposit@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The simplest thing to do is to add a mutex to be able to provide
an accurate snapshot of the progress values to the caller.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c                    | 33 +++++++++++++++++++++++++--------
 include/qemu/progress_meter.h | 31 +++++++++++++++++++++++++++++++
 job-qmp.c                     |  8 ++++++--
 job.c                         |  3 +++
 qemu-img.c                    |  9 ++++++---
 5 files changed, 71 insertions(+), 13 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 046c1bcd66..98bb12f015 100644
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
index 9a23ff071c..81f79770d2 100644
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
@@ -37,21 +39,50 @@ typedef struct ProgressMeter {
 
     /** Estimated current value at the completion of the process */
     uint64_t total;
+
+    QemuMutex lock;
 } ProgressMeter;
 
+static inline void progress_init(ProgressMeter *pm)
+{
+    qemu_mutex_init(&pm->lock);
+}
+
+static inline void progress_destroy(ProgressMeter *pm)
+{
+    qemu_mutex_destroy(&pm->lock);
+}
+
+static inline void progress_get_snapshot(ProgressMeter *pm,
+                                         uint64_t *current, uint64_t *total)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+
+    if (current) {
+        *current = pm->current;
+    }
+
+    if (total) {
+        *total = pm->total;
+    }
+}
+
 static inline void progress_work_done(ProgressMeter *pm, uint64_t done)
 {
+    QEMU_LOCK_GUARD(&pm->lock);
     pm->current += done;
 }
 
 static inline void progress_set_remaining(ProgressMeter *pm, uint64_t remaining)
 {
+    QEMU_LOCK_GUARD(&pm->lock);
     pm->total = pm->current + remaining;
 }
 
 static inline void progress_increase_remaining(ProgressMeter *pm,
                                                uint64_t delta)
 {
+    QEMU_LOCK_GUARD(&pm->lock);
     pm->total += delta;
 }
 
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
index 4aff13d95a..00b0560052 100644
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
2.30.2


