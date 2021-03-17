Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D833F612
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:53:06 +0100 (CET)
Received: from localhost ([::1]:43906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZPt-0001jb-6N
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ7S-0000tS-HA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:34:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:49892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ7Q-0004sM-N1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=RrwxIBwXtwLmbUQ/MT7DER+r9mV6A3s/DhkSW9EIpng=; b=teFp42zdibli
 +2oIk6cy+8OIOBaR4ihZT92uG0f7cx0wtycZvJ8CEX8hFCWfifpwLH1RoUeq+x9t22WjLWvBFe7vv
 gY1fad2GkbRQp8IXRM1DwQ2nsYo+GUNiZeYilwonlGuGTNxyKlcp16R38miLHQD728n3PwvwpEG96
 m05MM=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ6p-0034yI-Qh; Wed, 17 Mar 2021 19:33:24 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 3/9] migration/snap-tool: Preparations to run code in main
 loop context
Date: Wed, 17 Mar 2021 19:32:16 +0300
Message-Id: <20210317163222.182609-4-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
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

Major part of code is using QEMUFile and block layer routines, thus to
take advantage from concurrent I/O operations we need to use coroutines
and run in the the main loop context.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snap.h  |  3 +++
 meson.build          |  2 +-
 qemu-snap-handlers.c | 38 ++++++++++++++++++++++++++
 qemu-snap.c          | 63 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 qemu-snap-handlers.c

diff --git a/include/qemu-snap.h b/include/qemu-snap.h
index b8e48bfcbb..b6fd779b13 100644
--- a/include/qemu-snap.h
+++ b/include/qemu-snap.h
@@ -32,4 +32,7 @@ typedef struct SnapLoadState {
 SnapSaveState *snap_save_get_state(void);
 SnapLoadState *snap_load_get_state(void);
 
+int coroutine_fn snap_save_state_main(SnapSaveState *sn);
+int coroutine_fn snap_load_state_main(SnapLoadState *sn);
+
 #endif /* QEMU_SNAP_H */
diff --git a/meson.build b/meson.build
index 11564165ba..252c55d6a3 100644
--- a/meson.build
+++ b/meson.build
@@ -2324,7 +2324,7 @@ if have_tools
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls], install: true)
-  qemu_snap = executable('qemu-snap', files('qemu-snap.c'),
+  qemu_snap = executable('qemu-snap', files('qemu-snap.c', 'qemu-snap-handlers.c'),
                dependencies: [blockdev, qemuutil, migration], install: true)
 
   subdir('storage-daemon')
diff --git a/qemu-snap-handlers.c b/qemu-snap-handlers.c
new file mode 100644
index 0000000000..bdc1911909
--- /dev/null
+++ b/qemu-snap-handlers.c
@@ -0,0 +1,38 @@
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
+#include "sysemu/block-backend.h"
+#include "qemu/coroutine.h"
+#include "qemu/cutils.h"
+#include "qemu/bitmap.h"
+#include "qemu/error-report.h"
+#include "io/channel-buffer.h"
+#include "migration/qemu-file-channel.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/ram.h"
+#include "qemu-snap.h"
+
+/* Save snapshot data from incoming migration stream */
+int coroutine_fn snap_save_state_main(SnapSaveState *sn)
+{
+    /* TODO: implement */
+    return 0;
+}
+
+/* Load snapshot data and send it with outgoing migration stream */
+int coroutine_fn snap_load_state_main(SnapLoadState *sn)
+{
+    /* TODO: implement */
+    return 0;
+}
diff --git a/qemu-snap.c b/qemu-snap.c
index c9f8d7166a..ec56aa55d2 100644
--- a/qemu-snap.c
+++ b/qemu-snap.c
@@ -44,6 +44,14 @@
 #define OPT_CACHE   256
 #define OPT_AIO     257
 
+/* Snapshot task execution state */
+typedef struct SnapTaskState {
+    QEMUBH *bh;                 /* BH to enter task's coroutine */
+    Coroutine *co;              /* Coroutine to execute task */
+
+    int ret;                    /* Return code, -EINPROGRESS until complete */
+} SnapTaskState;
+
 /* Parameters for snapshot saving */
 typedef struct SnapSaveParams {
     const char *filename;       /* QCOW2 image file name */
@@ -177,6 +185,51 @@ static BlockBackend *snap_open(const char *filename, int flags)
     return blk;
 }
 
+static void coroutine_fn do_snap_save_co(void *opaque)
+{
+    SnapTaskState *task_state = opaque;
+    SnapSaveState *sn = snap_save_get_state();
+
+    /* Enter main routine */
+    task_state->ret = snap_save_state_main(sn);
+}
+
+static void coroutine_fn do_snap_load_co(void *opaque)
+{
+    SnapTaskState *task_state = opaque;
+    SnapLoadState *sn = snap_load_get_state();
+
+    /* Enter main routine */
+    task_state->ret = snap_load_state_main(sn);
+}
+
+/* We use BH to enter coroutine from the main loop context */
+static void enter_co_bh(void *opaque)
+{
+    SnapTaskState *task_state = opaque;
+
+    qemu_coroutine_enter(task_state->co);
+    /* Delete BH once we entered coroutine from the main loop */
+    qemu_bh_delete(task_state->bh);
+    task_state->bh = NULL;
+}
+
+static int run_snap_task(CoroutineEntry *entry)
+{
+    SnapTaskState task_state;
+
+    task_state.bh = qemu_bh_new(enter_co_bh, &task_state);
+    task_state.co = qemu_coroutine_create(entry, &task_state);
+    task_state.ret = -EINPROGRESS;
+
+    qemu_bh_schedule(task_state.bh);
+    while (task_state.ret == -EINPROGRESS) {
+        main_loop_wait(false);
+    }
+
+    return task_state.ret;
+}
+
 static int snap_save(const SnapSaveParams *params)
 {
     SnapSaveState *sn;
@@ -191,6 +244,11 @@ static int snap_save(const SnapSaveParams *params)
         goto fail;
     }
 
+    res = run_snap_task(do_snap_save_co);
+    if (res) {
+        error_report("Failed to save snapshot: error=%d", res);
+    }
+
 fail:
     snap_save_destroy_state();
 
@@ -210,6 +268,11 @@ static int snap_load(SnapLoadParams *params)
         goto fail;
     }
 
+    res = run_snap_task(do_snap_load_co);
+    if (res) {
+        error_report("Failed to load snapshot: error=%d", res);
+    }
+
 fail:
     snap_load_destroy_state();
 
-- 
2.25.1


