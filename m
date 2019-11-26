Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E210A0A7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 15:46:34 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZc6r-0000Jl-L0
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 09:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iZc3v-0005xd-04
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 09:43:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iZc3t-0003wA-9p
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 09:43:30 -0500
Received: from relay.sw.ru ([185.231.240.75]:47908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iZc3t-0003vI-2O; Tue, 26 Nov 2019 09:43:29 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iZc3j-0004JL-7K; Tue, 26 Nov 2019 17:43:19 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v9 1/3] block: introduce compress filter driver
Date: Tue, 26 Nov 2019 17:43:16 +0300
Message-Id: <1574779398-88772-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574779398-88772-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1574779398-88772-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow writing all the data compressed through the filter driver.
The written data will be aligned by the cluster size.
Based on the QEMU current implementation, that data can be written to
unallocated clusters only. May be used for a backup job.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/Makefile.objs     |   1 +
 block/filter-compress.c | 190 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/block-core.json    |  10 ++-
 3 files changed, 197 insertions(+), 4 deletions(-)
 create mode 100644 block/filter-compress.c

diff --git a/block/Makefile.objs b/block/Makefile.objs
index e394fe0..330529b 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -43,6 +43,7 @@ block-obj-y += crypto.o
 
 block-obj-y += aio_task.o
 block-obj-y += backup-top.o
+block-obj-y += filter-compress.o
 
 common-obj-y += stream.o
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
new file mode 100644
index 0000000..ef4b12b
--- /dev/null
+++ b/block/filter-compress.c
@@ -0,0 +1,190 @@
+/*
+ * Compress filter block driver
+ *
+ * Copyright (c) 2019 Virtuozzo International GmbH
+ *
+ * Author:
+ *   Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
+ *   (based on block/copy-on-read.c by Max Reitz)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) any later version of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "block/block_int.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+
+static int compress_open(BlockDriverState *bs, QDict *options, int flags,
+                         Error **errp)
+{
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, false,
+                               errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    if (!bs->file->bs->drv || !block_driver_can_compress(bs->file->bs->drv)) {
+        error_setg(errp, "Compression is not supported with this drive %s",
+                   bdrv_get_device_name(bs->file->bs));
+        return -ENOTSUP;
+    }
+
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+        (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
+
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+        ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+            bs->file->bs->supported_zero_flags);
+
+    return 0;
+}
+
+
+#define PERM_PASSTHROUGH (BLK_PERM_CONSISTENT_READ \
+                          | BLK_PERM_WRITE \
+                          | BLK_PERM_RESIZE)
+#define PERM_UNCHANGED (BLK_PERM_ALL & ~PERM_PASSTHROUGH)
+
+static void compress_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                const BdrvChildRole *role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    *nperm = perm & PERM_PASSTHROUGH;
+    *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
+
+    /*
+     * We must not request write permissions for an inactive node, the child
+     * cannot provide it.
+     */
+    if (!(bs->open_flags & BDRV_O_INACTIVE)) {
+        *nperm |= BLK_PERM_WRITE_UNCHANGED;
+    }
+}
+
+
+static int64_t compress_getlength(BlockDriverState *bs)
+{
+    return bdrv_getlength(bs->file->bs);
+}
+
+
+static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,
+                                                uint64_t offset, uint64_t bytes,
+                                                QEMUIOVector *qiov,
+                                                size_t qiov_offset,
+                                                int flags)
+{
+    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                               flags);
+}
+
+
+static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,
+                                                 uint64_t offset,
+                                                 uint64_t bytes,
+                                                 QEMUIOVector *qiov,
+                                                 size_t qiov_offset, int flags)
+{
+    return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                flags | BDRV_REQ_WRITE_COMPRESSED);
+}
+
+
+static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
+                                                  int64_t offset, int bytes,
+                                                  BdrvRequestFlags flags)
+{
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
+}
+
+
+static int coroutine_fn compress_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int bytes)
+{
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
+}
+
+
+static void compress_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    BlockDriverInfo bdi;
+    int ret;
+
+    if (!bs->file) {
+        return;
+    }
+
+    ret = bdrv_get_info(bs->file->bs, &bdi);
+    if (ret < 0 || bdi.cluster_size == 0) {
+        return;
+    }
+
+    bs->bl.request_alignment = bdi.cluster_size;
+}
+
+
+static void compress_eject(BlockDriverState *bs, bool eject_flag)
+{
+    bdrv_eject(bs->file->bs, eject_flag);
+}
+
+
+static void compress_lock_medium(BlockDriverState *bs, bool locked)
+{
+    bdrv_lock_medium(bs->file->bs, locked);
+}
+
+
+static bool compress_recurse_is_first_non_filter(BlockDriverState *bs,
+                                                 BlockDriverState *candidate)
+{
+    return bdrv_recurse_is_first_non_filter(bs->file->bs, candidate);
+}
+
+
+static BlockDriver bdrv_compress = {
+    .format_name                        = "compress",
+
+    .bdrv_open                          = compress_open,
+    .bdrv_child_perm                    = compress_child_perm,
+
+    .bdrv_getlength                     = compress_getlength,
+
+    .bdrv_co_preadv_part                = compress_co_preadv_part,
+    .bdrv_co_pwritev_part               = compress_co_pwritev_part,
+    .bdrv_co_pwrite_zeroes              = compress_co_pwrite_zeroes,
+    .bdrv_co_pdiscard                   = compress_co_pdiscard,
+    .bdrv_refresh_limits                = compress_refresh_limits,
+
+    .bdrv_eject                         = compress_eject,
+    .bdrv_lock_medium                   = compress_lock_medium,
+
+    .bdrv_co_block_status               = bdrv_co_block_status_from_backing,
+
+    .bdrv_recurse_is_first_non_filter   = compress_recurse_is_first_non_filter,
+
+    .has_variable_length                = true,
+    .is_filter                          = true,
+};
+
+static void bdrv_compress_init(void)
+{
+    bdrv_register(&bdrv_compress);
+}
+
+block_init(bdrv_compress_init);
diff --git a/qapi/block-core.json b/qapi/block-core.json
index aa97ee2..2f34703 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2884,15 +2884,16 @@
 # @copy-on-read: Since 3.0
 # @blklogwrites: Since 3.0
 # @blkreplay: Since 4.2
+# @compress: Since 5.0
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
-            'cloop', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps', 'gluster',
-            'host_cdrom', 'host_device', 'http', 'https', 'iscsi', 'luks',
-            'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels', 'qcow',
-            'qcow2', 'qed', 'quorum', 'raw', 'rbd',
+            'cloop', 'copy-on-read', 'compress', 'dmg', 'file', 'ftp', 'ftps',
+            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
+            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
+            'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
             'sheepdog',
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat', 'vxhs' ] }
@@ -4045,6 +4046,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'copy-on-read':'BlockdevOptionsGenericFormat',
+      'compress':   'BlockdevOptionsGenericFormat',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
       'ftp':        'BlockdevOptionsCurlFtp',
-- 
1.8.3.1


