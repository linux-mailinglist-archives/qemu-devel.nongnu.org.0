Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025BA387642
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:15:34 +0200 (CEST)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwlB-0004AI-2S
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweF-0002tR-Iu
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweD-0007hF-BX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DbdcXoXCJGjezvlQj1alpxoSnh3a9pgSnLpwfxFi1c=;
 b=PWxTD/oHuWOn3S7VuPco1Z/A/W5eLIthhNF9X3B+TpfkR2A0p58T6ShX6VM/OaTLo3CtCg
 b4IZxJUEEo+O1ADKNRettIp4Zt3h8Kvwvqcp6qAQ+On+sYiHOli0uNBeRq4pZmL8v7Sg07
 6s9CQM12YOPAQpW57X4SqGQ069uOrlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-YCh4mNp0P5Gzi4aRPHuH_g-1; Tue, 18 May 2021 06:08:19 -0400
X-MC-Unique: YCh4mNp0P5Gzi4aRPHuH_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C9631936B6C;
 Tue, 18 May 2021 10:08:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33B05781E2;
 Tue, 18 May 2021 10:08:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/7] block-copy: improve documentation of BlockCopyTask and
 BlockCopyState types and functions
Date: Tue, 18 May 2021 12:07:52 +0200
Message-Id: <20210518100757.31243-3-eesposit@redhat.com>
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
References: <20210518100757.31243-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As done in BlockCopyCallState, categorize BlockCopyTask
and BlockCopyState in IN, State and OUT fields.
This is just to understand which field has to be protected with a lock.

BlockCopyTask .zeroes is a special case, because it is only initialized
and then read by the coroutine in block_copy_task_entry.

Also set block_copy_task_create as coroutine_fn because:
1) it is static and only invoked by coroutine functions
2) next patches will introduce and use a CoMutex lock there

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 49 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 10ce51a244..d2d3839dec 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -67,13 +67,28 @@ typedef struct BlockCopyCallState {
 typedef struct BlockCopyTask {
     AioTask task;
 
+    /*
+     * IN parameters. Initialized in block_copy_task_create()
+     * and never changed.
+     */
     BlockCopyState *s;
     BlockCopyCallState *call_state;
     int64_t offset;
-    int64_t bytes;
+    int64_t bytes; /* only re-set in task_shrink, before running the task */
+
+    /*
+     * "local" parameter: used only to communicate between
+     * the caller (block_copy_dirty_clusters) and the aiotask
+     * coroutine running block_copy_task_entry
+     */
     bool zeroes;
-    QLIST_ENTRY(BlockCopyTask) list;
+
+    /* State */
     CoQueue wait_queue; /* coroutines blocked on this task */
+
+    /* To reference all call states from BlockCopyState */
+    QLIST_ENTRY(BlockCopyTask) list;
+
 } BlockCopyTask;
 
 static int64_t task_end(BlockCopyTask *task)
@@ -89,15 +104,25 @@ typedef struct BlockCopyState {
      */
     BdrvChild *source;
     BdrvChild *target;
-    BdrvDirtyBitmap *copy_bitmap;
+
+    /* State */
     int64_t in_flight_bytes;
-    int64_t cluster_size;
     BlockCopyMethod method;
-    int64_t max_transfer;
-    uint64_t len;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QLIST_HEAD(, BlockCopyCallState) calls;
+    /* State fields that use a thread-safe API */
+    BdrvDirtyBitmap *copy_bitmap;
+    ProgressMeter *progress;
+    SharedResource *mem;
+    RateLimit rate_limit;
 
+    /*
+     * IN parameters. Initialized in block_copy_state_new()
+     * and never changed.
+     */
+    int64_t cluster_size;
+    int64_t max_transfer;
+    uint64_t len;
     BdrvRequestFlags write_flags;
 
     /*
@@ -115,12 +140,6 @@ typedef struct BlockCopyState {
      * block_copy_reset_unallocated() every time it does.
      */
     bool skip_unallocated;
-
-    ProgressMeter *progress;
-
-    SharedResource *mem;
-
-    RateLimit rate_limit;
 } BlockCopyState;
 
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
@@ -176,9 +195,9 @@ static inline int64_t block_copy_chunk_size(BlockCopyState *s)
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
  */
-static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
-                                             BlockCopyCallState *call_state,
-                                             int64_t offset, int64_t bytes)
+static coroutine_fn BlockCopyTask *block_copy_task_create(BlockCopyState *s,
+                                                BlockCopyCallState *call_state,
+                                                int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
     int64_t max_chunk = block_copy_chunk_size(s);
-- 
2.30.2


