Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7736101A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:30:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7ka-0001Z5-LN; Thu, 27 Oct 2022 14:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gg-00021a-V6
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gd-0002dQ-Pi
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4D69xTJbtrNuacgKTZ3rWevDqLBV3pF3/vHs0hrnuYw=;
 b=NjGDx+3wIAW6A8nleN56nyCCHhtsRnsYEMLWXQiJRkq9rl7w5eQwLP6rpeEiUtK9hExqcc
 IClaGaE8MzQKKW6nbowZuFK5kmOF/71x6QjxOmce71iZfnre22eTghf2l/J81ySVA8pFiI
 Ws0R8oTKdIbb9pWQRui8LKrGhQhBG5A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-ZESNPBquO0qJ3sSKLcGBXw-1; Thu, 27 Oct 2022 14:33:01 -0400
X-MC-Unique: ZESNPBquO0qJ3sSKLcGBXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D74D811E81;
 Thu, 27 Oct 2022 18:33:01 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CC891121320;
 Thu, 27 Oct 2022 18:33:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 51/58] qcow: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:39 +0200
Message-Id: <20221027183146.463129-52-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-19-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow.c | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index 46bbabd2e3..bb25125b22 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -381,9 +381,9 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
         s->l1_table[l1_index] = l2_offset;
         tmp = cpu_to_be64(l2_offset);
         BLKDBG_EVENT(bs->file, BLKDBG_L1_UPDATE);
-        ret = bdrv_pwrite_sync(bs->file,
-                               s->l1_table_offset + l1_index * sizeof(tmp),
-                               sizeof(tmp), &tmp, 0);
+        ret = bdrv_co_pwrite_sync(bs->file,
+                                  s->l1_table_offset + l1_index * sizeof(tmp),
+                                  sizeof(tmp), &tmp, 0);
         if (ret < 0) {
             return ret;
         }
@@ -414,14 +414,14 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_L2_LOAD);
     if (new_l2_table) {
         memset(l2_table, 0, s->l2_size * sizeof(uint64_t));
-        ret = bdrv_pwrite_sync(bs->file, l2_offset,
-                               s->l2_size * sizeof(uint64_t), l2_table, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, l2_offset,
+                                  s->l2_size * sizeof(uint64_t), l2_table, 0);
         if (ret < 0) {
             return ret;
         }
     } else {
-        ret = bdrv_pread(bs->file, l2_offset, s->l2_size * sizeof(uint64_t),
-                         l2_table, 0);
+        ret = bdrv_co_pread(bs->file, l2_offset,
+                            s->l2_size * sizeof(uint64_t), l2_table, 0);
         if (ret < 0) {
             return ret;
         }
@@ -453,8 +453,8 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
             cluster_offset = QEMU_ALIGN_UP(cluster_offset, s->cluster_size);
             /* write the cluster content */
             BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-            ret = bdrv_pwrite(bs->file, cluster_offset, s->cluster_size,
-                              s->cluster_cache, 0);
+            ret = bdrv_co_pwrite(bs->file, cluster_offset, s->cluster_size,
+                                 s->cluster_cache, 0);
             if (ret < 0) {
                 return ret;
             }
@@ -469,8 +469,9 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
                 if (cluster_offset + s->cluster_size > INT64_MAX) {
                     return -E2BIG;
                 }
-                ret = bdrv_truncate(bs->file, cluster_offset + s->cluster_size,
-                                    false, PREALLOC_MODE_OFF, 0, NULL);
+                ret = bdrv_co_truncate(bs->file,
+                                       cluster_offset + s->cluster_size,
+                                       false, PREALLOC_MODE_OFF, 0, NULL);
                 if (ret < 0) {
                     return ret;
                 }
@@ -492,9 +493,9 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
                                 return -EIO;
                             }
                             BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-                            ret = bdrv_pwrite(bs->file, cluster_offset + i,
-                                              BDRV_SECTOR_SIZE,
-                                              s->cluster_data, 0);
+                            ret = bdrv_co_pwrite(bs->file, cluster_offset + i,
+                                                 BDRV_SECTOR_SIZE,
+                                                 s->cluster_data, 0);
                             if (ret < 0) {
                                 return ret;
                             }
@@ -514,8 +515,8 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
         } else {
             BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE);
         }
-        ret = bdrv_pwrite_sync(bs->file, l2_offset + l2_index * sizeof(tmp),
-                               sizeof(tmp), &tmp, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, l2_offset + l2_index * sizeof(tmp),
+                                  sizeof(tmp), &tmp, 0);
         if (ret < 0) {
             return ret;
         }
@@ -597,7 +598,7 @@ static int coroutine_fn decompress_cluster(BlockDriverState *bs,
         csize = cluster_offset >> (63 - s->cluster_bits);
         csize &= (s->cluster_size - 1);
         BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
-        ret = bdrv_pread(bs->file, coffset, csize, s->cluster_data, 0);
+        ret = bdrv_co_pread(bs->file, coffset, csize, s->cluster_data, 0);
         if (ret < 0)
             return -1;
         if (decompress_buffer(s->cluster_cache, s->cluster_size,
@@ -891,14 +892,14 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     }
 
     /* write all the data */
-    ret = blk_pwrite(qcow_blk, 0, sizeof(header), &header, 0);
+    ret = blk_co_pwrite(qcow_blk, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         goto exit;
     }
 
     if (qcow_opts->has_backing_file) {
-        ret = blk_pwrite(qcow_blk, sizeof(header), backing_filename_len,
-                         qcow_opts->backing_file, 0);
+        ret = blk_co_pwrite(qcow_blk, sizeof(header), backing_filename_len,
+                            qcow_opts->backing_file, 0);
         if (ret < 0) {
             goto exit;
         }
@@ -907,8 +908,8 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     tmp = g_malloc0(BDRV_SECTOR_SIZE);
     for (i = 0; i < DIV_ROUND_UP(sizeof(uint64_t) * l1_size, BDRV_SECTOR_SIZE);
          i++) {
-        ret = blk_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
-                         BDRV_SECTOR_SIZE, tmp, 0);
+        ret = blk_co_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
+                            BDRV_SECTOR_SIZE, tmp, 0);
         if (ret < 0) {
             g_free(tmp);
             goto exit;
-- 
2.37.3


