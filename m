Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC563AB27
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:38:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf4r-0005t9-W5; Mon, 28 Nov 2022 09:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf37-0004lN-UM
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:24:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf2y-0006uJ-QP
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669645428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpkNYsRJ7sd4gjQJbCC6YTRIt1PaQfYgPPQM8m8XsGk=;
 b=MxNllrkEM7RXNtSmQg40NsHKeAmZ7n6xK1628WNzo5ms7hezE+EJJk9npLFq00TLkn9OsL
 L3bEWDshfynf6LVZz0dwxNGbW6VpKY2nj1ttEu+2iCxBcOGKzuGwHIOb/ypPXzb0dNr2uc
 +YNzB7gBaOX7WaOF3b2tBY042EhLmdY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-woDkeYW4M7eHv71GK9VFUQ-1; Mon, 28 Nov 2022 09:23:44 -0500
X-MC-Unique: woDkeYW4M7eHv71GK9VFUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610918027FE;
 Mon, 28 Nov 2022 14:23:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F32461415122;
 Mon, 28 Nov 2022 14:23:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v7 09/14] block: rename generated_co_wrapper in
 co_wrapper_mixed
Date: Mon, 28 Nov 2022 09:23:32 -0500
Message-Id: <20221128142337.657646-10-eesposit@redhat.com>
In-Reply-To: <20221128142337.657646-1-eesposit@redhat.com>
References: <20221128142337.657646-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation to the incoming new function specifiers,
rename g_c_w with a more meaningful name and document it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 docs/devel/block-coroutine-wrapper.rst |  6 +--
 block/coroutines.h                     |  4 +-
 include/block/block-common.h           | 11 +++--
 include/block/block-io.h               | 44 ++++++++---------
 include/sysemu/block-backend-io.h      | 68 +++++++++++++-------------
 scripts/block-coroutine-wrapper.py     |  6 +--
 6 files changed, 71 insertions(+), 68 deletions(-)

diff --git a/docs/devel/block-coroutine-wrapper.rst b/docs/devel/block-coroutine-wrapper.rst
index 412851986b..64acc8d65d 100644
--- a/docs/devel/block-coroutine-wrapper.rst
+++ b/docs/devel/block-coroutine-wrapper.rst
@@ -26,12 +26,12 @@ called ``bdrv_foo(<same args>)``. In this case the script can help. To
 trigger the generation:
 
 1. You need ``bdrv_foo`` declaration somewhere (for example, in
-   ``block/coroutines.h``) with the ``generated_co_wrapper`` mark,
+   ``block/coroutines.h``) with the ``co_wrapper_mixed`` mark,
    like this:
 
 .. code-block:: c
 
-    int generated_co_wrapper bdrv_foo(<some args>);
+    int co_wrapper_mixed bdrv_foo(<some args>);
 
 2. You need to feed this declaration to block-coroutine-wrapper script.
    For this, add the .h (or .c) file with the declaration to the
@@ -46,7 +46,7 @@ Links
 
 1. The script location is ``scripts/block-coroutine-wrapper.py``.
 
-2. Generic place for private ``generated_co_wrapper`` declarations is
+2. Generic place for private ``co_wrapper_mixed`` declarations is
    ``block/coroutines.h``, for public declarations:
    ``include/block/block.h``
 
diff --git a/block/coroutines.h b/block/coroutines.h
index 3a2bad564f..17da4db963 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -71,7 +71,7 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper
+int co_wrapper_mixed
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
                                bool include_base,
@@ -82,7 +82,7 @@ bdrv_common_block_status_above(BlockDriverState *bs,
                                int64_t *map,
                                BlockDriverState **file,
                                int *depth);
-int generated_co_wrapper
+int co_wrapper_mixed
 nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 297704c1e9..ec2309055b 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -35,14 +35,17 @@
 #include "qemu/transactions.h"
 
 /*
- * generated_co_wrapper
+ * co_wrapper{*}: Function specifiers used by block-coroutine-wrapper.py
  *
- * Function specifier, which does nothing but mark functions to be
+ * Function specifiers, which do nothing but mark functions to be
  * generated by scripts/block-coroutine-wrapper.py
  *
- * Read more in docs/devel/block-coroutine-wrapper.rst
+ * Usage: read docs/devel/block-coroutine-wrapper.rst
+ *
+ * co_wrapper_mixed functions can be called by both coroutine and
+ * non-coroutine context.
  */
