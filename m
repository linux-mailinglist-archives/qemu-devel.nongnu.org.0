Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A456614A230
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 11:45:51 +0100 (CET)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw1tu-0007Ug-Kr
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 05:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iw1m0-0003Xb-Gq
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:37:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iw1lz-0003Ai-CC
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:37:40 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48779
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iw1lz-0003AX-8p
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580121459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykGD5q6tg/Ruqxi7LkOISW7w1se2v94mv33Xd77OWa8=;
 b=DPTnU3NMMdSYumR+NnB3cDp+eppwZk1Y20yzk+GEhmTvU8pRCqNz3xLbzGqi0Q49irxNpV
 85fbsKjjDwgzJ+ykmz/5ZGKXEA1a9hLn30w6DP2ybHzXhnLmWvBS7c3txbqA1oweNnBKKB
 uc/tXj/GnAxk8MOhWmspIWcn1iLy0UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-MCjzRulLN7OY2UjyJ1nJbQ-1; Mon, 27 Jan 2020 05:37:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A6FF8010D0;
 Mon, 27 Jan 2020 10:37:34 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA6B4451F;
 Mon, 27 Jan 2020 10:37:29 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/13] monitor/hmp: Prefer to use hmp_handle_error for
 error reporting in block hmp commands
Date: Mon, 27 Jan 2020 12:36:47 +0200
Message-Id: <20200127103647.17761-14-mlevitsk@redhat.com>
In-Reply-To: <20200127103647.17761-1-mlevitsk@redhat.com>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: MCjzRulLN7OY2UjyJ1nJbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This way they all will be prefixed with 'Error:' which some parsers
(e.g libvirt) need

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=3D1719169

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.=
c
index 7bbe4e3814..5b060d380d 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -84,7 +84,6 @@ void hmp_drive_add(Monitor *mon, const QDict *qdict)
     mc =3D MACHINE_GET_CLASS(current_machine);
     dinfo =3D drive_new(opts, mc->block_default_type, &err);
     if (err) {
-        error_report_err(err);
         qemu_opts_del(opts);
         goto err;
     }
@@ -98,7 +97,7 @@ void hmp_drive_add(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "OK\n");
         break;
     default:
-        monitor_printf(mon, "Can't hot-add drive to type %d\n", dinfo->typ=
e);
+        error_setg(&err, "Can't hot-add drive to type %d", dinfo->type);
         goto err;
     }
     return;
@@ -109,6 +108,7 @@ err:
         monitor_remove_blk(blk);
         blk_unref(blk);
     }
+    hmp_handle_error(mon, err);
 }
=20
 void hmp_drive_del(Monitor *mon, const QDict *qdict)
@@ -130,14 +130,14 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
=20
     blk =3D blk_by_name(id);
     if (!blk) {
-        error_report("Device '%s' not found", id);
-        return;
+        error_setg(&local_err, "Device '%s' not found", id);
+        goto err;
     }
=20
     if (!blk_legacy_dinfo(blk)) {
-        error_report("Deleting device added with blockdev-add"
-                     " is not supported");
-        return;
+        error_setg(&local_err,
+                   "Deleting device added with blockdev-add is not support=
ed");
+        goto err;
     }
=20
     aio_context =3D blk_get_aio_context(blk);
@@ -146,9 +146,8 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
     bs =3D blk_bs(blk);
     if (bs) {
         if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_DRIVE_DEL, &local_err)) {
-            error_report_err(local_err);
             aio_context_release(aio_context);
-            return;
+            goto err;
         }
=20
         blk_remove_bs(blk);
@@ -169,12 +168,15 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
     }
=20
     aio_context_release(aio_context);
+err:
+    hmp_handle_error(mon, local_err);
 }
=20
 void hmp_commit(Monitor *mon, const QDict *qdict)
 {
     const char *device =3D qdict_get_str(qdict, "device");
     BlockBackend *blk;
+    Error *local_err =3D NULL;
     int ret;
=20
     if (!strcmp(device, "all")) {
@@ -185,12 +187,12 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
=20
         blk =3D blk_by_name(device);
         if (!blk) {
-            error_report("Device '%s' not found", device);
-            return;
+            error_setg(&local_err, "Device '%s' not found", device);
+            goto err;
         }
         if (!blk_is_available(blk)) {
-            error_report("Device '%s' has no medium", device);
-            return;
+            error_setg(&local_err, "Device '%s' has no medium", device);
+            goto err;
         }
=20
         bs =3D blk_bs(blk);
@@ -202,8 +204,13 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
         aio_context_release(aio_context);
     }
     if (ret < 0) {
-        error_report("'commit' error for '%s': %s", device, strerror(-ret)=
);
+        error_setg(&local_err,
+                   "'commit' error for '%s': %s", device, strerror(-ret));
+        goto err;
     }
+    return;
+err:
+    hmp_handle_error(mon, local_err);
 }
=20
 void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
--=20
2.17.2


