Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900216A88D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 15:39:32 +0100 (CET)
Received: from localhost ([::1]:37484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6EtP-0000uu-K7
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 09:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6El8-00025w-Vi
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6El7-0002Nc-9K
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:30:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49687
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6El7-0002NP-4X
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582554656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOyrC+zcpf7vTJ4vhh9JtXzCpCkRLbYX5Cw8tSXypPw=;
 b=Lj+MnLxKT1SsuOknZkdl4mBVri/8narifskOkR8jEn+cc+BrQE2hbHLD17nisZeDItJ1L3
 xb4q5DZOu0KspJPcDCLqjfcYVtLVSKg70XFJ0sI/qtWg4O0/EHh6z3OF6T7c8GDb7mFonj
 qbtKV5DGyAyD+u6C4bidIUocAclnmFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-MhhNe58eOYSA85GrTAAhLQ-1; Mon, 24 Feb 2020 09:30:53 -0500
X-MC-Unique: MhhNe58eOYSA85GrTAAhLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FC71106BC24;
 Mon, 24 Feb 2020 14:30:52 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-134.ams2.redhat.com
 [10.36.117.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80BCF91833;
 Mon, 24 Feb 2020 14:30:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 10/20] blockdev-nbd: Boxed argument type for nbd-server-add
Date: Mon, 24 Feb 2020 15:29:58 +0100
Message-Id: <20200224143008.13362-11-kwolf@redhat.com>
In-Reply-To: <20200224143008.13362-1-kwolf@redhat.com>
References: <20200224143008.13362-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 coiby.xu@gmail.com, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the arguments of nbd-server-add to a new struct BlockExportNbd and
convert the command to 'boxed': true. This makes it easier to share code
with the storage daemon.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 18 ++++++++++++++----
 blockdev-nbd.c       | 35 ++++++++++++++++-------------------
 monitor/hmp-cmds.c   | 21 +++++++++++++++++----
 3 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index f8888f06c8..cdc585385c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5112,9 +5112,9 @@
             '*tls-authz': 'str'} }
=20
 ##
-# @nbd-server-add:
+# @BlockExportNbd:
 #
-# Export a block node to QEMU's embedded NBD server.
+# An NBD block export.
 #
 # @device: The device name or node name of the node to be exported
 #
@@ -5131,14 +5131,24 @@
 #          NBD client can use NBD_OPT_SET_META_CONTEXT with
 #          "qemu:dirty-bitmap:NAME" to inspect the bitmap. (since 4.0)
 #
+# Since: 5.0
+##
+{ 'struct': 'BlockExportNbd',
+  'data': {'device': 'str', '*name': 'str', '*description': 'str',
+           '*writable': 'bool', '*bitmap': 'str' } }
+
+##
+# @nbd-server-add:
+#
+# Export a block node to QEMU's embedded NBD server.
+#
 # Returns: error if the server is not running, or export with the same nam=
e
 #          already exists.
 #
 # Since: 1.3.0
 ##
 { 'command': 'nbd-server-add',
-  'data': {'device': 'str', '*name': 'str', '*description': 'str',
-           '*writable': 'bool', '*bitmap': 'str' } }
+  'data': 'BlockExportNbd', 'boxed': true }
=20
 ##
 # @NbdServerRemoveMode:
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index d8c892f7da..1a95d89f00 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -148,10 +148,7 @@ void qmp_nbd_server_start(SocketAddressLegacy *addr,
     qapi_free_SocketAddress(addr_flat);
 }
