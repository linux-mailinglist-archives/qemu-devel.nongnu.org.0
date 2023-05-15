Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5648B702630
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:38:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySll-0002Th-LN; Mon, 15 May 2023 03:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pySlh-0002T4-Cp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:37:18 -0400
Received: from apollo.dupie.be ([51.159.20.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pySle-0005Hx-Js
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:37:17 -0400
Received: from localhost.localdomain (unknown
 [IPv6:2a02:a03f:eaf7:ff01:cc6b:6666:e19c:b63f])
 by apollo.dupie.be (Postfix) with ESMTPSA id CAF961520C8C;
 Mon, 15 May 2023 09:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1684136223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=t0xGd8Alz+xFlVUCopJRPLV61/CrbHDc2ZrMF42btDM=;
 b=Z8JzAddjzgN5R6wqcq2sioN48g8HoFhjAlpm4Bk+93T/U0GjqvS5IpACB6qGABMWE47Tko
 oC+XLhZcqgOHVhTpwFGQncp5p0kQGvnbJfY0YxJ+xI+/vuIBhQKF8TyGkGnJ54weUmdHcv
 uCgJ2J3pfnMFYNsOeH3j2b9f91G7hHniy3eDRULRl5ysNFqP7H7vCtJQ1nl4dho4u7CjSQ
 J+SedL6sYpdfSszD3V+/VZ5xEole6E3WH9XvyvMp48opnVj1rL7fd3V5DKNb+3F7QARXD5
 WHSfC31sKXPLAsEo9T5H6hsRuBQgnOqJccZ02Ph2pEjpRgD7im+V5VzmTD7INw==
From: Jean-Louis Dupond <jean-louis@dupond.be>
To: qemu-devel@nongnu.org,
	kwolf@redhat.com,
	hreitz@redhat.com
Cc: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: [PATCH] qcow2: add discard-no-unref option
Date: Mon, 15 May 2023 09:36:44 +0200
Message-Id: <20230515073644.166677-1-jean-louis@dupond.be>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

When we for example have a sparse qcow2 image and discard: unmap is enabled,
there can be a lot of fragmentation in the image after some time. Surely on VM's
that do a lot of writes/deletes.
This causes the qcow2 image to grow even over 110% of its virtual size,
because the free gaps in the image get to small to allocate new
continuous clusters. So it allocates new space as the end of the image.

Disabling discard is not an option, as discard is needed to keep the
incremental backup size as low as possible. Without discard, the
incremental backups would become large, as qemu thinks it's just dirty
blocks but it doesn't know the blocks are empty/useless.
So we need to avoid fragmentation but also 'empty' the useless blocks in
the image to have a small incremental backup.

Next to that we also want to send the discards futher down the stack, so
the underlying blocks are still discarded.

Therefor we introduce a new qcow2 option "discard-no-unref". When
setting this option to true (defaults to false), the discard requests
will still be executed, but it will keep the offset of the cluster. And
it will also pass the discard request further down the stack (if
discard:unmap is enabled).
This will avoid fragmentation and for example on a fully preallocated
qcow2 image, this will make sure the image is perfectly continuous.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1621
Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
---
 block/qcow2-cluster.c  |  16 ++++-
 block/qcow2-refcount.c | 136 ++++++++++++++++++++++++-----------------
 block/qcow2.c          |  12 ++++
 block/qcow2.h          |   3 +
 qapi/block-core.json   |   4 ++
 qemu-options.hx        |   6 ++
 6 files changed, 120 insertions(+), 57 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 39cda7f907..88da70db5e 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1943,10 +1943,22 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
             new_l2_entry = new_l2_bitmap = 0;
         } else if (bs->backing || qcow2_cluster_is_allocated(cluster_type)) {
             if (has_subclusters(s)) {
-                new_l2_entry = 0;
+                if (s->discard_no_unref && (type & QCOW2_DISCARD_REQUEST)) {
+                    new_l2_entry = old_l2_entry;
+                } else {
+                    new_l2_entry = 0;
+                }
                 new_l2_bitmap = QCOW_L2_BITMAP_ALL_ZEROES;
             } else {
-                new_l2_entry = s->qcow_version >= 3 ? QCOW_OFLAG_ZERO : 0;
+                if (s->qcow_version >= 3) {
+                    if (s->discard_no_unref && (type & QCOW2_DISCARD_REQUEST)) {
+                        new_l2_entry |= QCOW_OFLAG_ZERO;
+                    } else {
+                        new_l2_entry = QCOW_OFLAG_ZERO;
+                    }
+                } else {
+                    new_l2_entry = 0;
+                }
             }
         }
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 4cf91bd955..a81685ed72 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -830,7 +830,10 @@ static int update_refcount(BlockDriverState *bs,
         return 0;
     }
 
-    if (decrease) {
+    bool discard_no_unref = (s->discard_no_unref &&
+                             (type & QCOW2_DISCARD_REQUEST));
+
+    if (decrease && (!discard_no_unref)) {
         qcow2_cache_set_dependency(bs, s->refcount_block_cache,
             s->l2_table_cache);
     }
@@ -840,69 +843,92 @@ static int update_refcount(BlockDriverState *bs,
     for(cluster_offset = start; cluster_offset <= last;
         cluster_offset += s->cluster_size)
     {
-        int block_index;
-        uint64_t refcount;
-        int64_t cluster_index = cluster_offset >> s->cluster_bits;
-        int64_t table_index = cluster_index >> s->refcount_block_bits;
-
-        /* Load the refcount block and allocate it if needed */
-        if (table_index != old_table_index) {
-            if (refcount_block) {
-                qcow2_cache_put(s->refcount_block_cache, &refcount_block);
-            }
-            ret = alloc_refcount_block(bs, cluster_index, &refcount_block);
-            /* If the caller needs to restart the search for free clusters,
-             * try the same ones first to see if they're still free. */
-            if (ret == -EAGAIN) {
-                if (s->free_cluster_index > (start >> s->cluster_bits)) {
-                    s->free_cluster_index = (start >> s->cluster_bits);
+        /*
+         * If discard-no-unref is enabled and this is a DISCARD request
+         * then we can skip the reference update, as we want to keep
+         * the reference in place.
+         */
+        if (!discard_no_unref) {
+            int block_index;
+            uint64_t refcount;
+            int64_t cluster_index = cluster_offset >> s->cluster_bits;
+            int64_t table_index = cluster_index >> s->refcount_block_bits;
+
+            /*
+             * Load the refcount block and allocate it if needed
+             */
+            if (table_index != old_table_index) {
+                if (refcount_block) {
+                    qcow2_cache_put(s->refcount_block_cache, &refcount_block);
+                }
+                ret = alloc_refcount_block(bs, cluster_index, &refcount_block);
+                /*
+                 * If the caller needs to restart the search for free clusters,
+                 * try the same ones first to see if they're still free.
+                 */
+                if (ret == -EAGAIN) {
+                    if (s->free_cluster_index > (start >> s->cluster_bits)) {
+                        s->free_cluster_index = (start >> s->cluster_bits);
+                    }
+                }
+                if (ret < 0) {
+                    goto fail;
                 }
             }
-            if (ret < 0) {
-                goto fail;
-            }
-        }
-        old_table_index = table_index;
+            old_table_index = table_index;
 
-        qcow2_cache_entry_mark_dirty(s->refcount_block_cache, refcount_block);
+            qcow2_cache_entry_mark_dirty(s->refcount_block_cache,
+                                         refcount_block);
+
+            /*
+             * we can update the count and save it
+             */
+            block_index = cluster_index & (s->refcount_block_size - 1);
 
-        /* we can update the count and save it */
-        block_index = cluster_index & (s->refcount_block_size - 1);
+            refcount = s->get_refcount(refcount_block, block_index);
+            if (decrease ? (refcount - addend > refcount)
+                        : (refcount + addend < refcount ||
+                            refcount + addend > s->refcount_max))
+            {
+                ret = -EINVAL;
+                goto fail;
+            }
+            if (decrease) {
+                refcount -= addend;
+            } else {
+                refcount += addend;
+            }
+            if (refcount == 0 && cluster_index < s->free_cluster_index) {
+                s->free_cluster_index = cluster_index;
+            }
+            s->set_refcount(refcount_block, block_index, refcount);
 
-        refcount = s->get_refcount(refcount_block, block_index);
-        if (decrease ? (refcount - addend > refcount)
-                     : (refcount + addend < refcount ||
-                        refcount + addend > s->refcount_max))
-        {
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (decrease) {
-            refcount -= addend;
-        } else {
-            refcount += addend;
-        }
-        if (refcount == 0 && cluster_index < s->free_cluster_index) {
-            s->free_cluster_index = cluster_index;
-        }
-        s->set_refcount(refcount_block, block_index, refcount);
+            if (refcount == 0) {
+                void *table;
 
-        if (refcount == 0) {
-            void *table;
+                table = qcow2_cache_is_table_offset(s->refcount_block_cache,
+                                                    offset);
+                if (table != NULL) {
+                    qcow2_cache_put(s->refcount_block_cache, &refcount_block);
+                    old_table_index = -1;
+                    qcow2_cache_discard(s->refcount_block_cache, table);
+                }
 
-            table = qcow2_cache_is_table_offset(s->refcount_block_cache,
-                                                offset);
-            if (table != NULL) {
-                qcow2_cache_put(s->refcount_block_cache, &refcount_block);
-                old_table_index = -1;
-                qcow2_cache_discard(s->refcount_block_cache, table);
-            }
+                table = qcow2_cache_is_table_offset(s->l2_table_cache, offset);
+                if (table != NULL) {
+                    qcow2_cache_discard(s->l2_table_cache, table);
+                }
 
-            table = qcow2_cache_is_table_offset(s->l2_table_cache, offset);
-            if (table != NULL) {
-                qcow2_cache_discard(s->l2_table_cache, table);
+                if (s->discard_passthrough[type]) {
+                    update_refcount_discard(bs, cluster_offset,
+                                            s->cluster_size);
+                }
             }
-
+        } else {
+            /*
+             * We had a discard request with discard-no-ref enabled, but we
+             * want to pass the discard to the backend to free the data there.
+             */
             if (s->discard_passthrough[type]) {
                 update_refcount_discard(bs, cluster_offset, s->cluster_size);
             }
diff --git a/block/qcow2.c b/block/qcow2.c
index 5bde3b8401..9dde2ac1a5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -681,6 +681,7 @@ static const char *const mutable_opts[] = {
     QCOW2_OPT_DISCARD_REQUEST,
     QCOW2_OPT_DISCARD_SNAPSHOT,
     QCOW2_OPT_DISCARD_OTHER,
+    QCOW2_OPT_DISCARD_NO_UNREF,
     QCOW2_OPT_OVERLAP,
     QCOW2_OPT_OVERLAP_TEMPLATE,
     QCOW2_OPT_OVERLAP_MAIN_HEADER,
@@ -725,6 +726,11 @@ static QemuOptsList qcow2_runtime_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "Generate discard requests when other clusters are freed",
         },
+        {
+            .name = QCOW2_OPT_DISCARD_NO_UNREF,
+            .type = QEMU_OPT_BOOL,
+            .help = "Do not dereference discarded clusters",
+        },
         {
             .name = QCOW2_OPT_OVERLAP,
             .type = QEMU_OPT_STRING,
@@ -968,6 +974,7 @@ typedef struct Qcow2ReopenState {
     bool use_lazy_refcounts;
     int overlap_check;
     bool discard_passthrough[QCOW2_DISCARD_MAX];
+    bool discard_no_unref;
     uint64_t cache_clean_interval;
     QCryptoBlockOpenOptions *crypto_opts; /* Disk encryption runtime options */
 } Qcow2ReopenState;
@@ -1139,6 +1146,9 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     r->discard_passthrough[QCOW2_DISCARD_OTHER] =
         qemu_opt_get_bool(opts, QCOW2_OPT_DISCARD_OTHER, false);
 
+    r->discard_no_unref = qemu_opt_get_bool(opts, QCOW2_OPT_DISCARD_NO_UNREF,
+                                            false);
+
     switch (s->crypt_method_header) {
     case QCOW_CRYPT_NONE:
         if (encryptfmt) {
@@ -1219,6 +1229,8 @@ static void qcow2_update_options_commit(BlockDriverState *bs,
         s->discard_passthrough[i] = r->discard_passthrough[i];
     }
 
+    s->discard_no_unref = r->discard_no_unref;
+
     if (s->cache_clean_interval != r->cache_clean_interval) {
         cache_clean_timer_del(bs);
         s->cache_clean_interval = r->cache_clean_interval;
diff --git a/block/qcow2.h b/block/qcow2.h
index 4f67eb912a..ea9adb5706 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -133,6 +133,7 @@
 #define QCOW2_OPT_DISCARD_REQUEST "pass-discard-request"
 #define QCOW2_OPT_DISCARD_SNAPSHOT "pass-discard-snapshot"
 #define QCOW2_OPT_DISCARD_OTHER "pass-discard-other"
+#define QCOW2_OPT_DISCARD_NO_UNREF "discard-no-unref"
 #define QCOW2_OPT_OVERLAP "overlap-check"
 #define QCOW2_OPT_OVERLAP_TEMPLATE "overlap-check.template"
 #define QCOW2_OPT_OVERLAP_MAIN_HEADER "overlap-check.main-header"
@@ -385,6 +386,8 @@ typedef struct BDRVQcow2State {
 
     bool discard_passthrough[QCOW2_DISCARD_MAX];
 
+    bool discard_no_unref;
+
     int overlap_check; /* bitmask of Qcow2MetadataOverlap values */
     bool signaled_corruption;
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 187e35d473..63aa792e9c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3432,6 +3432,9 @@
 # @pass-discard-other: whether discard requests for the data source
 #     should be issued on other occasions where a cluster gets freed
 #
+# @discard-no-unref: don't dereference the cluster when we do a discard
+#     this to avoid fragmentation of the qcow2 image (since 8.1)
+#
 # @overlap-check: which overlap checks to perform for writes to the
 #     image, defaults to 'cached' (since 2.2)
 #
@@ -3470,6 +3473,7 @@
             '*pass-discard-request': 'bool',
             '*pass-discard-snapshot': 'bool',
             '*pass-discard-other': 'bool',
+            '*discard-no-unref': 'bool',
             '*overlap-check': 'Qcow2OverlapChecks',
             '*cache-size': 'int',
             '*l2-cache-size': 'int',
diff --git a/qemu-options.hx b/qemu-options.hx
index 42b9094c10..17ac701d0d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1431,6 +1431,12 @@ SRST
             issued on other occasions where a cluster gets freed
             (on/off; default: off)
 
+        ``discard-no-unref``
+            When enabled, a discard in the guest does not cause the
+            cluster inside the qcow2 image to be dereferenced. This
+            was added to avoid qcow2 fragmentation whithin the image.
+            (on/off; default: off)
+
         ``overlap-check``
             Which overlap checks to perform for writes to the image
             (none/constant/cached/all; default: cached). For details or
-- 
2.40.1


