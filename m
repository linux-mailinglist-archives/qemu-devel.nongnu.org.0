Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8A58175F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:23:59 +0200 (CEST)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNLi-0003JI-5E
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9w-00032q-DR
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9r-0006BI-JJ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:46 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3b1031727;
 Tue, 26 Jul 2022 16:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Q1xO/14ZKEEOrSxrbSAZCdVWXv8qzXLukIfTwfb3Zxo=;
 b=yUcrjwUobuevy3u1GXtk+YfQg6bcr1HNQgAoc92jLk3vIOz/EbmGG6jkcCYBAPRh65JA
 8LWXvW9s9TcUPsx8dfQSoIJvk4kzMRGlnziIIRSovoljvkk7ae6kXOp6EHAr8rJJAnPB
 Kq7q57h7fszYkkougkilcyPS4QaXe+fkiGQq40y80n7MHXJMiHF17rtXd6fvQMNgyfLd
 T073rTid+G5Jfv3dsTF7xOfAApFQ074ndMM7lc/yvTz0LBUAV5qbhazx6cAQIo585rL6
 P0kKzklvwjj4uReYlQR7mkBdv8wmqLfoVkDKne5+IgfNZ5yklrJ8rC/TWal40CoEgAJG hA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q1as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:18 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF2X4s006282; Tue, 26 Jul 2022 16:11:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:17 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSr023334;
 Tue, 26 Jul 2022 16:11:16 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-23; Tue, 26 Jul 2022 16:11:16 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 22/46] cpr: exec mode
Date: Tue, 26 Jul 2022 09:10:19 -0700
Message-Id: <1658851843-236870-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: RpAIc3mxgRf_OFBwd_otjab9O8nmR7FF
X-Proofpoint-GUID: RpAIc3mxgRf_OFBwd_otjab9O8nmR7FF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the cpr-exec migration mode.  Usage:
  qemu-system-$arch -migrate-mode-enable cpr-exec ...
  migrate_set_parameter mode cpr-exec
  migrate_set_parameter cpr-exec-args <arg1> <arg2> ... -incoming defer
  migrate -d file:<filename>
  ... poll for runstate inmigrate ...
  migrate_incoming file:<filename>

In this mode, the migrate command saves state to a file, directly exec's a
new version of qemu on the same host, replacing the original process while
retaining its PID, and loads the file via the migrate-incoming command.
The caller must specify a migration URI that writes to and reads from a
file.  Arguments for the new qemu process are taken from the @cpr-exec-args
parameter.  The first argument should be the path of a new qemu binary, or
a prefix command that exec's the new qemu binary.  The arguments must match
those used to initially start qemu, plus the -incoming option.

Guest RAM must be backed by a memory backend with share=on, but cannot
be memory-backend-ram, and the '-migrate-mode-enable cpr-exec' option
is required.  This causes secondary guest ram blocks (those not specified
on the command line) to be allocated by mmap'ing a memfd.  The memfds
are kept open across exec, their values are saved in special cpr state
which is retrieved after exec, and they are re-mmap'd.  Hence guest RAM is
preserved in place, albeit with new virtual addresses in the qemu process.
Since guest RAM is not copied, and storage blocks are not migrated, the
caller must disable all capabilities related to page and block copy, and
the implementation ignores all related parameters.

Cpr-exec mode supports memory-backend-memfd, memory-backend-epc, and vfio
devices in subsequent patches.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |  2 ++
 include/migration/cpr.h | 18 +++++++++++
 migration/cpr.c         | 85 +++++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build   |  1 +
 migration/migration.c   |  9 ++++++
 migration/ram.c         |  4 ++-
 qapi/migration.json     | 25 ++++++++++++---
 softmmu/physmem.c       | 48 +++++++++++++++++++++++++++-
 softmmu/runstate.c      |  4 ++-
 trace-events            |  1 +
 10 files changed, 190 insertions(+), 7 deletions(-)
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 122af30..42f6f4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3168,6 +3168,8 @@ F: tests/unit/test-strlist.c
 F: include/migration/cpr-state.h
 F: migration/cpr-state.c
 F: stubs/cpr-state.c
