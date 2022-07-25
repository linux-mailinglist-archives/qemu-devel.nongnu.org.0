Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0C57FB0C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 10:14:09 +0200 (CEST)
Received: from localhost ([::1]:39576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFtE3-0006sR-B7
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 04:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFsgS-0004L4-CU
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFsgI-0003G3-K4
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 03:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658734749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LM9s2f6eUF43PxjCV18hv9qLtt4l9RfLQtWPgCDMmbQ=;
 b=HFN4AXnVAzk/SvB1cHB9Txp7vHY/mK5ZSEGWQgaOPIXm8tyG4MMgXxC3Qh9JCIzUWXZL53
 IdyPS/a21dr13Zl+5QNpmGS9v578PlaMvpBmoDr4F9pGrKXYGwdD4opKQk+5TsXInu7tX5
 3pDVyfK0ml0D2X96Tsju3vLffYm1P/w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-dxosgcrYNoiS8FsJUT7NuA-1; Mon, 25 Jul 2022 03:39:05 -0400
X-MC-Unique: dxosgcrYNoiS8FsJUT7NuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AA951032963;
 Mon, 25 Jul 2022 07:39:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2172166B26;
 Mon, 25 Jul 2022 07:39:04 +0000 (UTC)
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
Subject: [PATCH v10 15/21] blockjob.h: categorize fields in struct BlockJob
Date: Mon, 25 Jul 2022 03:38:49 -0400
Message-Id: <20220725073855.76049-16-eesposit@redhat.com>
In-Reply-To: <20220725073855.76049-1-eesposit@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

The same job lock is being used also to protect some of blockjob fields.
Categorize them just as done in job.h.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/blockjob.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 8b65d3949d..912e10b083 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -40,10 +40,16 @@ typedef struct BlockJobDriver BlockJobDriver;
  * Long-running operation on a BlockDriverState.
  */
 typedef struct BlockJob {
-    /** Data belonging to the generic Job infrastructure */
+    /**
+     * Data belonging to the generic Job infrastructure.
+     * Protected by job mutex.
+     */
     Job job;
 
-    /** Status that is published by the query-block-jobs QMP API */
+    /**
+     * Status that is published by the query-block-jobs QMP API.
+     * Protected by job mutex.
+     */
     BlockDeviceIoStatus iostatus;
 
     /** Speed that was set with @block_job_set_speed.  */
@@ -55,6 +61,8 @@ typedef struct BlockJob {
     /** Block other operations when block job is running */
     Error *blocker;
 
+    /** All notifiers are set once in block_job_create() and never modified. */
+
     /** Called when a cancelled job is finalised. */
     Notifier finalize_cancelled_notifier;
 
@@ -70,7 +78,10 @@ typedef struct BlockJob {
     /** Called when the job coroutine yields or terminates */
     Notifier idle_notifier;
 
-    /** BlockDriverStates that are involved in this block job */
+    /**
+     * BlockDriverStates that are involved in this block job.
+     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE)
+     */
     GSList *nodes;
 } BlockJob;
 
-- 
2.31.1


