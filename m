Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84154E26E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 15:48:50 +0200 (CEST)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1prd-0006mf-FS
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 09:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o1pOb-0005Dk-OV
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o1pOX-0007Xm-Au
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 09:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655385523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fR1wNIm3JnaBcnck6/VSRFk9/wPlAr+hazoXnH7Eh08=;
 b=V2hV1+AKVmqGD6bhMwtRDn3XaYwB7EUJ0RdiEX+wFkNTArijSR3siaL6PY6H0tq5rOpSJU
 H4gJwIioC23XcEeyEotW+fFGX2Zdolgcb40SpYTFi3Bv4ESXdcDu+nKOhHMuuTRv/Irk62
 poSmdqSDH4+VMyy/Q1WMsTfgF7tPAC8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-4Nmg8pBvM-K6V0wTZp57Xw-1; Thu, 16 Jun 2022 09:18:39 -0400
X-MC-Unique: 4Nmg8pBvM-K6V0wTZp57Xw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 437DF101E988;
 Thu, 16 Jun 2022 13:18:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3A9F40334E;
 Thu, 16 Jun 2022 13:18:38 +0000 (UTC)
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
Subject: [PATCH v7 05/18] job.h: add _locked duplicates for job API functions
 called with and without job_mutex
Date: Thu, 16 Jun 2022 09:18:22 -0400
Message-Id: <20220616131835.2004262-6-eesposit@redhat.com>
In-Reply-To: <20220616131835.2004262-1-eesposit@redhat.com>
References: <20220616131835.2004262-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In preparation to the job_lock/unlock usage, create _locked
duplicates of some functions, since they will be sometimes called with
job_mutex held (mostly within job.c),
and sometimes without (mostly from JobDrivers using the job API).

Therefore create a _locked version of such function, so that it
can be used in both cases.

List of functions duplicated as _locked:
job_is_ready (both versions are public)
job_is_completed (both versions are public)
job_is_cancelled (_locked version is public, needed by mirror.c)
job_pause_point (_locked version is static, purely done to simplify the code)
job_cancel_requested (_locked version is static)

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 25 +++++++++++++++++++++---
 job.c              | 48 ++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 4b64eb15f7..275d593715 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -475,21 +475,40 @@ const char *job_type_str(const Job *job);
 /** Returns true if the job should not be visible to the management layer. */
 bool job_is_internal(Job *job);
 
-/** Returns whether the job is being cancelled. */
+/**
+ * Returns whether the job is being cancelled.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_cancelled(Job *job);
 
+/** Just like job_is_cancelled, but called between job_lock and job_unlock */
+bool job_is_cancelled_locked(Job *job);
+
 /**
  * Returns whether the job is scheduled for cancellation (at an
  * indefinite point).
+ * Called with job_mutex *not* held.
  */
 bool job_cancel_requested(Job *job);
 
-/** Returns whether the job is in a completed state. */
+/**
+ * Returns whether the job is in a completed state.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_completed(Job *job);
 
-/** Returns whether the job is ready to be completed. */
+/** Just like job_is_completed, but called between job_lock and job_unlock */
+bool job_is_completed_locked(Job *job);
+
+/**
+ * Returns whether the job is ready to be completed.
+ * Called with job_mutex *not* held.
+ */
 bool job_is_ready(Job *job);
 
+/** Just like job_is_ready, but called between job_lock and job_unlock */
+bool job_is_ready_locked(Job *job);
+
 /**
  * Request @job to pause at the next pause point. Must be paired with
  * job_resume(). If the job is supposed to be resumed by user action, call
diff --git a/job.c b/job.c
index cafd597ba4..c4776985c4 100644
--- a/job.c
+++ b/job.c
@@ -236,19 +236,32 @@ const char *job_type_str(const Job *job)
     return JobType_str(job_type(job));
 }
 
-bool job_is_cancelled(Job *job)
+bool job_is_cancelled_locked(Job *job)
 {
     /* force_cancel may be true only if cancelled is true, too */
     assert(job->cancelled || !job->force_cancel);
     return job->force_cancel;
 }
 
-bool job_cancel_requested(Job *job)
+bool job_is_cancelled(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_cancelled_locked(job);
+}
+
+/* Called with job_mutex held. */
+static bool job_cancel_requested_locked(Job *job)
 {
     return job->cancelled;
 }
 
-bool job_is_ready(Job *job)
+bool job_cancel_requested(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_cancel_requested_locked(job);
+}
+
+bool job_is_ready_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -270,7 +283,13 @@ bool job_is_ready(Job *job)
     return false;
 }
 
-bool job_is_completed(Job *job)
+bool job_is_ready(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_ready_locked(job);
+}
+
+bool job_is_completed_locked(Job *job)
 {
     switch (job->status) {
     case JOB_STATUS_UNDEFINED:
@@ -292,6 +311,12 @@ bool job_is_completed(Job *job)
     return false;
 }
 
+bool job_is_completed(Job *job)
+{
+    JOB_LOCK_GUARD();
+    return job_is_completed_locked(job);
+}
+
 static bool job_started(Job *job)
 {
     return job->co;
@@ -521,7 +546,8 @@ static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
     assert(job->busy);
 }
 
-void coroutine_fn job_pause_point(Job *job)
+/* Called with job_mutex held, but releases it temporarily. */
+static void coroutine_fn job_pause_point_locked(Job *job)
 {
     assert(job && job_started(job));
 
@@ -552,6 +578,12 @@ void coroutine_fn job_pause_point(Job *job)
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
     assert(job->busy);
@@ -949,11 +981,15 @@ static void job_completed(Job *job)
     }
 }
 
-/** Useful only as a type shim for aio_bh_schedule_oneshot. */
+/**
+ * Useful only as a type shim for aio_bh_schedule_oneshot.
+ * Called with job_mutex *not* held.
+ */
 static void job_exit(void *opaque)
 {
     Job *job = (Job *)opaque;
     AioContext *ctx;
+    JOB_LOCK_GUARD();
 
     job_ref(job);
     aio_context_acquire(job->aio_context);
-- 
2.31.1


