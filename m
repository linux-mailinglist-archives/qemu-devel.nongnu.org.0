Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388764CFC89
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:20:03 +0100 (CET)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBPG-0002zA-9X
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjS-0005Jj-ES
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjO-0008Ks-G6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIlOzS9RgNTM3RgsWA4YVaabBRr5vzrEZNDUbH2tWAg=;
 b=B0HpT9/9e0ua/ddGVzRAkMmtOwB8MfBDfQn1xcymDhc+GRw8fXgJKCaYUKm3DO8NEhp97c
 R9lAEuO9BjpvIkWRMK/52K6kRTuPjkdmzp56kmOJlVv9PIo3c0MHq/HDUY8uyyrti/fGea
 mAf3Qv/ABxZ+WVYW8N4fOpqBONoY4SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-M-WshDaeNNiJ8Wk2YGKDHg-1; Mon, 07 Mar 2022 05:36:42 -0500
X-MC-Unique: M-WshDaeNNiJ8Wk2YGKDHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4C31006AA5;
 Mon,  7 Mar 2022 10:36:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B12478344;
 Mon,  7 Mar 2022 10:36:41 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/23] block: introduce snapshot-access block driver
Date: Mon,  7 Mar 2022 11:35:44 +0100
Message-Id: <20220307103549.808809-19-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The new block driver simply utilizes snapshot-access API of underlying
block node.

In further patches we want to use it like this:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

This way, NBD client will be able to read snapshotted state of active
disk, when active disk is continued to be written by guest. This is
known as "fleecing", and currently uses another scheme based on qcow2
temporary image which backing file is active-disk. New scheme comes
with benefits - see next commit.

The other possible application is exporting internal snapshots of
qcow2, like this:

[guest]          [NBD export]
   |                  |
   | root             | root
   v       file       v
[qcow2]<---------[snapshot-access]

For this, we'll need to implement snapshot-access API handlers in
qcow2 driver, and improve snapshot-access block driver (and API) to
make it possible to select snapshot by name. Another thing to improve
is size of snapshot. Now for simplicity we just use size of bs->file,
which is OK for backup, but for qcow2 snapshots export we'll need to
imporve snapshot-access API to get size of snapshot.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303194349.2304213-12-vsementsov@virtuozzo.com>
[hreitz: Rebased on block GS/IO split]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json             |   4 +-
 include/block/block_int-common.h |   6 ++
 block/snapshot-access.c          | 132 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   1 +
 block/meson.build                |   1 +
 5 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 block/snapshot-access.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ffb7aea2a5..f13b5ff942 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2914,13 +2914,14 @@
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
+# @snapshot-access: Since 7.0
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
-            'file', 'ftp', 'ftps', 'gluster',
+            'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             'http', 'https', 'iscsi',
@@ -4267,6 +4268,7 @@
       'rbd':        'BlockdevOptionsRbd',
       'replication': { 'type': 'BlockdevOptionsReplication',
                        'if': 'CONFIG_REPLICATION' },
+      'snapshot-access': 'BlockdevOptionsGenericFormat',
       'ssh':        'BlockdevOptionsSsh',
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 4ba04d0cc6..8947abab76 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -606,6 +606,12 @@ struct BlockDriver {
      * in generic block-layer: no serializing, no alignment, no tracked
      * requests. So, block-driver that realizes these APIs is fully responsible
      * for synchronization between snapshot-access API and normal IO requests.
+     *
+     * TODO: To be able to support qcow2's internal snapshots, this API will
+     * need to be extended to:
+     * - be able to select a specific snapshot
+     * - receive the snapshot's actual length (which may differ from bs's
+     *   length)
      */
     int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
new file mode 100644
index 0000000000..77b87c1946
--- /dev/null
+++ b/block/snapshot-access.c
@@ -0,0 +1,132 @@
+/*
+ * snapshot_access block driver
+ *
+ * Copyright (c) 2022 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "block/block_int.h"
+
+static coroutine_fn int
+snapshot_access_co_preadv_part(BlockDriverState *bs,
+                               int64_t offset, int64_t bytes,
+                               QEMUIOVector *qiov, size_t qiov_offset,
+                               BdrvRequestFlags flags)
+{
+    if (flags) {
+        return -ENOTSUP;
+    }
+
+    return bdrv_co_preadv_snapshot(bs->file, offset, bytes, qiov, qiov_offset);
+}
+
+static int coroutine_fn
+snapshot_access_co_block_status(BlockDriverState *bs,
+                                bool want_zero, int64_t offset,
+                                int64_t bytes, int64_t *pnum,
+                                int64_t *map, BlockDriverState **file)
+{
+    return bdrv_co_snapshot_block_status(bs->file->bs, want_zero, offset,
+                                         bytes, pnum, map, file);
+}
+
+static int coroutine_fn snapshot_access_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int64_t bytes)
+{
+    return bdrv_co_pdiscard_snapshot(bs->file->bs, offset, bytes);
+}
+
+static int coroutine_fn
+snapshot_access_co_pwrite_zeroes(BlockDriverState *bs,
+                                 int64_t offset, int64_t bytes,
+                                 BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+static coroutine_fn int
+snapshot_access_co_pwritev_part(BlockDriverState *bs,
+                                int64_t offset, int64_t bytes,
+                                QEMUIOVector *qiov, size_t qiov_offset,
+                                BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+
+static void snapshot_access_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
+                                Error **errp)
+{
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    bs->total_sectors = bs->file->bs->total_sectors;
+
+    return 0;
+}
+
+static void snapshot_access_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                BdrvChildRole role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    /*
+     * Currently, we don't need any permissions. If bs->file provides
+     * snapshot-access API, we can use it.
+     */
+    *nperm = 0;
+    *nshared = BLK_PERM_ALL;
+}
+
+BlockDriver bdrv_snapshot_access_drv = {
+    .format_name = "snapshot-access",
+
+    .bdrv_open                  = snapshot_access_open,
+
+    .bdrv_co_preadv_part        = snapshot_access_co_preadv_part,
+    .bdrv_co_pwritev_part       = snapshot_access_co_pwritev_part,
+    .bdrv_co_pwrite_zeroes      = snapshot_access_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = snapshot_access_co_pdiscard,
+    .bdrv_co_block_status       = snapshot_access_co_block_status,
+
+    .bdrv_refresh_filename      = snapshot_access_refresh_filename,
+
+    .bdrv_child_perm            = snapshot_access_child_perm,
+};
+
+static void snapshot_access_init(void)
+{
+    bdrv_register(&bdrv_snapshot_access_drv);
+}
+
+block_init(snapshot_access_init);
diff --git a/MAINTAINERS b/MAINTAINERS
index 101eb50619..4f0cc1e448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2520,6 +2520,7 @@ F: block/reqlist.c
 F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
+F: block/snapshot-access.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index 553b8eddbc..0b2a60c99b 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -34,6 +34,7 @@ block_ss.add(files(
   'raw-format.c',
   'reqlist.c',
   'snapshot.c',
+  'snapshot-access.c',
   'throttle-groups.c',
   'throttle.c',
   'vhdx-endian.c',
-- 
2.34.1


