Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D75422B2D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:38:01 +0200 (CEST)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlZw-0005hc-UP
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlWd-0002g7-Rx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlWa-0004KR-Ks
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwcirkykePZ5kt35TXk/Ur8b+lkfLpxZZeeQU9GP6Cs=;
 b=hMEt66G+KikIkp9aFXZzxggJOKfEm96ICDhPHkUfZ00t96rhPW7w/8b50CU+2EZfZi20m2
 X0P3qrCBaALG90W3goQvEwQW4U4A+FnP0UHbhKrb3sJS7YorfnpPOt0rNYHRq+ug2ByslI
 W1prOHbD17M3ERIecYiVTgSO3HcQMnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-U2HxWwImNBOTr1KS7vDjyw-1; Tue, 05 Oct 2021 10:34:30 -0400
X-MC-Unique: U2HxWwImNBOTr1KS7vDjyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D6184A5E0;
 Tue,  5 Oct 2021 14:34:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70BB11043260;
 Tue,  5 Oct 2021 14:34:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 02/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
Date: Tue,  5 Oct 2021 10:31:52 -0400
Message-Id: <20211005143215.29500-3-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block-backend.h currently contains a mix of functions:
some of them run under the BQL and modify the block layer graph,
others are instead thread-safe and perform I/O in iothreads.
It is not easy to understand which function is part of which
group (I/O vs GS), and this patch aims to clarify it.

The "GS" functions need the BQL, and often use
aio_context_acquire/release and/or drain to be sure they
can modify the graph safely.
The I/O function are instead thread safe, and can run in
any AioContext.

By splitting the header in two files, block-backend-io.h
and block-backend-global-state.h we have a clearer view on what
needs what kind of protection. block-backend-common.h
instead contains common structures shared by both headers.

In addition, remove "block/block.h" include as it seems
it is not necessary anymore, together with "qemu/iov.h"

block-backend.h is left there for legacy and to avoid changing
all includes in all c files that use the block-backend APIs.

Assertions are added in the next patch.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c                       |  10 +-
 include/sysemu/block-backend-common.h       |  74 ++++++
 include/sysemu/block-backend-global-state.h | 136 ++++++++++
 include/sysemu/block-backend-io.h           | 130 ++++++++++
 include/sysemu/block-backend.h              | 262 +-------------------
 5 files changed, 350 insertions(+), 262 deletions(-)
 create mode 100644 include/sysemu/block-backend-common.h
 create mode 100644 include/sysemu/block-backend-global-state.h
 create mode 100644 include/sysemu/block-backend-io.h

