Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DE5F7835
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:47:52 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmlb-0000yD-5C
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuZ-0006Ai-7S
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuX-0003Mr-P6
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXenS0USuqCPutG2E9TgzFlcbqGbt4PNzs5GFEdAjxw=;
 b=Zhh+CgCWR6ZmXRIR6QMKymByPx6plZ2L/uQF0TetJwW0kp+f4ck4EgQ6FrVe8H4k9d7FRU
 InLWHGsrMjMIM0Im7G1wQgdNf6KmvFPaLsQAGRZ0D7MXcjSHZo9xVD2vWnpf/5v7bru476
 o7fBts26PMBYoOf1SUCJ29+DDEXOCa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-L9k6LJQ3M-qgs1GHxrNdSg-1; Fri, 07 Oct 2022 06:48:50 -0400
X-MC-Unique: L9k6LJQ3M-qgs1GHxrNdSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4059E95E3A5;
 Fri,  7 Oct 2022 10:48:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6922028DC1;
 Fri,  7 Oct 2022 10:48:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 41/50] jobs: protect job.aio_context with BQL and job_mutex
Date: Fri,  7 Oct 2022 12:47:43 +0200
Message-Id: <20221007104752.141361-42-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

In order to make it thread safe, implement a "fake rwlock",
where we allow reads under BQL *or* job_mutex held, but
writes only under BQL *and* job_mutex.

The only write we have is in child_job_set_aio_ctx, which always
happens under drain (so the job is paused).
For this reason, introduce job_set_aio_context and make sure that
the context is set under BQL, job_mutex and drain.
Also make sure all other places where the aiocontext is read
are protected.

The reads in commit.c and mirror.c are actually safe, because always
done under BQL.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220926093214.506243-14-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/job.h  | 23 ++++++++++++++++++++---
 block/replication.c |  1 +
 blockjob.c          |  3 ++-
 job.c               | 12 ++++++++++++
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 870dce1535..c96387069d 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -74,11 +74,17 @@ typedef struct Job {
     /* ProgressMeter API is thread-safe */
     ProgressMeter progress;
 
+    /**
+     * AioContext to run the job coroutine in.
+     * The job Aiocontext can be read when holding *either*
+     * the BQL (so we are in the main loop) or the job_mutex.
+     * It can only be written when we hold *both* BQL
+     * and the job_mutex.
+     */
+    AioContext *aio_context;
 
-    /** Protected by AioContext lock */
 
-    /** AioContext to run the job coroutine in */
-    AioContext *aio_context;
+    /** Protected by AioContext lock */
 
     /** Reference count of the block job */
     int refcnt;
@@ -741,4 +747,15 @@ int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp),
 int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
                            Error **errp);
 
+/**
+ * Sets the @job->aio_context.
+ * Called with job_mutex *not* held.
+ *
+ * This function must run in the main thread to protect against
+ * concurrent read in job_finish_sync_locked(), takes the job_mutex
+ * lock to protect against the read in job_do_yield_locked(), and must
+ * be called when the job is quiescent.
+ */
+void job_set_aio_context(Job *job, AioContext *ctx);
+
 #endif
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..5977f7a833 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -142,6 +142,7 @@ static void replication_close(BlockDriverState *bs)
 {
     BDRVReplicationState *s = bs->opaque;
     Job *commit_job;
+    GLOBAL_STATE_CODE();
 
     if (s->stage == BLOCK_REPLICATION_RUNNING) {
         replication_stop(s->rs, false, NULL);
diff --git a/blockjob.c b/blockjob.c
index 96fb9d9f73..c8919cef9b 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -162,12 +162,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
         bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
     }
 
-    job->job.aio_context = ctx;
+    job_set_aio_context(&job->job, ctx);
 }
 
 static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
+    GLOBAL_STATE_CODE();
 
     return job->job.aio_context;
 }
diff --git a/job.c b/job.c
index 3ef5028751..3e6f61c523 100644
--- a/job.c
+++ b/job.c
@@ -396,6 +396,17 @@ Job *job_get(const char *id)
     return job_get_locked(id);
 }
 
+void job_set_aio_context(Job *job, AioContext *ctx)
+{
+    /* protect against read in job_finish_sync_locked and job_start */
+    GLOBAL_STATE_CODE();
+    /* protect against read in job_do_yield_locked */
+    JOB_LOCK_GUARD();
+    /* ensure the job is quiescent while the AioContext is changed */
+    assert(job->paused || job_is_completed_locked(job));
+    job->aio_context = ctx;
+}
+
 /* Called with job_mutex *not* held. */
 static void job_sleep_timer_cb(void *opaque)
 {
@@ -1379,6 +1390,7 @@ int job_finish_sync_locked(Job *job,
 {
     Error *local_err = NULL;
     int ret;
+    GLOBAL_STATE_CODE();
 
     job_ref_locked(job);
 
-- 
2.37.3


