Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A566560341
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:39:41 +0200 (CEST)
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Yqy-0004iA-Bl
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YU4-0007xT-0v
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o6YTv-000249-KQ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656512150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZLIi4ztmhGQMSsiZRqJz/mEYK9KxeBAMKyqhVKObsw=;
 b=a/NyyWckQtfHB1kpYk1IOyaWK+4199g1IniOtNsW0v3fivDvMtQcC0RkwYaMSqlNNBU7MY
 oUCCuw/6U5n0U/4JycQVD8Koc3Vhm/6SiQUkSMRUsBZYZm+mUJO5w84nHuOY3Rwwxsr/AD
 FJUTcRrDcnZocvZh8NkiuWMVja6AH7A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-AoxynU6EPsS_VUZVdCVdzg-1; Wed, 29 Jun 2022 10:15:46 -0400
X-MC-Unique: AoxynU6EPsS_VUZVdCVdzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46E21384F806;
 Wed, 29 Jun 2022 14:15:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB60C9D63;
 Wed, 29 Jun 2022 14:15:45 +0000 (UTC)
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
Subject: [PATCH v8 09/20] blockjob: rename notifier callbacks as _locked
Date: Wed, 29 Jun 2022 10:15:27 -0400
Message-Id: <20220629141538.3400679-10-eesposit@redhat.com>
In-Reply-To: <20220629141538.3400679-1-eesposit@redhat.com>
References: <20220629141538.3400679-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

They all are called with job_lock held, in job_event_*_locked()

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index 0d59aba439..70952879d8 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -247,7 +247,8 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     return 0;
 }
 
-static void block_job_on_idle(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_on_idle_locked(Notifier *n, void *opaque)
 {
     aio_wait_kick();
 }
@@ -367,7 +368,8 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
     }
 }
 
-static void block_job_event_cancelled(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_cancelled_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     uint64_t progress_current, progress_total;
@@ -386,7 +388,8 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
                                         job->speed);
 }
 
-static void block_job_event_completed(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_completed_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     const char *msg = NULL;
@@ -412,7 +415,8 @@ static void block_job_event_completed(Notifier *n, void *opaque)
                                         msg);
 }
 
-static void block_job_event_pending(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_pending_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
 
@@ -424,7 +428,8 @@ static void block_job_event_pending(Notifier *n, void *opaque)
                                       job->job.id);
 }
 
-static void block_job_event_ready(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_ready_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     uint64_t progress_current, progress_total;
@@ -469,11 +474,11 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     ratelimit_init(&job->limit);
 
-    job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
-    job->finalize_completed_notifier.notify = block_job_event_completed;
-    job->pending_notifier.notify = block_job_event_pending;
-    job->ready_notifier.notify = block_job_event_ready;
-    job->idle_notifier.notify = block_job_on_idle;
+    job->finalize_cancelled_notifier.notify = block_job_event_cancelled_locked;
+    job->finalize_completed_notifier.notify = block_job_event_completed_locked;
+    job->pending_notifier.notify = block_job_event_pending_locked;
+    job->ready_notifier.notify = block_job_event_ready_locked;
+    job->idle_notifier.notify = block_job_on_idle_locked;
 
     notifier_list_add(&job->job.on_finalize_cancelled,
                       &job->finalize_cancelled_notifier);
-- 
2.31.1


