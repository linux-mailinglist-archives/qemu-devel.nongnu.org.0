Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447264963E8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:26:59 +0100 (CET)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxgg-0007tq-85
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMj-0007dW-Gy
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMd-0008Bg-7Z
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJ1Jo4jnCMZGu7eYcLbz3Ceo3dyZF0hZaQs/tFSfoBA=;
 b=duztKdhJZL9bLDZYiYZexEYBLKidEQWRiN63tc/8F8miUKqtXdRQCz16K+VorPrVIzcmtg
 tK20ysRvY3GkpV4YVzo6Ep3Jolzm2qwg20eeRq6MmgKIt+tbdsQoeWk9wGvXkQaY8hZ0Z4
 W2l/65vFqi5cXF/WmrsjZSsxwv9RU94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-9HJEnI-hPaWZOpLmO38_mg-1; Fri, 21 Jan 2022 12:06:11 -0500
X-MC-Unique: 9HJEnI-hPaWZOpLmO38_mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26A0080EF8C;
 Fri, 21 Jan 2022 17:06:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39AEF7EBCA;
 Fri, 21 Jan 2022 17:06:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 05/33] include/sysemu/block-backend: split header into I/O
 and global state (GS) API
Date: Fri, 21 Jan 2022 12:05:16 -0500
Message-Id: <20220121170544.2049944-6-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the previous patches, split block-backend.h
in block-backend-io.h and block-backend-global-state.h

In addition, remove "block/block.h" include as it seems
it is not necessary anymore, together with "qemu/iov.h"

block-backend-common.h contains the structures shared between
the two headers, and the functions that can't be categorized as
I/O or global state.

Assertions are added in the next patch.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c                       |   9 +-
 include/sysemu/block-backend-common.h       |  84 ++++++
 include/sysemu/block-backend-global-state.h | 115 +++++++++
 include/sysemu/block-backend-io.h           | 145 +++++++++++
 include/sysemu/block-backend.h              | 269 +-------------------
 5 files changed, 353 insertions(+), 269 deletions(-)
 create mode 100644 include/sysemu/block-backend-common.h
 create mode 100644 include/sysemu/block-backend-global-state.h
 create mode 100644 include/sysemu/block-backend-io.h

