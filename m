Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E34CC168
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:34:36 +0100 (CET)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnTQ-0006xt-1D
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEL-0007Gl-Ec
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEJ-0006AJ-S1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpc3R8sEPhN+MMpQ8Uhq+b/8u32sd2SBoh6gf4ggNvA=;
 b=WzxcOtajE6BIN9C9wgKOsQ04ukhA7P2L+B8K7bTCTSkJsYaWT6FmP4Nunua+LgtCQP0Loj
 M4askGYiwd01yOljWnxfxEGrOxPvbjHkC30meQDNdbjRvRtYIo/K4vvlrexRaAiyVY5hAL
 Mti0N8qqsV/KT2fhHwbffHBXhBbW1MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-_EeUpjbrN8-4CEjrT-iEdA-1; Thu, 03 Mar 2022 10:18:53 -0500
X-MC-Unique: _EeUpjbrN8-4CEjrT-iEdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1CEB51E0;
 Thu,  3 Mar 2022 15:18:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85CBC7BCD7;
 Thu,  3 Mar 2022 15:18:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 18/31] include/block/blockjob.h: global state API
Date: Thu,  3 Mar 2022 10:16:03 -0500
Message-Id: <20220303151616.325444-19-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

blockjob functions run always under the BQL lock.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
2.31.1


