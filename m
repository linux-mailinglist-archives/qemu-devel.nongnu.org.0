Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62F48556F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:07:30 +0100 (CET)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57sv-0001Sf-Bt
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:07:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sk-0000Hv-ER
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n56sb-0007O7-OV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641391385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/ypJPqsKZBwcX4ZTuN9cITCyT5OXf4VlHCs1AlxneI=;
 b=harLyN4BzVj8VNyEtM2DM3q/9YFfVKRl95ouDojru5MM0riYBoeNmTCQnBINaaXxJt6/Ex
 XkVONagV1wD6UkmRgxY/pKC5KbA5z5Y2GjhIWh/9KsGs9rhRTFI3gu/fbLVGChUAp9NToZ
 b1Qzp0ze8JImxMGt217Ntp0cD5pafSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-Zn25ye9eO6G9PlD8O2UKAQ-1; Wed, 05 Jan 2022 09:03:02 -0500
X-MC-Unique: Zn25ye9eO6G9PlD8O2UKAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A0093942;
 Wed,  5 Jan 2022 14:02:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F08B2B4CF;
 Wed,  5 Jan 2022 14:02:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 09/16] jobs: remove aiocontext locks since the functions
 are under BQL
Date: Wed,  5 Jan 2022 09:02:01 -0500
Message-Id: <20220105140208.365608-10-eesposit@redhat.com>
In-Reply-To: <20220105140208.365608-1-eesposit@redhat.com>
References: <20220105140208.365608-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We don't want this, as job_lock can only be *wrapped by*
the aiocontext lock, and not vice-versa, to avoid deadlocks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c | 4 ----
 job-qmp.c  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 11fd651bde..ee35aff13a 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3707,15 +3707,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         BlockJobInfo *value;
-        AioContext *aio_context;
 
         if (block_job_is_internal(job)) {
             continue;
         }
-        aio_context = blk_get_aio_context(job->blk);
-        aio_context_acquire(aio_context);
         value = block_job_query(job, errp);
-        aio_context_release(aio_context);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
             return NULL;
diff --git a/job-qmp.c b/job-qmp.c
index de4120a1d4..f6f9840436 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -173,15 +173,11 @@ JobInfoList *qmp_query_jobs(Error **errp)
 
     for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
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


