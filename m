Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419892D7CD6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:28:17 +0100 (CET)
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmDI-00022b-6Z
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluR-0003hZ-Sv
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluC-00025n-QU
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5pi+lqtSy6x09huXwtETuWlRVAFp3UAGT9VF9Rjo9g=;
 b=Ns9vbfNiS+q+2K83FhBWkp1+1KUdk0lZDiPI488j7imKJlYgBgApNICL7tJQzaVwoFpXdt
 nWd5+LKmrE8Sreepi20dyBoZrSUp6ScFRr8O/IvORANG7RnMds6htscNcobPM5nWOa0gfA
 QXBCbPSSj/5ETg5AvGkcXwRohnv5C9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-7kHaR_xhPsKfmrjrHqm9Lw-1; Fri, 11 Dec 2020 12:08:28 -0500
X-MC-Unique: 7kHaR_xhPsKfmrjrHqm9Lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC62B8108;
 Fri, 11 Dec 2020 17:08:26 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7E525D734;
 Fri, 11 Dec 2020 17:08:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/34] fuse: Allow exporting BDSs via FUSE
Date: Fri, 11 Dec 2020 18:07:44 +0100
Message-Id: <20201211170812.228643-7-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

block-export-add type=fuse allows mounting block graph nodes via FUSE on
some existing regular file.  That file should then appears like a raw
disk image, and accesses to it result in accesses to the exported BDS.

Right now, we only implement the necessary block export functions to set
it up and shut it down.  We do not implement any access functions, so
accessing the mount point only results in errors.  This will be
addressed by a followup patch.

We keep a hash table of exported mount points, because we want to be
able to detect when users try to use a mount point twice.  This is
because we invoke stat() to check whether the given mount point is a
regular file, but if that file is served by ourselves (because it is
already used as a mount point), then this stat() would have to be served
by ourselves, too, which is impossible to do while we (as the caller)
are waiting for it to settle.  Therefore, keep track of mount point
paths to at least catch the most obvious instances of that problem.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-3-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json   |  23 ++-
 include/block/fuse.h     |  30 ++++
 block.c                  |   1 +
 block/export/export.c    |   4 +
 block/export/fuse.c      | 295 +++++++++++++++++++++++++++++++++++++++
 MAINTAINERS              |   6 +
 block/export/meson.build |   2 +
 7 files changed, 359 insertions(+), 2 deletions(-)
 create mode 100644 include/block/fuse.h
 create mode 100644 block/export/fuse.c

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 4eeac7842d..430bc69f35 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -120,6 +120,21 @@
 	    '*logical-block-size': 'size',
             '*num-queues': 'uint16'} }
 
+##
+# @BlockExportOptionsFuse:
+#
+# Options for exporting a block graph node on some (file) mountpoint
+# as a raw image.
+#
+# @mountpoint: Path on which to export the block device via FUSE.
+#              This must point to an existing regular file.
+#
+# Since: 6.0
+##
+{ 'struct': 'BlockExportOptionsFuse',
+  'data': { 'mountpoint': 'str' },
+  'if': 'defined(CONFIG_FUSE)' }
+
 ##
 # @NbdServerAddOptions:
 #
@@ -222,11 +237,13 @@
 #
 # @nbd: NBD export
 # @vhost-user-blk: vhost-user-blk export (since 5.2)
+# @fuse: FUSE export (since: 6.0)
 #
 # Since: 4.2
 ##
 { 'enum': 'BlockExportType',
-  'data': [ 'nbd', 'vhost-user-blk' ] }
+  'data': [ 'nbd', 'vhost-user-blk',
+            { 'name': 'fuse', 'if': 'defined(CONFIG_FUSE)' } ] }
 
 ##
 # @BlockExportOptions:
