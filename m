Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C428159B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:46:38 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMKT-0004Bn-RZ
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI6-0001FP-Kq
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI2-0004W8-86
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAXmjk72JqHTthKglqTLb5P46u6DGJ69vh6lvA/1aa0=;
 b=XVk+hkDUBf64oBI2HgNDopa7og8RIkCl+V0gFdOwFvQDR0bCW00wUkbzeQAgP9pNhxIQHs
 VCWzNdIk994N/ZQzkpUIE9nRJ2kBsPqIYNpM0KPKc8pnNLxzcRlgq0MRBnG1TgudVpLpBX
 +XlpZrMjE4k2npadgblKAdnEk4oPujc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-9um0dIEJN3GjU4D3HKkWmg-1; Fri, 02 Oct 2020 10:44:02 -0400
X-MC-Unique: 9um0dIEJN3GjU4D3HKkWmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BF65192AB65;
 Fri,  2 Oct 2020 14:44:01 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43E765D9D3;
 Fri,  2 Oct 2020 14:44:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/37] block/export: Add BlockExport infrastructure and
 block-export-add
Date: Fri,  2 Oct 2020 16:43:16 +0200
Message-Id: <20201002144345.253865-9-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We want to have a common set of commands for all types of block exports.
Currently, this is only NBD, but we're going to add more types.

This patch adds the basic BlockExport and BlockExportDriver structs and
a QMP command block-export-add that creates a new export based on the
given BlockExportOptions.

qmp_nbd_server_add() becomes a wrapper around qmp_block_export_add().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200924152717.287415-5-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json   | 10 +++++++++
 include/block/export.h   | 33 +++++++++++++++++++++++++++
 include/block/nbd.h      |  5 ++++-
 block/export/export.c    | 48 ++++++++++++++++++++++++++++++++++++++++
 blockdev-nbd.c           | 28 +++++++++++++++++------
 nbd/server.c             | 15 ++++++++++++-
 block/export/meson.build |  1 +
 block/meson.build        |  2 ++
 meson.build              |  2 +-
 9 files changed, 134 insertions(+), 10 deletions(-)
 create mode 100644 include/block/export.h
 create mode 100644 block/export/export.c
 create mode 100644 block/export/meson.build

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 6ac3a63123..5890a94219 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -172,3 +172,13 @@
   'data': {
       'nbd': 'BlockExportOptionsNbd'
    } }
+
+##
+# @block-export-add:
+#
+# Creates a new block export.
+#
+# Since: 5.2
+##
+{ 'command': 'block-export-add',
+  'data': 'BlockExportOptions', 'boxed': true }
diff --git a/include/block/export.h b/include/block/export.h
new file mode 100644
index 0000000000..42e3c055fc
--- /dev/null
+++ b/include/block/export.h
@@ -0,0 +1,33 @@
+/*
+ * Declarations for block exports
+ *
+ * Copyright (c) 2012, 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Paolo Bonzini <pbonzini@redhat.com>
+ * Kevin Wolf <kwolf@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef BLOCK_EXPORT_H
+#define BLOCK_EXPORT_H
+
+#include "qapi/qapi-types-block-export.h"
+
+typedef struct BlockExport BlockExport;
+
+typedef struct BlockExportDriver {
+    /* The export type that this driver services */
+    BlockExportType type;
+
+    /* Creates and starts a new block export */
+    BlockExport *(*create)(BlockExportOptions *, Error **);
+} BlockExportDriver;
+
+struct BlockExport {
+    const BlockExportDriver *drv;
+};
+
+#endif
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 262f6da2ce..7698453fb2 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -20,11 +20,13 @@
 #ifndef NBD_H
 #define NBD_H
 
-#include "qapi/qapi-types-block-export.h"
+#include "block/export.h"
 #include "io/channel-socket.h"
 #include "crypto/tlscreds.h"
 #include "qapi/error.h"
 
+extern const BlockExportDriver blk_exp_nbd;
+
 /* Handshake phase structs - this struct is passed on the wire */
 
 struct NBDOption {
@@ -328,6 +330,7 @@ int nbd_errno_to_system_errno(int err);
 typedef struct NBDExport NBDExport;
 typedef struct NBDClient NBDClient;
 
+BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp);
 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *desc,
                           const char *bitmap, bool readonly, bool shared,
