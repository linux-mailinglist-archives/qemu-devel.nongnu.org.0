Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A34260484
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:29:20 +0200 (CEST)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLtG-00049y-Vh
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLlB-0005SS-CK
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20337
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFLl3-0004ZS-Fo
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 14:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599502848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGYl5LmM3HC8DO75LfUAxMLFkMebSsZecXYcf5OiUlw=;
 b=KFmB9drEuX0eOTVGY1WBNYJBM7rJFgYNt5NCHJS2Di+SpowEvQmSi4ZjXYqj3HOUQaAe78
 YFx+meq9pcvz4j8WW7uCs4/peHSxklKYlLRvXS1W0fvkw6jqT8oyAMWdAKdZkCURDtp0hH
 7FQB9t5iYIsPEB/IBbeP39NpKeSF9WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-QV5G2enMOjCl_244cQoLEA-1; Mon, 07 Sep 2020 14:20:46 -0400
X-MC-Unique: QV5G2enMOjCl_244cQoLEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7BD618B9EC1;
 Mon,  7 Sep 2020 18:20:45 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8A6860BF3;
 Mon,  7 Sep 2020 18:20:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 15/29] block/export: Add node-name to BlockExportOptions
Date: Mon,  7 Sep 2020 20:19:57 +0200
Message-Id: <20200907182011.521007-16-kwolf@redhat.com>
In-Reply-To: <20200907182011.521007-1-kwolf@redhat.com>
References: <20200907182011.521007-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every block export needs a block node to export, so add a 'node-name'
option to BlockExportOptions and remove the replaced option 'device'
from BlockExportOptionsNbd.

To maintain compatibility in nbd-server-add, BlockExportOptionsNbd needs
to be wrapped by a new type NbdServerAddOptions that adds 'device' back
because nbd-server-add doesn't use the BlockExportOptions base type at
all (so even without changing it to a 'node-name' option in
block-export-add, this compatibility code would be necessary).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json         | 27 ++++++++++++++++-----
 block/monitor/block-hmp-cmds.c |  6 ++---
 blockdev-nbd.c                 | 44 +++++++++++++++++++++++++---------
 qemu-nbd.c                     |  2 +-
 4 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index d95c082a33..4d22f46c94 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -65,9 +65,8 @@
 ##
 # @BlockExportOptionsNbd:
 #
-# An NBD block export.
-#
-# @device: The device name or node name of the node to be exported
+# An NBD block export (options shared between nbd-server-add and the NBD branch
+# of block-export-add).
 #
 # @name: Export name. If unspecified, the @device parameter is used as the
 #        export name. (Since 2.12)
@@ -85,8 +84,21 @@
 # Since: 5.0
 ##
 { 'struct': 'BlockExportOptionsNbd',
-  'data': {'device': 'str', '*name': 'str', '*description': 'str',
-           '*writable': 'bool', '*bitmap': 'str' } }
+  'data': { '*name': 'str', '*description': 'str',
+            '*writable': 'bool', '*bitmap': 'str' } }
+
+##
+# @NbdServerAddOptions:
+#
+# An NBD block export.
+#
+# @device: The device name or node name of the node to be exported
+#
+# Since: 5.0
+##
+{ 'struct': 'NbdServerAddOptions',
+  'base': 'BlockExportOptionsNbd',
+  'data': { 'device': 'str' } }
 
 ##
 # @nbd-server-add:
@@ -99,7 +111,7 @@
 # Since: 1.3.0
 ##
 { 'command': 'nbd-server-add',
-  'data': 'BlockExportOptionsNbd', 'boxed': true }
+  'data': 'NbdServerAddOptions', 'boxed': true }
 
 ##
 # @NbdServerRemoveMode:
@@ -170,6 +182,8 @@
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
+# @node-name: The node name of the block node to be exported (since: 5.2)
+#
 # @writethrough: If true, caches are flushed after every write request to the
 #                export before completion is signalled. (since: 5.2;
 #                default: false)
@@ -178,6 +192,7 @@
 ##
 { 'union': 'BlockExportOptions',
   'base': { 'type': 'BlockExportType',
+            'node-name': 'str',
             '*writethrough': 'bool' },
   'discriminator': 'type',
   'data': {
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 662b7f7d00..db357cafcb 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -398,7 +398,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *qdict)
     Error *local_err = NULL;
     BlockInfoList *block_list, *info;
     SocketAddress *addr;
-    BlockExportOptionsNbd export;
+    NbdServerAddOptions export;
 
     if (writable && !all) {
         error_setg(&local_err, "-w only valid together with -a");
@@ -431,7 +431,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *qdict)
             continue;
         }
 
