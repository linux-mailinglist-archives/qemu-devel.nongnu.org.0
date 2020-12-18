Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B62DE684
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:27:41 +0100 (CET)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHfQ-0002Mr-PT
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRr-0002e5-P5
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRf-0005Oi-5L
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pMrRLW1pNIL8Mvj5t1VwJcCti4VoRFw2mGD2tv12t4=;
 b=Ph73k/SXA2VB876v4sJQWLoWNEVbPfcjClL5n2TZZf34jgj3ZiIzumVgu0UNqQKShkDYGi
 WKB/SMf9o0Tjbj8uRRTVIcdjEvMrN2RVo0yTkLOCRPKCcmtioxm9davXPZeV973mF9BOYc
 OZLU4JUEZoCNedHkNL5TuhM0j810Ypg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-E3j_ji-0OyCH_KXAtyaf0Q-1; Fri, 18 Dec 2020 10:13:20 -0500
X-MC-Unique: E3j_ji-0OyCH_KXAtyaf0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 831578030A1;
 Fri, 18 Dec 2020 15:13:19 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C20D85C1C5;
 Fri, 18 Dec 2020 15:13:18 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/30] block: introduce preallocate filter
Date: Fri, 18 Dec 2020 16:12:31 +0100
Message-Id: <20201218151249.715731-13-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

It's intended to be inserted between format and protocol nodes to
preallocate additional space (expanding protocol file) on writes
crossing EOF. It improves performance for file-systems with slow
allocation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-9-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
[mreitz: Two comment fixes, and bumped the version from 5.2 to 6.0]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 docs/system/qemu-block-drivers.rst.inc |  26 ++
 qapi/block-core.json                   |  20 +-
 block/preallocate.c                    | 559 +++++++++++++++++++++++++
 block/meson.build                      |   1 +
 4 files changed, 605 insertions(+), 1 deletion(-)
 create mode 100644 block/preallocate.c

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index b052a6d14e..60a064b232 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -952,3 +952,29 @@ on host and see if there are locks held by the QEMU process on the image file.
 More than one byte could be locked by the QEMU instance, each byte of which
 reflects a particular permission that is acquired or protected by the running
 block driver.
+
+Filter drivers
+~~~~~~~~~~~~~~
+
+QEMU supports several filter drivers, which don't store any data, but perform
+some additional tasks, hooking io requests.
+
+.. program:: filter-drivers
+.. option:: preallocate
+
+  The preallocate filter driver is intended to be inserted between format
+  and protocol nodes and preallocates some additional space
+  (expanding the protocol file) when writing past the file’s end. This can be
+  useful for file-systems with slow allocation.
+
+  Supported options:
+
+  .. program:: preallocate
+  .. option:: prealloc-align
+
+    On preallocation, align the file length to this value (in bytes), default 1M.
+
+  .. program:: preallocate
+  .. option:: prealloc-size
+
+    How much to preallocate (in bytes), default 128M.
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04c5196e59..3484986d1c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2829,7 +2829,7 @@
             'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
             'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
-            'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
+            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
             { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
             'sheepdog',
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
@@ -3098,6 +3098,23 @@
   'data': { 'aes': 'QCryptoBlockOptionsQCow',
             'luks': 'QCryptoBlockOptionsLUKS'} }
 
+##
+# @BlockdevOptionsPreallocate:
+#
+# Filter driver intended to be inserted between format and protocol node
+# and do preallocation in protocol node on write.
+#
+# @prealloc-align: on preallocation, align file length to this number,
+#                  default 1048576 (1M)
+#
+# @prealloc-size: how much to preallocate, default 134217728 (128M)
+#
+# Since: 6.0
+##
+{ 'struct': 'BlockdevOptionsPreallocate',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { '*prealloc-align': 'int', '*prealloc-size': 'int' } }
+
 ##
 # @BlockdevOptionsQcow2:
 #
@@ -4006,6 +4023,7 @@
       'null-co':    'BlockdevOptionsNull',
       'nvme':       'BlockdevOptionsNVMe',
       'parallels':  'BlockdevOptionsGenericFormat',
+      'preallocate':'BlockdevOptionsPreallocate',
       'qcow2':      'BlockdevOptionsQcow2',
       'qcow':       'BlockdevOptionsQcow',
       'qed':        'BlockdevOptionsGenericCOWFormat',
