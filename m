Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497F49F951
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 13:22:53 +0100 (CET)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDQHE-0001Gx-L4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 07:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmU-0004b1-Nv
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDPmP-0003SL-VZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 06:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643370657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTC6hAOkNVf4r3kj2csR/6UgeLJRKD1qOcAFfv0Ui8g=;
 b=H9/bzNAg+JuYvzZBKXPu514392pXmqnIqUKQqkXcfRUMmCKNISn6+3CpswCHtH+VClgTkc
 4eTcwgMwz+VnugdML4JY1aGwjeWHn3gg+t3LbmdSbSTjJxhOBExEMe3EPKmLElV+DfsIOh
 AseA8bRCgIeO91hJBf/IdUGaiWM3L94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-WTa3g2JiPOSpA1Gt4GidLQ-1; Fri, 28 Jan 2022 06:50:51 -0500
X-MC-Unique: WTa3g2JiPOSpA1Gt4GidLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FFB71083F60;
 Fri, 28 Jan 2022 11:50:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A66A1F478;
 Fri, 28 Jan 2022 11:50:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 14/19] blockjob: block_job_get_aio_context is a GS function
Date: Fri, 28 Jan 2022 06:50:26 -0500
Message-Id: <20220128115031.4061565-15-eesposit@redhat.com>
In-Reply-To: <20220128115031.4061565-1-eesposit@redhat.com>
References: <20220128115031.4061565-1-eesposit@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Move block_job_get_aio_context under the GS category in blockjob.h,
as it is always called with the BQL held.

This is done also to simplify the coming job->aiocontext protection.

For more infos about the GS API, see include/block/block-global-state.h

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockjob.c               |  1 +
 include/block/blockjob.h | 15 ++++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index a6c94b6b64..04d868f020 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -568,5 +568,6 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
 
 AioContext *block_job_get_aio_context(BlockJob *job)
 {
+    assert(qemu_in_main_thread());
     return job->job.aio_context;
 }
diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index a9a6cf2b84..376cd95877 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -169,6 +169,14 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp);
  */
 void block_job_iostatus_reset_locked(BlockJob *job);
 
+/*
+ * block_job_get_aio_context:
+ *
+ * Returns aio context associated with a block job.
+ */
+AioContext *block_job_get_aio_context(BlockJob *job);
+
+
 /* Common functions that are neither I/O nor Global State */
 
 /**
@@ -186,11 +194,4 @@ bool block_job_is_internal(BlockJob *job);
  */
 const BlockJobDriver *block_job_driver(BlockJob *job);
 
-/*
- * block_job_get_aio_context:
- *
- * Returns aio context associated with a block job.
- */
-AioContext *block_job_get_aio_context(BlockJob *job);
-
 #endif
-- 
2.31.1


