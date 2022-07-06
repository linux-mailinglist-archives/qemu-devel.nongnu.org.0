Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99518569450
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:26:55 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CXu-00068N-Ku
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRH-0005GA-NV
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:16:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRA-0007GN-H8
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657138551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AICUR11mJP12YcK3yFvDVJ4upsdLDQ4EKYHAZc0vS+M=;
 b=HSSAS0Tn3KeSfAOlqsT5FCZIC5XT6Y+mxfh6G3kWBSuGPFait+o3FTrGnUOba4YRJ0QjHE
 aAF4j9SXWr2KdySCTCpCT+jtipuoEy5P2Kt7T9V/fi6ysiHLaBlpfEsuz53vVslCkNdxU1
 Y+aURQyyZGXOKTvd3XceNlQhYy7rLd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-0UVMiPhyMmSkk6jdwV-O5A-1; Wed, 06 Jul 2022 16:15:48 -0400
X-MC-Unique: 0UVMiPhyMmSkk6jdwV-O5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D21D8339CA;
 Wed,  6 Jul 2022 20:15:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCFB41121315;
 Wed,  6 Jul 2022 20:15:47 +0000 (UTC)
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
Subject: [PATCH v9 17/21] blockjob.h: categorize fields in struct BlockJob
Date: Wed,  6 Jul 2022 16:15:29 -0400
Message-Id: <20220706201533.289775-18-eesposit@redhat.com>
In-Reply-To: <20220706201533.289775-1-eesposit@redhat.com>
References: <20220706201533.289775-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