diff --git a/block/block-backend.c b/block/block-backend.c
index deb55c272e..d31ae16b99 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -78,6 +78,7 @@ struct BlockBackend {
     bool allow_aio_context_change;
     bool allow_write_beyond_eof;
 
+    /* Protected by BQL lock */
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
 
@@ -110,12 +111,14 @@ static const AIOCBInfo block_backend_aiocb_info = {
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
 
@@ -985,6 +988,7 @@ BlockBackend *blk_by_dev(void *dev)
 void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
                      void *opaque)
 {
+    g_assert(qemu_in_main_thread());
     blk->dev_ops = ops;
     blk->dev_opaque = opaque;
 
diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
new file mode 100644
index 0000000000..52ff6a4d26
--- /dev/null
+++ b/include/sysemu/block-backend-common.h
@@ -0,0 +1,74 @@
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
+#include "block/throttle-groups.h"
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
index 0000000000..2e75e1e62a
--- /dev/null
+++ b/include/sysemu/block-backend-global-state.h
@@ -0,0 +1,136 @@
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
+ * If a function modifies the graph, it also uses drain and/or
+ * aio_context_acquire/release to be sure it has unique access.
+ * aio_context locking is needed together with BQL because of
+ * the thread-safe I/O API that concurrently runs and accesses
+ * the graph without the BQL.
+ *
+ * It is important to note that not all of these functions are
+ * necessarily limited to running under the BQL, but they would
+ * require additional auditing and may small thread-safety changes
+ * to move them into the I/O API. Often it's not worth doing that
+ * work since the APIs are only used with the BQL held at the
+ * moment, so they have been placed in the GS API (for now).
+ *
+ * All functions in this header must use this assertion:
+ * g_assert(qemu_in_main_thread());
+ * to catch when they are accidentally called without the BQL.
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
+const char *blk_name(const BlockBackend *blk);
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
+char *blk_get_attached_dev_id(BlockBackend *blk);
+BlockBackend *blk_by_dev(void *dev);
+BlockBackend *blk_by_qdev_id(const char *id, Error **errp);
+void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops, void *opaque);
+
+int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
+int64_t blk_nb_sectors(BlockBackend *blk);
+int blk_commit_all(void);
+void blk_drain(BlockBackend *blk);
+void blk_drain_all(void);
+void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
+                      BlockdevOnError on_write_error);
+bool blk_supports_write_perm(BlockBackend *blk);
+bool blk_is_sg(BlockBackend *blk);
+bool blk_enable_write_cache(BlockBackend *blk);
+void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
+void blk_lock_medium(BlockBackend *blk, bool locked);
+void blk_eject(BlockBackend *blk, bool eject_flag);
+int blk_get_flags(BlockBackend *blk);
+void blk_set_guest_block_size(BlockBackend *blk, int align);
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
+BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
+                                  BlockCompletionFunc *cb,
+                                  void *opaque, int ret);
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
+#endif /* BLOCK_BACKEND_GS_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
new file mode 100644
index 0000000000..a77b2080ce
--- /dev/null
+++ b/include/sysemu/block-backend-io.h
@@ -0,0 +1,130 @@
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
+ * I/O API functions. These functions are thread-safe, and therefore
+ * can run in any thread as long as they have called
+ * aio_context_acquire/release().
+ */
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
+int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
+                               unsigned int bytes, QEMUIOVector *qiov,
+                               BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
+                                     unsigned int bytes,
+                                     QEMUIOVector *qiov, size_t qiov_offset,
+                                     BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
+                               unsigned int bytes, QEMUIOVector *qiov,
+                               BdrvRequestFlags flags);
+
+static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
+                                            unsigned int bytes, void *buf,
+                                            BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+
+    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
+}
+
+static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
+                                             unsigned int bytes, void *buf,
+                                             BdrvRequestFlags flags)
+{
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+
+    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
+}
+
+BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                  int bytes, BdrvRequestFlags flags,
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
+BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int bytes,
+                             BlockCompletionFunc *cb, void *opaque);
+void blk_aio_cancel(BlockAIOCB *acb);
+void blk_aio_cancel_async(BlockAIOCB *acb);
+int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
+                          BlockCompletionFunc *cb, void *opaque);
+int blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
+int blk_co_flush(BlockBackend *blk);
+int blk_flush(BlockBackend *blk);
+void blk_inc_in_flight(BlockBackend *blk);
+void blk_dec_in_flight(BlockBackend *blk);
+bool blk_is_inserted(BlockBackend *blk);
+bool blk_is_available(BlockBackend *blk);
+int64_t blk_getlength(BlockBackend *blk);
+void blk_get_geometry(BlockBackend *blk, uint64_t *nb_sectors_ptr);
+void *blk_try_blockalign(BlockBackend *blk, size_t size);
+void *blk_blockalign(BlockBackend *blk, size_t size);
+bool blk_is_writable(BlockBackend *blk);
+BlockdevOnError blk_get_on_error(BlockBackend *blk, bool is_read);
+BlockErrorAction blk_get_error_action(BlockBackend *blk, bool is_read,
+                                      int error);
+void blk_error_action(BlockBackend *blk, BlockErrorAction action,
+                      bool is_read, int error);
+int blk_get_max_iov(BlockBackend *blk);
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
+                          int bytes);
+int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
+int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                      int bytes, BdrvRequestFlags flags);
+int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+                                      int bytes, BdrvRequestFlags flags);
+int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
+                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
+
+uint32_t blk_get_request_alignment(BlockBackend *blk);
+uint32_t blk_get_max_transfer(BlockBackend *blk);
+uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
+
+int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
+                                   BlockBackend *blk_out, int64_t off_out,
+                                   int bytes, BdrvRequestFlags read_flags,
+                                   BdrvRequestFlags write_flags);
+
+
+int blk_make_empty(BlockBackend *blk, Error **errp);
+
+#endif /* BLOCK_BACKEND_IO_H */
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 9ac5f7bbd3..038be9fc40 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -13,265 +13,9 @@
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
-                               unsigned int bytes, QEMUIOVector *qiov,
-                               BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
-                                     unsigned int bytes,
-                                     QEMUIOVector *qiov, size_t qiov_offset,
-                                     BdrvRequestFlags flags);
-int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
-                               unsigned int bytes, QEMUIOVector *qiov,
-                               BdrvRequestFlags flags);
-
-static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
-                                            unsigned int bytes, void *buf,
-                                            BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-
-    return blk_co_preadv(blk, offset, bytes, &qiov, flags);
-}
-
-static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             unsigned int bytes, void *buf,
-                                             BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-
-    return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
-}
-
-int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                      int bytes, BdrvRequestFlags flags);
-BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                  int bytes, BdrvRequestFlags flags,
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
-BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int bytes,
-                             BlockCompletionFunc *cb, void *opaque);
-void blk_aio_cancel(BlockAIOCB *acb);
-void blk_aio_cancel_async(BlockAIOCB *acb);
-int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
-BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
-                          BlockCompletionFunc *cb, void *opaque);
-int blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
-int blk_co_flush(BlockBackend *blk);
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
-                                      int bytes, BdrvRequestFlags flags);
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int bytes);
-int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-                 PreallocMode prealloc, BdrvRequestFlags flags, Error **errp);
-int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
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
-                                   int bytes, BdrvRequestFlags read_flags,
-                                   BdrvRequestFlags write_flags);
-
-const BdrvChild *blk_root(BlockBackend *blk);
-
-int blk_make_empty(BlockBackend *blk, Error **errp);
+/* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
 #endif
-- 
2.27.0