-#define generated_co_wrapper
+#define co_wrapper_mixed
 
 /* block.c */
 typedef struct BlockDriver BlockDriver;
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 72919254cd..72cf45975b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -39,19 +39,19 @@
  * to catch when they are accidentally called by the wrong API.
  */
 
-int generated_co_wrapper bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                            int64_t bytes,
-                                            BdrvRequestFlags flags);
+int co_wrapper_mixed bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
+                                        int64_t bytes,
+                                        BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
-                                    int64_t bytes, void *buf,
-                                    BdrvRequestFlags flags);
-int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
-                                     int64_t bytes, const void *buf,
-                                     BdrvRequestFlags flags);
-int generated_co_wrapper bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                                          int64_t bytes, const void *buf,
-                                          BdrvRequestFlags flags);
+int co_wrapper_mixed bdrv_pread(BdrvChild *child, int64_t offset,
+                                int64_t bytes, void *buf,
+                                BdrvRequestFlags flags);
+int co_wrapper_mixed bdrv_pwrite(BdrvChild *child, int64_t offset,
+                                 int64_t bytes, const void *buf,
+                                 BdrvRequestFlags flags);
+int co_wrapper_mixed bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
+                                      int64_t bytes, const void *buf,
+                                      BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
                                      int64_t bytes, const void *buf,
                                      BdrvRequestFlags flags);
@@ -281,22 +281,22 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
 
 void bdrv_drain(BlockDriverState *bs);
 
