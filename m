Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA0C6523F8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:51:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7esP-000588-G3; Tue, 20 Dec 2022 10:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7esL-00051o-8J
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7esH-00064Z-Gd
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671551388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MScXhK2+4RFOnjiAIHvznxHvN2G7ZFH2DpswjbTmdFU=;
 b=aXP0EiBx0E0EkjQdOb0XMe1RntKbHwtK2tZT8j0jkU68I9JjDeXauRYrhfKvPwmzYoNMIQ
 7UklrYt0aSMtr39xhM+pVWLKSN1qlgztEWC0IjTNJfdZZMw+GTuh4MpLtMN4y9iPXd37tv
 rF2l0wKOhQ5531kcerrQkkY/s81D0hw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-CzDKieuIM1SaZv6JPYt_cg-1; Tue, 20 Dec 2022 10:49:46 -0500
X-MC-Unique: CzDKieuIM1SaZv6JPYt_cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F90F3817973
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 15:49:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07CA140C1073;
 Tue, 20 Dec 2022 15:49:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBC6C21E6935; Tue, 20 Dec 2022 16:49:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH v2 4/5] coroutine: Split qemu/coroutine-core.h off
 qemu/coroutine.h
Date: Tue, 20 Dec 2022 16:49:43 +0100
Message-Id: <20221220154944.3611845-5-armbru@redhat.com>
In-Reply-To: <20221220154944.3611845-1-armbru@redhat.com>
References: <20221220154944.3611845-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

qemu/coroutine.h and qemu/lockable.h include each other.

They need each other only in macro expansions, so we could simply drop
both inclusions to break the loop, and add suitable includes to files
that expand the macros.

Instead, move a part of qemu/coroutine.h to new qemu/coroutine-core.h
so that qemu/coroutine-core.h doesn't need qemu/lockable.h, and
qemu/lockable.h only needs qemu/coroutine-core.h.  Result:
qemu/coroutine.h includes qemu/lockable.h includes
qemu/coroutine-core.h.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/9pfs/coth.h                |   2 +-
 include/block/aio.h           |   2 +-
 include/io/channel.h          |   2 +-
 include/qemu/coroutine-core.h | 154 ++++++++++++++++++++++++++++++++++
 include/qemu/coroutine.h      |  97 +--------------------
 include/qemu/lockable.h       |   2 +-
 include/qemu/typedefs.h       |   1 -
 block.c                       |   2 +-
 block/block-copy.c            |   2 +-
 block/io_uring.c              |   2 +-
 block/linux-aio.c             |   2 +-
 block/mirror.c                |   2 +-
 block/vdi.c                   |   2 +-
 chardev/char.c                |   2 +-
 hw/9pfs/coth.c                |   2 +-
 hw/block/virtio-blk.c         |   2 +-
 migration/rdma.c              |   2 +-
 nbd/client-connection.c       |   1 +
 net/colo-compare.c            |   2 +-
 qapi/qmp-dispatch.c           |   2 +-
 tests/unit/test-aio.c         |   2 +-
 ui/console.c                  |   1 +
 util/thread-pool.c            |   2 +-
 23 files changed, 175 insertions(+), 115 deletions(-)
 create mode 100644 include/qemu/coroutine-core.h

diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index 1a1edbdc2a..2c54249b35 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -16,7 +16,7 @@
 #define QEMU_9P_COTH_H
 
 #include "qemu/thread.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "9p.h"
 
 /*
diff --git a/include/block/aio.h b/include/block/aio.h
index 0f65a3cc9e..3a546e7515 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -17,7 +17,7 @@
 #ifdef CONFIG_LINUX_IO_URING
 #include <liburing.h>
 #endif
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/queue.h"
 #include "qemu/event_notifier.h"
 #include "qemu/thread.h"
diff --git a/include/io/channel.h b/include/io/channel.h
index f1b7e05f81..78b15f7870 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -22,7 +22,7 @@
 #define QIO_CHANNEL_H
 
 #include "qom/object.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "block/aio.h"
 
 #define TYPE_QIO_CHANNEL "qio-channel"
diff --git a/include/qemu/coroutine-core.h b/include/qemu/coroutine-core.h
new file mode 100644
index 0000000000..230bb56517
--- /dev/null
+++ b/include/qemu/coroutine-core.h
@@ -0,0 +1,154 @@
+/*
+ * QEMU coroutine implementation
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Stefan Hajnoczi    <stefanha@linux.vnet.ibm.com>
+ *  Kevin Wolf         <kwolf@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_COROUTINE_CORE_H
+#define QEMU_COROUTINE_CORE_H
+
+/**
+ * Coroutines are a mechanism for stack switching and can be used for
+ * cooperative userspace threading.  These functions provide a simple but
+ * useful flavor of coroutines that is suitable for writing sequential code,
+ * rather than callbacks, for operations that need to give up control while
+ * waiting for events to complete.
+ *
+ * These functions are re-entrant and may be used outside the global mutex.
+ *
+ * Functions that execute in coroutine context cannot be called
+ * directly from normal functions.  Use @coroutine_fn to mark such
+ * functions.  For example:
+ *
+ *   static void coroutine_fn foo(void) {
+ *       ....
+ *   }
+ *
+ * In the future it would be nice to have the compiler or a static
+ * checker catch misuse of such functions.  This annotation might make
+ * it possible and in the meantime it serves as documentation.
+ */
+
+/**
+ * Mark a function that executes in coroutine context
+ *
+ *
+ * Functions that execute in coroutine context cannot be called
+ * directly from normal functions.  Use @coroutine_fn to mark such
+ * functions.  For example:
+ *
+ *   static void coroutine_fn foo(void) {
+ *       ....
+ *   }
+ *
+ * In the future it would be nice to have the compiler or a static
+ * checker catch misuse of such functions.  This annotation might make
+ * it possible and in the meantime it serves as documentation.
+ */
+
+typedef struct Coroutine Coroutine;
+typedef struct CoMutex CoMutex;
+
+/**
+ * Coroutine entry point
+ *
+ * When the coroutine is entered for the first time, opaque is passed in as an
+ * argument.
+ *
+ * When this function returns, the coroutine is destroyed automatically and
+ * execution continues in the caller who last entered the coroutine.
+ */
+typedef void coroutine_fn CoroutineEntry(void *opaque);
+
+/**
+ * Create a new coroutine
+ *
+ * Use qemu_coroutine_enter() to actually transfer control to the coroutine.
+ * The opaque argument is passed as the argument to the entry point.
+ */
+Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque);
+
+/**
+ * Transfer control to a coroutine
+ */
+void qemu_coroutine_enter(Coroutine *coroutine);
+
+/**
+ * Transfer control to a coroutine if it's not active (i.e. part of the call
+ * stack of the running coroutine). Otherwise, do nothing.
+ */
+void qemu_coroutine_enter_if_inactive(Coroutine *co);
+
+/**
+ * Transfer control to a coroutine and associate it with ctx
+ */
+void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co);
+
+/**
+ * Transfer control back to a coroutine's caller
+ *
+ * This function does not return until the coroutine is re-entered using
+ * qemu_coroutine_enter().
+ */
+void coroutine_fn qemu_coroutine_yield(void);
+
+/**
+ * Get the AioContext of the given coroutine
+ */
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
+
+/**
+ * Get the currently executing coroutine
+ */
+Coroutine *qemu_coroutine_self(void);
+
+/**
+ * Return whether or not currently inside a coroutine
+ *
+ * This can be used to write functions that work both when in coroutine context
+ * and when not in coroutine context.  Note that such functions cannot use the
+ * coroutine_fn annotation since they work outside coroutine context.
+ */
+bool qemu_in_coroutine(void);
+
+/**
+ * Return true if the coroutine is currently entered
+ *
+ * A coroutine is "entered" if it has not yielded from the current
+ * qemu_coroutine_enter() call used to run it.  This does not mean that the
+ * coroutine is currently executing code since it may have transferred control
+ * to another coroutine using qemu_coroutine_enter().
+ *
+ * When several coroutines enter each other there may be no way to know which
+ * ones have already been entered.  In such situations this function can be
+ * used to avoid recursively entering coroutines.
+ */
+bool qemu_coroutine_entered(Coroutine *co);
+
+/**
+ * Initialises a CoMutex. This must be called before any other operation is used
+ * on the CoMutex.
+ */
+void qemu_co_mutex_init(CoMutex *mutex);
+
+/**
+ * Locks the mutex. If the lock cannot be taken immediately, control is
+ * transferred to the caller of the current coroutine.
+ */
+void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex);
+
+/**
+ * Unlocks the mutex and schedules the next coroutine that was waiting for this
+ * lock to be run.
+ */
+void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex);
+
+#endif
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 2496a4f4ef..a65be6697f 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -15,6 +15,7 @@
 #ifndef QEMU_COROUTINE_H
 #define QEMU_COROUTINE_H
 
