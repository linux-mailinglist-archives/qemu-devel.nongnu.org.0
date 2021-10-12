Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D242A139
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:35:51 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maECM-00019W-BC
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUz-00071q-NO
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUw-0003MN-Jj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCmLghVGjISGUV52ltaPY2MUBHrWQeP/x4Htd4eenQY=;
 b=JGTAY2DGAspV2rPy/fdmqRFW5xEES4VKui4jTj2Og+Sw6d5s8pV/vAmPBs/gFP/8a8egOh
 Jx31BS45JIkO5heOtj9vIO6H0Sr0YcLPMb1NDgOFiQ6Rwp/wNp6HwV1M0UV9tUpZ+DKyrF
 18V0meo4prFyt0TCPHqy7RycjP5GV7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-y3591PQKNC2dxEbHRHhNHg-1; Tue, 12 Oct 2021 04:50:54 -0400
X-MC-Unique: y3591PQKNC2dxEbHRHhNHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 968A0BBEE3;
 Tue, 12 Oct 2021 08:50:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6864E5C1B4;
 Tue, 12 Oct 2021 08:50:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 25/25] job.h: assertions in the callers of JobDriver
 funcion pointers
Date: Tue, 12 Oct 2021 04:49:06 -0400
Message-Id: <20211012084906.2060507-26-eesposit@redhat.com>
In-Reply-To: <20211012084906.2060507-1-eesposit@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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