=20
-void qmp_nbd_server_add(const char *device, bool has_name, const char *nam=
e,
-                        bool has_description, const char *description,
-                        bool has_writable, bool writable,
-                        bool has_bitmap, const char *bitmap, Error **errp)
+void qmp_nbd_server_add(BlockExportNbd *arg, Error **errp)
 {
     BlockDriverState *bs =3D NULL;
     BlockBackend *on_eject_blk;
@@ -164,28 +161,28 @@ void qmp_nbd_server_add(const char *device, bool has_=
name, const char *name,
         return;
     }
=20
-    if (!has_name) {
-        name =3D device;
+    if (!arg->has_name) {
+        arg->name =3D arg->device;
     }
=20
-    if (strlen(name) > NBD_MAX_STRING_SIZE) {
-        error_setg(errp, "export name '%s' too long", name);
+    if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
+        error_setg(errp, "export name '%s' too long", arg->name);
         return;
     }
=20
-    if (has_description && strlen(description) > NBD_MAX_STRING_SIZE) {
-        error_setg(errp, "description '%s' too long", description);
+    if (arg->description && strlen(arg->description) > NBD_MAX_STRING_SIZE=
) {
+        error_setg(errp, "description '%s' too long", arg->description);
         return;
     }
=20
-    if (nbd_export_find(name)) {
-        error_setg(errp, "NBD server already has export named '%s'", name)=
;
+    if (nbd_export_find(arg->name)) {
+        error_setg(errp, "NBD server already has export named '%s'", arg->=
name);
         return;
     }
=20
-    on_eject_blk =3D blk_by_name(device);
+    on_eject_blk =3D blk_by_name(arg->device);
=20
-    bs =3D bdrv_lookup_bs(device, device, errp);
+    bs =3D bdrv_lookup_bs(arg->device, arg->device, errp);
     if (!bs) {
         return;
     }
@@ -199,15 +196,15 @@ void qmp_nbd_server_add(const char *device, bool has_=
name, const char *name,
         goto out;
     }
=20
-    if (!has_writable) {
-        writable =3D false;
+    if (!arg->has_writable) {
+        arg->writable =3D false;
     }
     if (bdrv_is_read_only(bs)) {
-        writable =3D false;
+        arg->writable =3D false;
     }
=20
-    exp =3D nbd_export_new(bs, 0, len, name, description, bitmap,
-                         !writable, !writable,
+    exp =3D nbd_export_new(bs, 0, len, arg->name, arg->description, arg->b=
itmap,
+                         !arg->writable, !arg->writable,
                          NULL, false, on_eject_blk, errp);
     if (!exp) {
         goto out;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 53bc3f76c4..92d78656a8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2320,6 +2320,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *=
qdict)
     Error *local_err =3D NULL;
     BlockInfoList *block_list, *info;
     SocketAddress *addr;
+    BlockExportNbd export;
=20
     if (writable && !all) {
         error_setg(&local_err, "-w only valid together with -a");
@@ -2352,8 +2353,13 @@ void hmp_nbd_server_start(Monitor *mon, const QDict =
*qdict)
             continue;
         }
=20
-        qmp_nbd_server_add(info->value->device, false, NULL, false, NULL,
-                           true, writable, false, NULL, &local_err);
+        export =3D (BlockExportNbd) {
+            .device         =3D info->value->device,
+            .has_writable   =3D true,
+            .writable       =3D writable,
+        };
+
+        qmp_nbd_server_add(&export, &local_err);
=20
         if (local_err !=3D NULL) {
             qmp_nbd_server_stop(NULL);
@@ -2374,8 +2380,15 @@ void hmp_nbd_server_add(Monitor *mon, const QDict *q=
dict)
     bool writable =3D qdict_get_try_bool(qdict, "writable", false);
     Error *local_err =3D NULL;
=20
-    qmp_nbd_server_add(device, !!name, name, false, NULL, true, writable,
-                       false, NULL, &local_err);
+    BlockExportNbd export =3D {
+        .device         =3D (char *) device,
+        .has_name       =3D !!name,
+        .name           =3D (char *) name,
+        .has_writable   =3D true,
+        .writable       =3D writable,
+    };
+
+    qmp_nbd_server_add(&export, &local_err);
     hmp_handle_error(mon, local_err);
 }
=20
--=20
2.20.1


