Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C234B1D78A4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 14:30:04 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaeuB-0008Rp-RF
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 08:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaelm-000524-AF
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:21:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44733
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaelk-0007L7-SF
 for qemu-devel@nongnu.org; Mon, 18 May 2020 08:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589804479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aa4YAhvwceD35Ej/Ut0ODIaNZQZ3EzRDfMsxnphJtSg=;
 b=TLArpEM5dabRrng5DVEHpvTobi3R8fn7vRn33npOleW0K1X+33A0O1hZGIxEm20fsUHMGU
 T2rCS6GwzkWAfiOyaaKYTKX6cHhj7KmJ1+9MN49e8Vu/sJUAM4Gm1Tv46whflE3GFyrNo9
 oyBzVvQNI0WEhP/lF8MCjZKK45kOq48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-WB23_wn-NHeQbd1u-kiYsQ-1; Mon, 18 May 2020 08:21:18 -0400
X-MC-Unique: WB23_wn-NHeQbd1u-kiYsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BDA108BD13;
 Mon, 18 May 2020 12:21:17 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE64F60BF1;
 Mon, 18 May 2020 12:21:14 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/14] block/core: add generic infrastructure for
 x-blockdev-amend qmp command
Date: Mon, 18 May 2020 15:20:38 +0300
Message-Id: <20200518122041.10694-12-mlevitsk@redhat.com>
In-Reply-To: <20200518122041.10694-1-mlevitsk@redhat.com>
References: <20200518122041.10694-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 23:32:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

blockdev-amend will be used similiar to blockdev-create
to allow on the fly changes of the structure of the format based block devices.

Current plan is to first support encryption keyslot management for luks
based formats (raw and embedded in qcow2)

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/Makefile.objs       |   2 +-
 block/amend.c             | 113 ++++++++++++++++++++++++++++++++++++++
 include/block/block_int.h |  21 +++++--
 qapi/block-core.json      |  42 ++++++++++++++
 qapi/job.json             |   4 +-
 5 files changed, 174 insertions(+), 8 deletions(-)
 create mode 100644 block/amend.c

diff --git a/block/Makefile.objs b/block/Makefile.objs
index 3635b6b4c1..a0988638d5 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -19,7 +19,7 @@ block-obj-$(CONFIG_WIN32) += file-win32.o win32-aio.o
 block-obj-$(CONFIG_POSIX) += file-posix.o
 block-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
 block-obj-$(CONFIG_LINUX_IO_URING) += io_uring.o
-block-obj-y += null.o mirror.o commit.o io.o create.o
+block-obj-y += null.o mirror.o commit.o io.o create.o amend.o
 block-obj-y += throttle-groups.o
 block-obj-$(CONFIG_LINUX) += nvme.o
 
diff --git a/block/amend.c b/block/amend.c
new file mode 100644
index 0000000000..f4612dcf08
--- /dev/null
+++ b/block/amend.c
@@ -0,0 +1,113 @@
+/*
+ * Block layer code related to image options amend
+ *
+ * Copyright (c) 2018 Kevin Wolf <kwolf@redhat.com>
+ * Copyright (c) 2020 Red Hat. Inc
+ *
+ * Heavily based on create.c
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "block/block_int.h"
+#include "qemu/job.h"
+#include "qemu/main-loop.h"
+#include "qapi/qapi-commands-block-core.h"
+#include "qapi/qapi-visit-block-core.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/error.h"
+
+typedef struct BlockdevAmendJob {
+    Job common;
+    BlockdevAmendOptions *opts;
+    BlockDriverState *bs;
+    bool force;
+} BlockdevAmendJob;
+
+static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
+{
+    BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
+    int ret;
+
+    job_progress_set_remaining(&s->common, 1);
+    ret = s->bs->drv->bdrv_co_amend(s->bs, s->opts, s->force, errp);
+    job_progress_update(&s->common, 1);
+    qapi_free_BlockdevAmendOptions(s->opts);
+    return ret;
+}
+
+static const JobDriver blockdev_amend_job_driver = {
+    .instance_size = sizeof(BlockdevAmendJob),
+    .job_type      = JOB_TYPE_AMEND,
+    .run           = blockdev_amend_run,
+};
+
+void qmp_x_blockdev_amend(const char *job_id,
+                          const char *node_name,
+                          BlockdevAmendOptions *options,
+                          bool has_force,
+                          bool force,
+                          Error **errp)
+{
+    BlockdevAmendJob *s;
+    const char *fmt = BlockdevDriver_str(options->driver);
+    BlockDriver *drv = bdrv_find_format(fmt);
+    BlockDriverState *bs = bdrv_find_node(node_name);
+
+
+    if (!drv) {
+        error_setg(errp, "Block driver '%s' not found or not supported", fmt);
+        return;
+    }
+
+    /*
+     * If the driver is in the schema, we know that it exists. But it may not
+     * be whitelisted.
+     */
+    if (bdrv_uses_whitelist() && !bdrv_is_whitelisted(drv, false)) {
+        error_setg(errp, "Driver is not whitelisted");
+        return;
+    }
+
+    if (bs->drv != drv) {
+        error_setg(errp,
+                   "x-blockdev-amend doesn't support changing the block driver");
+        return;
+    }
+
+    /* Error out if the driver doesn't support .bdrv_co_amend */
+    if (!drv->bdrv_co_amend) {
+        error_setg(errp, "Driver does not support x-blockdev-amend");
+        return;
+    }
+
+    /* Create the block job */
+    s = job_create(job_id, &blockdev_amend_job_driver, NULL,
+                   bdrv_get_aio_context(bs), JOB_DEFAULT | JOB_MANUAL_DISMISS,
+                   NULL, NULL, errp);
+    if (!s) {
+        return;
+    }
+
+    s->bs = bs,
+    s->opts = QAPI_CLONE(BlockdevAmendOptions, options),
+    s->force = has_force ? force : false;
+    job_start(&s->common);
+}
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 3646926d78..79f0a33211 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -134,12 +134,27 @@ struct BlockDriver {
     int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
+
+
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
                                        Error **errp);
     int coroutine_fn (*bdrv_co_create_opts)(BlockDriver *drv,
                                             const char *filename,
                                             QemuOpts *opts,
                                             Error **errp);
