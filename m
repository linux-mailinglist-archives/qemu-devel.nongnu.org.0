Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76850889B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:57:37 +0200 (CEST)
Received: from localhost ([::1]:50666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9to-00065M-I7
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e8-0002Km-L3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e6-00049J-Sn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1lbctqjoYWtE2nKk+RStis+7Aqzle8szyXHu/XF1gM=;
 b=XxRmeMI6zYwDa6dNXUk8zY55WjWvqCj9c/4kjs0WYGmvkXjeraFZD0n4xOxDBb9cXSrjQF
 xact4LzHDIoIzhDI8smpbOUNCZdTxWdwZNFkRjD68KTU7/io0DTF0ydazUozopgbv2W/O+
 SywHRkwSDEM3YdlZ+chQtnLP5wZmpo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-g5iFGWYdMCe0GhPsDJunEg-1; Wed, 20 Apr 2022 08:41:19 -0400
X-MC-Unique: g5iFGWYdMCe0GhPsDJunEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF2A802819;
 Wed, 20 Apr 2022 12:41:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D7340EC001;
 Wed, 20 Apr 2022 12:41:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 8/8] qcow2: Add errp to rebuild_refcount_structure()
Date: Wed, 20 Apr 2022 14:41:04 +0200
Message-Id: <20220420124104.795836-9-hreitz@redhat.com>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
References: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of fprint()-ing error messages in rebuild_refcount_structure()
and its rebuild_refcounts_write_refblocks() helper, pass them through an
Error object to qcow2_check_refcounts() (which will then print it).

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220405134652.19278-4-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index c5669eaa51..ed0ecfaa89 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2465,7 +2465,8 @@ static int64_t alloc_clusters_imrt(BlockDriverState *bs,
 static int rebuild_refcounts_write_refblocks(
         BlockDriverState *bs, void **refcount_table, int64_t *nb_clusters,
         int64_t first_cluster, int64_t end_cluster,
-        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr
+        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr,
+        Error **errp
     )
 {
     BDRVQcow2State *s = bs->opaque;
@@ -2516,8 +2517,8 @@ static int rebuild_refcounts_write_refblocks(
                                                   nb_clusters,
                                                   &first_free_cluster);
             if (refblock_offset < 0) {
-                fprintf(stderr, "ERROR allocating refblock: %s\n",
-                        strerror(-refblock_offset));
+                error_setg_errno(errp, -refblock_offset,
+                                 "ERROR allocating refblock");
                 return refblock_offset;
             }
 
@@ -2539,6 +2540,7 @@ static int rebuild_refcounts_write_refblocks(
                                   on_disk_reftable_entries *
                                   REFTABLE_ENTRY_SIZE);
                 if (!on_disk_reftable) {
+                    error_setg(errp, "ERROR allocating reftable memory");
                     return -ENOMEM;
                 }
 
@@ -2562,7 +2564,7 @@ static int rebuild_refcounts_write_refblocks(
         ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
                                             s->cluster_size, false);
         if (ret < 0) {
-            fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
+            error_setg_errno(errp, -ret, "ERROR writing refblock");
             return ret;
         }
 
@@ -2578,7 +2580,7 @@ static int rebuild_refcounts_write_refblocks(
         ret = bdrv_pwrite(bs->file, refblock_offset, on_disk_refblock,
                           s->cluster_size);
         if (ret < 0) {
-            fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
+            error_setg_errno(errp, -ret, "ERROR writing refblock");
             return ret;
         }
 
@@ -2601,7 +2603,8 @@ static int rebuild_refcounts_write_refblocks(
 static int rebuild_refcount_structure(BlockDriverState *bs,
                                       BdrvCheckResult *res,
                                       void **refcount_table,
-                                      int64_t *nb_clusters)
+                                      int64_t *nb_clusters,
+                                      Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t reftable_offset = -1;
@@ -2652,7 +2655,7 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
         rebuild_refcounts_write_refblocks(bs, refcount_table, nb_clusters,
                                           0, *nb_clusters,
                                           &on_disk_reftable,
-                                          &on_disk_reftable_entries);
+                                          &on_disk_reftable_entries, errp);
     if (reftable_size_changed < 0) {
         res->check_errors++;
         ret = reftable_size_changed;
@@ -2676,8 +2679,8 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
                                               refcount_table, nb_clusters,
                                               &first_free_cluster);
         if (reftable_offset < 0) {
-            fprintf(stderr, "ERROR allocating reftable: %s\n",
-                    strerror(-reftable_offset));
+            error_setg_errno(errp, -reftable_offset,
+                             "ERROR allocating reftable");
             res->check_errors++;
             ret = reftable_offset;
             goto fail;
@@ -2695,7 +2698,7 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
                                               reftable_start_cluster,
                                               reftable_end_cluster,
                                               &on_disk_reftable,
-                                              &on_disk_reftable_entries);
+                                              &on_disk_reftable_entries, errp);
         if (reftable_size_changed < 0) {
             res->check_errors++;
             ret = reftable_size_changed;
@@ -2725,7 +2728,7 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
     ret = qcow2_pre_write_overlap_check(bs, 0, reftable_offset, reftable_length,
                                         false);
     if (ret < 0) {
-        fprintf(stderr, "ERROR writing reftable: %s\n", strerror(-ret));
+        error_setg_errno(errp, -ret, "ERROR writing reftable");
         goto fail;
     }
 
@@ -2733,7 +2736,7 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
     ret = bdrv_pwrite(bs->file, reftable_offset, on_disk_reftable,
                       reftable_length);
     if (ret < 0) {
-        fprintf(stderr, "ERROR writing reftable: %s\n", strerror(-ret));
+        error_setg_errno(errp, -ret, "ERROR writing reftable");
         goto fail;
     }
 
@@ -2746,7 +2749,7 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
                            &reftable_offset_and_clusters,
                            sizeof(reftable_offset_and_clusters));
     if (ret < 0) {
-        fprintf(stderr, "ERROR setting reftable: %s\n", strerror(-ret));
+        error_setg_errno(errp, -ret, "ERROR setting reftable");
         goto fail;
     }
 
@@ -2814,11 +2817,13 @@ int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
     if (rebuild && (fix & BDRV_FIX_ERRORS)) {
         BdrvCheckResult old_res = *res;
         int fresh_leaks = 0;
+        Error *local_err = NULL;
 
         fprintf(stderr, "Rebuilding refcount structure\n");
         ret = rebuild_refcount_structure(bs, res, &refcount_table,
-                                         &nb_clusters);
+                                         &nb_clusters, &local_err);
         if (ret < 0) {
+            error_report_err(local_err);
             goto fail;
         }
 
-- 
2.35.1


