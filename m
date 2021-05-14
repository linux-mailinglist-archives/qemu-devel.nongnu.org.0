Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFE380E88
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:59:42 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbA5-0006L9-VI
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawX-0005L3-If
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawK-0005nm-Gh
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sb0FtA8GWBsnQgxmAMYR4+RiIWzP7PmxGL4VS5l9iOg=;
 b=UmX9ieuUDAdFpfNfFZKNIIPjczTUHx6yMJhvYo8Xz2zflGh62tVGiDKldNQ0ETe4uHEKCK
 KSr6ZpFWQUeeiMQkvyFNGURVVjGeKuhfqhEn5D6hUI3OfA+kFwTYtdTzSxhy3E1i/GNC9U
 20BDVcRjpn+8pKDLQ4m2DTbPgtuggEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-cYzCbNeTPeSlPehBIRKKCg-1; Fri, 14 May 2021 12:45:26 -0400
X-MC-Unique: cYzCbNeTPeSlPehBIRKKCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2CCF107ACE8;
 Fri, 14 May 2021 16:45:24 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CD802BFE7;
 Fri, 14 May 2021 16:45:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/19] mirror: stop cancelling in-flight requests on non-force
 cancel in READY
Date: Fri, 14 May 2021 18:44:59 +0200
Message-Id: <20210514164514.1057680-5-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If mirror is READY than cancel operation is not discarding the whole
result of the operation, but instead it's a documented way get a
point-in-time snapshot of source disk.

So, we should not cancel any requests if mirror is READ and
force=false. Let's fix that case.

Note, that bug that we have before this commit is not critical, as the
only .bdrv_cancel_in_flight implementation is nbd_cancel_in_flight()
and it cancels only requests waiting for reconnection, so it should be
rare case.

Fixes: 521ff8b779b11c394dbdc43f02e158dd99df308a
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210421075858.40197-1-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h | 2 +-
 include/qemu/job.h        | 2 +-
 block/backup.c            | 2 +-
 block/mirror.c            | 6 ++++--
 job.c                     | 2 +-
 tests/qemu-iotests/264    | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c823f5b1b3..731ffedb27 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -357,7 +357,7 @@ struct BlockDriver {
      * of in-flight requests, so don't waste the time if possible.
      *
      * One example usage is to avoid waiting for an nbd target node reconnect
-     * timeout during job-cancel.
+     * timeout during job-cancel with force=true.
      */
     void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
 
diff --git a/include/qemu/job.h b/include/qemu/job.h
index efc6fa7544..41162ed494 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -254,7 +254,7 @@ struct JobDriver {
     /**
      * If the callback is not NULL, it will be invoked in job_cancel_async
      */
-    void (*cancel)(Job *job);
+    void (*cancel)(Job *job, bool force);
 
 
     /** Called when the job is freed */
diff --git a/block/backup.c b/block/backup.c
index 6cf2f974aa..bd3614ce70 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -331,7 +331,7 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }
 
-static void backup_cancel(Job *job)
+static void backup_cancel(Job *job, bool force)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
 
diff --git a/block/mirror.c b/block/mirror.c
index 840b8e8c15..019f6deaa5 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1178,12 +1178,14 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
-static void mirror_cancel(Job *job)
+static void mirror_cancel(Job *job, bool force)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target = blk_bs(s->target);
 
-    bdrv_cancel_in_flight(target);
+    if (force || !job_is_ready(job)) {
+        bdrv_cancel_in_flight(target);
+    }
 }
 
 static const BlockJobDriver mirror_job_driver = {
diff --git a/job.c b/job.c
index 4aff13d95a..8775c1803b 100644
--- a/job.c
+++ b/job.c
@@ -716,7 +716,7 @@ static int job_finalize_single(Job *job)
 static void job_cancel_async(Job *job, bool force)
 {
     if (job->driver->cancel) {
-        job->driver->cancel(job);
+        job->driver->cancel(job, force);
     }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 4f96825a22..bc431d1a19 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -95,7 +95,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
             self.assert_qmp(result, 'return', {})
 
     def cancel_job(self):
-        result = self.vm.qmp('block-job-cancel', device='drive0')
+        result = self.vm.qmp('block-job-cancel', device='drive0', force=True)
         self.assert_qmp(result, 'return', {})
 
         start_t = time.time()
-- 
2.31.1