@@ -267,7 +284,9 @@
   'discriminator': 'type',
   'data': {
       'nbd': 'BlockExportOptionsNbd',
-      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk'
+      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
+      'fuse': { 'type': 'BlockExportOptionsFuse',
+                'if': 'defined(CONFIG_FUSE)' }
    } }
 
 ##
diff --git a/include/block/fuse.h b/include/block/fuse.h
new file mode 100644
index 0000000000..ffa91fe364
--- /dev/null
+++ b/include/block/fuse.h
@@ -0,0 +1,30 @@
+/*
+ * Present a block device as a raw image through FUSE
+ *
+ * Copyright (c) 2020 Max Reitz <mreitz@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; under version 2 or later of the License.
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
+#ifndef BLOCK_FUSE_H
+#define BLOCK_FUSE_H
+
+#ifdef CONFIG_FUSE
+
+#include "block/export.h"
+
+extern const BlockExportDriver blk_exp_fuse;
+
+#endif /* CONFIG_FUSE */
+
+#endif
diff --git a/block.c b/block.c
index f1cedac362..eb16fb48c6 100644
--- a/block.c
+++ b/block.c
@@ -26,6 +26,7 @@
 #include "block/trace.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/fuse.h"
 #include "block/nbd.h"
 #include "block/qdict.h"
 #include "qemu/error-report.h"
diff --git a/block/export/export.c b/block/export/export.c
index bad6f21b1c..b716c1522c 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -17,6 +17,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/iothread.h"
 #include "block/export.h"
+#include "block/fuse.h"
 #include "block/nbd.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-export.h"
@@ -31,6 +32,9 @@ static const BlockExportDriver *blk_exp_drivers[] = {
 #ifdef CONFIG_VHOST_USER_BLK_SERVER
     &blk_exp_vhost_user_blk,
 #endif
+#ifdef CONFIG_FUSE
+    &blk_exp_fuse,
+#endif
 };
 
 /* Only accessed from the main thread */
