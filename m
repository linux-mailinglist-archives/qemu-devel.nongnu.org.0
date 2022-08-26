Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9B5A28B2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:37:06 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZWD-000231-9G
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH6-0000x0-I7
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGw-0003z7-97
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hyiHSQ1Qhc+b3VG5PI5DaHdlddCPX69P03EqLQU2C0=;
 b=JrG0CjIBNIF+sJNyL+Hz5lJPUYGINXyRlmJleUDBClJAliyQTD2VyXH6yGRadpO/nLsEHQ
 uohstzfhKmJX7fcP6SFkXxBSoXVMDCxvlJsTnAMScYusmsIhY0nTNXnpwXKaePWVrY5huf
 Gz/RBFwiVxZk6zWtsxg0LiMj6BXeiqo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-7j-Dt6gQMum_yZLDmex7lg-1; Fri, 26 Aug 2022 09:21:14 -0400
X-MC-Unique: 7j-Dt6gQMum_yZLDmex7lg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EEC61C006B4;
 Fri, 26 Aug 2022 13:21:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38546492C3B;
 Fri, 26 Aug 2022 13:21:13 +0000 (UTC)
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
Subject: [PATCH v11 15/21] blockjob: rename notifier callbacks as _locked
Date: Fri, 26 Aug 2022 09:20:58 -0400
Message-Id: <20220826132104.3678958-16-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They all are called with job_lock held, in job_event_*_locked()

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 blockjob.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index c8919cef9b..d8fb5311c7 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -250,7 +250,8 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     return 0;
 }
 
-static void block_job_on_idle(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_on_idle_locked(Notifier *n, void *opaque)
 {
     aio_wait_kick();
 }
@@ -370,7 +371,8 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
     }
 }
 
-static void block_job_event_cancelled(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_cancelled_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     uint64_t progress_current, progress_total;
@@ -389,7 +391,8 @@ static void block_job_event_cancelled(Notifier *n, void *opaque)
                                         job->speed);
 }
 
-static void block_job_event_completed(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_completed_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     const char *msg = NULL;
@@ -415,7 +418,8 @@ static void block_job_event_completed(Notifier *n, void *opaque)
                                         msg);
 }
 
-static void block_job_event_pending(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_pending_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
 
@@ -427,7 +431,8 @@ static void block_job_event_pending(Notifier *n, void *opaque)
                                       job->job.id);
 }
 
-static void block_job_event_ready(Notifier *n, void *opaque)
+/* Called with job_mutex lock held. */
+static void block_job_event_ready_locked(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     uint64_t progress_current, progress_total;
@@ -472,11 +477,11 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
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
 
     WITH_JOB_LOCK_GUARD() {
         notifier_list_add(&job->job.on_finalize_cancelled,
-- 
2.31.1


