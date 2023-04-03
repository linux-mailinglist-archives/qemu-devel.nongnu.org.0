Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480DB6D5539
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 01:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjTeN-0001Cg-Uq; Mon, 03 Apr 2023 19:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjTeL-0001C9-Ml
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 19:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjTdH-0004nI-FT
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 19:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680564637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tA3XlYA82TA/7gYytK0+kHEr1Nx0u+maq2USH/2zBF4=;
 b=PNlSf+UoKGJ+fKVfOCIzIeqiqyPYAgV2rsjxykGH1GQr/7m3aNGI9PuU7vU+8frZZ0TitE
 NNtLuJ04gS2uSkiQy1CYwPEMrURV5J2Y9sJKS/mX/RIUwl9KE2V7ibmzqTtoM+Yl0AITkL
 GqDiKAdM1nPLYwnWY4UMLe1xjsIS9YY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-tJRQzVa7M6ia0bOtMwFwkA-1; Mon, 03 Apr 2023 19:30:36 -0400
X-MC-Unique: tJRQzVa7M6ia0bOtMwFwkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4E40848B67;
 Mon,  3 Apr 2023 23:30:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D5440C83A9;
 Mon,  3 Apr 2023 23:30:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 eesposit@redhat.com, Peter Lieven <pl@kamp.de>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] block/nfs: avoid BDRV_POLL_WHILE() in
 nfs_co_get_allocated_file_size()
Date: Mon,  3 Apr 2023 19:30:33 -0400
Message-Id: <20230403233033.408120-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 82618d7bc341 ("block: Convert bdrv_get_allocated_file_size() to
co_wrapper") made nfs_get_allocated_file_size() a coroutine. The
coroutine still uses BDRV_POLL_WHILE() to wait for the NFS RPC to
complete.

Take it a step further and yield the coroutine until the RPC completes.
This avoids the blocking, nested event loop and unifies
nfs_co_get_allocated_file_size() with the other coroutine functions that
send RPCs:
- Use nfs_co_init_task() to set up a coroutine NFSRPC task.
- Take client->mutex to protect fd handler state since we're in IO_CODE.
- Use nfs_co_generic_cb() instead of a specialized callback function.
- Yield until the task completes.

Getting rid of BDRV_POLL_WHILE() helps with the multi-queue block layer
effort where we don't want to take the AioContext lock.

This commit passes qemu-iotests/check -nfs, except inactivate-failure,
which also fails before this commit.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nfs.c | 45 +++++++++++++++++----------------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 351dc6ec8d..71062c9b47 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -248,14 +248,18 @@ nfs_co_generic_cb(int ret, struct nfs_context *nfs, void *data,
 {
     NFSRPC *task = private_data;
     task->ret = ret;
-    assert(!task->st);
     if (task->ret > 0 && task->iov) {
+        assert(!task->st);
         if (task->ret <= task->iov->size) {
             qemu_iovec_from_buf(task->iov, 0, data, task->ret);
         } else {
             task->ret = -EIO;
         }
     }
+    if (task->ret == 0 && task->st) {
+        assert(!task->iov);
+        memcpy(task->st, data, sizeof(struct stat));
+    }
     if (task->ret < 0) {
         error_report("NFS Error: %s", nfs_get_error(nfs));
     }
@@ -713,29 +717,10 @@ static int nfs_has_zero_init(BlockDriverState *bs)
 }
 
 #if !defined(_WIN32)
-/* Called (via nfs_service) with QemuMutex held.  */
-static void
-nfs_get_allocated_file_size_cb(int ret, struct nfs_context *nfs, void *data,
-                               void *private_data)
-{
-    NFSRPC *task = private_data;
-    task->ret = ret;
-    if (task->ret == 0) {
-        memcpy(task->st, data, sizeof(struct stat));
-    }
-    if (task->ret < 0) {
-        error_report("NFS Error: %s", nfs_get_error(nfs));
-    }
-
-    /* Set task->complete before reading bs->wakeup.  */
-    qatomic_mb_set(&task->complete, 1);
-    bdrv_wakeup(task->bs);
-}
-
 static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
 {
     NFSClient *client = bs->opaque;
-    NFSRPC task = {0};
+    NFSRPC task;
     struct stat st;
 
     if (bdrv_is_read_only(bs) &&
@@ -743,15 +728,19 @@ static int64_t coroutine_fn nfs_co_get_allocated_file_size(BlockDriverState *bs)
         return client->st_blocks * 512;
     }
 
-    task.bs = bs;
+    nfs_co_init_task(bs, &task);
     task.st = &st;
-    if (nfs_fstat_async(client->context, client->fh, nfs_get_allocated_file_size_cb,
-                        &task) != 0) {
-        return -ENOMEM;
-    }
+    WITH_QEMU_LOCK_GUARD(&client->mutex) {
+        if (nfs_fstat_async(client->context, client->fh, nfs_co_generic_cb,
+                            &task) != 0) {
+            return -ENOMEM;
+        }
 
-    nfs_set_events(client);
-    BDRV_POLL_WHILE(bs, !task.complete);
+        nfs_set_events(client);
+    }
+    while (!task.complete) {
+        qemu_coroutine_yield();
+    }
 
     return (task.ret < 0 ? task.ret : st.st_blocks * 512);
 }
-- 
2.39.2


