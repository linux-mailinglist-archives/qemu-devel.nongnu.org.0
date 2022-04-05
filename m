Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE54F3590
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:51:34 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbjao-00061M-0M
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbjWa-00019N-LI
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nbjWQ-0004ey-4U
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649166421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxdymYwCCKwwqF9ok+P7nzQF6QPIsB+OcyXVyP6dPDM=;
 b=OkMWtzEbwRJOvQyTWvI7TSGnUblo+VPeynpHQ3zR2Kb//YyyfHb4TfFmU+Naclb6K6dxhn
 XDzMnvQMlL/z93J7Nusb3kCQjYJbOw/KtcwkzPXH+1Bm17m1DscfTES6Nsa/ysTXKOtApg
 7wuh3Ak96TSguZS+eCNDr9VUL93CghI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-Qyj-2JTqN4ip-O2rQGLYaw-1; Tue, 05 Apr 2022 09:47:00 -0400
X-MC-Unique: Qyj-2JTqN4ip-O2rQGLYaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 336B33C11A11;
 Tue,  5 Apr 2022 13:47:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E35C140CF8E5;
 Tue,  5 Apr 2022 13:46:59 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/3] qcow2: Add errp to rebuild_refcount_structure()
Date: Tue,  5 Apr 2022 15:46:52 +0200
Message-Id: <20220405134652.19278-4-hreitz@redhat.com>
In-Reply-To: <20220405134652.19278-1-hreitz@redhat.com>
References: <20220405134652.19278-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of fprint()-ing error messages in rebuild_refcount_structure()
and its rebuild_refcounts_write_refblocks() helper, pass them through an
Error object to qcow2_check_refcounts() (which will then print it).

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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


