Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033B56EE2BB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIWT-0007YU-SF; Tue, 25 Apr 2023 09:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVK-0006fW-Ao
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006bK-23
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MsujTFtByCb4h5ljvGu1y+tBM3+dYvvxd0Vakulip5g=;
 b=hDrRjOCFRavA+PoZOYiwigemJwA2OurO6V69DHQYV+CV6RYQWrqZXCVJ7DY2wQxVi6xjG7
 OaYVj/CGsztGPKO4+62dEd/sfOBeOD3zSZ6K5apsscFK6xzBmKr994AdJU1IwaXAmuEhBN
 +C7empnX4sEn82/4Gewr8Cd+PajLHJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-Mxs9j0jrNCWu2RblsJFcLQ-1; Tue, 25 Apr 2023 09:14:20 -0400
X-MC-Unique: Mxs9j0jrNCWu2RblsJFcLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91B0C185A794;
 Tue, 25 Apr 2023 13:14:19 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D760740C2064;
 Tue, 25 Apr 2023 13:14:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 16/25] vvfat: mark various functions as coroutine_fn
Date: Tue, 25 Apr 2023 15:13:50 +0200
Message-Id: <20230425131359.259007-17-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Functions that can do I/O are prime candidates for being coroutine_fns.  Make the
change for those that are themselves called only from coroutine_fns.

In addition, coroutine_fns should do I/O using bdrv_co_*() functions, for
which it is required to hold the BlockDriverState graph lock.  So also nnotate
functions on the I/O path with TSA attributes, making it possible to
switch them to use bdrv_co_*() functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230309084456.304669-2-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 58 ++++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index fd45e86416..0ddc91fc09 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1053,7 +1053,7 @@ static BDRVVVFATState *vvv = NULL;
 #endif
 
 static int enable_write_target(BlockDriverState *bs, Error **errp);
-static int is_consistent(BDRVVVFATState *s);
+static int coroutine_fn is_consistent(BDRVVVFATState *s);
 
 static QemuOptsList runtime_opts = {
     .name = "vvfat",
@@ -1469,8 +1469,8 @@ static void print_mapping(const mapping_t* mapping)
 }
 #endif
 
