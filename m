Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9666F6AAA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:00:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXb3-00034s-R4; Thu, 04 May 2023 07:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb2-00034k-BG
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXb0-0004AH-PJ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3Zbn8tJ/b081MbWgYZPkFNrkxwQdGfuG401p2h3/Ps=;
 b=TFBYkiIv9IxZRxTIn2xM+bs3RexJjiis1GqUEPWWCimmPjjm1ZiYwKZQ6fkF/vRBwqM9b7
 yARWcuS/xYH+KuZEXM/X0BxfpoLUaYA0LxiOmxe9vITtbpxzqwhuRIfevS6CfVnMqSWihG
 +CGuuBDE0QFssSOYU/YtbNPht+klyg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-Hadxg4-FOsm-QTcyMSWZCA-1; Thu, 04 May 2023 07:58:00 -0400
X-MC-Unique: Hadxg4-FOsm-QTcyMSWZCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 117FC1C0758D;
 Thu,  4 May 2023 11:58:00 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F182AC15BAD;
 Thu,  4 May 2023 11:57:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 01/20] qcow2: Don't call bdrv_getlength() in coroutine_fns
Date: Thu,  4 May 2023 13:57:31 +0200
Message-Id: <20230504115750.54437-2-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

There is a bdrv_co_getlength() now, which should be used in coroutine
context.

This requires adding GRAPH_RDLOCK to some functions so that this still
compiles with TSA because bdrv_co_getlength() is GRAPH_RDLOCK.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/qcow2.h          |  4 +++-
 block/qcow2-refcount.c |  2 +-
 block/qcow2.c          | 19 +++++++++----------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c75decc38a..4f67eb912a 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -895,7 +895,9 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 void *cb_opaque, Error **errp);
 int coroutine_fn GRAPH_RDLOCK qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t coroutine_fn qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
-int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
+
+int coroutine_fn GRAPH_RDLOCK
+qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b2a81ff707..4cf91bd955 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3715,7 +3715,7 @@ int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs)
 
     qemu_co_mutex_assert_locked(&s->lock);
 
-    file_length = bdrv_getlength(bs->file->bs);
+    file_length = bdrv_co_getlength(bs->file->bs);
     if (file_length < 0) {
         return file_length;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index fe5def438e..94cf59af8b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2089,11 +2089,10 @@ static void qcow2_join_options(QDict *options, QDict *old_options)
     }
 }
 
-static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
-                                              bool want_zero,
-                                              int64_t offset, int64_t count,
-                                              int64_t *pnum, int64_t *map,
-                                              BlockDriverState **file)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_block_status(BlockDriverState *bs, bool want_zero, int64_t offset,
+                      int64_t count, int64_t *pnum, int64_t *map,
+                      BlockDriverState **file)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t host_offset;
@@ -3235,7 +3234,7 @@ preallocate_co(BlockDriverState *bs, uint64_t offset, uint64_t new_length,
      * all of the allocated clusters (otherwise we get failing reads after
      * EOF). Extend the image to the last allocated sector.
      */
-    file_length = bdrv_getlength(s->data_file->bs);
+    file_length = bdrv_co_getlength(s->data_file->bs);
     if (file_length < 0) {
         error_setg_errno(errp, -file_length, "Could not get file size");
         ret = file_length;
@@ -4098,7 +4097,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
         case QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC:
             if (bs->backing && bs->backing->bs) {
-                int64_t backing_length = bdrv_getlength(bs->backing->bs);
+                int64_t backing_length = bdrv_co_getlength(bs->backing->bs);
                 if (src_offset >= backing_length) {
                     cur_write_flags |= BDRV_REQ_ZERO_WRITE;
                 } else {
@@ -4293,7 +4292,7 @@ qcow2_co_truncate(BlockDriverState *bs, int64_t offset, bool exact,
             goto fail;
         }
 
-        old_file_size = bdrv_getlength(bs->file->bs);
+        old_file_size = bdrv_co_getlength(bs->file->bs);
         if (old_file_size < 0) {
             error_setg_errno(errp, -old_file_size,
                              "Failed to inquire current file length");
@@ -4386,7 +4385,7 @@ qcow2_co_truncate(BlockDriverState *bs, int64_t offset, bool exact,
             break;
         }
 
-        old_file_size = bdrv_getlength(bs->file->bs);
+        old_file_size = bdrv_co_getlength(bs->file->bs);
         if (old_file_size < 0) {
             error_setg_errno(errp, -old_file_size,
                              "Failed to inquire current file length");
@@ -4694,7 +4693,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
          * align end of file to a sector boundary to ease reading with
          * sector based I/Os
          */
-        int64_t len = bdrv_getlength(bs->file->bs);
+        int64_t len = bdrv_co_getlength(bs->file->bs);
         if (len < 0) {
             return len;
         }
-- 
2.40.1