diff --git a/block/block-backend.c b/block/block-backend.c
index 23e727199b..6f91dcc85d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -79,6 +79,7 @@ struct BlockBackend {
     bool allow_aio_context_change;
     bool allow_write_beyond_eof;
 
+    /* Protected by BQL lock */
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
 
@@ -111,12 +112,14 @@ static const AIOCBInfo block_backend_aiocb_info = {
 static void drive_info_del(DriveInfo *dinfo);
 static BlockBackend *bdrv_first_blk(BlockDriverState *bs);
 
-/* All BlockBackends */
+/* All BlockBackends. Protected by BQL lock. */
 static QTAILQ_HEAD(, BlockBackend) block_backends =
     QTAILQ_HEAD_INITIALIZER(block_backends);
 
-/* All BlockBackends referenced by the monitor and which are iterated through by
- * blk_next() */
+/*
+ * All BlockBackends referenced by the monitor and which are iterated through by
+ * blk_next(). Protected by BQL lock.
+ */
 static QTAILQ_HEAD(, BlockBackend) monitor_block_backends =
     QTAILQ_HEAD_INITIALIZER(monitor_block_backends);
 
diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
new file mode 100644
index 0000000000..6963bbf45a
--- /dev/null
+++ b/include/sysemu/block-backend-common.h
@@ -0,0 +1,84 @@
+/*
+ * QEMU Block backends
+ *
+ * Copyright (C) 2014-2016 Red Hat, Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>,
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1
+ * or later.  See the COPYING.LIB file in the top-level directory.
+ */
+
+#ifndef BLOCK_BACKEND_COMMON_H
+#define BLOCK_BACKEND_COMMON_H
+
+#include "qemu/iov.h"
+#include "block/throttle-groups.h"
+
+/*
+ * TODO Have to include block/block.h for a bunch of block layer
+ * types.  Unfortunately, this pulls in the whole BlockDriverState
+ * API, which we don't want used by many BlockBackend users.  Some of
+ * the types belong here, and the rest should be split into a common
+ * header and one for the BlockDriverState API.
+ */
+#include "block/block.h"
+
+/* Callbacks for block device models */
+typedef struct BlockDevOps {
+    /*
+     * Runs when virtual media changed (monitor commands eject, change)
+     * Argument load is true on load and false on eject.
+     * Beware: doesn't run when a host device's physical media
+     * changes.  Sure would be useful if it did.
+     * Device models with removable media must implement this callback.
+     */
+    void (*change_media_cb)(void *opaque, bool load, Error **errp);
+    /*
+     * Runs when an eject request is issued from the monitor, the tray
+     * is closed, and the medium is locked.
+     * Device models that do not implement is_medium_locked will not need
+     * this callback.  Device models that can lock the medium or tray might
+     * want to implement the callback and unlock the tray when "force" is
+     * true, even if they do not support eject requests.
+     */
+    void (*eject_request_cb)(void *opaque, bool force);
+    /*
+     * Is the virtual tray open?
+     * Device models implement this only when the device has a tray.
+     */
+    bool (*is_tray_open)(void *opaque);
+    /*
+     * Is the virtual medium locked into the device?
+     * Device models implement this only when device has such a lock.
+     */
+    bool (*is_medium_locked)(void *opaque);
+    /*
+     * Runs when the size changed (e.g. monitor command block_resize)
+     */
+    void (*resize_cb)(void *opaque);
+    /*
+     * Runs when the backend receives a drain request.
+     */
+    void (*drained_begin)(void *opaque);
+    /*
+     * Runs when the backend's last drain request ends.
+     */
+    void (*drained_end)(void *opaque);
+    /*
+     * Is the device still busy?
+     */
+    bool (*drained_poll)(void *opaque);
+} BlockDevOps;
+
+/*
+ * This struct is embedded in (the private) BlockBackend struct and contains
+ * fields that must be public. This is in particular for QLIST_ENTRY() and
+ * friends so that BlockBackends can be kept in lists outside block-backend.c
+ */
+typedef struct BlockBackendPublic {
+    ThrottleGroupMember throttle_group_member;
+} BlockBackendPublic;
+
+#endif /* BLOCK_BACKEND_COMMON_H */
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
new file mode 100644
index 0000000000..4291401929
--- /dev/null
+++ b/include/sysemu/block-backend-global-state.h
@@ -0,0 +1,115 @@
+/*
+ * QEMU Block backends
+ *
+ * Copyright (C) 2014-2016 Red Hat, Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>,
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1
+ * or later.  See the COPYING.LIB file in the top-level directory.
+ */
+
+#ifndef BLOCK_BACKEND_GS_H
+#define BLOCK_BACKEND_GS_H
+
+#include "block-backend-common.h"
+
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
+BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm);
+BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
+                              uint64_t shared_perm, Error **errp);
+BlockBackend *blk_new_open(const char *filename, const char *reference,
+                           QDict *options, int flags, Error **errp);
+int blk_get_refcnt(BlockBackend *blk);
+void blk_ref(BlockBackend *blk);
+void blk_unref(BlockBackend *blk);
+void blk_remove_all_bs(void);
+BlockBackend *blk_by_name(const char *name);
+BlockBackend *blk_next(BlockBackend *blk);
+BlockBackend *blk_all_next(BlockBackend *blk);
+bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp);
+void monitor_remove_blk(BlockBackend *blk);
+
+BlockBackendPublic *blk_get_public(BlockBackend *blk);
+BlockBackend *blk_by_public(BlockBackendPublic *public);
+
+void blk_remove_bs(BlockBackend *blk);
+int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
+bool bdrv_has_blk(BlockDriverState *bs);
+bool bdrv_is_root_node(BlockDriverState *bs);
+int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
+                 Error **errp);
+void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm);
+
+void blk_iostatus_enable(BlockBackend *blk);
+bool blk_iostatus_is_enabled(const BlockBackend *blk);
+BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk);
+void blk_iostatus_disable(BlockBackend *blk);
+void blk_iostatus_reset(BlockBackend *blk);
+void blk_iostatus_set_err(BlockBackend *blk, int error);
+int blk_attach_dev(BlockBackend *blk, DeviceState *dev);
+void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
+DeviceState *blk_get_attached_dev(BlockBackend *blk);
+BlockBackend *blk_by_dev(void *dev);
+BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
+void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
+
+int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
+void blk_aio_cancel(BlockAIOCB *acb);
+int blk_commit_all(void);
+void blk_drain_all(void);
+void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
+                      BlockdevOnError on_write_error);
+bool blk_supports_write_perm(BlockBackend *blk);
+bool blk_is_sg(BlockBackend *blk);
+void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
+int blk_get_flags(BlockBackend *blk);
+bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp);
+void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason);
+void blk_op_block_all(BlockBackend *blk, Error *reason);
+void blk_op_unblock_all(BlockBackend *blk, Error *reason);
+int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
+                        Error **errp);
+void blk_add_aio_context_notifier(BlockBackend *blk,
+        void (*attached_aio_context)(AioContext *new_context, void *opaque),
+        void (*detach_aio_context)(void *opaque), void *opaque);
+void blk_remove_aio_context_notifier(BlockBackend *blk,
+                                     void (*attached_aio_context)(AioContext *,
+                                                                  void *),
+                                     void (*detach_aio_context)(void *),
+                                     void *opaque);
+void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify);
+void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify);
+BlockBackendRootState *blk_get_root_state(BlockBackend *blk);
+void blk_update_root_state(BlockBackend *blk);
+bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk);
+int blk_get_open_flags_from_root_state(BlockBackend *blk);
+
+int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
+                     int64_t pos, int size);
+int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
+int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz);
+int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo);
+
+void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg);
+void blk_io_limits_disable(BlockBackend *blk);
+void blk_io_limits_enable(BlockBackend *blk, const char *group);
+void blk_io_limits_update_group(BlockBackend *blk, const char *group);
+void blk_set_force_allow_inactivate(BlockBackend *blk);
+
+void blk_register_buf(BlockBackend *blk, void *host, size_t size);
+void blk_unregister_buf(BlockBackend *blk, void *host);
+
+const BdrvChild *blk_root(BlockBackend *blk);
+
+int blk_make_empty(BlockBackend *blk, Error **errp);
+
+#endif /* BLOCK_BACKEND_GS_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
new file mode 100644
index 0000000000..178cf197fb
--- /dev/null
+++ b/include/sysemu/block-backend-io.h
@@ -0,0 +1,145 @@
+/*
+ * QEMU Block backends
+ *
+ * Copyright (C) 2014-2016 Red Hat, Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>,
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1
+ * or later.  See the COPYING.LIB file in the top-level directory.
+ */
+
+#ifndef BLOCK_BACKEND_IO_H
+#define BLOCK_BACKEND_IO_H
+
+#include "block-backend-common.h"
+
+/*
+ * I/O API functions. These functions are thread-safe.
+ *
+ * See include/block/block-io.h for more information about
+ * the I/O API.
+ */
+
+const char *blk_name(const BlockBackend *blk);
+
+BlockDriverState *blk_bs(BlockBackend *blk);
+
+void blk_set_allow_write_beyond_eof(BlockBackend *blk, bool allow);
+void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow);
+void blk_set_disable_request_queuing(BlockBackend *blk, bool disable);
+
+int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes);
+int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
+               BdrvRequestFlags flags);
+char *blk_get_attached_dev_id(BlockBackend *blk);
+int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
+                               int64_t bytes, QEMUIOVector *qiov,
+                               BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
+                                     int64_t bytes,
+                                     QEMUIOVector *qiov, size_t qiov_offset,
+                                     BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
+                                int64_t bytes, QEMUIOVector *qiov,
+                                BdrvRequestFlags flags);
+
+static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
+                                            int64_t bytes, void *buf,
+                                            BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+
+    assert(bytes <= SIZE_MAX);
+
+    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
+}
+
+static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
+                                             int64_t bytes, void *buf,
+                                             BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+
+    assert(bytes <= SIZE_MAX);
+
+    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
+}
+
+BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                  int64_t bytes, BdrvRequestFlags flags,
+                                  BlockCompletionFunc *cb, void *opaque);
+
+BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
+                           QEMUIOVector *qiov, BdrvRequestFlags flags,
+                           BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
+                            QEMUIOVector *qiov, BdrvRequestFlags flags,
+                            BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_flush(BlockBackend *blk,
+                          BlockCompletionFunc *cb, void *opaque);
+BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
+                             BlockCompletionFunc *cb, void *opaque);
+void blk_aio_cancel_async(BlockAIOCB *acb);
+int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
+                          BlockCompletionFunc *cb, void *opaque);
+int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
+                                 int64_t bytes);
+int coroutine_fn blk_co_flush(BlockBackend *blk);
+int blk_flush(BlockBackend *blk);
+void blk_inc_in_flight(BlockBackend *blk);
+void blk_dec_in_flight(BlockBackend *blk);
+void blk_drain(BlockBackend *blk);
+bool blk_is_inserted(BlockBackend *blk);
+bool blk_is_available(BlockBackend *blk);
+void blk_lock_medium(BlockBackend *blk, bool locked);
+void blk_eject(BlockBackend *blk, bool eject_flag);
+int64_t blk_getlength(BlockBackend *blk);
+void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
+int64_t blk_nb_sectors(BlockBackend *blk);
+void *blk_try_blockalign(BlockBackend *blk, size_t size);
+void *blk_blockalign(BlockBackend *blk, size_t size);
+bool blk_is_writable(BlockBackend *blk);
+bool blk_enable_write_cache(BlockBackend *blk);
+BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read);
+BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
+                                      int error);
+void blk_error_action(BlockBackend *blk, BlockErrorAction action,
+                      bool is_read, int error);
+int blk_get_max_iov(BlockBackend *blk);
+int blk_get_max_hw_iov(BlockBackend *blk);
+void blk_set_guest_block_size(BlockBackend *blk, int align);
+
+void blk_invalidate_cache(BlockBackend *blk, Error **errp);
+
+void blk_io_plug(BlockBackend *blk);
+void blk_io_unplug(BlockBackend *blk);
+AioContext *blk_get_aio_context(BlockBackend *blk);
+BlockAcctStats *blk_get_stats(BlockBackend *blk);
+void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
+                  BlockCompletionFunc *cb, void *opaque);
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
+                          int64_t bytes);
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                      int64_t bytes, BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                      int64_t bytes, BdrvRequestFlags flags);
+int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
+BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
+                                  BlockCompletionFunc *cb,
+                                  void *opaque, int ret);
+
+uint32_t blk_get_request_alignment(BlockBackend *blk);
+uint32_t blk_get_max_transfer(BlockBackend *blk);
+uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
+
+int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
+                                   BlockBackend *blk_out, int64_t off_out,
+                                   int64_t bytes, BdrvRequestFlags read_flags,
+                                   BdrvRequestFlags write_flags);
+
+#endif /* BLOCK_BACKEND_IO_H */
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..038be9fc40 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -13,272 +13,9 @@
 #ifndef BLOCK_BACKEND_H
 #define BLOCK_BACKEND_H
 