diff --git a/block/export/export.c b/block/export/export.c
new file mode 100644
index 0000000000..fd65541963
--- /dev/null
+++ b/block/export/export.c
@@ -0,0 +1,48 @@
+/*
+ * Common block export infrastructure
+ *
+ * Copyright (c) 2012, 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Paolo Bonzini <pbonzini@redhat.com>
+ * Kevin Wolf <kwolf@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "block/export.h"
+#include "block/nbd.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-block-export.h"
+
+static const BlockExportDriver *blk_exp_drivers[] = {
+    &blk_exp_nbd,
+};
+
+static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(blk_exp_drivers); i++) {
+        if (blk_exp_drivers[i]->type == type) {
+            return blk_exp_drivers[i];
+        }
+    }
+    return NULL;
+}
+
+void qmp_block_export_add(BlockExportOptions *export, Error **errp)
+{
+    const BlockExportDriver *drv;
+
+    drv = blk_exp_find_driver(export->type);
+    if (!drv) {
+        error_setg(errp, "No driver found for the requested export type");
+        return;
+    }
+
+    drv->create(export, errp);
+}
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 98ee1b6170..47b04f166a 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -148,17 +148,20 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr,
     qapi_free_SocketAddress(addr_flat);
 }
 
-void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
+BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
 {
+    BlockExportOptionsNbd *arg = &exp_args->u.nbd;
     BlockDriverState *bs = NULL;
     BlockBackend *on_eject_blk;
-    NBDExport *exp;
+    NBDExport *exp = NULL;
     int64_t len;
     AioContext *aio_context;
 
+    assert(exp_args->type == BLOCK_EXPORT_TYPE_NBD);
+
     if (!nbd_server) {
         error_setg(errp, "NBD server not running");
-        return;
+        return NULL;
     }
 
     if (!arg->has_name) {
@@ -167,24 +170,24 @@ void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
 
     if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
         error_setg(errp, "export name '%s' too long", arg->name);
-        return;
+        return NULL;
     }
 
     if (arg->description && strlen(arg->description) > NBD_MAX_STRING_SIZE) {
         error_setg(errp, "description '%s' too long", arg->description);
-        return;
+        return NULL;
     }
 
     if (nbd_export_find(arg->name)) {
         error_setg(errp, "NBD server already has export named '%s'", arg->name);
-        return;
+        return NULL;
     }
 
     on_eject_blk = blk_by_name(arg->device);
 
     bs = bdrv_lookup_bs(arg->device, arg->device, errp);
     if (!bs) {
-        return;
+        return NULL;
     }
 
     aio_context = bdrv_get_aio_context(bs);
@@ -217,6 +220,17 @@ void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
 
  out:
     aio_context_release(aio_context);
+    /* TODO Remove the cast: nbd_export_new() will return a BlockExport. */
+    return (BlockExport*) exp;
+}
+
+void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
+{
+    BlockExportOptions export = {
+        .type = BLOCK_EXPORT_TYPE_NBD,
+        .u.nbd = *arg,
+    };
+    qmp_block_export_add(&export, errp);
 }
 
 void qmp_nbd_server_remove(const char *name,
diff --git a/nbd/server.c b/nbd/server.c
index bd53f7baea..f5af93c253 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -18,6 +18,8 @@
  */
 
 #include "qemu/osdep.h"
+
+#include "block/export.h"
 #include "qapi/error.h"
 #include "qemu/queue.h"
 #include "trace.h"
@@ -80,6 +82,7 @@ struct NBDRequestData {
 };
 
 struct NBDExport {
+    BlockExport common;
     int refcount;
     void (*close)(NBDExport *exp);
 
@@ -1512,10 +1515,15 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
 {
     AioContext *ctx;
     BlockBackend *blk;
-    NBDExport *exp = g_new0(NBDExport, 1);
+    NBDExport *exp;
     uint64_t perm;
     int ret;
 
+    exp = g_new0(NBDExport, 1);
+    exp->common = (BlockExport) {
+        .drv = &blk_exp_nbd,
+    };
+
     /*
      * NBD exports are used for non-shared storage migration.  Make sure
      * that BDRV_O_INACTIVE is cleared and the image is ready for write
@@ -1731,6 +1739,11 @@ void nbd_export_put(NBDExport *exp)
     }
 }
 
+const BlockExportDriver blk_exp_nbd = {
+    .type               = BLOCK_EXPORT_TYPE_NBD,
+    .create             = nbd_export_create,
+};
+
 void nbd_export_close_all(void)
 {
     NBDExport *exp, *next;
diff --git a/block/export/meson.build b/block/export/meson.build
new file mode 100644
index 0000000000..558ef35d38
--- /dev/null
+++ b/block/export/meson.build
@@ -0,0 +1 @@
+block_ss.add(files('export.c'))
diff --git a/block/meson.build b/block/meson.build
index a3e56b7cd1..0b38dc36f7 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -110,6 +110,8 @@ block_ss.add(module_block_h)
 block_ss.add(files('stream.c'))
 
 softmmu_ss.add(files('qapi-sysemu.c'))
+
+subdir('export')
 subdir('monitor')
 
 modules += {'block': block_modules}
diff --git a/meson.build b/meson.build
index 3161c1f037..0f0cc21d16 100644
--- a/meson.build
+++ b/meson.build
@@ -970,6 +970,7 @@ subdir('dump')
 
 block_ss.add(files(
   'block.c',
+  'blockdev-nbd.c',
   'blockjob.c',
   'job.c',
   'qemu-io-cmds.c',
@@ -982,7 +983,6 @@ subdir('block')
 
 blockdev_ss.add(files(
   'blockdev.c',
-  'blockdev-nbd.c',
   'iothread.c',
   'job-qmp.c',
 ))
-- 
2.25.4