-static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
-                    uint8_t *buf, int nb_sectors)
+static int coroutine_fn GRAPH_RDLOCK
+vvfat_read(BlockDriverState *bs, int64_t sector_num, uint8_t *buf, int nb_sectors)
 {
     BDRVVVFATState *s = bs->opaque;
     int i;
@@ -1490,8 +1490,8 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
                 DLOG(fprintf(stderr, "sectors %" PRId64 "+%" PRId64
                              " allocated\n", sector_num,
                              n >> BDRV_SECTOR_BITS));
-                if (bdrv_pread(s->qcow, sector_num * BDRV_SECTOR_SIZE, n,
-                               buf + i * 0x200, 0) < 0) {
+                if (bdrv_co_pread(s->qcow, sector_num * BDRV_SECTOR_SIZE, n,
+                                  buf + i * 0x200, 0) < 0) {
                     return -1;
                 }
                 i += (n >> BDRV_SECTOR_BITS) - 1;
@@ -1532,7 +1532,7 @@ static int vvfat_read(BlockDriverState *bs, int64_t sector_num,
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vvfat_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -1796,8 +1796,8 @@ static inline uint32_t modified_fat_get(BDRVVVFATState* s,
     }
 }
 
-static inline bool cluster_was_modified(BDRVVVFATState *s,
-                                        uint32_t cluster_num)
+static inline bool coroutine_fn GRAPH_RDLOCK
+cluster_was_modified(BDRVVVFATState *s, uint32_t cluster_num)
 {
     int was_modified = 0;
     int i;
@@ -1852,8 +1852,8 @@ typedef enum {
  * Further, the files/directories handled by this function are
  * assumed to be *not* deleted (and *only* those).
  */
-static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
-        direntry_t* direntry, const char* path)
+static uint32_t coroutine_fn GRAPH_RDLOCK
+get_cluster_count_for_direntry(BDRVVVFATState* s, direntry_t* direntry, const char* path)
 {
     /*
      * This is a little bit tricky:
@@ -1979,9 +1979,9 @@ static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
                         if (res) {
                             return -1;
                         }
-                        res = bdrv_pwrite(s->qcow, offset * BDRV_SECTOR_SIZE,
-                                          BDRV_SECTOR_SIZE, s->cluster_buffer,
-                                          0);
+                        res = bdrv_co_pwrite(s->qcow, offset * BDRV_SECTOR_SIZE,
+                                             BDRV_SECTOR_SIZE, s->cluster_buffer,
+                                             0);
                         if (res < 0) {
                             return -2;
                         }
@@ -2011,8 +2011,8 @@ static uint32_t get_cluster_count_for_direntry(BDRVVVFATState* s,
  * It returns 0 upon inconsistency or error, and the number of clusters
  * used by the directory, its subdirectories and their files.
  */
-static int check_directory_consistency(BDRVVVFATState *s,
-        int cluster_num, const char* path)
+static int coroutine_fn GRAPH_RDLOCK
+check_directory_consistency(BDRVVVFATState *s, int cluster_num, const char* path)
 {
     int ret = 0;
     unsigned char* cluster = g_malloc(s->cluster_size);
@@ -2138,7 +2138,8 @@ DLOG(fprintf(stderr, "check direntry %d:\n", i); print_direntry(direntries + i))
 }
 
 /* returns 1 on success */
-static int is_consistent(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK
+is_consistent(BDRVVVFATState* s)
 {
     int i, check;
     int used_clusters_count = 0;
@@ -2414,8 +2415,8 @@ static int commit_mappings(BDRVVVFATState* s,
     return 0;
 }
 
-static int commit_direntries(BDRVVVFATState* s,
-        int dir_index, int parent_mapping_index)
+static int coroutine_fn GRAPH_RDLOCK
+commit_direntries(BDRVVVFATState* s, int dir_index, int parent_mapping_index)
 {
     direntry_t* direntry = array_get(&(s->directory), dir_index);
     uint32_t first_cluster = dir_index == 0 ? 0 : begin_of_direntry(direntry);
@@ -2504,8 +2505,8 @@ static int commit_direntries(BDRVVVFATState* s,
 
 /* commit one file (adjust contents, adjust mapping),
    return first_mapping_index */
-static int commit_one_file(BDRVVVFATState* s,
-        int dir_index, uint32_t offset)
+static int coroutine_fn GRAPH_RDLOCK
+commit_one_file(BDRVVVFATState* s, int dir_index, uint32_t offset)
 {
     direntry_t* direntry = array_get(&(s->directory), dir_index);
     uint32_t c = begin_of_direntry(direntry);
@@ -2770,7 +2771,7 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
 /*
  * TODO: make sure that the short name is not matching *another* file
  */
-static int handle_commits(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK handle_commits(BDRVVVFATState* s)
 {
     int i, fail = 0;
 
@@ -2913,7 +2914,7 @@ static int handle_deletes(BDRVVVFATState* s)
  * - recurse direntries from root (using bs->bdrv_pread)
  * - delete files corresponding to mappings marked as deleted
  */
-static int do_commit(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK do_commit(BDRVVVFATState* s)
 {
     int ret = 0;
 
@@ -2963,7 +2964,7 @@ DLOG(checkpoint());
     return 0;
 }
 
-static int try_commit(BDRVVVFATState* s)
+static int coroutine_fn GRAPH_RDLOCK try_commit(BDRVVVFATState* s)
 {
     vvfat_close_current_file(s);
 DLOG(checkpoint());
@@ -2972,8 +2973,9 @@ DLOG(checkpoint());
     return do_commit(s);
 }
 
-static int vvfat_write(BlockDriverState *bs, int64_t sector_num,
-                    const uint8_t *buf, int nb_sectors)
+static int coroutine_fn GRAPH_RDLOCK
+vvfat_write(BlockDriverState *bs, int64_t sector_num,
+            const uint8_t *buf, int nb_sectors)
 {
     BDRVVVFATState *s = bs->opaque;
     int i, ret;
@@ -3082,8 +3084,8 @@ DLOG(checkpoint());
      * Use qcow backend. Commit later.
      */
 DLOG(fprintf(stderr, "Write to qcow backend: %d + %d\n", (int)sector_num, nb_sectors));
-    ret = bdrv_pwrite(s->qcow, sector_num * BDRV_SECTOR_SIZE,
-                      nb_sectors * BDRV_SECTOR_SIZE, buf, 0);
+    ret = bdrv_co_pwrite(s->qcow, sector_num * BDRV_SECTOR_SIZE,
+                         nb_sectors * BDRV_SECTOR_SIZE, buf, 0);
     if (ret < 0) {
         fprintf(stderr, "Error writing to qcow backend\n");
         return ret;
@@ -3103,7 +3105,7 @@ DLOG(checkpoint());
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vvfat_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                  QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
-- 
2.40.0


