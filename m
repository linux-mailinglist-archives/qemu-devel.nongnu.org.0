Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4F4D86FB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:34:12 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTllz-0001zF-5P
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:34:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt0-0006Qq-KU
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTksw-0001ac-Pk
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsgyhZHLmYWejqrirZQTxTBoo1ZgRwjMszgLo65h3zg=;
 b=HMfAfXpTk1oeFkaxO2x0fy2VupCBjFbw2HusOZ7mikBVtmJD0BU72M4w3BYItbw4w6qy0W
 KkwMThKTftwlyCriVZB6bv+YPhaGSZWoaEb9lkXayAD13enL5N+s88DissBxD/7TxqoZS9
 qZ+t4qYPBRdjc3hc3JeINZ5nlDi3uD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-XCArkLQfMIeoA4h-nlBr6Q-1; Mon, 14 Mar 2022 09:37:14 -0400
X-MC-Unique: XCArkLQfMIeoA4h-nlBr6Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9D6E1C05AD1;
 Mon, 14 Mar 2022 13:37:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68AC9403144;
 Mon, 14 Mar 2022 13:37:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 02/18] job.h: categorize fields in struct Job
Date: Mon, 14 Mar 2022 09:36:51 -0400
Message-Id: <20220314133707.2206082-3-eesposit@redhat.com>
In-Reply-To: <20220314133707.2206082-1-eesposit@redhat.com>
References: <20220314133707.2206082-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Categorize the fields in struct Job to understand which ones
need to be protected by the job mutex and which don't.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index d1192ffd61..86ec46c09e 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
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
@@ -112,14 +135,6 @@ typedef struct Job {
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
@@ -134,12 +149,6 @@ typedef struct Job {
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
 
@@ -167,6 +176,7 @@ typedef struct Job {
 
 /**
  * Callbacks and other information about a Job driver.
+ * All callbacks are invoked with job_mutex *not* held.
  */
 struct JobDriver {
 
@@ -472,7 +482,6 @@ void job_yield(Job *job);
  */
 void coroutine_fn job_sleep_ns(Job *job, int64_t ns);
 
-
 /** Returns the JobType of a given Job. */
 JobType job_type(const Job *job);
 
-- 
2.31.1


