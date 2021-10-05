Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0E422B94
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:56:22 +0200 (CEST)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlrh-0007JP-Dy
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXz-0004bv-Rx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXx-0005Xr-Hj
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCCV5Wzu7tDOiA93MKHBA5UaBHyNDfaaye1uRfljl60=;
 b=FdJoh0VCb0/YTbhNvNnEzaQnOLFcsSFkD5/903BMfS+5QGRRwiHv36nf2biSGZkOIAtmAZ
 wjJAL+XgX3+Wpy4ToleBQfAyE0lezJ//8JNuyS28hTucw4Fk2ITqjUTwoYBH5ol3R+jcGP
 P+3TRZtws6jaoWeLBwy0Kc7xJ3plazk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-HTiWPH56O5SZulmTmPx8SQ-1; Tue, 05 Oct 2021 10:35:55 -0400
X-MC-Unique: HTiWPH56O5SZulmTmPx8SQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B017F18D6A39;
 Tue,  5 Oct 2021 14:35:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A49F1002391;
 Tue,  5 Oct 2021 14:35:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 25/25] job.h: assertions in the callers of JobDriver
 funcion pointers
Date: Tue,  5 Oct 2021 10:32:15 -0400
Message-Id: <20211005143215.29500-26-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 job.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/job.c b/job.c
index e7a5d28854..62a13b6982 100644
--- a/job.c
+++ b/job.c
@@ -373,6 +373,8 @@ void job_ref(Job *job)
 
 void job_unref(Job *job)
 {
+    g_assert(qemu_in_main_thread());
+
     if (--job->refcnt == 0) {
         assert(job->status == JOB_STATUS_NULL);
         assert(!timer_pending(&job->sleep_timer));
@@ -594,6 +596,7 @@ bool job_user_paused(Job *job)
 void job_user_resume(Job *job, Error **errp)
 {
     assert(job);
+    g_assert(qemu_in_main_thread());
     if (!job->user_paused || job->pause_count <= 0) {
         error_setg(errp, "Can't resume a job that was not paused");
         return;
@@ -664,6 +667,7 @@ static void job_update_rc(Job *job)
 static void job_commit(Job *job)
 {
     assert(!job->ret);
+    g_assert(qemu_in_main_thread());
     if (job->driver->commit) {
         job->driver->commit(job);
     }
@@ -672,6 +676,7 @@ static void job_commit(Job *job)
 static void job_abort(Job *job)
 {
     assert(job->ret);
+    g_assert(qemu_in_main_thread());
     if (job->driver->abort) {
         job->driver->abort(job);
     }
@@ -679,6 +684,7 @@ static void job_abort(Job *job)
 
 static void job_clean(Job *job)
 {
+    g_assert(qemu_in_main_thread());
     if (job->driver->clean) {
         job->driver->clean(job);
     }
@@ -718,6 +724,7 @@ static int job_finalize_single(Job *job)
 
 static void job_cancel_async(Job *job, bool force)
 {
+    g_assert(qemu_in_main_thread());
     if (job->driver->cancel) {
         job->driver->cancel(job, force);
     }
@@ -786,6 +793,7 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    g_assert(qemu_in_main_thread());
     if (job->ret == 0 && job->driver->prepare) {
         job->ret = job->driver->prepare(job);
         job_update_rc(job);
@@ -991,6 +999,7 @@ void job_complete(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
     assert(job->id);
+    g_assert(qemu_in_main_thread());
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-- 
2.27.0


