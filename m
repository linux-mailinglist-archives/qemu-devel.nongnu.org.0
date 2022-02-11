Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9034B2925
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:32:37 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXuW-0000ve-EW
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:32:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXJR-0006R5-Pn
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXJO-00021U-D2
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWO9NSVEaTkE7QzxrRrebueQT29gfk2saO2rOvbc2u8=;
 b=Dbtbx5oI2gI79/NqNvGiQfE2cg7jwS15/eST+kt01sqqEZ3ie+l4satpwqAwaP9Vo9yAD7
 de7w4PMkNVnidkf0I/qeKCkDV8oUHW59llxBdjRj4vtGfd2GVTQ5pJJroqyWl928KSHU6M
 ngkwv3ORG3GWm8wKzAcMEKgLQTmyv0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-AYg2NT3wPlaO49AHOozmFw-1; Fri, 11 Feb 2022 09:54:00 -0500
X-MC-Unique: AYg2NT3wPlaO49AHOozmFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F85886A8A1;
 Fri, 11 Feb 2022 14:53:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 746617C0E8;
 Fri, 11 Feb 2022 14:53:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 31/31] job.h: assertions in the callers of JobDriver
 function pointers
Date: Fri, 11 Feb 2022 09:51:53 -0500
Message-Id: <20220211145153.2861415-32-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
2.31.1


