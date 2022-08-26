Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BD5A28BE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:41:33 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZaV-0008FL-Ng
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH9-00015p-7y
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGx-000405-Os
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lT2EiCUikGEm7/huwGQGIMK7ecVWIIaCy0NEOkPKnA=;
 b=XysD/rD5fh+GlHGLzCqFCgn/0WI2KccLbJDCbwGQtUrrhJRAx4AAUISZIn7imu5JdNuJ18
 YwIm6pNwgm8JsdNJolTPcm0V67THpBDB/GepGQSVzzYArQHyjGaWM9HbIqAGOJYyemFi/B
 ICL7GDDVlLklcd5/b5hoP6E6qFeY3wI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-b1nqToB0NLaNeW09OCLCqw-1; Fri, 26 Aug 2022 09:21:15 -0400
X-MC-Unique: b1nqToB0NLaNeW09OCLCqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BA73C0E237;
 Fri, 26 Aug 2022 13:21:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313E4492C3B;
 Fri, 26 Aug 2022 13:21:15 +0000 (UTC)
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
Subject: [PATCH v11 20/21] blockjob: remove unused functions
Date: Fri, 26 Aug 2022 09:21:03 -0400
Message-Id: <20220826132104.3678958-21-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

These public functions are not used anywhere, thus can be dropped.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 blockjob.c               | 16 ++--------------
 include/block/blockjob.h | 31 ++++++++++++-------------------
 2 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 120c1b7ead..bdf20a0e35 100644
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
@@ -308,7 +302,7 @@ bool block_job_set_speed_locked(BlockJob *job, int64_t speed, Error **errp)
     return true;
 }
 
-bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+static bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     JOB_LOCK_GUARD();
     return block_job_set_speed_locked(job, speed, errp);
@@ -357,12 +351,6 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
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
@@ -525,7 +513,7 @@ void block_job_iostatus_reset_locked(BlockJob *job)
     job->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
 }
 
-void block_job_iostatus_reset(BlockJob *job)
+static void block_job_iostatus_reset(BlockJob *job)
 {
     JOB_LOCK_GUARD();
     block_job_iostatus_reset_locked(job);
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 10c24e240a..03032b2eca 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -102,17 +102,15 @@ typedef struct BlockJob {
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
@@ -122,6 +120,7 @@ BlockJob *block_job_next_locked(BlockJob *job);
  * Get the block job identified by @id (which must not be %NULL).
  *
  * Returns the requested job, or %NULL if it doesn't exist.
+ * Called with job lock *not* held.
  */
 BlockJob *block_job_get(const char *id);
 
@@ -161,43 +160,37 @@ void block_job_remove_all_bdrv(BlockJob *job);
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


