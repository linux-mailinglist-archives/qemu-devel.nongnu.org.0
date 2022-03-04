Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BD4CDA56
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:26:50 +0100 (CET)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBhZ-0001Kt-AC
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB65-0005eC-0X
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB60-0007UX-KK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHc8xBASAbywGQixccorwipTQ4NdBP65CwGhspRJUmE=;
 b=WKYI7furyVJ1nSuhlMm+DOhqHA4yf9uBklAPjnd96E4xaNj0WxZhoYBVMjd4Y96iPECTtT
 BGpKgklnisGVVcXtSQXHUSDLncMuOSd1YGg5wIFbB8Au7FTbOthfT5T5LbMluLc0nsV0Hy
 v4L2OOPhGsvlOTns/Sdr3IUi79m3JVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-DIUqHvSzMEKNhxX28mt2hQ-1; Fri, 04 Mar 2022 11:47:59 -0500
X-MC-Unique: DIUqHvSzMEKNhxX28mt2hQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F081FC82;
 Fri,  4 Mar 2022 16:47:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 119EA8547C;
 Fri,  4 Mar 2022 16:47:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 31/50] include/block/blockjob.h: global state API
Date: Fri,  4 Mar 2022 17:46:52 +0100
Message-Id: <20220304164711.474713-32-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

blockjob functions run always under the BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-19-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/blockjob.h | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 87fbb3985f..6525e16fd5 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -74,6 +74,13 @@ typedef struct BlockJob {
     GSList *nodes;
 } BlockJob;
 
+/*
+ * Global state (GS) API. These functions run under the BQL.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
 /**
  * block_job_next:
  * @job: A block job, or %NULL.
@@ -155,6 +162,21 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
  */
 void block_job_iostatus_reset(BlockJob *job);
 
+/*
+ * block_job_get_aio_context:
+ *
+ * Returns aio context associated with a block job.
+ */
+AioContext *block_job_get_aio_context(BlockJob *job);
+
+
+/*
+ * Common functions that are neither I/O nor Global State.
+ *
+ * See include/block/block-common.h for more information about
+ * the Common API.
+ */
+
 /**
  * block_job_is_internal:
  * @job: The job to determine if it is user-visible or not.
@@ -170,11 +192,4 @@ bool block_job_is_internal(BlockJob *job);
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
2.35.1


