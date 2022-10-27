Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F96100FF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:00:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7lX-00020y-KF; Thu, 27 Oct 2022 14:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7h7-0002Ex-K2
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gh-0002eS-O5
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eUNjsY0rmWM6GaHCBCTCLl1ingjAKQ4sN+KenS5bQ8=;
 b=bI6rZGyslI19IORkQmyWQBs3eq/fFQ59bBIiHO0t3EVZBKpHZn7FVlqu/oD22/6TZVNnXl
 Jhi8LEUiPuzr0DJ58bpm19YWxekvjebYgygekAnNtvrdSBSzVTIULXdH6CcPlUbERm9aEM
 dE36NTWXmc4VDAwlr9GtRM16T8WNWMA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-8q30V2PlPFiTZXMBFcys2A-1; Thu, 27 Oct 2022 14:33:02 -0400
X-MC-Unique: 8q30V2PlPFiTZXMBFcys2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4986C29324B1;
 Thu, 27 Oct 2022 18:33:02 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 864E91121320;
 Thu, 27 Oct 2022 18:33:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 52/58] qcow2: switch to *_co_* functions
Date: Thu, 27 Oct 2022 20:31:40 +0200
Message-Id: <20221027183146.463129-53-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-20-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-cluster.c  |  8 ++++----
 block/qcow2-refcount.c | 10 +++++-----
 block/qcow2-snapshot.c |  6 +++---
 block/qcow2.c          | 24 ++++++++++++------------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 097f6484ed..40ed847f97 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -48,14 +48,14 @@ int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs,
 #endif
 
     BLKDBG_EVENT(bs->file, BLKDBG_L1_SHRINK_WRITE_TABLE);
-    ret = bdrv_pwrite_zeroes(bs->file, s->l1_table_offset +
-                                       new_l1_size * L1E_SIZE,
-                             (s->l1_size - new_l1_size) * L1E_SIZE, 0);
+    ret = bdrv_co_pwrite_zeroes(bs->file,
+                                s->l1_table_offset + new_l1_size * L1E_SIZE,
+                                (s->l1_size - new_l1_size) * L1E_SIZE, 0);
     if (ret < 0) {
         goto fail;
     }
 
-    ret = bdrv_flush(bs->file->bs);
+    ret = bdrv_co_flush(bs->file->bs);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 40e3870887..81264740f0 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -118,8 +118,8 @@ int coroutine_fn qcow2_refcount_init(BlockDriverState *bs)
             goto fail;
         }
         BLKDBG_EVENT(bs->file, BLKDBG_REFTABLE_LOAD);
-        ret = bdrv_pread(bs->file, s->refcount_table_offset,
-                         refcount_table_size2, s->refcount_table, 0);
+        ret = bdrv_co_pread(bs->file, s->refcount_table_offset,
+                            refcount_table_size2, s->refcount_table, 0);
         if (ret < 0) {
             goto fail;
         }
@@ -3657,9 +3657,9 @@ int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs)
         reftable_tmp[i] = unused_block ? 0 : cpu_to_be64(s->refcount_table[i]);
     }
 
-    ret = bdrv_pwrite_sync(bs->file, s->refcount_table_offset,
-                           s->refcount_table_size * REFTABLE_ENTRY_SIZE,
-                           reftable_tmp, 0);
+    ret = bdrv_co_pwrite_sync(bs->file, s->refcount_table_offset,
+                              s->refcount_table_size * REFTABLE_ENTRY_SIZE,
+                              reftable_tmp, 0);
     /*
      * If the write in the reftable failed the image may contain a partially
      * overwritten reftable. In this case it would be better to clear the
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index d1d46facbf..62e8a0335d 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -441,9 +441,9 @@ int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
     } QEMU_PACKED snapshot_table_pointer;
 
     /* qcow2_do_open() discards this information in check mode */
-    ret = bdrv_pread(bs->file, offsetof(QCowHeader, nb_snapshots),
-                     sizeof(snapshot_table_pointer), &snapshot_table_pointer,
-                     0);
+    ret = bdrv_co_pread(bs->file, offsetof(QCowHeader, nb_snapshots),
+                        sizeof(snapshot_table_pointer), &snapshot_table_pointer,
+                        0);
     if (ret < 0) {
         result->check_errors++;
         fprintf(stderr, "ERROR failed to read the snapshot table pointer from "
diff --git a/block/qcow2.c b/block/qcow2.c
index a8bb7135a5..4d6666d3ff 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1306,7 +1306,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     uint64_t l1_vm_state_index;
     bool update_header = false;
 
-    ret = bdrv_pread(bs->file, 0, sizeof(header), &header, 0);
+    ret = bdrv_co_pread(bs->file, 0, sizeof(header), &header, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not read qcow2 header");
         goto fail;
@@ -1382,9 +1382,9 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     if (header.header_length > sizeof(header)) {
         s->unknown_header_fields_size = header.header_length - sizeof(header);
         s->unknown_header_fields = g_malloc(s->unknown_header_fields_size);
-        ret = bdrv_pread(bs->file, sizeof(header),
-                         s->unknown_header_fields_size,
-                         s->unknown_header_fields, 0);
+        ret = bdrv_co_pread(bs->file, sizeof(header),
+                            s->unknown_header_fields_size,
+                            s->unknown_header_fields, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read unknown qcow2 header "
                              "fields");
@@ -1579,8 +1579,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             ret = -ENOMEM;
             goto fail;
         }
-        ret = bdrv_pread(bs->file, s->l1_table_offset, s->l1_size * L1E_SIZE,
-                         s->l1_table, 0);
+        ret = bdrv_co_pread(bs->file, s->l1_table_offset, s->l1_size * L1E_SIZE,
+                            s->l1_table, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read L1 table");
             goto fail;
@@ -1699,8 +1699,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
         }
 
         s->image_backing_file = g_malloc(len + 1);
-        ret = bdrv_pread(bs->file, header.backing_file_offset, len,
-                         s->image_backing_file, 0);
+        ret = bdrv_co_pread(bs->file, header.backing_file_offset, len,
+                            s->image_backing_file, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Could not read backing file name");
             goto fail;
@@ -3679,7 +3679,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             cpu_to_be64(QCOW2_INCOMPAT_EXTL2);
     }
 
-    ret = blk_pwrite(blk, 0, cluster_size, header, 0);
+    ret = blk_co_pwrite(blk, 0, cluster_size, header, 0);
     g_free(header);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not write qcow2 header");
@@ -3689,7 +3689,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     /* Write a refcount table with one refcount block */
     refcount_table = g_malloc0(2 * cluster_size);
     refcount_table[0] = cpu_to_be64(2 * cluster_size);
-    ret = blk_pwrite(blk, cluster_size, 2 * cluster_size, refcount_table, 0);
+    ret = blk_co_pwrite(blk, cluster_size, 2 * cluster_size, refcount_table, 0);
     g_free(refcount_table);
 
     if (ret < 0) {
@@ -3744,8 +3744,8 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     }
 
     /* Okay, now that we have a valid image, let's give it the right size */
-    ret = blk_truncate(blk, qcow2_opts->size, false, qcow2_opts->preallocation,
-                       0, errp);
+    ret = blk_co_truncate(blk, qcow2_opts->size, false,
+                          qcow2_opts->preallocation, 0, errp);
     if (ret < 0) {
         error_prepend(errp, "Could not resize image: ");
         goto out;
-- 
2.37.3