diff --git a/block/preallocate.c b/block/preallocate.c
new file mode 100644
index 0000000000..b619206304
--- /dev/null
+++ b/block/preallocate.c
@@ -0,0 +1,559 @@
+/*
+ * preallocate filter driver
+ *
+ * The driver performs preallocate operation: it is injected above
+ * some node, and before each write over EOF it does additional preallocating
+ * write-zeroes request.
+ *
+ * Copyright (c) 2020 Virtuozzo International GmbH.
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
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "qemu/option.h"
+#include "qemu/units.h"
+#include "block/block_int.h"
+
+
+typedef struct PreallocateOpts {
+    int64_t prealloc_size;
+    int64_t prealloc_align;
+} PreallocateOpts;
+
+typedef struct BDRVPreallocateState {
+    PreallocateOpts opts;
+
+    /*
+     * Track real data end, to crop preallocation on close. If < 0 the status is
+     * unknown.
+     *
+     * @data_end is a maximum of file size on open (or when we get write/resize
+     * permissions) and all write request ends after it. So it's safe to
+     * truncate to data_end if it is valid.
+     */
+    int64_t data_end;
+
+    /*
+     * Start of trailing preallocated area which reads as zero. May be smaller
+     * than data_end, if user does over-EOF write zero operation. If < 0 the
+     * status is unknown.
+     *
+     * If both @zero_start and @file_end are valid, the region
+     * [@zero_start, @file_end) is known to be preallocated zeroes. If @file_end
+     * is not valid, @zero_start doesn't make much sense.
+     */
+    int64_t zero_start;
+
+    /*
+     * Real end of file. Actually the cache for bdrv_getlength(bs->file->bs),
+     * to avoid extra lseek() calls on each write operation. If < 0 the status
+     * is unknown.
+     */
+    int64_t file_end;
+
+    /*
+     * All three states @data_end, @zero_start and @file_end are guaranteed to
+     * be invalid (< 0) when we don't have both exclusive BLK_PERM_RESIZE and
+     * BLK_PERM_WRITE permissions on file child.
+     */
+} BDRVPreallocateState;
+
+#define PREALLOCATE_OPT_PREALLOC_ALIGN "prealloc-align"
+#define PREALLOCATE_OPT_PREALLOC_SIZE "prealloc-size"
+static QemuOptsList runtime_opts = {
+    .name = "preallocate",
+    .head = QTAILQ_HEAD_INITIALIZER(runtime_opts.head),
+    .desc = {
+        {
+            .name = PREALLOCATE_OPT_PREALLOC_ALIGN,
+            .type = QEMU_OPT_SIZE,
+            .help = "on preallocation, align file length to this number, "
+                "default 1M",
+        },
+        {
+            .name = PREALLOCATE_OPT_PREALLOC_SIZE,
+            .type = QEMU_OPT_SIZE,
+            .help = "how much to preallocate, default 128M",
+        },
+        { /* end of list */ }
+    },
+};
+
+static bool preallocate_absorb_opts(PreallocateOpts *dest, QDict *options,
+                                    BlockDriverState *child_bs, Error **errp)
+{
+    QemuOpts *opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
+
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
+        return false;
+    }
+
+    dest->prealloc_align =
+        qemu_opt_get_size(opts, PREALLOCATE_OPT_PREALLOC_ALIGN, 1 * MiB);
+    dest->prealloc_size =
+        qemu_opt_get_size(opts, PREALLOCATE_OPT_PREALLOC_SIZE, 128 * MiB);
+
+    qemu_opts_del(opts);
+
+    if (!QEMU_IS_ALIGNED(dest->prealloc_align, BDRV_SECTOR_SIZE)) {
+        error_setg(errp, "prealloc-align parameter of preallocate filter "
+                   "is not aligned to %llu", BDRV_SECTOR_SIZE);
+        return false;
+    }
+
+    if (!QEMU_IS_ALIGNED(dest->prealloc_align,
+                         child_bs->bl.request_alignment)) {
+        error_setg(errp, "prealloc-align parameter of preallocate filter "
+                   "is not aligned to underlying node request alignment "
+                   "(%" PRIi32 ")", child_bs->bl.request_alignment);
+        return false;
+    }
+
+    return true;
+}
+
+static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
+                            Error **errp)
+{
+    BDRVPreallocateState *s = bs->opaque;
+
+    /*
+     * s->data_end and friends should be initialized on permission update.
+     * For this to work, mark them invalid.
+     */
+    s->file_end = s->zero_start = s->data_end = -EINVAL;
+
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    if (!preallocate_absorb_opts(&s->opts, options, bs->file->bs, errp)) {
+        return -EINVAL;
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
+static void preallocate_close(BlockDriverState *bs)
+{
+    int ret;
+    BDRVPreallocateState *s = bs->opaque;
+
+    if (s->data_end < 0) {
+        return;
+    }
+
+    if (s->file_end < 0) {
+        s->file_end = bdrv_getlength(bs->file->bs);
+        if (s->file_end < 0) {
+            return;
+        }
+    }
+
+    if (s->data_end < s->file_end) {
+        ret = bdrv_truncate(bs->file, s->data_end, true, PREALLOC_MODE_OFF, 0,
+                            NULL);
+        s->file_end = ret < 0 ? ret : s->data_end;
+    }
+}
+
+
+/*
+ * Handle reopen.
+ *
+ * We must implement reopen handlers, otherwise reopen just don't work. Handle
+ * new options and don't care about preallocation state, as it is handled in
+ * set/check permission handlers.
+ */
+
+static int preallocate_reopen_prepare(BDRVReopenState *reopen_state,
+                                      BlockReopenQueue *queue, Error **errp)
+{
+    PreallocateOpts *opts = g_new0(PreallocateOpts, 1);
+
+    if (!preallocate_absorb_opts(opts, reopen_state->options,
+                                 reopen_state->bs->file->bs, errp)) {
+        g_free(opts);
+        return -EINVAL;
+    }
+
+    reopen_state->opaque = opts;
+
+    return 0;
+}
+
+static void preallocate_reopen_commit(BDRVReopenState *state)
+{
+    BDRVPreallocateState *s = state->bs->opaque;
+
+    s->opts = *(PreallocateOpts *)state->opaque;
+
+    g_free(state->opaque);
+    state->opaque = NULL;
+}
+
+static void preallocate_reopen_abort(BDRVReopenState *state)
+{
+    g_free(state->opaque);
+    state->opaque = NULL;
+}
+
+static coroutine_fn int preallocate_co_preadv_part(
+        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, int flags)
+{
+    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                               flags);
+}
+
+static int coroutine_fn preallocate_co_pdiscard(BlockDriverState *bs,
+                                               int64_t offset, int bytes)
+{
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
+}
+
+static bool can_write_resize(uint64_t perm)
+{
+    return (perm & BLK_PERM_WRITE) && (perm & BLK_PERM_RESIZE);
+}
+
+static bool has_prealloc_perms(BlockDriverState *bs)
+{
+    BDRVPreallocateState *s = bs->opaque;
+
+    if (can_write_resize(bs->file->perm)) {
+        assert(!(bs->file->shared_perm & BLK_PERM_WRITE));
+        assert(!(bs->file->shared_perm & BLK_PERM_RESIZE));
+        return true;
+    }
+
+    assert(s->data_end < 0);
+    assert(s->zero_start < 0);
+    assert(s->file_end < 0);
+    return false;
+}
+
+/*
+ * Call on each write. Returns true if @want_merge_zero is true and the region
+ * [offset, offset + bytes) is zeroed (as a result of this call or earlier
+ * preallocation).
+ *
+ * want_merge_zero is used to merge write-zero request with preallocation in
+ * one bdrv_co_pwrite_zeroes() call.
+ */
+static bool coroutine_fn handle_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes, bool want_merge_zero)
+{
+    BDRVPreallocateState *s = bs->opaque;
+    int64_t end = offset + bytes;
+    int64_t prealloc_start, prealloc_end;
+    int ret;
+
+    if (!has_prealloc_perms(bs)) {
+        /* We don't have state neither should try to recover it */
+        return false;
+    }
+
+    if (s->data_end < 0) {
+        s->data_end = bdrv_getlength(bs->file->bs);
+        if (s->data_end < 0) {
+            return false;
+        }
+
+        if (s->file_end < 0) {
+            s->file_end = s->data_end;
+        }
+    }
+
+    if (end <= s->data_end) {
+        return false;
+    }
+
+    /* We have valid s->data_end, and request writes beyond it. */
+
+    s->data_end = end;
+    if (s->zero_start < 0 || !want_merge_zero) {
+        s->zero_start = end;
+    }
+
+    if (s->file_end < 0) {
+        s->file_end = bdrv_getlength(bs->file->bs);
+        if (s->file_end < 0) {
+            return false;
+        }
+    }
+
+    /* Now s->data_end, s->zero_start and s->file_end are valid. */
+
+    if (end <= s->file_end) {
+        /* No preallocation needed. */
+        return want_merge_zero && offset >= s->zero_start;
+    }
+
+    /* Now we want new preallocation, as request writes beyond s->file_end. */
+
+    prealloc_start = want_merge_zero ? MIN(offset, s->file_end) : s->file_end;
+    prealloc_end = QEMU_ALIGN_UP(end + s->opts.prealloc_size,
+                                 s->opts.prealloc_align);
+
+    ret = bdrv_co_pwrite_zeroes(
+            bs->file, prealloc_start, prealloc_end - prealloc_start,
+            BDRV_REQ_NO_FALLBACK | BDRV_REQ_SERIALISING | BDRV_REQ_NO_WAIT);
+    if (ret < 0) {
+        s->file_end = ret;
+        return false;
+    }
+
+    s->file_end = prealloc_end;
+    return want_merge_zero;
+}
+
+static int coroutine_fn preallocate_co_pwrite_zeroes(BlockDriverState *bs,
+        int64_t offset, int bytes, BdrvRequestFlags flags)
+{
+    bool want_merge_zero =
+        !(flags & ~(BDRV_REQ_ZERO_WRITE | BDRV_REQ_NO_FALLBACK));
+    if (handle_write(bs, offset, bytes, want_merge_zero)) {
+        return 0;
+    }
+
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
+}
+
+static coroutine_fn int preallocate_co_pwritev_part(BlockDriverState *bs,
+                                                    uint64_t offset,
+                                                    uint64_t bytes,
+                                                    QEMUIOVector *qiov,
+                                                    size_t qiov_offset,
+                                                    int flags)
+{
+    handle_write(bs, offset, bytes, false);
+
+    return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                flags);
+}
+
+static int coroutine_fn
+preallocate_co_truncate(BlockDriverState *bs, int64_t offset,
+                        bool exact, PreallocMode prealloc,
+                        BdrvRequestFlags flags, Error **errp)
+{
+    ERRP_GUARD();
+    BDRVPreallocateState *s = bs->opaque;
+    int ret;
+
+    if (s->data_end >= 0 && offset > s->data_end) {
+        if (s->file_end < 0) {
+            s->file_end = bdrv_getlength(bs->file->bs);
+            if (s->file_end < 0) {
+                error_setg(errp, "failed to get file length");
+                return s->file_end;
+            }
+        }
+
+        if (prealloc == PREALLOC_MODE_FALLOC) {
+            /*
+             * If offset <= s->file_end, the task is already done, just
+             * update s->data_end, to move part of "filter preallocation"
+             * to "preallocation requested by user".
+             * Otherwise just proceed to preallocate missing part.
+             */
+            if (offset <= s->file_end) {
+                s->data_end = offset;
+                return 0;
+            }
+        } else {
+            /*
+             * We have to drop our preallocation, to
+             * - avoid "Cannot use preallocation for shrinking files" in
+             *   case of offset < file_end
+             * - give PREALLOC_MODE_OFF a chance to keep small disk
+             *   usage
+             * - give PREALLOC_MODE_FULL a chance to actually write the
+             *   whole region as user expects
+             */
+            if (s->file_end > s->data_end) {
+                ret = bdrv_co_truncate(bs->file, s->data_end, true,
+                                       PREALLOC_MODE_OFF, 0, errp);
+                if (ret < 0) {
+                    s->file_end = ret;
+                    error_prepend(errp, "preallocate-filter: failed to drop "
+                                  "write-zero preallocation: ");
+                    return ret;
+                }
+                s->file_end = s->data_end;
+            }
+        }
+
+        s->data_end = offset;
+    }
+
+    ret = bdrv_co_truncate(bs->file, offset, exact, prealloc, flags, errp);
+    if (ret < 0) {
+        s->file_end = s->zero_start = s->data_end = ret;
+        return ret;
+    }
+
+    if (has_prealloc_perms(bs)) {
+        s->file_end = s->zero_start = s->data_end = offset;
+    }
+    return 0;
+}
+
+static int coroutine_fn preallocate_co_flush(BlockDriverState *bs)
+{
+    return bdrv_co_flush(bs->file->bs);
+}
+
+static int64_t preallocate_getlength(BlockDriverState *bs)
+{
+    int64_t ret;
+    BDRVPreallocateState *s = bs->opaque;
+
+    if (s->data_end >= 0) {
+        return s->data_end;
+    }
+
+    ret = bdrv_getlength(bs->file->bs);
+
+    if (has_prealloc_perms(bs)) {
+        s->file_end = s->zero_start = s->data_end = ret;
+    }
+
+    return ret;
+}
+
+static int preallocate_check_perm(BlockDriverState *bs,
+                                  uint64_t perm, uint64_t shared, Error **errp)
+{
+    BDRVPreallocateState *s = bs->opaque;
+
+    if (s->data_end >= 0 && !can_write_resize(perm)) {
+        /*
+         * Lose permissions.
+         * We should truncate in check_perm, as in set_perm bs->file->perm will
+         * be already changed, and we should not violate it.
+         */
+        if (s->file_end < 0) {
+            s->file_end = bdrv_getlength(bs->file->bs);
+            if (s->file_end < 0) {
+                error_setg(errp, "Failed to get file length");
+                return s->file_end;
+            }
+        }
+
+        if (s->data_end < s->file_end) {
+            int ret = bdrv_truncate(bs->file, s->data_end, true,
+                                    PREALLOC_MODE_OFF, 0, NULL);
+            if (ret < 0) {
+                error_setg(errp, "Failed to drop preallocation");
+                s->file_end = ret;
+                return ret;
+            }
+            s->file_end = s->data_end;
+        }
+    }
+
+    return 0;
+}
+
+static void preallocate_set_perm(BlockDriverState *bs,
+                                 uint64_t perm, uint64_t shared)
+{
+    BDRVPreallocateState *s = bs->opaque;
+
+    if (can_write_resize(perm)) {
+        if (s->data_end < 0) {
+            s->data_end = s->file_end = s->zero_start =
+                bdrv_getlength(bs->file->bs);
+        }
+    } else {
+        /*
+         * We drop our permissions, as well as allow shared
+         * permissions (see preallocate_child_perm), anyone will be able to
+         * change the child, so mark all states invalid. We'll regain control if
+         * get good permissions back.
+         */
+        s->data_end = s->file_end = s->zero_start = -EINVAL;
+    }
+}
+
+static void preallocate_child_perm(BlockDriverState *bs, BdrvChild *c,
+    BdrvChildRole role, BlockReopenQueue *reopen_queue,
+    uint64_t perm, uint64_t shared, uint64_t *nperm, uint64_t *nshared)
+{
+    bdrv_default_perms(bs, c, role, reopen_queue, perm, shared, nperm, nshared);
+
+    if (can_write_resize(perm)) {
+        /* This should come by default, but let's enforce: */
+        *nperm |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
+
+        /*
+         * Don't share, to keep our states s->file_end, s->data_end and
+         * s->zero_start valid.
+         */
+        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
+    }
+}
+
+BlockDriver bdrv_preallocate_filter = {
+    .format_name = "preallocate",
+    .instance_size = sizeof(BDRVPreallocateState),
+
+    .bdrv_getlength = preallocate_getlength,
+    .bdrv_open = preallocate_open,
+    .bdrv_close = preallocate_close,
+
+    .bdrv_reopen_prepare  = preallocate_reopen_prepare,
+    .bdrv_reopen_commit   = preallocate_reopen_commit,
+    .bdrv_reopen_abort    = preallocate_reopen_abort,
+
+    .bdrv_co_preadv_part = preallocate_co_preadv_part,
+    .bdrv_co_pwritev_part = preallocate_co_pwritev_part,
+    .bdrv_co_pwrite_zeroes = preallocate_co_pwrite_zeroes,
+    .bdrv_co_pdiscard = preallocate_co_pdiscard,
+    .bdrv_co_flush = preallocate_co_flush,
+    .bdrv_co_truncate = preallocate_co_truncate,
+
+    .bdrv_check_perm = preallocate_check_perm,
+    .bdrv_set_perm = preallocate_set_perm,
+    .bdrv_child_perm = preallocate_child_perm,
+
+    .has_variable_length = true,
+    .is_filter = true,
+};
+
+static void bdrv_preallocate_init(void)
+{
+    bdrv_register(&bdrv_preallocate_filter);
+}
+
+block_init(bdrv_preallocate_init);
diff --git a/block/meson.build b/block/meson.build
index 5dcc1e5cce..7595d86c41 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -12,6 +12,7 @@ block_ss.add(files(
   'block-copy.c',
   'commit.c',
   'copy-on-read.c',
+  'preallocate.c',
   'create.c',
   'crypto.c',
   'dirty-bitmap.c',
-- 
2.29.2


