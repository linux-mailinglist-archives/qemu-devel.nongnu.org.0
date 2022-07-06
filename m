Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCB5694A6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:47:01 +0200 (CEST)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CrL-0008Bp-JG
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRK-0005Hh-5a
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRC-0007HJ-2N
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657138553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SW7NB2CGAtYcXY6MbgwngCMa6sgaFwN9uebHWkNUnpk=;
 b=U1DJLJaHoeSgomafz9g0hAOFOFRTxKwSZiS8vSiJAWDNaapScuDqt9+swA0CuHkKZHxTx/
 ih2QW4QQ3iO4F1+mVAN2Y2B3WiB6js+HALgG5T275f13JM9wjcuIRFPmM84BUQULNtBhdG
 MelRdegtV+3Y8vPzrxNZ29hU2KQHd90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-zx35w3ljOUCuNyce856LvQ-1; Wed, 06 Jul 2022 16:15:49 -0400
X-MC-Unique: zx35w3ljOUCuNyce856LvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B62E3801F65;
 Wed,  6 Jul 2022 20:15:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 085D01121320;
 Wed,  6 Jul 2022 20:15:49 +0000 (UTC)
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
Subject: [PATCH v9 20/21] blockjob: remove unused functions
Date: Wed,  6 Jul 2022 16:15:32 -0400
Message-Id: <20220706201533.289775-21-eesposit@redhat.com>
In-Reply-To: <20220706201533.289775-1-eesposit@redhat.com>
References: <20220706201533.289775-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These public functions are not used anywhere, thus can be dropped.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 blockjob.c               | 30 ------------------------------
 include/block/blockjob.h | 36 +++++++++++++-----------------------
 2 files changed, 13 insertions(+), 53 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 893c8ff08e..bb82e8d04c 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -56,12 +56,6 @@ BlockJob *block_job_next_locked(BlockJob *bjob)
     return job ? container_of(job, BlockJob, job) : NULL;
 }
 
-BlockJob *block_job_next(BlockJob *bjob)
-{
-    JOB_LOCK_GUARD();
-    return block_job_next_locked(bjob);
-}
-
 BlockJob *block_job_get_locked(const char *id)
 {
     Job *job = job_get_locked(id);
@@ -74,12 +68,6 @@ BlockJob *block_job_get_locked(const char *id)
     }
 }
 
-BlockJob *block_job_get(const char *id)
-{
-    JOB_LOCK_GUARD();
-    return block_job_get_locked(id);
-}
-
 void block_job_free(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
@@ -312,12 +300,6 @@ bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp)
     return true;
 }
 
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    return block_job_set_speed_locked(job, speed, errp);
-}
-
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 {
     IO_CODE();
@@ -361,12 +343,6 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
     return info;
 }
 
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
-{
-    JOB_LOCK_GUARD();
-    return block_job_query_locked(job, errp);
-}
-
 /* Called with job lock held */
 static void block_job_iostatus_set_err_locked(BlockJob *job, int error)
 {
@@ -532,12 +508,6 @@ void block_job_iostatus_reset_locked(BlockJob *job)
     job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
 
-void block_job_iostatus_reset(BlockJob *job)
-{
-    JOB_LOCK_GUARD();
-    block_job_iostatus_reset_locked(job);
-}
-
 void block_job_user_resume(Job *job)
 {
     BlockJob *bjob = container_of(job, BlockJob, job);
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 912e10b083..7cb4ceaf09 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -93,30 +93,26 @@ typedef struct BlockJob {
  */
 
 /**
- * block_job_next:
+ * block_job_next_locked:
  * @job: A block job, or %NULL.
  *
  * Get the next element from the list of block jobs after @job, or the
  * first one if @job is %NULL.
  *
  * Returns the requested job, or %NULL if there are no more jobs left.
+ * Called with job lock held.
  */
-BlockJob *block_job_next(BlockJob *job);
-
-/* Same as block_job_next(), but called with job lock held. */
 BlockJob *block_job_next_locked(BlockJob *job);
 
 /**
- * block_job_get:
+ * block_job_get_locked:
  * @id: The id of the block job.
  *
  * Get the block job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ * Called with job lock held.
  */
-BlockJob *block_job_get(const char *id);
-
-/* Same as block_job_get(), but called with job lock held. */
 BlockJob *block_job_get_locked(const char *id);
 
 /**
@@ -152,43 +148,37 @@ void block_job_remove_all_bdrv(BlockJob *job);
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
 
 /**
- * block_job_set_speed:
+ * block_job_set_speed_locked:
  * @job: The job to set the speed for.
  * @speed: The new value
  * @errp: Error object.
  *
  * Set a rate-limiting parameter for the job; the actual meaning may
  * vary depending on the job type.
- */
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
-
-/*
- * Same as block_job_set_speed(), but called with job lock held.
- * Might release the lock temporarily.
+ *
+ * Called with job lock held, but might release it temporarily.
  */
 bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp);
 
 /**
- * block_job_query:
+ * block_job_query_locked:
  * @job: The job to get information about.
  *
  * Return information about a job.
+ *
+ * Called with job lock held.
  */
-BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
-
-/* Same as block_job_query(), but called with job lock held. */
 BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp);
 
 /**
- * block_job_iostatus_reset:
+ * block_job_iostatus_reset_locked:
  * @job: The job whose I/O status should be reset.
  *
  * Reset I/O status on @job and on BlockDriverState objects it uses,
  * other than job->blk.
+ *
+ * Called with job lock held.
  */
-void block_job_iostatus_reset(BlockJob *job);
-
-/* Same as block_job_iostatus_reset(), but called with job lock held. */
 void block_job_iostatus_reset_locked(BlockJob *job);
 
 /*
-- 
2.31.1


