Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6E5F77B0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:52:27 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglty-0000Jr-LH
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuN-0005xn-VY
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuM-0003JA-6f
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7QNLuesQeEoRs6rSiuaAvoqBv/q1X7S0r9g2GM3nvfg=;
 b=gwY3FxaiuJp/8UKpoGZMjCY2JnOMOw9S7owiHVItsp1b7yCiOj3iowk62l67crxQp/sVZ7
 7YBDMUaXo3KWm+cQZjA2IQert3ZJwRuPt1CwwjcDSoPTp/lLSPh+e4ckCbnJa0S5uLMT7K
 jAtc29A9TsT0/141HbrIadJAkD2W9Fc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-6o5AsN4yNP-ICDyYjlHOTA-1; Fri, 07 Oct 2022 06:48:42 -0400
X-MC-Unique: 6o5AsN4yNP-ICDyYjlHOTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D3A895E3A8;
 Fri,  7 Oct 2022 10:48:42 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FDF2024CBB;
 Fri,  7 Oct 2022 10:48:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 42/50] blockjob.h: categorize fields in struct BlockJob
Date: Fri,  7 Oct 2022 12:47:44 +0200
Message-Id: <20221007104752.141361-43-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

The same job lock is being used also to protect some of blockjob fields.
Categorize them just as done in job.h.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220926093214.506243-15-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.37.3


