Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E492A4400CF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:58:03 +0200 (CEST)
Received: from localhost ([::1]:54492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVCd-0001Fu-1J
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvU-00070w-89
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvQ-0004Dh-EO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p94Yp9hT0ZiVop2XyugpJj2jnVtBOkeJM12bjvwGUWE=;
 b=hLS8+1+TmcjdHYD+K0b0ytCNqi5hi4SGbGMxoem25BomWiIvG0lc2OTHMvTt6xXUhmkyre
 Fcrz4ZUT6RIJxrKX+VFpTvktmZXvQTtQ41rHmQB49nN2hoibZn2hY2JSjwESaaXM6pVWvK
 m3YEashWCHg1wgY7Ip40Hims+qq46iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-UJNhWfrTOte2bzvJXMjJGg-1; Fri, 29 Oct 2021 12:39:48 -0400
X-MC-Unique: UJNhWfrTOte2bzvJXMjJGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA0910A8E00;
 Fri, 29 Oct 2021 16:39:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E99669117;
 Fri, 29 Oct 2021 16:39:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 11/15] jobs: remove aiocontext locks since the functions
 are under BQL
Date: Fri, 29 Oct 2021 12:39:10 -0400
Message-Id: <20211029163914.4044794-12-eesposit@redhat.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index d9bf842a81..67b55eec11 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3719,15 +3719,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 
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
2.27.0


