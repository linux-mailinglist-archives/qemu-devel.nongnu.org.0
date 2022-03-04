Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2D4CD9EB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:16:45 +0100 (CET)
Received: from localhost ([::1]:41506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBXo-0005Di-3a
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6V-000685-Jh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6U-0007cP-4I
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIS5hETE82BdkE4glc0YHXF42OsmzHwsRiAt6u9qkys=;
 b=gBiX8QlZDfJDHgSxruyR2vTDJAhtcmWxqvrWNRdcOE2H/rbO8PZLcs6oaeJmDXmJ2ygBTn
 iliK59a9FGgD2cf7It33Fc9MgFtHOpVQMlfMP1An8hRSEovDrdMfEvECHmdKhcFkTxfev0
 /n2/245/A8HyaOng3x5iPvBmlEoW8Tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-wKHNEWRWPe6qYAEG8scpKA-1; Fri, 04 Mar 2022 11:48:26 -0500
X-MC-Unique: wKHNEWRWPe6qYAEG8scpKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CE9FC80;
 Fri,  4 Mar 2022 16:48:25 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 570A983BF9;
 Fri,  4 Mar 2022 16:48:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 44/50] job.h: assertions in the callers of JobDriver function
 pointers
Date: Fri,  4 Mar 2022 17:47:05 +0100
Message-Id: <20220304164711.474713-45-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-32-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 job.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/job.c b/job.c
index 54db80df66..075c6f3a20 100644
--- a/job.c
+++ b/job.c
@@ -381,6 +381,8 @@ void job_ref(Job *job)
 
 void job_unref(Job *job)
 {
+    GLOBAL_STATE_CODE();
+
     if (--job->refcnt == 0) {
         assert(job->status == JOB_STATUS_NULL);
         assert(!timer_pending(&job->sleep_timer));
@@ -602,6 +604,7 @@ bool job_user_paused(Job *job)
 void job_user_resume(Job *job, Error **errp)
 {
     assert(job);
+    GLOBAL_STATE_CODE();
     if (!job->user_paused || job->pause_count <= 0) {
         error_setg(errp, "Can't resume a job that was not paused");
         return;
@@ -672,6 +675,7 @@ static void job_update_rc(Job *job)
 static void job_commit(Job *job)
 {
     assert(!job->ret);
+    GLOBAL_STATE_CODE();
     if (job->driver->commit) {
         job->driver->commit(job);
     }
@@ -680,6 +684,7 @@ static void job_commit(Job *job)
 static void job_abort(Job *job)
 {
     assert(job->ret);
+    GLOBAL_STATE_CODE();
     if (job->driver->abort) {
         job->driver->abort(job);
     }
@@ -687,6 +692,7 @@ static void job_abort(Job *job)
 
 static void job_clean(Job *job)
 {
+    GLOBAL_STATE_CODE();
     if (job->driver->clean) {
         job->driver->clean(job);
     }
@@ -726,6 +732,7 @@ static int job_finalize_single(Job *job)
 
 static void job_cancel_async(Job *job, bool force)
 {
+    GLOBAL_STATE_CODE();
     if (job->driver->cancel) {
         force = job->driver->cancel(job, force);
     } else {
@@ -825,6 +832,7 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    GLOBAL_STATE_CODE();
     if (job->ret == 0 && job->driver->prepare) {
         job->ret = job->driver->prepare(job);
         job_update_rc(job);
@@ -952,6 +960,7 @@ static void coroutine_fn job_co_entry(void *opaque)
     Job *job = opaque;
 
     assert(job && job->driver && job->driver->run);
+    assert(job->aio_context == qemu_get_current_aio_context());
     job_pause_point(job);
     job->ret = job->driver->run(job, &job->err);
     job->deferred_to_main_loop = true;
@@ -1054,6 +1063,7 @@ void job_complete(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
     assert(job->id);
+    GLOBAL_STATE_CODE();
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-- 
2.35.1


