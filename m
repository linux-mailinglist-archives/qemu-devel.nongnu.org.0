Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950142815E4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:57:46 +0200 (CEST)
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMVF-0002AY-M3
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIL-0001sI-0r
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMII-0004aJ-Hu
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HItjtl/3N4FOB3fPsAqoRrGkZ4YN2+05++64rVEDhw=;
 b=F7iwljXmjHHHa9WBKM57Fzec3ngGeW9dErUnzrz7IU4VoiDgycU1u+qR54+pmjarUlazam
 TnFojE8np3vUL4iiV5dScabTefyPmQvFAzwAK2yfSFZDFtdUtE0juuS+X9drmx9i5aghuv
 KpxasdEEj/U1vTT+srGG6wKsiyMi9tE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-ifaxl_USM26A7Eewcy8OyQ-1; Fri, 02 Oct 2020 10:44:19 -0400
X-MC-Unique: ifaxl_USM26A7Eewcy8OyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3F4A80EFBE;
 Fri,  2 Oct 2020 14:44:17 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC16B5D9D3;
 Fri,  2 Oct 2020 14:44:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/37] block/export: Add node-name to BlockExportOptions
Date: Fri,  2 Oct 2020 16:43:27 +0200
Message-Id: <20201002144345.253865-20-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
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

Every block export needs a block node to export, so add a 'node-name'
option to BlockExportOptions and remove the replaced option 'device'
from BlockExportOptionsNbd.

To maintain compatibility in nbd-server-add, BlockExportOptionsNbd needs
to be wrapped by a new type NbdServerAddOptions that adds 'device' back
because nbd-server-add doesn't use the BlockExportOptions base type at
all (so even without changing it to a 'node-name' option in
block-export-add, this compatibility code would be necessary).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200924152717.287415-16-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json         | 27 ++++++++++++++++-----
 block/monitor/block-hmp-cmds.c |  6 ++---
 blockdev-nbd.c                 | 44 +++++++++++++++++++++++++---------
 qemu-nbd.c                     |  2 +-
 4 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index ce66f278b2..1091c97f6f 100644
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
index fc6e68a797..fe0d1928c3 100644
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


