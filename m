Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84056038C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:47:29 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6YyW-00039s-7x
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YU4-0007xX-59
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YTv-000236-K7
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656512148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTpDBTFfrx7nITUCv8EmSkF6y1fnDWo0Y9hyDRkbKno=;
 b=HS1maFL0+YCkTStKG4VmLJX73/DUzbZeGsNiRh9+/ZsDn0bgtqubfePArq8imMT6xjojJC
 N7lT+f9zeCkIHCvZ/uMBqDZAIgIU8vpj/nbyEUB+JJsEJbpfx0TEhFFRW8AWQPL9y3nn3n
 S8MmueCht3+i/qphH9Q+UWQ4zRn8uco=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-O4MX005QMWedPRr-uvntcA-1; Wed, 29 Jun 2022 10:15:44 -0400
X-MC-Unique: O4MX005QMWedPRr-uvntcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1487B3C0F38A;
 Wed, 29 Jun 2022 14:15:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4A809D7F;
 Wed, 29 Jun 2022 14:15:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v8 03/20] job.c: API functions not used outside should be
 static
Date: Wed, 29 Jun 2022 10:15:21 -0400
Message-Id: <20220629141538.3400679-4-eesposit@redhat.com>
In-Reply-To: <20220629141538.3400679-1-eesposit@redhat.com>
References: <20220629141538.3400679-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

job_event_* functions can all be static, as they are not used
outside job.c.

Same applies for job_txn_add_job().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/qemu/job.h | 18 ------------------
 job.c              | 22 +++++++++++++++++++---
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 876e13d549..4b64eb15f7 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -358,18 +358,6 @@ JobTxn *job_txn_new(void);
  */
 void job_txn_unref(JobTxn *txn);
 
-/**
- * @txn: The transaction (may be NULL)
- * @job: Job to add to the transaction
- *
- * Add @job to the transaction.  The @job must not already be in a transaction.
- * The caller must call either job_txn_unref() or job_completed() to release
- * the reference that is automatically grabbed here.
- *
- * If @txn is NULL, the function does nothing.
- */
-void job_txn_add_job(JobTxn *txn, Job *job);
-
 /**
  * Create a new long-running job and return it.
  *
@@ -431,12 +419,6 @@ void job_progress_set_remaining(Job *job, uint64_t remaining);
  */
 void job_progress_increase_remaining(Job *job, uint64_t delta);
 
-/** To be called when a cancelled job is finalised. */
-void job_event_cancelled(Job *job);
-
-/** To be called when a successfully completed job is finalised. */
-void job_event_completed(Job *job);
-
 /**
  * Conditionally enter the job coroutine if the job is ready to run, not
  * already busy and fn() returns true. fn() is called while under the job_lock
diff --git a/job.c b/job.c
index 2b4ffca9d4..cafd597ba4 100644
--- a/job.c
+++ b/job.c
@@ -125,7 +125,17 @@ void job_txn_unref(JobTxn *txn)
     }
 }
 
-void job_txn_add_job(JobTxn *txn, Job *job)
+/**
+ * @txn: The transaction (may be NULL)
+ * @job: Job to add to the transaction
+ *
+ * Add @job to the transaction.  The @job must not already be in a transaction.
+ * The caller must call either job_txn_unref() or job_completed() to release
+ * the reference that is automatically grabbed here.
+ *
+ * If @txn is NULL, the function does nothing.
+ */
+static void job_txn_add_job(JobTxn *txn, Job *job)
 {
     if (!txn) {
         return;
@@ -427,12 +437,18 @@ void job_progress_increase_remaining(Job *job, uint64_t delta)
     progress_increase_remaining(&job->progress, delta);
 }
 
-void job_event_cancelled(Job *job)
+/**
+ * To be called when a cancelled job is finalised.
+ */
+static void job_event_cancelled(Job *job)
 {
     notifier_list_notify(&job->on_finalize_cancelled, job);
 }
 
-void job_event_completed(Job *job)
+/**
+ * To be called when a successfully completed job is finalised.
+ */
+static void job_event_completed(Job *job)
 {
     notifier_list_notify(&job->on_finalize_completed, job);
 }
-- 
2.31.1