+#include "qemu/coroutine-core.h"
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 
@@ -40,84 +41,6 @@
  * it possible and in the meantime it serves as documentation.
  */
 
-typedef struct Coroutine Coroutine;
-
-/**
- * Coroutine entry point
- *
- * When the coroutine is entered for the first time, opaque is passed in as an
- * argument.
- *
- * When this function returns, the coroutine is destroyed automatically and
- * execution continues in the caller who last entered the coroutine.
- */
-typedef void coroutine_fn CoroutineEntry(void *opaque);
-
-/**
- * Create a new coroutine
- *
- * Use qemu_coroutine_enter() to actually transfer control to the coroutine.
- * The opaque argument is passed as the argument to the entry point.
- */
-Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque);
-
-/**
- * Transfer control to a coroutine
- */
-void qemu_coroutine_enter(Coroutine *coroutine);
-
-/**
- * Transfer control to a coroutine if it's not active (i.e. part of the call
- * stack of the running coroutine). Otherwise, do nothing.
- */
-void qemu_coroutine_enter_if_inactive(Coroutine *co);
-
-/**
- * Transfer control to a coroutine and associate it with ctx
- */
-void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co);
-
-/**
- * Transfer control back to a coroutine's caller
- *
- * This function does not return until the coroutine is re-entered using
- * qemu_coroutine_enter().
- */
-void coroutine_fn qemu_coroutine_yield(void);
-
-/**
- * Get the AioContext of the given coroutine
- */
-AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
-
-/**
- * Get the currently executing coroutine
- */
-Coroutine *qemu_coroutine_self(void);
-
-/**
- * Return whether or not currently inside a coroutine
- *
- * This can be used to write functions that work both when in coroutine context
- * and when not in coroutine context.  Note that such functions cannot use the
- * coroutine_fn annotation since they work outside coroutine context.
- */
-bool qemu_in_coroutine(void);
-
-/**
- * Return true if the coroutine is currently entered
- *
- * A coroutine is "entered" if it has not yielded from the current
- * qemu_coroutine_enter() call used to run it.  This does not mean that the
- * coroutine is currently executing code since it may have transferred control
- * to another coroutine using qemu_coroutine_enter().
- *
- * When several coroutines enter each other there may be no way to know which
- * ones have already been entered.  In such situations this function can be
- * used to avoid recursively entering coroutines.
- */
-bool qemu_coroutine_entered(Coroutine *co);
-
 /**
  * Provides a mutex that can be used to synchronise coroutines
  */
@@ -145,24 +68,6 @@ struct CoMutex {
     Coroutine *holder;
 };
 
-/**
- * Initialises a CoMutex. This must be called before any other operation is used
- * on the CoMutex.
- */
-void qemu_co_mutex_init(CoMutex *mutex);
-
-/**
- * Locks the mutex. If the lock cannot be taken immediately, control is
- * transferred to the caller of the current coroutine.
- */
-void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex);
-
-/**
- * Unlocks the mutex and schedules the next coroutine that was waiting for this
- * lock to be run.
- */
-void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex);
-
 /**
  * Assert that the current coroutine holds @mutex.
  */
diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index 86db7cb04c..9823220446 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -13,7 +13,7 @@
 #ifndef QEMU_LOCKABLE_H
 #define QEMU_LOCKABLE_H
 
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/thread.h"
 
 typedef void QemuLockUnlockFunc(void *);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 688408e048..0f7329b70f 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -37,7 +37,6 @@ typedef struct BusState BusState;
 typedef struct Chardev Chardev;
 typedef struct Clock Clock;
 typedef struct CompatProperty CompatProperty;
-typedef struct CoMutex CoMutex;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
 typedef struct CPUArchState CPUArchState;
