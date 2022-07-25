Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976C657FA67
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 09:43:18 +0200 (CEST)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFskH-0000zG-MR
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 03:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFsgF-0003iz-5d
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFsgC-0003Cd-JR
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658734744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CX0JozOiowan0mYy3TlgKF8JCuNmamOAvf6f9rxg/Zs=;
 b=JG7fQDTzVTZ8ainA4ksUOPRqmu9KWwEi9jN2ZD08p2P5rhB1TkwDDVOFwP5/von3sTUu8Z
 UtAMooMWVaU/8u5O6ixb2UUNSiGpBuqyQwSc6VEN/Sw17CDHSLRVkKvhoRMTS244iJldM7
 gyKocTAzOGTdoUrsSTe+MbI6e5HBmtE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-OpycK9KJOK-Ck0niIeBrOw-1; Mon, 25 Jul 2022 03:39:00 -0400
X-MC-Unique: OpycK9KJOK-Ck0niIeBrOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EFE51C05144;
 Mon, 25 Jul 2022 07:39:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B84452166B26;
 Mon, 25 Jul 2022 07:38:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v10 02/21] job.h: categorize fields in struct Job
Date: Mon, 25 Jul 2022 03:38:36 -0400
Message-Id: <20220725073855.76049-3-eesposit@redhat.com>
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

Categorize the fields in struct Job to understand which ones
need to be protected by the job mutex and which don't.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/qemu/job.h | 61 +++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index d1192ffd61..876e13d549 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -40,27 +40,52 @@ typedef struct JobTxn JobTxn;
  * Long-running operation.
  */
 typedef struct Job {
+
+    /* Fields set at initialization (job_create), and never modified */
+
     /** The ID of the job. May be NULL for internal jobs. */
     char *id;
 
-    /** The type of this job. */
+    /**
+     * The type of this job.
+     * All callbacks are called with job_mutex *not* held.
+     */
     const JobDriver *driver;
 
-    /** Reference count of the block job */
-    int refcnt;
-
-    /** Current state; See @JobStatus for details. */
-    JobStatus status;
-
-    /** AioContext to run the job coroutine in */
-    AioContext *aio_context;
-
     /**
      * The coroutine that executes the job.  If not NULL, it is reentered when
      * busy is false and the job is cancelled.
+     * Initialized in job_start()
      */
     Coroutine *co;
 
+    /** True if this job should automatically finalize itself */
+    bool auto_finalize;
+
+    /** True if this job should automatically dismiss itself */
+    bool auto_dismiss;
+
+    /** The completion function that will be called when the job completes.  */
+    BlockCompletionFunc *cb;
+
+    /** The opaque value that is passed to the completion function.  */
+    void *opaque;
+
+    /* ProgressMeter API is thread-safe */
+    ProgressMeter progress;
+
+
+    /** Protected by AioContext lock */
+
+    /** AioContext to run the job coroutine in */
+    AioContext *aio_context;
+
+    /** Reference count of the block job */
+    int refcnt;
+
+    /** Current state; See @JobStatus for details. */
+    JobStatus status;
+
     /**
      * Timer that is used by @job_sleep_ns. Accessed under job_mutex (in
      * job.c).
@@ -112,14 +137,6 @@ typedef struct Job {
     /** Set to true when the job has deferred work to the main loop. */
     bool deferred_to_main_loop;
 
-    /** True if this job should automatically finalize itself */
-    bool auto_finalize;
-
-    /** True if this job should automatically dismiss itself */
-    bool auto_dismiss;
-
-    ProgressMeter progress;
-
     /**
      * Return code from @run and/or @prepare callback(s).
      * Not final until the job has reached the CONCLUDED status.
@@ -134,12 +151,6 @@ typedef struct Job {
      */
     Error *err;
 
-    /** The completion function that will be called when the job completes.  */
-    BlockCompletionFunc *cb;
-
-    /** The opaque value that is passed to the completion function.  */
-    void *opaque;
-
     /** Notifiers called when a cancelled job is finalised */
     NotifierList on_finalize_cancelled;
 
@@ -167,6 +178,7 @@ typedef struct Job {
 
 /**
  * Callbacks and other information about a Job driver.
+ * All callbacks are invoked with job_mutex *not* held.
  */
 struct JobDriver {
 
@@ -472,7 +484,6 @@ void job_yield(Job *job);
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
-
 /** Returns the JobType of a given Job. */
 JobType job_type(const Job *job);
 
-- 
2.31.1