+
+    int coroutine_fn (*bdrv_co_amend)(BlockDriverState *bs,
+                                      BlockdevAmendOptions *opts,
+                                      bool force,
+                                      Error **errp);
+
+    int (*bdrv_amend_options)(BlockDriverState *bs,
+                              QemuOpts *opts,
+                              BlockDriverAmendStatusCB *status_cb,
+                              void *cb_opaque,
+                              bool force,
+                              Error **errp);
+
     int (*bdrv_make_empty)(BlockDriverState *bs);
 
     /*
@@ -434,12 +449,6 @@ struct BlockDriver {
                                       BdrvCheckResult *result,
                                       BdrvCheckMode fix);
 
-    int (*bdrv_amend_options)(BlockDriverState *bs, QemuOpts *opts,
-                              BlockDriverAmendStatusCB *status_cb,
-                              void *cb_opaque,
-                              bool force,
-                              Error **errp);
-
     void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
 
     /* TODO Better pass a option string/QDict/QemuOpts to add any rule? */
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6fbacddab2..7e953dd7e2 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4668,6 +4668,48 @@
   'data': { 'job-id': 'str',
             'options': 'BlockdevCreateOptions' } }
 
+##
+# @BlockdevAmendOptions:
+#
+# Options for amending an image format
+#
+# @driver:          Block driver of the node to amend.
+#
+# Since: 5.1
+##
+{ 'union': 'BlockdevAmendOptions',
+  'base': {
+      'driver':         'BlockdevDriver' },
+  'discriminator': 'driver',
+  'data': {
+  } }
+
+##
+# @x-blockdev-amend:
+#
+# Starts a job to amend format specific options of an existing open block device
+# The job is automatically finalized, but a manual job-dismiss is required.
+#
+# @job-id:          Identifier for the newly created job.
+#
+# @node-name:       Name of the block node to work on
+#
+# @options:         Options (driver specific)
+#
+# @force:           Allow unsafe operations, format specific
+#                   For luks that allows erase of the last active keyslot
+#                   (permanent loss of data),
+#                   and replacement of an active keyslot
+#                   (possible loss of data if IO error happens)
+#
+# Since: 5.1
+##
+{ 'command': 'x-blockdev-amend',
+  'data': { 'job-id': 'str',
+            'node-name': 'str',
+            'options': 'BlockdevAmendOptions',
+            '*force': 'bool' } }
+
 ##
 # @BlockErrorAction:
 #
diff --git a/qapi/job.json b/qapi/job.json
index 5e658281f5..c48a0c3e34 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -19,10 +19,12 @@
 #
 # @create: image creation job type, see "blockdev-create" (since 3.0)
 #
+# @amend: image options amend job type, see "x-blockdev-amend" (since 5.1)
+#
 # Since: 1.7
 ##
 { 'enum': 'JobType',
-  'data': ['commit', 'stream', 'mirror', 'backup', 'create'] }
+  'data': ['commit', 'stream', 'mirror', 'backup', 'create', 'amend'] }
 
 ##
 # @JobStatus:
-- 
2.17.2