diff --git a/block.c b/block.c
index 9c2ac757e4..be78be95f9 100644
--- a/block.c
+++ b/block.c
@@ -44,7 +44,7 @@
 #include "sysemu/block-backend.h"
 #include "qemu/notify.h"
 #include "qemu/option.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "block/qapi.h"
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
diff --git a/block/block-copy.c b/block/block-copy.c
index 5e59d6262f..3261a6a0d2 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -20,7 +20,7 @@
 #include "block/reqlist.h"
 #include "sysemu/block-backend.h"
 #include "qemu/units.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "block/aio_task.h"
 #include "qemu/error-report.h"
 #include "qemu/memalign.h"
diff --git a/block/io_uring.c b/block/io_uring.c
index 973e15d876..1ece7a75c8 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -14,7 +14,7 @@
 #include "qemu/queue.h"
 #include "block/block.h"
 #include "block/raw-aio.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qapi/error.h"
 #include "trace.h"
 
diff --git a/block/linux-aio.c b/block/linux-aio.c
index d2cfb7f523..9740cae864 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -13,7 +13,7 @@
 #include "block/block.h"
 #include "block/raw-aio.h"
 #include "qemu/event_notifier.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qapi/error.h"
 
 #include <libaio.h>
diff --git a/block/mirror.c b/block/mirror.c
index 251adc5ae0..ef3a111b4e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/range.h"
 #include "trace.h"
 #include "block/blockjob_int.h"
diff --git a/block/vdi.c b/block/vdi.c
index 479bcfe820..fed390a939 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -61,7 +61,7 @@
 #include "qemu/option.h"
 #include "qemu/bswap.h"
 #include "migration/blocker.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/cutils.h"
 #include "qemu/uuid.h"
 #include "qemu/memalign.h"
diff --git a/chardev/char.c b/chardev/char.c
index 4c5de16402..e98cb0f13b 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -37,7 +37,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/id.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/yank.h"
 
 #include "chardev-internal.h"
diff --git a/hw/9pfs/coth.c b/hw/9pfs/coth.c
index 2802d41cce..706fa2b272 100644
--- a/hw/9pfs/coth.c
+++ b/hw/9pfs/coth.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "block/thread-pool.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f717550fdc..c55f8eb119 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -34,7 +34,7 @@
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-blk-common.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
diff --git a/migration/rdma.c b/migration/rdma.c
index 94a55dd95b..70dcf51b6e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -27,7 +27,7 @@
 #include "qemu/rcu.h"
 #include "qemu/sockets.h"
 #include "qemu/bitmap.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "exec/memory.h"
 #include <sys/socket.h>
 #include <netdb.h>
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 0c5f917efa..e5b1046a1c 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -29,6 +29,7 @@
 
 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/clone-visitor.h"
+#include "qemu/coroutine.h"
 
 struct NBDClientConnection {
     /* Initialization constants, never change */
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 7f9e6f89ce..d6591aa0ea 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -32,7 +32,7 @@
 #include "util.h"
 
 #include "block/aio-wait.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 
 #define TYPE_COLO_COMPARE "colo-compare"
 typedef struct CompareState CompareState;
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8..2352eeeb23 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -22,7 +22,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp/qbool.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/main-loop.h"
 
 Visitor *qobject_input_visitor_new_qmp(QObject *obj)
diff --git a/tests/unit/test-aio.c b/tests/unit/test-aio.c
index 178048d2f2..321d7ab01a 100644
--- a/tests/unit/test-aio.c
+++ b/tests/unit/test-aio.c
@@ -16,7 +16,7 @@
 #include "qemu/timer.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "qemu/main-loop.h"
 
 static AioContext *ctx;
diff --git a/ui/console.c b/ui/console.c
index 9ff9217f9b..ab43561fe1 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -27,6 +27,7 @@
 #include "hw/qdev-core.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qemu/coroutine.h"
 #include "qemu/fifo8.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
diff --git a/util/thread-pool.c b/util/thread-pool.c
index 31113b5860..f98f090287 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -17,7 +17,7 @@
 #include "qemu/osdep.h"
 #include "qemu/queue.h"
 #include "qemu/thread.h"
-#include "qemu/coroutine.h"
+#include "qemu/coroutine-core.h"
 #include "trace.h"
 #include "block/thread-pool.h"
 #include "qemu/main-loop.h"
-- 
2.38.1