diff --git a/block/export/fuse.c b/block/export/fuse.c
new file mode 100644
index 0000000000..0553bcd630
--- /dev/null
+++ b/block/export/fuse.c
@@ -0,0 +1,295 @@
+/*
+ * Present a block device as a raw image through FUSE
+ *
+ * Copyright (c) 2020 Max Reitz <mreitz@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; under version 2 or later of the License.
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
+#define FUSE_USE_VERSION 31
+
+#include "qemu/osdep.h"
+#include "block/aio.h"
+#include "block/block.h"
+#include "block/export.h"
+#include "block/fuse.h"
+#include "block/qapi.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-block.h"
+#include "sysemu/block-backend.h"
+
+#include <fuse.h>
+#include <fuse_lowlevel.h>
+
+
+/* Prevent overly long bounce buffer allocations */
+#define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
+
+
+typedef struct FuseExport {
+    BlockExport common;
+
+    struct fuse_session *fuse_session;
+    struct fuse_buf fuse_buf;
+    bool mounted, fd_handler_set_up;
+
+    char *mountpoint;
+    bool writable;
+} FuseExport;
+
+static GHashTable *exports;
+static const struct fuse_lowlevel_ops fuse_ops;
+
+static void fuse_export_shutdown(BlockExport *exp);
+static void fuse_export_delete(BlockExport *exp);
+
+static void init_exports_table(void);
+
+static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
+                             Error **errp);
+static void read_from_fuse_export(void *opaque);
+
+static bool is_regular_file(const char *path, Error **errp);
+
+
+static int fuse_export_create(BlockExport *blk_exp,
+                              BlockExportOptions *blk_exp_args,
+                              Error **errp)
+{
+    FuseExport *exp = container_of(blk_exp, FuseExport, common);
+    BlockExportOptionsFuse *args = &blk_exp_args->u.fuse;
+    int ret;
+
+    assert(blk_exp_args->type == BLOCK_EXPORT_TYPE_FUSE);
+
+    init_exports_table();
+
+    /*
+     * It is important to do this check before calling is_regular_file() --
+     * that function will do a stat(), which we would have to handle if we
+     * already exported something on @mountpoint.  But we cannot, because
+     * we are currently caught up here.
+     * (Note that ideally we would want to resolve relative paths here,
+     * but bdrv_make_absolute_filename() might do the wrong thing for
+     * paths that contain colons, and realpath() would resolve symlinks,
+     * which we do not want: The mount point is not going to be the
+     * symlink's destination, but the link itself.)
+     * So this will not catch all potential clashes, but hopefully at
+     * least the most common one of specifying exactly the same path
+     * string twice.
+     */
+    if (g_hash_table_contains(exports, args->mountpoint)) {
+        error_setg(errp, "There already is a FUSE export on '%s'",
+                   args->mountpoint);
+        ret = -EEXIST;
+        goto fail;
+    }
+
+    if (!is_regular_file(args->mountpoint, errp)) {
+        ret = -EINVAL;
+        goto fail;
+    }
+
+    exp->mountpoint = g_strdup(args->mountpoint);
+    exp->writable = blk_exp_args->writable;
+
+    ret = setup_fuse_export(exp, args->mountpoint, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    return 0;
+
+fail:
+    fuse_export_delete(blk_exp);
+    return ret;
+}
+
+/**
+ * Allocates the global @exports hash table.
+ */
+static void init_exports_table(void)
+{
+    if (exports) {
+        return;
+    }
+
+    exports = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
+}
+
+/**
+ * Create exp->fuse_session and mount it.
+ */
+static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
+                             Error **errp)
+{
+    const char *fuse_argv[4];
+    char *mount_opts;
+    struct fuse_args fuse_args;
+    int ret;
+
+    /* Needs to match what fuse_init() sets.  Only max_read must be supplied. */
+    mount_opts = g_strdup_printf("max_read=%zu", FUSE_MAX_BOUNCE_BYTES);
+
+    fuse_argv[0] = ""; /* Dummy program name */
+    fuse_argv[1] = "-o";
+    fuse_argv[2] = mount_opts;
+    fuse_argv[3] = NULL;
+    fuse_args = (struct fuse_args)FUSE_ARGS_INIT(3, (char **)fuse_argv);
+
+    exp->fuse_session = fuse_session_new(&fuse_args, &fuse_ops,
+                                         sizeof(fuse_ops), exp);
+    g_free(mount_opts);
+    if (!exp->fuse_session) {
+        error_setg(errp, "Failed to set up FUSE session");
+        ret = -EIO;
+        goto fail;
+    }
+
+    ret = fuse_session_mount(exp->fuse_session, mountpoint);
+    if (ret < 0) {
+        error_setg(errp, "Failed to mount FUSE session to export");
+        ret = -EIO;
+        goto fail;
+    }
+    exp->mounted = true;
+
+    g_hash_table_insert(exports, g_strdup(mountpoint), NULL);
+
+    aio_set_fd_handler(exp->common.ctx,
+                       fuse_session_fd(exp->fuse_session), true,
+                       read_from_fuse_export, NULL, NULL, exp);
+    exp->fd_handler_set_up = true;
+
+    return 0;
+
+fail:
+    fuse_export_shutdown(&exp->common);
+    return ret;
+}
+
+/**
+ * Callback to be invoked when the FUSE session FD can be read from.
+ * (This is basically the FUSE event loop.)
+ */
+static void read_from_fuse_export(void *opaque)
+{
+    FuseExport *exp = opaque;
+    int ret;
+
+    blk_exp_ref(&exp->common);
+
+    do {
+        ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
+    } while (ret == -EINTR);
+    if (ret < 0) {
+        goto out;
+    }
+
+    fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
+
+out:
+    blk_exp_unref(&exp->common);
+}
+
+static void fuse_export_shutdown(BlockExport *blk_exp)
+{
+    FuseExport *exp = container_of(blk_exp, FuseExport, common);
+
+    if (exp->fuse_session) {
+        fuse_session_exit(exp->fuse_session);
+
+        if (exp->fd_handler_set_up) {
+            aio_set_fd_handler(exp->common.ctx,
+                               fuse_session_fd(exp->fuse_session), true,
+                               NULL, NULL, NULL, NULL);
+            exp->fd_handler_set_up = false;
+        }
+    }
+
+    if (exp->mountpoint) {
+        /*
+         * Safe to drop now, because we will not handle any requests
+         * for this export anymore anyway.
+         */
+        g_hash_table_remove(exports, exp->mountpoint);
+    }
+}
+
+static void fuse_export_delete(BlockExport *blk_exp)
+{
+    FuseExport *exp = container_of(blk_exp, FuseExport, common);
+
+    if (exp->fuse_session) {
+        if (exp->mounted) {
+            fuse_session_unmount(exp->fuse_session);
+        }
+
+        fuse_session_destroy(exp->fuse_session);
+    }
+
+    free(exp->fuse_buf.mem);
+    g_free(exp->mountpoint);
+}
+
+/**
+ * Check whether @path points to a regular file.  If not, put an
+ * appropriate message into *errp.
+ */
+static bool is_regular_file(const char *path, Error **errp)
+{
+    struct stat statbuf;
+    int ret;
+
+    ret = stat(path, &statbuf);
+    if (ret < 0) {
+        error_setg_errno(errp, errno, "Failed to stat '%s'", path);
+        return false;
+    }
+
+    if (!S_ISREG(statbuf.st_mode)) {
+        error_setg(errp, "'%s' is not a regular file", path);
+        return false;
+    }
+
+    return true;
+}
+
+/**
+ * A chance to set change some parameters supplied to FUSE_INIT.
+ */
+static void fuse_init(void *userdata, struct fuse_conn_info *conn)
+{
+    /*
+     * MIN_NON_ZERO() would not be wrong here, but what we set here
+     * must equal what has been passed to fuse_session_new().
+     * Therefore, as long as max_read must be passed as a mount option
+     * (which libfuse claims will be changed at some point), we have
+     * to set max_read to a fixed value here.
+     */
+    conn->max_read = FUSE_MAX_BOUNCE_BYTES;
+
+    conn->max_write = MIN_NON_ZERO(BDRV_REQUEST_MAX_BYTES, conn->max_write);
+}
+
+static const struct fuse_lowlevel_ops fuse_ops = {
+    .init       = fuse_init,
+};
+
+const BlockExportDriver blk_exp_fuse = {
+    .type               = BLOCK_EXPORT_TYPE_FUSE,
+    .instance_size      = sizeof(FuseExport),
+    .create             = fuse_export_create,
+    .delete             = fuse_export_delete,
+    .request_shutdown   = fuse_export_shutdown,
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index aa39490a24..1950592d04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3114,6 +3114,12 @@ F: include/qemu/vhost-user-server.h
 F: tests/qtest/libqos/vhost-user-blk.c
 F: util/vhost-user-server.c
 
+FUSE block device exports
+M: Max Reitz <mreitz@redhat.com>
+L: qemu-block@nongnu.org
+S: Supported
+F: block/export/fuse.c
+
 Replication
 M: Wen Congyang <wencongyang2@huawei.com>
 M: Xie Changlong <xiechanglong.d@gmail.com>
diff --git a/block/export/meson.build b/block/export/meson.build
index 135b356775..0a08e384c7 100644
--- a/block/export/meson.build
+++ b/block/export/meson.build
@@ -3,3 +3,5 @@ blockdev_ss.add(files('export.c'))
 if have_vhost_user_blk_server
     blockdev_ss.add(files('vhost-user-blk-server.c'))
 endif
+
+blockdev_ss.add(when: fuse, if_true: files('fuse.c'))
-- 
2.29.2


