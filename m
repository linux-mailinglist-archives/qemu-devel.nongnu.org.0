Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763F4D863B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:52:35 +0100 (CET)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTl7i-0001eM-2F
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:52:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTktC-0006zb-AF
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkt1-0001dt-FM
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647265042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aXjCuW4SV79Oe6hDfMZZg9exqw8x0C5zPZhM8jzGmMk=;
 b=cG/3sifn3eRV3CQgGIU5oqw4Z95OHioD6du2EdHCtYV6pZFCl5bLYpOvxeR5BuudzsxWN0
 5mnNQ5eZsvSm3YsSrIpjIarU51UGe05QBskvgWYs6gs7wrp9A/tmqFpVdOPdH6zFXQzIt4
 cz9wN/t2soxhOF7b8so5cMXNzaWg2Vc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-IugojKFkMruFNmv406IDiA-1; Mon, 14 Mar 2022 09:37:19 -0400
X-MC-Unique: IugojKFkMruFNmv406IDiA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF3F899ED2;
 Mon, 14 Mar 2022 13:37:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D10D46503C;
 Mon, 14 Mar 2022 13:37:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 16/18] jobs: protect job.aio_context with BQL and job_mutex
Date: Mon, 14 Mar 2022 09:37:05 -0400
Message-Id: <20220314133707.2206082-17-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In order to make it thread safe, implement a "fake rwlock",
where we allow reads under BQL *or* job_mutex held, but
writes only under BQL *and* job_mutex.

The only write we have is in child_job_set_aio_ctx, which always
happens under drain (so the job is paused).
For this reason, introduce job_set_aio_context and make sure that
the context is set under BQL, job_mutex and drain.
Also make sure all other places where the aiocontext is read
are protected.

Note: at this stage, job_{lock/unlock} and job lock guard macros
are *nop*.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/replication.c |  2 +-
 blockjob.c          |  3 ++-
 include/qemu/job.h  | 19 ++++++++++++++++++-
 job.c               | 12 ++++++++++++
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 50ea778937..68018948b9 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -148,8 +148,8 @@ static void replication_close(BlockDriverState *bs)
     }
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
-        assert(commit_job->aio_context == qemu_get_current_aio_context());
         WITH_JOB_LOCK_GUARD() {
+            assert(commit_job->aio_context == qemu_get_current_aio_context());
             job_cancel_sync_locked(commit_job, false);
         }
     }
diff --git a/blockjob.c b/blockjob.c
index 2c075db45b..8b9e10813d 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -154,12 +154,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
         bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
     }
 
-    job->job.aio_context = ctx;
+    job_set_aio_context(&job->job, ctx);
 }
 
 static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
+    assert(qemu_in_main_thread());
 
     return job->job.aio_context;
 }
diff --git a/include/qemu/job.h b/include/qemu/job.h
index dfbf2ea501..fad4ee8cb3 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -75,7 +75,12 @@ typedef struct Job {
     ProgressMeter progress;
 
 
-    /** AioContext to run the job coroutine in */
+    /**
+     * AioContext to run the job coroutine in.
+     * This field can be read when holding either the BQL (so we are in
+     * the main loop) or the job_mutex.
+     * It can be only written when we hold *both* BQL and job_mutex.
+     */
     AioContext *aio_context;
 
     /** Reference count of the block job */
@@ -706,4 +711,16 @@ void job_dismiss_locked(Job **job, Error **errp);
 int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
                            Error **errp);
 
+/**
+ * Sets the @job->aio_context.
+ * Called with job_mutex *not* held.
+ *
+ * This function must run in the main thread to protect against
+ * concurrent read in job_finish_sync_locked(),
+ * takes the job_mutex lock to protect against the read in
+ * job_do_yield_locked(), and must be called when the coroutine
+ * is quiescent.
+ */
+void job_set_aio_context(Job *job, AioContext *ctx);
+
 #endif
diff --git a/job.c b/job.c
index 10a5981748..80a0fb34b1 100644
--- a/job.c
+++ b/job.c
@@ -368,6 +368,17 @@ Job *job_get_locked(const char *id)
     return NULL;
 }
 
+void job_set_aio_context(Job *job, AioContext *ctx)
+{
+    /* protect against read in job_finish_sync_locked and job_start */
+    assert(qemu_in_main_thread());
+    /* protect against read in job_do_yield_locked */
+    JOB_LOCK_GUARD();
+    /* ensure the coroutine is quiescent while the AioContext is changed */
+    assert(job->pause_count > 0);
+    job->aio_context = ctx;
+}
+
 /* Called with job_mutex *not* held. */
 static void job_sleep_timer_cb(void *opaque)
 {
@@ -1261,6 +1272,7 @@ int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
 {
     Error *local_err = NULL;
     int ret;
+    assert(qemu_in_main_thread());
 
     job_ref_locked(job);
 
-- 
2.31.1


