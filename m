Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D05E9E11
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:41:36 +0200 (CEST)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ockcI-0001BC-TV
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTf-0004sR-Of
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTV-0000Ic-HE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hyiHSQ1Qhc+b3VG5PI5DaHdlddCPX69P03EqLQU2C0=;
 b=KySPBlrDBJSAzt5NO5a1rR/zwHqzmvL45oRmjrS3DjGjsn8LO/ZHo86Tmb1hwIqVa0flB7
 QpidNF5ay7VBQCgqZOatWIAkwg++mb0uSAI46LYIaK7QC2OAi67HKrIYxrkGphANX56Rbp
 p7PCfN0RiQUmAQo4OFDtPs/OzMACAIc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-LOapucXaPUqoVmMZMuLg3g-1; Mon, 26 Sep 2022 05:32:24 -0400
X-MC-Unique: LOapucXaPUqoVmMZMuLg3g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B4561C05AF3;
 Mon, 26 Sep 2022 09:32:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 342994B3FC6;
 Mon, 26 Sep 2022 09:32:23 +0000 (UTC)
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
Subject: [PATCH v12 15/21] blockjob: rename notifier callbacks as _locked
Date: Mon, 26 Sep 2022 05:32:08 -0400
Message-Id: <20220926093214.506243-16-eesposit@redhat.com>
In-Reply-To: <20220926093214.506243-1-eesposit@redhat.com>
References: <20220926093214.506243-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


