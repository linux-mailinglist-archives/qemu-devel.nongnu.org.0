Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF66243D78
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 18:35:52 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6GCl-0003qX-BS
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 12:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k6G7U-0002aP-Dr
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 12:30:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40683
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k6G7R-0001Nl-Kd
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 12:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597336220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0lAlwo7ZayN2MMSO99xG+h7JK21Naz46hLLYxuJFGc=;
 b=BWOhzEddfm0FQDwLBDfkXOcQWvTAIpuc+nXHxhtHeX6hNQsbX91qWEipssV6/mmQtHb7Hj
 4E115StGurQJWy3SJDQf+iqNXEGVtBbXXhE1x2RkY7l58PUdT1dr1qljiphiKyIi7XluUy
 HplKVYCTmMP7NJDt48EdccUjQC9Toy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-O6TNwfvMM1OeMae9KsW_YA-1; Thu, 13 Aug 2020 12:30:19 -0400
X-MC-Unique: O6TNwfvMM1OeMae9KsW_YA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FAA2802B4C;
 Thu, 13 Aug 2020 16:30:18 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A7615C1A3;
 Thu, 13 Aug 2020 16:30:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 15/22] block/export: Move device to BlockExportOptions
Date: Thu, 13 Aug 2020 18:29:28 +0200
Message-Id: <20200813162935.210070-16-kwolf@redhat.com>
In-Reply-To: <20200813162935.210070-1-kwolf@redhat.com>
References: <20200813162935.210070-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every block export needs a block node to export, so move the 'device'
option from BlockExportOptionsNbd to BlockExportOptions.

To maintain compatibility in nbd-server-add, BlockExportOptionsNbd needs
to be wrapped by a new type NbdServerAddOptions that adds 'device' back
because nbd-server-add doesn't use the BlockExportOptions base type.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json         | 27 +++++++++++++++++++++------
 block/export/export.c          | 26 ++++++++++++++++++++------
 block/monitor/block-hmp-cmds.c |  6 +++---
 blockdev-nbd.c                 |  4 ++--
 qemu-nbd.c                     |  2 +-
 5 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 4ce163411f..d68f3bf87e 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -62,9 +62,8 @@
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
@@ -82,8 +81,21 @@
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
@@ -96,7 +108,7 @@
 # Since: 1.3.0
 ##
 { 'command': 'nbd-server-add',
-  'data': 'BlockExportOptionsNbd', 'boxed': true }
+  'data': 'NbdServerAddOptions', 'boxed': true }
 
 ##
 # @NbdServerRemoveMode:
@@ -167,6 +179,8 @@
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
+# @device: The device name or node name of the node to be exported
+#
 # @writethrough: If true, caches are flushed after every write request to the
 #                export before completion is signalled. (since: 5.2;
 #                default: false)
@@ -175,6 +189,7 @@
 ##
 { 'union': 'BlockExportOptions',
   'base': { 'type': 'BlockExportType',
+            'device': 'str',
             '*writethrough': 'bool' },
   'discriminator': 'type',
   'data': {
diff --git a/block/export/export.c b/block/export/export.c
index 1d5de564c7..ef86bf892b 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -68,15 +68,26 @@ void qmp_block_export_add(BlockExportOptions *export, Error **errp)
     blk_exp_add(export, errp);
 }
 
-void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
+void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
 {
     BlockExport *export;
     BlockDriverState *bs;
     BlockBackend *on_eject_blk;
 
-    BlockExportOptions export_opts = {
-        .type = BLOCK_EXPORT_TYPE_NBD,
-        .u.nbd = *arg,
+    BlockExportOptions *export_opts = g_new(BlockExportOptions, 1);
+    *export_opts = (BlockExportOptions) {
+        .type                   = BLOCK_EXPORT_TYPE_NBD,
+        .device                 = g_strdup(arg->device),
+        .u.nbd = {
+            .has_name           = arg->has_name,
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
@@ -89,9 +100,9 @@ void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
         arg->writable = false;
     }
 
-    export = blk_exp_add(&export_opts, errp);
+    export = blk_exp_add(export_opts, errp);
     if (!export) {
-        return;
+        goto fail;
     }
 
     /*
@@ -102,4 +113,7 @@ void qmp_nbd_server_add(BlockExportOptionsNbd *arg, Error **errp)
     if (on_eject_blk) {
         nbd_export_set_on_eject_blk(export, on_eject_blk);
     }
+
+fail:
+    qapi_free_BlockExportOptions(export_opts);
 }
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index a651954e16..6c823234a9 100644
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
index a8b7b785e7..5e97975c80 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -188,7 +188,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
     }
 
     if (!arg->has_name) {
-        arg->name = arg->device;
+        arg->name = exp_args->device;
     }
 
     if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
@@ -206,7 +206,7 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         return NULL;
     }
 
-    bs = bdrv_lookup_bs(arg->device, arg->device, errp);
+    bs = bdrv_lookup_bs(exp_args->device, exp_args->device, errp);
     if (!bs) {
         return NULL;
     }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index d967b8fcb9..f31868708c 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1055,10 +1055,10 @@ int main(int argc, char **argv)
     export_opts = g_new(BlockExportOptions, 1);
     *export_opts = (BlockExportOptions) {
         .type               = BLOCK_EXPORT_TYPE_NBD,
+        .device             = g_strdup(bdrv_get_node_name(bs)),
         .has_writethrough   = true,
         .writethrough       = writethrough,
         .u.nbd = {
-            .device             = g_strdup(bdrv_get_node_name(bs)),
             .has_name           = true,
             .name               = g_strdup(export_name),
             .has_description    = !!export_description,
-- 
2.25.4