-#include "qemu/iov.h"
-#include "block/throttle-groups.h"
+#include "block-backend-global-state.h"
+#include "block-backend-io.h"
 
-/*
- * TODO Have to include block/block.h for a bunch of block layer
- * types.  Unfortunately, this pulls in the whole BlockDriverState
- * API, which we don't want used by many BlockBackend users.  Some of
- * the types belong here, and the rest should be split into a common
- * header and one for the BlockDriverState API.
- */
-#include "block/block.h"
-
-/* Callbacks for block device models */
-typedef struct BlockDevOps {
-    /*
-     * Runs when virtual media changed (monitor commands eject, change)
-     * Argument load is true on load and false on eject.
-     * Beware: doesn't run when a host device's physical media
-     * changes.  Sure would be useful if it did.
-     * Device models with removable media must implement this callback.
-     */
-    void (*change_media_cb)(void *opaque, bool load, Error **errp);
-    /*
-     * Runs when an eject request is issued from the monitor, the tray
-     * is closed, and the medium is locked.
-     * Device models that do not implement is_medium_locked will not need
-     * this callback.  Device models that can lock the medium or tray might
-     * want to implement the callback and unlock the tray when "force" is
-     * true, even if they do not support eject requests.
-     */
-    void (*eject_request_cb)(void *opaque, bool force);
-    /*
-     * Is the virtual tray open?
-     * Device models implement this only when the device has a tray.
-     */
-    bool (*is_tray_open)(void *opaque);
-    /*
-     * Is the virtual medium locked into the device?
-     * Device models implement this only when device has such a lock.
-     */
-    bool (*is_medium_locked)(void *opaque);
-    /*
-     * Runs when the size changed (e.g. monitor command block_resize)
-     */
-    void (*resize_cb)(void *opaque);
-    /*
-     * Runs when the backend receives a drain request.
-     */
-    void (*drained_begin)(void *opaque);
-    /*
-     * Runs when the backend's last drain request ends.
-     */
-    void (*drained_end)(void *opaque);
-    /*
-     * Is the device still busy?
-     */
-    bool (*drained_poll)(void *opaque);
-} BlockDevOps;
-
-/* This struct is embedded in (the private) BlockBackend struct and contains
- * fields that must be public. This is in particular for QLIST_ENTRY() and
- * friends so that BlockBackends can be kept in lists outside block-backend.c
- * */
-typedef struct BlockBackendPublic {
-    ThrottleGroupMember throttle_group_member;
-} BlockBackendPublic;
-
-BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm);
-BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
-                              uint64_t shared_perm, Error **errp);
-BlockBackend *blk_new_open(const char *filename, const char *reference,
-                           QDict *options, int flags, Error **errp);
-int blk_get_refcnt(BlockBackend *blk);
-void blk_ref(BlockBackend *blk);
-void blk_unref(BlockBackend *blk);
-void blk_remove_all_bs(void);
-const char *blk_name(const BlockBackend *blk);
-BlockBackend *blk_by_name(const char *name);
-BlockBackend *blk_next(BlockBackend *blk);
-BlockBackend *blk_all_next(BlockBackend *blk);
-bool monitor_add_blk(BlockBackend *blk, const char *name, Error **errp);
-void monitor_remove_blk(BlockBackend *blk);
-
-BlockBackendPublic *blk_get_public(BlockBackend *blk);
-BlockBackend *blk_by_public(BlockBackendPublic *public);
-
-BlockDriverState *blk_bs(BlockBackend *blk);
-void blk_remove_bs(BlockBackend *blk);
-int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
-int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
-bool bdrv_has_blk(BlockDriverState *bs);
-bool bdrv_is_root_node(BlockDriverState *bs);
-int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
-                 Error **errp);
-void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm);
-
-void blk_set_allow_write_beyond_eof(BlockBackend *blk, bool allow);
-void blk_set_allow_aio_context_change(BlockBackend *blk, bool allow);
-void blk_set_disable_request_queuing(BlockBackend *blk, bool disable);
-void blk_iostatus_enable(BlockBackend *blk);
-bool blk_iostatus_is_enabled(const BlockBackend *blk);
-BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk);
-void blk_iostatus_disable(BlockBackend *blk);
-void blk_iostatus_reset(BlockBackend *blk);
-void blk_iostatus_set_err(BlockBackend *blk, int error);
-int blk_attach_dev(BlockBackend *blk, DeviceState *dev);
-void blk_detach_dev(BlockBackend *blk, DeviceState *dev);
-DeviceState *blk_get_attached_dev(BlockBackend *blk);
-char *blk_get_attached_dev_id(BlockBackend *blk);
-BlockBackend *blk_by_dev(void *dev);
-BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
-void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
-int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, QEMUIOVector *qiov,
-                               BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
-                                     int64_t bytes,
-                                     QEMUIOVector *qiov, size_t qiov_offset,
-                                     BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, QEMUIOVector *qiov,
-                               BdrvRequestFlags flags);
-
-static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
-                                            int64_t bytes, void *buf,
-                                            BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-
-    assert(bytes <= SIZE_MAX);
-
-    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
-}
-
-static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             int64_t bytes, void *buf,
-                                             BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-
-    assert(bytes <= SIZE_MAX);
-
-    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
-}
-
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int64_t bytes, BdrvRequestFlags flags);
-BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                  int64_t bytes, BdrvRequestFlags flags,
-                                  BlockCompletionFunc *cb, void *opaque);
-int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes);
-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
-               BdrvRequestFlags flags);
-int64_t blk_getlength(BlockBackend *blk);
-void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
-int64_t blk_nb_sectors(BlockBackend *blk);
-BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
-                           QEMUIOVector *qiov, BdrvRequestFlags flags,
-                           BlockCompletionFunc *cb, void *opaque);
-BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
-                            QEMUIOVector *qiov, BdrvRequestFlags flags,
-                            BlockCompletionFunc *cb, void *opaque);
-BlockAIOCB *blk_aio_flush(BlockBackend *blk,
-                          BlockCompletionFunc *cb, void *opaque);
-BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
-                             BlockCompletionFunc *cb, void *opaque);
-void blk_aio_cancel(BlockAIOCB *acb);
-void blk_aio_cancel_async(BlockAIOCB *acb);
-int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
-                          BlockCompletionFunc *cb, void *opaque);
-int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
-                                 int64_t bytes);
-int coroutine_fn blk_co_flush(BlockBackend *blk);
-int blk_flush(BlockBackend *blk);
-int blk_commit_all(void);
-void blk_inc_in_flight(BlockBackend *blk);
-void blk_dec_in_flight(BlockBackend *blk);
-void blk_drain(BlockBackend *blk);
-void blk_drain_all(void);
-void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
-                      BlockdevOnError on_write_error);
-BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read);
-BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
-                                      int error);
-void blk_error_action(BlockBackend *blk, BlockErrorAction action,
-                      bool is_read, int error);
-bool blk_supports_write_perm(BlockBackend *blk);
-bool blk_is_writable(BlockBackend *blk);
-bool blk_is_sg(BlockBackend *blk);
-bool blk_enable_write_cache(BlockBackend *blk);
-void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
-void blk_invalidate_cache(BlockBackend *blk, Error **errp);
-bool blk_is_inserted(BlockBackend *blk);
-bool blk_is_available(BlockBackend *blk);
-void blk_lock_medium(BlockBackend *blk, bool locked);
-void blk_eject(BlockBackend *blk, bool eject_flag);
-int blk_get_flags(BlockBackend *blk);
-uint32_t blk_get_request_alignment(BlockBackend *blk);
-uint32_t blk_get_max_transfer(BlockBackend *blk);
-uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
-int blk_get_max_iov(BlockBackend *blk);
-int blk_get_max_hw_iov(BlockBackend *blk);
-void blk_set_guest_block_size(BlockBackend *blk, int align);
-void *blk_try_blockalign(BlockBackend *blk, size_t size);
-void *blk_blockalign(BlockBackend *blk, size_t size);
-bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp);
-void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason);
-void blk_op_block_all(BlockBackend *blk, Error *reason);
-void blk_op_unblock_all(BlockBackend *blk, Error *reason);
-AioContext *blk_get_aio_context(BlockBackend *blk);
-int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
-                        Error **errp);
-void blk_add_aio_context_notifier(BlockBackend *blk,
-        void (*attached_aio_context)(AioContext *new_context, void *opaque),
-        void (*detach_aio_context)(void *opaque), void *opaque);
-void blk_remove_aio_context_notifier(BlockBackend *blk,
-                                     void (*attached_aio_context)(AioContext *,
-                                                                  void *),
-                                     void (*detach_aio_context)(void *),
-                                     void *opaque);
-void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify);
-void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify);
-void blk_io_plug(BlockBackend *blk);
-void blk_io_unplug(BlockBackend *blk);
-BlockAcctStats *blk_get_stats(BlockBackend *blk);
-BlockBackendRootState *blk_get_root_state(BlockBackend *blk);
-void blk_update_root_state(BlockBackend *blk);
-bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk);
-int blk_get_open_flags_from_root_state(BlockBackend *blk);
-
-void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
-                  BlockCompletionFunc *cb, void *opaque);
-int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                      int64_t bytes, BdrvRequestFlags flags);
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes);
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
-                     int64_t pos, int size);
-int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
-int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz);
-int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo);
-BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
-                                  BlockCompletionFunc *cb,
-                                  void *opaque, int ret);
-
-void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg);
-void blk_io_limits_disable(BlockBackend *blk);
-void blk_io_limits_enable(BlockBackend *blk, const char *group);
-void blk_io_limits_update_group(BlockBackend *blk, const char *group);
-void blk_set_force_allow_inactivate(BlockBackend *blk);
-
-void blk_register_buf(BlockBackend *blk, void *host, size_t size);
-void blk_unregister_buf(BlockBackend *blk, void *host);
-
-int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
-                                   BlockBackend *blk_out, int64_t off_out,
-                                   int64_t bytes, BdrvRequestFlags read_flags,
-                                   BdrvRequestFlags write_flags);
-
-const BdrvChild *blk_root(BlockBackend *blk);
-
-int blk_make_empty(BlockBackend *blk, Error **errp);
+/* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
 #endif
-- 
2.31.1