-int generated_co_wrapper
+int co_wrapper_mixed
 bdrv_truncate(BdrvChild *child, int64_t offset, bool exact,
               PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
 
-int generated_co_wrapper bdrv_check(BlockDriverState *bs, BdrvCheckResult *res,
-                                    BdrvCheckMode fix);
+int co_wrapper_mixed bdrv_check(BlockDriverState *bs, BdrvCheckResult *res,
+                                BdrvCheckMode fix);
 
 /* Invalidate any cached metadata used by image formats */
-int generated_co_wrapper bdrv_invalidate_cache(BlockDriverState *bs,
-                                               Error **errp);
-int generated_co_wrapper bdrv_flush(BlockDriverState *bs);
-int generated_co_wrapper bdrv_pdiscard(BdrvChild *child, int64_t offset,
-                                       int64_t bytes);
-int generated_co_wrapper
+int co_wrapper_mixed bdrv_invalidate_cache(BlockDriverState *bs,
+                                           Error **errp);
+int co_wrapper_mixed bdrv_flush(BlockDriverState *bs);
+int co_wrapper_mixed bdrv_pdiscard(BdrvChild *child, int64_t offset,
+                                   int64_t bytes);
+int co_wrapper_mixed
 bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
-int generated_co_wrapper
+int co_wrapper_mixed
 bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
 /**
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index ee3eb12610..7ec6d978d4 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -110,77 +110,77 @@ int coroutine_fn blk_co_is_allocated_above(BlockBackend *blk,
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
-                                   int64_t bytes, void *buf,
-                                   BdrvRequestFlags flags);
+int co_wrapper_mixed blk_pread(BlockBackend *blk, int64_t offset,
+                               int64_t bytes, void *buf,
+                               BdrvRequestFlags flags);
 int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset, int64_t bytes,
                               void *buf, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, QEMUIOVector *qiov,
-                                    BdrvRequestFlags flags);
+int co_wrapper_mixed blk_preadv(BlockBackend *blk, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
-                                         int64_t bytes, QEMUIOVector *qiov,
-                                         size_t qiov_offset,
-                                         BdrvRequestFlags flags);
+int co_wrapper_mixed blk_preadv_part(BlockBackend *blk, int64_t offset,
+                                     int64_t bytes, QEMUIOVector *qiov,
+                                     size_t qiov_offset,
+                                     BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
                                     int64_t bytes, QEMUIOVector *qiov,
                                     size_t qiov_offset, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
-                                    int64_t bytes, const void *buf,
-                                    BdrvRequestFlags flags);
+int co_wrapper_mixed blk_pwrite(BlockBackend *blk, int64_t offset,
+                                int64_t bytes, const void *buf,
+                                BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
                                const void *buf, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
-                                     int64_t bytes, QEMUIOVector *qiov,
-                                     BdrvRequestFlags flags);
+int co_wrapper_mixed blk_pwritev(BlockBackend *blk, int64_t offset,
+                                 int64_t bytes, QEMUIOVector *qiov,
+                                 BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                 int64_t bytes, QEMUIOVector *qiov,
                                 BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwritev_part(BlockBackend *blk, int64_t offset,
-                                          int64_t bytes, QEMUIOVector *qiov,
-                                          size_t qiov_offset,
-                                          BdrvRequestFlags flags);
+int co_wrapper_mixed blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes, QEMUIOVector *qiov,
+                                      size_t qiov_offset,
+                                      BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
                                      int64_t bytes,
                                      QEMUIOVector *qiov, size_t qiov_offset,
                                      BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pwrite_compressed(BlockBackend *blk,
-                                               int64_t offset, int64_t bytes,
-                                               const void *buf);
+int co_wrapper_mixed blk_pwrite_compressed(BlockBackend *blk,
+                                           int64_t offset, int64_t bytes,
+                                           const void *buf);
 int coroutine_fn blk_co_pwrite_compressed(BlockBackend *blk, int64_t offset,
                                           int64_t bytes, const void *buf);
 
-int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                           int64_t bytes,
-                                           BdrvRequestFlags flags);
+int co_wrapper_mixed blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                       int64_t bytes,
+                                       BdrvRequestFlags flags);
 int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                       int64_t bytes, BdrvRequestFlags flags);
 
-int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
-                                      int64_t bytes);
+int co_wrapper_mixed blk_pdiscard(BlockBackend *blk, int64_t offset,
+                                  int64_t bytes);
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
-int generated_co_wrapper blk_flush(BlockBackend *blk);
+int co_wrapper_mixed blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
 
-int generated_co_wrapper blk_ioctl(BlockBackend *blk, unsigned long int req,
-                                   void *buf);
+int co_wrapper_mixed blk_ioctl(BlockBackend *blk, unsigned long int req,
+                               void *buf);
 int coroutine_fn blk_co_ioctl(BlockBackend *blk, unsigned long int req,
                               void *buf);
 
-int generated_co_wrapper blk_truncate(BlockBackend *blk, int64_t offset,
-                                      bool exact, PreallocMode prealloc,
-                                      BdrvRequestFlags flags, Error **errp);
+int co_wrapper_mixed blk_truncate(BlockBackend *blk, int64_t offset,
+                                  bool exact, PreallocMode prealloc,
+                                  BdrvRequestFlags flags, Error **errp);
 int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
                                  PreallocMode prealloc, BdrvRequestFlags flags,
                                  Error **errp);
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 08be813407..56e6425356 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -2,7 +2,7 @@
 """Generate coroutine wrappers for block subsystem.
 
 The program parses one or several concatenated c files from stdin,
-searches for functions with the 'generated_co_wrapper' specifier
+searches for functions with the 'co_wrapper_mixed' specifier
 and generates corresponding wrappers on stdout.
 
 Usage: block-coroutine-wrapper.py generated-file.c FILE.[ch]...
@@ -74,8 +74,8 @@ def gen_block(self, format: str) -> str:
         return '\n'.join(format.format_map(arg.__dict__) for arg in self.args)
 
 
-# Match wrappers declared with a generated_co_wrapper mark
-func_decl_re = re.compile(r'^int\s*generated_co_wrapper\s*'
+# Match wrappers declared with a co_wrapper_mixed mark
+func_decl_re = re.compile(r'^int\s*co_wrapper_mixed\s*'
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
 
-- 
2.31.1


