Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90C37D410
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:04:11 +0200 (CEST)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgv5W-0004Wc-6E
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguV2-00022B-IW
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:44762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUz-0000op-FJ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=jUzyxOas3D4hkM6Th+OZ/ZukUBJ1FSlPRUclUe0K3ok=; b=N3LeN9g7qc7o
 HMy+cPEhD40WDZN4U8OGokiw+iKBuiHmtn7JAPSo1k5ZaOLGdhJn3Rlfc9y2xusJxB2GS1zCzIRVC
 4Hiehuta2m3lFOd+sVN2APGIEHc0NUriYlvxcqYtSoEsOYaYYLnys5T+O0XCS+u/7fCMiWVoz3I3X
 pNOh0=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUu-002BHm-5E; Wed, 12 May 2021 22:26:20 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH v1 4/7] migration/snapshot: Block layer AIO support in
 qemu-snapshot
Date: Wed, 12 May 2021 22:26:16 +0300
Message-Id: <20210512192619.537268-5-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512192619.537268-1-andrey.gruzdev@virtuozzo.com>
References: <20210512192619.537268-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit enables asynchronous block layer I/O for qemu-snapshot tool.
Implementation provides in-order request completion delivery to simplify
migration code.

Several file utility routines are introduced as well.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snapshot.h |  30 +++++
 meson.build             |   2 +-
 qemu-snapshot-io.c      | 266 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 297 insertions(+), 1 deletion(-)
 create mode 100644 qemu-snapshot-io.c

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index 154e11e9a5..7b3406fd56 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -34,6 +34,23 @@
 /* RAM slice size for snapshot revert */
 #define SLICE_SIZE_REVERT           (16 * PAGE_SIZE_MAX)
 
+typedef struct AioRing AioRing;
+
+typedef struct AioRingRequest {
+    void *opaque;               /* Opaque */
+
+    void *data;                 /* Data buffer */
+    int64_t offset;             /* Offset */
+    size_t size;                /* Size */
+} AioRingRequest;
+
+typedef struct AioRingEvent {
+    AioRingRequest *origin;     /* Originating request */
+    ssize_t status;             /* Completion status */
+} AioRingEvent;
+
+typedef ssize_t coroutine_fn (*AioRingFunc)(AioRingRequest *req);
+
 typedef struct StateSaveCtx {
     BlockBackend *blk;          /* Block backend */
 } StateSaveCtx;
@@ -56,4 +73,17 @@ StateLoadCtx *get_load_context(void);
 int coroutine_fn save_state_main(StateSaveCtx *s);
 int coroutine_fn load_state_main(StateLoadCtx *s);
 
+AioRing *coroutine_fn aio_ring_new(AioRingFunc func, unsigned ring_entries,
+        unsigned max_inflight);
+void aio_ring_free(AioRing *ring);
+void aio_ring_set_max_inflight(AioRing *ring, unsigned max_inflight);
+AioRingRequest *coroutine_fn aio_ring_get_request(AioRing *ring);
+void coroutine_fn aio_ring_submit(AioRing *ring);
+AioRingEvent *coroutine_fn aio_ring_wait_event(AioRing *ring);
+void coroutine_fn aio_ring_complete(AioRing *ring);
+
+QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable);
+void qemu_fsplice(QEMUFile *f_dst, QEMUFile *f_src, size_t size);
+void qemu_fsplice_tail(QEMUFile *f_dst, QEMUFile *f_src);
+
 #endif /* QEMU_SNAPSHOT_H */
