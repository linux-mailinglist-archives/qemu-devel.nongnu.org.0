Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E2521DED
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:16:25 +0200 (CEST)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRb6-000718-NO
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1noRW5-0000AH-Vy
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1noRW3-0002ox-97
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652195470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfoIFrxu+5MlSYRXI6HehGB0WDw/rAF+N9LSQNJ9/dM=;
 b=Sq3tPytzab39Zx/D7BpTD4xppC+MUdDvmnB4xZg+s8fxD92aUVJJlaOSQ/u47PIjN3XgLB
 H1HTscrDMVrzGaKDuRD5DOqSG2CK12SzoawGl9tASIsUP0g4cUpazRqKpvoum/0m77809G
 FWvOGYyAxlz993ruPSm8XfL9qPbq1Ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-mMPoL2bqOdaFE5ZhElvZ6Q-1; Tue, 10 May 2022 11:11:05 -0400
X-MC-Unique: mMPoL2bqOdaFE5ZhElvZ6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F1C381B547;
 Tue, 10 May 2022 15:11:02 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 164E89E78;
 Tue, 10 May 2022 15:11:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, hnarukaw@yahoo-corp.jp,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: [PATCH 2/2] coroutine: Revert to constant batch size
Date: Tue, 10 May 2022 17:10:20 +0200
Message-Id: <20220510151020.105528-3-kwolf@redhat.com>
In-Reply-To: <20220510151020.105528-1-kwolf@redhat.com>
References: <20220510151020.105528-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Commit 4c41c69e changed the way the coroutine pool is sized because for
virtio-blk devices with a large queue size and heavy I/O, it was just
too small and caused coroutines to be deleted and reallocated soon
afterwards. The change made the size dynamic based on the number of
queues and the queue size of virtio-blk devices.

There are two important numbers here: Slightly simplified, when a
coroutine terminates, it is generally stored in the global release pool
up to a certain pool size, and if the pool is full, it is freed.
Conversely, when allocating a new coroutine, the coroutines in the
release pool are reused if the pool already has reached a certain
minimum size (the batch size), otherwise we allocate new coroutines.

The problem after commit 4c41c69e is that it not only increases the
maximum pool size (which is the intended effect), but also the batch
size for reusing coroutines (which is a bug). It means that in cases
with many devices and/or a large queue size (which defaults to the
number of vcpus for virtio-blk-pci), many thousand coroutines could be
sitting in the release pool without being reused.

This is not only a waste of memory and allocations, but it actually
makes the QEMU process likely to hit the vm.max_map_count limit on Linux
because each coroutine requires two mappings (its stack and the guard
page for the stack), causing it to abort() in qemu_alloc_stack() because
when the limit is hit, mprotect() starts to fail with ENOMEM.

In order to fix the problem, change the batch size back to 64 to avoid
uselessly accumulating coroutines in the release pool, but keep the
dynamic maximum pool size so that coroutines aren't freed too early
in heavy I/O scenarios.

Note that this fix doesn't strictly make it impossible to hit the limit,
but this would only happen if most of the coroutines are actually in use
at the same time, not just sitting in a pool. This is the same behaviour
as we already had before commit 4c41c69e. Fully preventing this would
require allowing qemu_coroutine_create() to return an error, but it
doesn't seem to be a scenario that people hit in practice.

Cc: qemu-stable@nongnu.org
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2079938
Fixes: 4c41c69e05fe28c0f95f8abd2ebf407e95a4f04b
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/qemu-coroutine.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index ea23929a74..4a8bd63ef0 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -21,14 +21,20 @@
 #include "qemu/coroutine-tls.h"
 #include "block/aio.h"
 
-/** Initial batch size is 64, and is increased on demand */
+/**
+ * The minimal batch size is always 64, coroutines from the release_pool are
+ * reused as soon as there are 64 coroutines in it. The maximum pool size starts
+ * with 64 and is increased on demand so that coroutines are not deleted even if
+ * they are not immediately reused.
+ */
 enum {
-    POOL_INITIAL_BATCH_SIZE = 64,
+    POOL_MIN_BATCH_SIZE = 64,
+    POOL_INITIAL_MAX_SIZE = 64,
 };
 
 /** Free list to speed up creation */
 static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
-static unsigned int pool_batch_size = POOL_INITIAL_BATCH_SIZE;
+static unsigned int pool_max_size = POOL_INITIAL_MAX_SIZE;
 static unsigned int release_pool_size;
 
 typedef QSLIST_HEAD(, Coroutine) CoroutineQSList;
@@ -57,7 +63,7 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
 
         co = QSLIST_FIRST(alloc_pool);
         if (!co) {
-            if (release_pool_size > qatomic_read(&pool_batch_size)) {
+            if (release_pool_size > POOL_MIN_BATCH_SIZE) {
                 /* Slow path; a good place to register the destructor, too.  */
                 Notifier *notifier = get_ptr_coroutine_pool_cleanup_notifier();
                 if (!notifier->notify) {
@@ -95,12 +101,12 @@ static void coroutine_delete(Coroutine *co)
     co->caller = NULL;
 
     if (CONFIG_COROUTINE_POOL) {
-        if (release_pool_size < qatomic_read(&pool_batch_size) * 2) {
+        if (release_pool_size < qatomic_read(&pool_max_size) * 2) {
             QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
             qatomic_inc(&release_pool_size);
             return;
         }
-        if (get_alloc_pool_size() < qatomic_read(&pool_batch_size)) {
+        if (get_alloc_pool_size() < qatomic_read(&pool_max_size)) {
             QSLIST_INSERT_HEAD(get_ptr_alloc_pool(), co, pool_next);
             set_alloc_pool_size(get_alloc_pool_size() + 1);
             return;
@@ -214,10 +220,10 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
 
 void qemu_coroutine_inc_pool_size(unsigned int additional_pool_size)
 {
-    qatomic_add(&pool_batch_size, additional_pool_size);
+    qatomic_add(&pool_max_size, additional_pool_size);
 }
 
 void qemu_coroutine_dec_pool_size(unsigned int removing_pool_size)
 {
-    qatomic_sub(&pool_batch_size, removing_pool_size);
+    qatomic_sub(&pool_max_size, removing_pool_size);
 }
-- 
2.35.3


