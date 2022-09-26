Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6B5E9E19
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 11:43:45 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ockeN-00073i-Vz
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 05:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTf-0004t3-SD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ockTV-0000IY-MS
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664184747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGVA3ktwx9v2Ova5wax/U1mwlhKzuntiarETSGroatY=;
 b=N4s82WpzlUhEtLXHIVd+mHIZZwuuCwS8aBvz6z9M3BXHP9H8z0QKMnXNlgcWjm6FJ1muES
 D8+gN8BmDnZQQj7kTzCIpUaGVtZMqcy+1PcJzM7kxER+beGaqhi0JPedxoXW2dlzLeEraC
 jXf5dKNEo0rBOJmhdicILBEwiVw6NOE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-1VLXV0ihOpKphHWXyzWTiQ-1; Mon, 26 Sep 2022 05:32:23 -0400
X-MC-Unique: 1VLXV0ihOpKphHWXyzWTiQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C52F180074D;
 Mon, 26 Sep 2022 09:32:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA65A4B3FC8;
 Mon, 26 Sep 2022 09:32:22 +0000 (UTC)
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
Subject: [PATCH v12 14/21] blockjob.h: categorize fields in struct BlockJob
Date: Mon, 26 Sep 2022 05:32:07 -0400
Message-Id: <20220926093214.506243-15-eesposit@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 include/block/blockjob.h | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 8b65d3949d..10c24e240a 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -40,21 +40,38 @@ typedef struct BlockJobDriver BlockJobDriver;
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
 
-    /** Speed that was set with @block_job_set_speed.  */
+    /**
+     * Speed that was set with @block_job_set_speed.
+     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
+     */
     int64_t speed;
 
-    /** Rate limiting data structure for implementing @speed. */
+    /**
+     * Rate limiting data structure for implementing @speed.
+     * RateLimit API is thread-safe.
+     */
     RateLimit limit;
 
-    /** Block other operations when block job is running */
+    /**
+     * Block other operations when block job is running.
+     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
+     */
     Error *blocker;
 
+    /** All notifiers are set once in block_job_create() and never modified. */
+
     /** Called when a cancelled job is finalised. */
     Notifier finalize_cancelled_notifier;
 
@@ -70,7 +87,10 @@ typedef struct BlockJob {
     /** Called when the job coroutine yields or terminates */
     Notifier idle_notifier;
 
-    /** BlockDriverStates that are involved in this block job */
+    /**
+     * BlockDriverStates that are involved in this block job.
+     * Always modified and read under QEMU global mutex (GLOBAL_STATE_CODE).
+     */
     GSList *nodes;
 } BlockJob;
 
-- 
2.31.1