diff --git a/meson.build b/meson.build
index b851671914..c25fc518df 100644
--- a/meson.build
+++ b/meson.build
@@ -2361,7 +2361,7 @@ if have_tools
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls], install: true)
-  qemu_snapshot = executable('qemu-snapshot', files('qemu-snapshot.c', 'qemu-snapshot-vm.c'),
+  qemu_snapshot = executable('qemu-snapshot', files('qemu-snapshot.c', 'qemu-snapshot-vm.c', 'qemu-snapshot-io.c'),
                dependencies: [blockdev, qemuutil, migration], install: true)
 
   subdir('storage-daemon')
diff --git a/qemu-snapshot-io.c b/qemu-snapshot-io.c
new file mode 100644
index 0000000000..cd6428a4a2
--- /dev/null
+++ b/qemu-snapshot-io.c
@@ -0,0 +1,266 @@
+/*
+ * QEMU External Snapshot Utility
+ *
+ * Copyright Virtuozzo GmbH, 2021
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/coroutine.h"
+#include "sysemu/block-backend.h"
+#include "migration/qemu-file.h"
+#include "qemu-snapshot.h"
+
+/*
+ * AIO ring.
+ *
+ * Coroutine-based environment to support asynchronous I/O operations
+ * providing in-order completion event delivery.
+ *
+ * All routines (with an exception of aio_ring_free()) are required to be
+ * called from the same coroutine.
+ *
+ * Call sequence to keep AIO ring filled:
+ *
+ *   aio_ring_new()             !
+ *                              !
+ *   aio_ring_get_request()     !<------!<------!
+ *   aio_ring_submit()          !------>!       !
+ *                              !               !
+ *   aio_ring_wait_event()      !               !
+ *   aio_ring_complete()        !-------------->!
+ *                              !
+ *   aio_ring_free()            !
+ *
+ */
+
+typedef struct AioRingEntry {
+    AioRingRequest request;     /* I/O request */
+    AioRingEvent event;         /* I/O completion event */
+    bool owned;                 /* Owned by caller */
+} AioRingEntry;
+
+typedef struct AioRing {
+    unsigned head;              /* Head entry index */
+    unsigned tail;              /* Tail entry index */
+
+    unsigned ring_mask;         /* Mask for ring entry indices */
+    unsigned ring_entries;      /* Number of entries in the ring */
+
+    AioRingFunc func;           /* Routine to call */
+
+    Coroutine *main_co;         /* Caller's coroutine */
+    bool waiting;               /* Caller is waiting for event */
+
+    unsigned length;            /* Tail-head distance */
+    unsigned inflight;          /* Number of in-flight requests */
+    unsigned max_inflight;      /* Maximum in-flight requests */
+
+    AioRingEntry entries[];     /* Flex-array of AioRingEntry */
+} AioRing;
+
+static void coroutine_fn aio_ring_co(void *opaque)
+{
+    AioRing *ring = (AioRing *) opaque;
+    AioRingEntry *entry = &ring->entries[ring->tail];
+
+    ring->tail = (ring->tail + 1) & ring->ring_mask;
+    ring->length++;
+
+    ring->inflight++;
+    entry->owned = false;
+
+    entry->event.status = ring->func(&entry->request);
+
+    entry->event.origin = &entry->request;
+    entry->owned = true;
+    ring->inflight--;
+
+    if (ring->waiting) {
+        ring->waiting = false;
+        aio_co_wake(ring->main_co);
+    }
+}
+
+AioRingRequest *coroutine_fn aio_ring_get_request(AioRing *ring)
+{
+    assert(qemu_coroutine_self() == ring->main_co);
+
+    if (ring->length >= ring->ring_entries ||
+            ring->inflight >= ring->max_inflight) {
+        return NULL;
+    }
+
+    return &ring->entries[ring->tail].request;
+}
+
+void coroutine_fn aio_ring_submit(AioRing *ring)
+{
+    assert(qemu_coroutine_self() == ring->main_co);
+    assert(ring->length < ring->ring_entries);
+
+    qemu_coroutine_enter(qemu_coroutine_create(aio_ring_co, ring));
+}
+
+AioRingEvent *coroutine_fn aio_ring_wait_event(AioRing *ring)
+{
+    AioRingEntry *entry = &ring->entries[ring->head];
+
+    assert(qemu_coroutine_self() == ring->main_co);
+
+    if (!ring->length) {
+        return NULL;
+    }
+
+    while (true) {
+        if (entry->owned) {
+            return &entry->event;
+        }
+        ring->waiting = true;
+        qemu_coroutine_yield();
+    }
+
+    /* NOTREACHED */
+}
+
+void coroutine_fn aio_ring_complete(AioRing *ring)
+{
+    AioRingEntry *entry = &ring->entries[ring->head];
+
+    assert(qemu_coroutine_self() == ring->main_co);
+    assert(ring->length);
+
+    ring->head = (ring->head + 1) & ring->ring_mask;
+    ring->length--;
+
+    entry->event.origin = NULL;
+    entry->event.status = 0;
+}
+
+/* Create new AIO ring */
+AioRing *coroutine_fn aio_ring_new(AioRingFunc func, unsigned ring_entries,
+                                   unsigned max_inflight)
+{
+    AioRing *ring;
+
+    assert(is_power_of_2(ring_entries));
+    assert(max_inflight && max_inflight <= ring_entries);
+
+    ring = g_malloc0(sizeof(AioRing) + ring_entries * sizeof(AioRingEntry));
+    ring->main_co = qemu_coroutine_self();
+    ring->ring_entries = ring_entries;
+    ring->ring_mask = ring_entries - 1;
+    ring->max_inflight = max_inflight;
+    ring->func = func;
+
+    return ring;
+}
+
+/* Free AIO ring */
+void aio_ring_free(AioRing *ring)
+{
+    assert(!ring->inflight);
+    g_free(ring);
+}
+
+/* Limit the maximum number of in-flight AIO requests */
+void aio_ring_set_max_inflight(AioRing *ring, unsigned max_inflight)
+{
+    ring->max_inflight = MIN(max_inflight, ring->ring_entries);
+}
+
+static ssize_t bdrv_vmstate_get_buffer(void *opaque, uint8_t *buf, int64_t pos,
+                                       size_t size, Error **errp)
+{
+    return bdrv_load_vmstate((BlockDriverState *) opaque, buf, pos, size);
+}
+
+static ssize_t bdrv_vmstate_writev_buffer(void *opaque, struct iovec *iov,
+        int iovcnt, int64_t pos, Error **errp)
+{
+    QEMUIOVector qiov;
+    int res;
+
+    qemu_iovec_init_external(&qiov, iov, iovcnt);
+
+    res = bdrv_writev_vmstate((BlockDriverState *) opaque, &qiov, pos);
+    if (res < 0) {
+        return res;
+    }
+
+    return qiov.size;
+}
+
+static int bdrv_vmstate_fclose(void *opaque, Error **errp)
+{
+    return bdrv_flush((BlockDriverState *) opaque);
+}
+
+static const QEMUFileOps bdrv_vmstate_read_ops = {
+    .get_buffer = bdrv_vmstate_get_buffer,
+    .close      = bdrv_vmstate_fclose,
+};
+
+static const QEMUFileOps bdrv_vmstate_write_ops = {
+    .writev_buffer  = bdrv_vmstate_writev_buffer,
+    .close          = bdrv_vmstate_fclose,
+};
+
+/* Create QEMUFile to access vmstate stream on QCOW2 image */
+QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable)
+{
+    if (is_writable) {
+        return qemu_fopen_ops(bs, &bdrv_vmstate_write_ops);
+    }
+
+    return qemu_fopen_ops(bs, &bdrv_vmstate_read_ops);
+}
+
+/* Move number of bytes from the source QEMUFile to destination */
+void qemu_fsplice(QEMUFile *f_dst, QEMUFile *f_src, size_t size)
+{
+    size_t rest = size;
+
+    while (rest) {
+        uint8_t *ptr = NULL;
+        size_t req_size;
+        size_t count;
+
+        req_size = MIN(rest, INPLACE_READ_MAX);
+        count = qemu_peek_buffer(f_src, &ptr, req_size, 0);
+        qemu_file_skip(f_src, count);
+
+        qemu_put_buffer(f_dst, ptr, count);
+        rest -= count;
+    }
+}
+
+/*
+ * Move data from source QEMUFile to destination
+ * until EOF is reached on source.
+ */
+void qemu_fsplice_tail(QEMUFile *f_dst, QEMUFile *f_src)
+{
+    bool eof = false;
+
+    while (!eof) {
+        const size_t size = INPLACE_READ_MAX;
+        uint8_t *buffer = NULL;
+        size_t count;
+
+        count = qemu_peek_buffer(f_src, &buffer, size, 0);
+        qemu_file_skip(f_src, count);
+
+        /* Reached EOF on source? */
+        if (count != size) {
+            eof = true;
+        }
+
+        qemu_put_buffer(f_dst, buffer, count);
+    }
+}
-- 
2.27.0