-        export = (BlockExportOptionsNbd) {
+        export = (NbdServerAddOptions) {
             .device         = info->value->device,
             .has_writable   = true,
             .writable       = writable,
@@ -458,7 +458,7 @@ void hmp_nbd_server_add(Monitor *mon, const QDict *qdict)
     bool writable = qdict_get_try_bool(qdict, "writable", false);
     Error *local_err = NULL;
 
-    BlockExportOptionsNbd export = {
+    NbdServerAddOptions export = {
         .device         = (char *) device,
         .has_name       = !!name,
         .name           = (char *) name,
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index e208324d42..ef14303b25 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -188,7 +188,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
     }
 
     if (!arg->has_name) {
-        arg->name = arg->device;
+        arg->name = exp_args->node_name;
     }
 
     if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
@@ -206,7 +206,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         return NULL;
     }
 
-    bs = bdrv_lookup_bs(arg->device, arg->device, errp);
+    bs = bdrv_lookup_bs(NULL, exp_args->node_name, errp);
     if (!bs) {
         return NULL;
     }
@@ -244,21 +244,40 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
     return (BlockExport*) exp;
 }
 
-void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
+void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
 {
     BlockExport *export;
     BlockDriverState *bs;
     BlockBackend *on_eject_blk;
-    BlockExportOptions export_opts;
+    BlockExportOptions *export_opts;
 
     bs = bdrv_lookup_bs(arg->device, arg->device, errp);
     if (!bs) {
         return;
     }
 
-    export_opts = (BlockExportOptions) {
-        .type = BLOCK_EXPORT_TYPE_NBD,
-        .u.nbd = *arg,
+    /*
+     * block-export-add would default to the node-name, but we may have to use
+     * the device name as a default here for compatibility.
+     */
+    if (!arg->has_name) {
+        arg->name = arg->device;
+    }
+
+    export_opts = g_new(BlockExportOptions, 1);
+    *export_opts = (BlockExportOptions) {
+        .type                   = BLOCK_EXPORT_TYPE_NBD,
+        .node_name              = g_strdup(bdrv_get_node_name(bs)),
+        .u.nbd = {
+            .has_name           = true,
+            .name               = g_strdup(arg->name),
+            .has_description    = arg->has_description,
+            .description        = g_strdup(arg->description),
+            .has_writable       = arg->has_writable,
+            .writable           = arg->writable,
+            .has_bitmap         = arg->has_bitmap,
+            .bitmap             = g_strdup(arg->bitmap),
+        },
     };
 
     /*
@@ -267,13 +286,13 @@ void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
      * block-export-add.
      */
     if (bdrv_is_read_only(bs)) {
-        export_opts.u.nbd.has_writable = true;
-        export_opts.u.nbd.writable = false;
+        export_opts->u.nbd.has_writable = true;
+        export_opts->u.nbd.writable = false;
     }
 
-    export = blk_exp_add(&export_opts, errp);
+    export = blk_exp_add(export_opts, errp);
     if (!export) {
-        return;
+        goto fail;
     }
 
     /*
@@ -284,6 +303,9 @@ void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
     if (on_eject_blk) {
         nbd_export_set_on_eject_blk(export, on_eject_blk);
     }
+
+fail:
+    qapi_free_BlockExportOptions(export_opts);
 }
 
 void qmp_nbd_server_remove(const char *name,
diff --git a/qemu-nbd.c b/qemu-nbd.c
index a863741e8f..23c2b7da8e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1064,10 +1064,10 @@ int main(int argc, char **argv)
     export_opts = g_new(BlockExportOptions, 1);
     *export_opts = (BlockExportOptions) {
         .type               = BLOCK_EXPORT_TYPE_NBD,
+        .node_name          = g_strdup(bdrv_get_node_name(bs)),
         .has_writethrough   = true,
         .writethrough       = writethrough,
         .u.nbd = {
-            .device             = g_strdup(bdrv_get_node_name(bs)),
             .has_name           = true,
             .name               = g_strdup(export_name),
             .has_description    = !!export_description,
-- 
2.25.4


