Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D374ADE91
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:46:26 +0100 (CET)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTdJ-0000U1-OL
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:46:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRaz-0003Im-E7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHRap-0008E5-H9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644330930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKK9aLL/p3+u37VL/BNRrvm+Qs2mo2Mq4n90eMm78RQ=;
 b=EkOEsMNqG666z3/dOWIZblRls8Egr1+37ai80iE8IxZTtr/RvsNZSCQLAqtHDAGAHHlpjV
 V9vAET+YxsDCxQSg1WPyHymD7mz2znDE9uxgJx//rUVZ/xsXm3YogJVRnL112HDPE1WaN2
 TU0Fj2XcmeYPbynFXKTTjb1Ag2LCzbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-nPELcQydN5uNI1FKuzQaUw-1; Tue, 08 Feb 2022 09:35:27 -0500
X-MC-Unique: nPELcQydN5uNI1FKuzQaUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F920835B4B;
 Tue,  8 Feb 2022 14:35:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C8E77243E;
 Tue,  8 Feb 2022 14:35:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 06/20] jobs: remove aiocontext locks since the functions
 are under BQL
Date: Tue,  8 Feb 2022 09:34:59 -0500
Message-Id: <20220208143513.1077229-7-eesposit@redhat.com>
In-Reply-To: <20220208143513.1077229-1-eesposit@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation to the job_lock/unlock patch, remove these
aiocontext locks.
The main reason these two locks are removed here is because
they are inside a loop iterating on the jobs list. Once the
job_lock is added, it will have to protect the whole loop,
wrapping also the aiocontext acquire/release.

We don't want this, as job_lock must be taken inside the AioContext
lock, and taking it outside would cause deadlocks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c | 4 ----
 job-qmp.c  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 8cac3d739c..e315466914 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3713,15 +3713,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         BlockJobInfo *value;
-        AioContext *aio_context;
 
         if (block_job_is_internal(job)) {
             continue;
         }
-        aio_context = block_job_get_aio_context(job);
-        aio_context_acquire(aio_context);
         value = block_job_query(job, errp);
-        aio_context_release(aio_context);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
             return NULL;
diff --git a/job-qmp.c b/job-qmp.c
index 829a28aa70..a6774aaaa5 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -173,15 +173,11 @@ JobInfoList *qmp_query_jobs(Error **errp)
 
     for (job = job_next(NULL); job; job = job_next(job)) {
         JobInfo *value;
-        AioContext *aio_context;
 
         if (job_is_internal(job)) {
             continue;
         }
-        aio_context = job->aio_context;
-        aio_context_acquire(aio_context);
         value = job_query_single(job, errp);
-        aio_context_release(aio_context);
         if (!value) {
             qapi_free_JobInfoList(head);
             return NULL;
-- 
2.31.1


