Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B914A4393DC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:37:27 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexM6-0004Bj-Rf
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4d-0005z4-96
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4a-0007M4-5V
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCmLghVGjISGUV52ltaPY2MUBHrWQeP/x4Htd4eenQY=;
 b=EvPPBi6owdArYoQAIBe1vXBJVxDHXwWBdTp5gVeHbedb93haraRJPuwSd0CYbMOX/9zuYr
 KazH/DVI8lNmtrOe0sCIhpsqaVpxSmMY8nkFAqjkWYdPUdyvKf1mSq5xyiIMl05IcDvhWW
 ccLHwSMsTR/DSU67c4JeJCaKzhcLIgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-fVh4Zic-PiKFWZ6D_AnFlg-1; Mon, 25 Oct 2021 06:19:18 -0400
X-MC-Unique: fVh4Zic-PiKFWZ6D_AnFlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A0010A8E07;
 Mon, 25 Oct 2021 10:19:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 388535DD68;
 Mon, 25 Oct 2021 10:19:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 25/25] job.h: assertions in the callers of JobDriver
 funcion pointers
Date: Mon, 25 Oct 2021 06:17:35 -0400
Message-Id: <20211025101735.2060852-26-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 job.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/job.c b/job.c
index dbfa67bb0a..94b142684f 100644
--- a/job.c
+++ b/job.c
@@ -380,6 +380,8 @@ void job_ref(Job *job)
 
 void job_unref(Job *job)
 {
+    assert(qemu_in_main_thread());
+
     if (--job->refcnt == 0) {
         assert(job->status == JOB_STATUS_NULL);
         assert(!timer_pending(&job->sleep_timer));
@@ -601,6 +603,7 @@ bool job_user_paused(Job *job)
 void job_user_resume(Job *job, Error **errp)
 {
     assert(job);
+    assert(qemu_in_main_thread());
     if (!job->user_paused || job->pause_count <= 0) {
         error_setg(errp, "Can't resume a job that was not paused");
         return;
@@ -671,6 +674,7 @@ static void job_update_rc(Job *job)
 static void job_commit(Job *job)
 {
     assert(!job->ret);
+    assert(qemu_in_main_thread());
     if (job->driver->commit) {
         job->driver->commit(job);
     }
@@ -679,6 +683,7 @@ static void job_commit(Job *job)
 static void job_abort(Job *job)
 {
     assert(job->ret);
+    assert(qemu_in_main_thread());
     if (job->driver->abort) {
         job->driver->abort(job);
     }
@@ -686,6 +691,7 @@ static void job_abort(Job *job)
 
 static void job_clean(Job *job)
 {
+    assert(qemu_in_main_thread());
     if (job->driver->clean) {
         job->driver->clean(job);
     }
@@ -725,6 +731,7 @@ static int job_finalize_single(Job *job)
 
 static void job_cancel_async(Job *job, bool force)
 {
+    assert(qemu_in_main_thread());
     if (job->driver->cancel) {
         force = job->driver->cancel(job, force);
     } else {
@@ -824,6 +831,7 @@ static void job_completed_txn_abort(Job *job)
 
 static int job_prepare(Job *job)
 {
+    assert(qemu_in_main_thread());
     if (job->ret == 0 && job->driver->prepare) {
         job->ret = job->driver->prepare(job);
         job_update_rc(job);
@@ -1053,6 +1061,7 @@ void job_complete(Job *job, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
     assert(job->id);
+    assert(qemu_in_main_thread());
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-- 
2.27.0