+F: include/migration/cpr.h
+F: migration/cpr.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
new file mode 100644
index 0000000..c48be2d
--- /dev/null
+++ b/include/migration/cpr.h
@@ -0,0 +1,18 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_H
+#define MIGRATION_CPR_H
+
+extern bool only_cpr_capable;
+
+void cpr_init(void);
+void cpr_exec(void);
+void cpr_exec_failed(Error *err);
+void cpr_preserve_fds(void);
+
+#endif
diff --git a/migration/cpr.c b/migration/cpr.c
new file mode 100644
index 0000000..698baa4
--- /dev/null
+++ b/migration/cpr.c
@@ -0,0 +1,85 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "migration/migration.h"
+#include "migration/misc.h"
+#include "migration/cpr.h"
+#include "migration/cpr-state.h"
+#include "sysemu/runstate.h"
+
+bool only_cpr_capable;
+static Notifier cpr_fd_notifier;
+
+static int preserve_fd(const char *name, int id, int fd, void *opaque)
+{
+    qemu_clear_cloexec(fd);
+    return 0;
+}
+
+static int unpreserve_fd(const char *name, int id, int fd, void *opaque)
+{
+    qemu_set_cloexec(fd);
+    return 0;
+}
+
+static void cpr_fd_notifier_func(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+
+    if (migrate_mode_of(s) == MIG_MODE_CPR_EXEC && migration_has_failed(s)) {
+        cpr_walk_fd(unpreserve_fd, 0);
+    }
+}
+
+void cpr_preserve_fds(void)
+{
+    cpr_walk_fd(preserve_fd, 0);
+}
+
+void cpr_init(void)
+{
+    cpr_state_load(&error_fatal);
+    migration_add_notifier(&cpr_fd_notifier, cpr_fd_notifier_func);
+}
+
+void cpr_exec(void)
+{
+    MigrationState *s = migrate_get_current();
+    Error *err = NULL;
+
+    if (migrate_mode_of(s) == MIG_MODE_CPR_EXEC && !migration_has_failed(s)) {
+        if (!migration_has_finished(s)) {
+            error_setg(&err, "cannot exec: migration status is '%s', "
+                             "but must be 'completed'",
+                       MigrationStatus_str(s->state));
+            goto error;
+        }
+
+        if (cpr_state_save(&err)) {
+            goto error;
+        }
+
+        qemu_system_exec_request(s->parameters.cpr_exec_args);
+    }
+    return;
+
+error:
+    cpr_exec_failed(err);
+}
+
+void cpr_exec_failed(Error *err)
+{
+    MigrationState *s = migrate_get_current();
+
+    migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
+    migrate_set_error(s, err);
+    error_report_err(err);
+    migration_call_notifiers(s);
+    cpr_state_unsave();
+}
diff --git a/migration/meson.build b/migration/meson.build
index f7d130d..5b65561 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel-block.c',
   'colo-failover.c',
   'colo.c',
+  'cpr.c',
   'cpr-state.c',
   'exec.c',
   'fd.c',
diff --git a/migration/migration.c b/migration/migration.c
index d7c6902..1a8a6ff 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -32,6 +32,7 @@
 #include "migration.h"
 #include "savevm.h"
 #include "qemu-file.h"
+#include "migration/cpr.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -231,6 +232,7 @@ void migration_object_init(void)
     blk_mig_init();
     ram_mig_init();
     dirty_bitmap_mig_init();
+    cpr_init();
 }
 
 void migration_cancel(const Error *error)
@@ -1964,6 +1966,7 @@ static void migrate_fd_cleanup(MigrationState *s)
     }
     migration_call_notifiers(s);
     block_cleanup_parameters(s);
+    cpr_exec();
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
@@ -2489,6 +2492,12 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
         return false;
     }
 
+    if (migrate_mode_of(s) == MIG_MODE_CPR_EXEC &&
+        !s->parameters.has_cpr_exec_args) {
+        error_setg(errp, "cpr-exec mode requires setting cpr-exec-args");
+        return false;
+    }
+
     if (migration_is_blocked(errp)) {
         return false;
     }
diff --git a/migration/ram.c b/migration/ram.c
index 3ea3b41..4c868d2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -165,6 +165,7 @@ out:
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
+           migrate_mode() == MIG_MODE_CPR_EXEC ||
            (migrate_ignore_shared() && qemu_ram_is_shared(block) &&
             ramblock_is_named_file(block));
 }
