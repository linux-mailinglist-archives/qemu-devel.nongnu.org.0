Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D33BECC6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:03:54 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Axm-0003oX-2L
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asj-0002h4-CV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asg-0000D8-Rz
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIrPiEQ3tA6Dzc89klSAnn6Q+mMSCGklqnwTjsNCL9A=;
 b=fv50AR91BF78/zfjaaf+k63SWYH22W/xl/hd9XXTvhwCYGL5dTdZoyE4QsGJHgRg+Oz4Kw
 lcRO8PFdCiYTA+3zXJMKMNI5wdVEdaonCPmyaflU/uRec2bL3uxWQYKjdGgQ1u0fpunT5P
 TNFg0QwgQssNompqYg+NucQqDEsiE1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-VstCD4oVO9m_fmJ57juHXw-1; Wed, 07 Jul 2021 12:58:37 -0400
X-MC-Unique: VstCD4oVO9m_fmJ57juHXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0917C101F000;
 Wed,  7 Jul 2021 16:58:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A6641036D03;
 Wed,  7 Jul 2021 16:58:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 4/6] job.h: categorize job fields
Date: Wed,  7 Jul 2021 18:58:11 +0200
Message-Id: <20210707165813.55361-5-eesposit@redhat.com>
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it easier to understand what needs to be protected
by a lock and what doesn't.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/job.h | 101 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 19 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index ba2f9b2660..4421d08d93 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -40,24 +40,40 @@ typedef struct JobTxn JobTxn;
  * Long-running operation.
  */
 typedef struct Job {
-    /** The ID of the job. May be NULL for internal jobs. */
+    /**
+     * The ID of the job. May be NULL for internal jobs.
+     * Set it in job_create and just read.
+     */
     char *id;
 
-    /** The type of this job. */
+    /**
+     * The type of this job.
+     * Set it in job_create and just read.
+     */
     const JobDriver *driver;
 
-    /** Reference count of the block job */
+    /**
+     * Reference count of the block job.
+     * Protected by job_mutex.
+     */
     int refcnt;
 
-    /** Current state; See @JobStatus for details. */
+    /**
+     * Current state; See @JobStatus for details.
+     * Protected by job_mutex.
+     */
     JobStatus status;
 
-    /** AioContext to run the job coroutine in */
+    /**
+     * AioContext to run the job coroutine in.
+     * Atomic.
+     */
     AioContext *aio_context;
 
     /**
      * The coroutine that executes the job.  If not NULL, it is reentered when
      * busy is false and the job is cancelled.
+     * Set it in job_create and just read.
      */
     Coroutine *co;
 
@@ -70,13 +86,15 @@ typedef struct Job {
     /**
      * Counter for pause request. If non-zero, the block job is either paused,
      * or if busy == true will pause itself as soon as possible.
+     * Protected by job_mutex.
      */
     int pause_count;
 
     /**
      * Set to false by the job while the coroutine has yielded and may be
      * re-entered by job_enter(). There may still be I/O or event loop activity
-     * pending. Accessed under block_job_mutex (in blockjob.c).
+     * pending.
+     * Protected by job_mutex.
      *
      * When the job is deferred to the main loop, busy is true as long as the
      * bottom half is still pending.
@@ -86,12 +104,14 @@ typedef struct Job {
     /**
      * Set to true by the job while it is in a quiescent state, where
      * no I/O or event loop activity is pending.
+     * Protected by job_mutex.
      */
     bool paused;
 
     /**
      * Set to true if the job is paused by user.  Can be unpaused with the
      * block-job-resume QMP command.
+     * Protected by job_mutex.
      */
     bool user_paused;
 
@@ -100,22 +120,33 @@ typedef struct Job {
      * always be tested just before toggling the busy flag from false
      * to true.  After a job has been cancelled, it should only yield
      * if #aio_poll will ("sooner or later") reenter the coroutine.
+     * Protected by job_mutex.
      */
     bool cancelled;
 
     /**
      * Set to true if the job should abort immediately without waiting
      * for data to be in sync.
+     * Protected by job_mutex.
      */
     bool force_cancel;
 
-    /** Set to true when the job has deferred work to the main loop. */
+    /**
+     * Set to true when the job has deferred work to the main loop.
+     * Protected by job_mutex.
+     */
     bool deferred_to_main_loop;
 
-    /** True if this job should automatically finalize itself */
+    /**
+     * True if this job should automatically finalize itself.
+     * Set it in job_create and just read.
+     */
     bool auto_finalize;
 
-    /** True if this job should automatically dismiss itself */
+    /**
+     * True if this job should automatically dismiss itself.
+     * Set it in job_create and just read.
+     */
     bool auto_dismiss;
 
     ProgressMeter progress;
@@ -124,6 +155,7 @@ typedef struct Job {
      * Return code from @run and/or @prepare callback(s).
      * Not final until the job has reached the CONCLUDED status.
      * 0 on success, -errno on failure.
+     * Protected by job_mutex.
      */
     int ret;
 
@@ -131,37 +163,68 @@ typedef struct Job {
      * Error object for a failed job.
      * If job->ret is nonzero and an error object was not set, it will be set
      * to strerror(-job->ret) during job_completed.
+     * Protected by job_mutex.
      */
     Error *err;
 
-    /** The completion function that will be called when the job completes.  */
+    /**
+     * The completion function that will be called when the job completes.
+     * Set it in job_create and just read.
+     */
     BlockCompletionFunc *cb;
 
-    /** The opaque value that is passed to the completion function.  */
+    /**
+     * The opaque value that is passed to the completion function.
+     * Set it in job_create and just read.
+     */
     void *opaque;
 
-    /** Notifiers called when a cancelled job is finalised */
+    /**
+     * Notifiers called when a cancelled job is finalised.
+     * Protected by job_mutex.
+     */
     NotifierList on_finalize_cancelled;
 
-    /** Notifiers called when a successfully completed job is finalised */
+    /**
+     * Notifiers called when a successfully completed job is finalised.
+     * Protected by job_mutex.
+     */
     NotifierList on_finalize_completed;
 
-    /** Notifiers called when the job transitions to PENDING */
+    /**
+     * Notifiers called when the job transitions to PENDING.
+     * Protected by job_mutex.
+     */
     NotifierList on_pending;
 
-    /** Notifiers called when the job transitions to READY */
+    /**
+     * Notifiers called when the job transitions to READY.
+     * Protected by job_mutex.
+     */
     NotifierList on_ready;
 
-    /** Notifiers called when the job coroutine yields or terminates */
+    /**
+     * Notifiers called when the job coroutine yields or terminates.
+     * Protected by job_mutex.
+     */
     NotifierList on_idle;
 
-    /** Element of the list of jobs */
+    /**
+     * Element of the list of jobs.
+     * Protected by job_mutex.
+     */
     QLIST_ENTRY(Job) job_list;
 
-    /** Transaction this job is part of */
+    /**
+     * Transaction this job is part of.
+     * Protected by job_mutex.
+     */
     JobTxn *txn;
 
-    /** Element of the list of jobs in a job transaction */
+    /**
+     * Element of the list of jobs in a job transaction.
+     * Protected by job_mutex.
+     */
     QLIST_ENTRY(Job) txn_list;
 } Job;
 
-- 
2.31.1


