Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F05F1089
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:10:15 +0200 (CEST)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJWg-000238-85
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFs-0006g7-7X
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFq-0006gF-1L
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94mQ6MvpdlUf4Z02g1zIymucwp0QBlCPiasoMcG5Bug=;
 b=Hx8Gl7DOhP8HMQAthJQxxTaa98dMRxDN3B8+t6o8Si4sIYzY8B6RN7VQJlTlU/ww0KsxD+
 0wcWEyVgXPEFpKY/cb8wYvdqQrd3z9YOyunrB+aVruDLFhdlBSfNTLg+DuZ/OtFEVFoRLx
 1Y3d2Jl+eUGwlcJEy8sBNt/gIxnZ6P0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-cFJ1JLTJNwO-89vbKhIcBQ-1; Fri, 30 Sep 2022 12:52:46 -0400
X-MC-Unique: cFJ1JLTJNwO-89vbKhIcBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD1EB882824;
 Fri, 30 Sep 2022 16:52:45 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17FA817582;
 Fri, 30 Sep 2022 16:52:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 12/18] block: move bdrv_qiov_is_aligned to file-posix
Date: Fri, 30 Sep 2022 18:52:16 +0200
Message-Id: <20220930165222.249716-13-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

From: Keith Busch <kbusch@kernel.org>

There is only user of bdrv_qiov_is_aligned(), so move the alignment
function to there and make it static.

Signed-off-by: Keith Busch <kbusch@kernel.org>
Message-Id: <20220929200523.3218710-2-kbusch@meta.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h |  1 -
 block/file-posix.c       | 21 +++++++++++++++++++++
 block/io.c               | 21 ---------------------
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index fd25ffa9be..492f95fc05 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -150,7 +150,6 @@ void *qemu_blockalign(BlockDriverState *bs, size_t size);
 void *qemu_blockalign0(BlockDriverState *bs, size_t size);
 void *qemu_try_blockalign(BlockDriverState *bs, size_t size);
 void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
-bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov);
 
 void bdrv_enable_copy_on_read(BlockDriverState *bs);
 void bdrv_disable_copy_on_read(BlockDriverState *bs);
diff --git a/block/file-posix.c b/block/file-posix.c
index 256de1f456..989dfc4586 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2061,6 +2061,27 @@ static int coroutine_fn raw_thread_pool_submit(BlockDriverState *bs,
     return thread_pool_submit_co(pool, func, arg);
 }
 
+/*
+ * Check if all memory in this vector is sector aligned.
+ */
+static bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
+{
+    int i;
+    size_t alignment = bdrv_min_mem_align(bs);
+    IO_CODE();
+
+    for (i = 0; i < qiov->niov; i++) {
+        if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
+            return false;
+        }
+        if (qiov->iov[i].iov_len % alignment) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
                                    uint64_t bytes, QEMUIOVector *qiov, int type)
 {
diff --git a/block/io.c b/block/io.c
index 51d8f943a4..c3200bcdff 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3227,27 +3227,6 @@ void *qemu_try_blockalign0(BlockDriverState *bs, size_t size)
     return mem;
 }
 
-/*
- * Check if all memory in this vector is sector aligned.
- */
-bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
-{
-    int i;
-    size_t alignment = bdrv_min_mem_align(bs);
-    IO_CODE();
-
-    for (i = 0; i < qiov->niov; i++) {
-        if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
-            return false;
-        }
-        if (qiov->iov[i].iov_len % alignment) {
-            return false;
-        }
-    }
-
-    return true;
-}
-
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
-- 
2.37.3