@@ -3058,7 +3059,8 @@ static void ram_init_bitmaps(RAMState *rs)
     WITH_RCU_READ_LOCK_GUARD() {
         ram_list_init_bitmaps();
         /* We don't use dirty log with background snapshots */
-        if (!migrate_background_snapshot()) {
+        if (!migrate_background_snapshot() &&
+            migrate_mode() == MIG_MODE_NORMAL) {
             memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
             migration_bitmap_sync_precopy(rs);
         }
diff --git a/qapi/migration.json b/qapi/migration.json
index 839fcd4..a068d4c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -586,10 +586,21 @@
 #              arguments must match those used to initially start qemu, plus
 #              the -incoming option.
 #
+# @cpr-exec: The migrate command saves state to a file, directly exec's a
+#            new version of qemu on the same host, replacing the original
+#            process while retaining its PID, and loads the file via the
+#            migrate-incoming command.  The caller must specify a migration URI
+#            that writes to and reads from a file.  Guest RAM must be backed by
+#            a memory backend with share=on, and cannot be memory-backend-ram.
+#            Guest RAM is not copied, and storage blocks are not migrated, so
+#            all capabilities related to page and block copy must be disabled,
+#            and all related parameters are ignored.  Arguments for the new
+#            qemu process are taken from the @cpr-exec-args parameter.
+#
 # Since: 7.1
 ##
 { 'enum': 'MigMode',
-  'data': [ 'normal', 'cpr-reboot' ] }
+  'data': [ 'normal', 'cpr-reboot', 'cpr-exec' ] }
 
 ##
 # @BitmapMigrationBitmapAliasTransform:
@@ -712,7 +723,11 @@
 #                         at tail stage.
 #                         The default value is false. (Since 5.1)
 #
-# @cpr-exec-args: defined in a subsequent patch.
+# @cpr-exec-args: arguments passed to new qemu for cpr-exec mode.  The first
+#                 argument should be the path of a new qemu binary, or a prefix
+#                 command that exec's the new qemu binary.  The arguments must
+#                 match those used to initially start qemu, plus the -incoming
+#                 option. (Since 7.1)
 #
 # @tls-creds: ID of the 'tls-creds' object that provides credentials for
 #             establishing a TLS connection over the migration data channel.
@@ -885,7 +900,8 @@
 #                         at tail stage.
 #                         The default value is false. (Since 5.1)
 #
-# @cpr-exec-args: defined in a subsequent patch.
+# @cpr-exec-args: Arguments passed to new qemu for cpr-exec mode.
+#                 See description in @MigrationParameter. (Since 7.1)
 #
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
 #             for establishing a TLS connection over the migration data
@@ -1090,7 +1106,8 @@
 #                         at tail stage.
 #                         The default value is false. (Since 5.1)
 #
-# @cpr-exec-args: defined in a subsequent patch.
+# @cpr-exec-args: Arguments passed to new qemu for cpr-exec mode.
+#                 See description in @MigrationParameter. (Since 7.1)
 #
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
 #             for establishing a TLS connection over the migration data
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cce721a..29baa0f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -44,6 +44,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/log.h"
 #include "qemu/memalign.h"
+#include "qemu/memfd.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
@@ -66,6 +67,8 @@
 
 #include "qemu/pmem.h"
 
+#include "migration/cpr-state.h"
+#include "migration/misc.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1971,6 +1974,40 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
     }
 }
 
+static bool memory_region_is_backend(MemoryRegion *mr)
+{
+    return !!object_dynamic_cast(OBJECT(mr)->parent, TYPE_MEMORY_BACKEND);
+}
+
+static void *qemu_anon_memfd_alloc(RAMBlock *rb, size_t maxlen, Error **errp)
+{
+    size_t len, align;
+    void *addr;
+    struct MemoryRegion *mr = rb->mr;
+    const char *name = memory_region_name(mr);
+    int mfd = cpr_find_memfd(name, &len, &maxlen, &align);
+
+    if (mfd >= 0) {
+        rb->used_length = len;
+        rb->max_length = maxlen;
+        mr->align = align;
+    } else {
+        len = rb->used_length;
+        maxlen = rb->max_length;
+        mr->align = QEMU_VMALLOC_ALIGN;
+        mfd = qemu_memfd_create(name, maxlen + mr->align, 0, 0, 0, errp);
+        if (mfd < 0) {
+            return NULL;
+        }
+        cpr_save_memfd(name, mfd, len, maxlen, mr->align);
+    }
+    rb->flags |= RAM_SHARED;
+    qemu_set_cloexec(mfd);
+    addr = file_ram_alloc(rb, maxlen, mfd, false, false, 0, errp);
+    trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+    return addr;
+}
+
 static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
     const bool noreserve = qemu_ram_is_noreserve(new_block);
@@ -1994,6 +2031,14 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 qemu_mutex_unlock_ramlist();
                 return;
             }
+        } else if (migrate_mode_enabled(MIG_MODE_CPR_EXEC) &&
+                   !memory_region_is_backend(new_block->mr)) {
+            new_block->host = qemu_anon_memfd_alloc(new_block,
+                                                    new_block->max_length,
+                                                    errp);
+            if (!new_block->host) {
+                return;
+            }
         } else {
             new_block->host = qemu_anon_ram_alloc(new_block->max_length,
                                                   &new_block->mr->align,
@@ -2005,8 +2050,8 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
         }
+        memory_try_enable_merging(new_block->host, new_block->max_length);
     }
 
     new_ram_size = MAX(old_ram_size,
@@ -2239,6 +2284,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    cpr_delete_memfd(memory_region_name(block->mr));
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 14b43df..fb86740 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -32,6 +32,7 @@
 #include "exec/cpu-common.h"
 #include "exec/gdbstub.h"
 #include "hw/boards.h"
+#include "migration/cpr.h"
 #include "migration/misc.h"
 #include "migration/postcopy-ram.h"
 #include "monitor/monitor.h"
@@ -692,9 +693,10 @@ static bool main_loop_should_exit(void)
 
         if (qemu_exec_requested()) {
             Error *err = NULL;
+            cpr_preserve_fds();
             execvp(exec_argv[0], exec_argv);
             error_setg_errno(&err, errno, "execvp %s failed", exec_argv[0]);
-            error_report_err(err);
+            cpr_exec_failed(err);
             g_strfreev(exec_argv);
             exec_argv = NULL;
             return false;
diff --git a/trace-events b/trace-events
index bc71006..07369bb 100644
--- a/trace-events
+++ b/trace-events
@@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
-- 
1.8.3.1


