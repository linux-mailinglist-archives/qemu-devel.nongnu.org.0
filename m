Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF30126856
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:43:47 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihzpy-0002k5-FN
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihzYi-0007Bi-8M
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihzYe-00088g-Sl
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:54 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27380
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihzYd-000847-Af
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576776347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rz8XplpVE9Nfga1S43gkcI04Wv87Es806T4s0FizFFk=;
 b=T8ReqE1YbNqd7Qq9v60xB35edIFqRz0lWEiWj6nnDpT37kN4AMsUyXLhSWiXG619KYmbuZ
 AKlpBPbVtfoP8tUONDaN+qLC4oPssu02lBViVE335L354bufJJxfMyWsJFYCkmutN18nGo
 M6r1KZEkJufSvMUzk9PFR6xbCuSMoPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-34k4uNdjPUiJdTIimAYxJA-1; Thu, 19 Dec 2019 12:25:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F40B107ACCA;
 Thu, 19 Dec 2019 17:25:43 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1E3A620C0;
 Thu, 19 Dec 2019 17:25:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/30] hmp: Allow using qdev ID for qemu-io command
Date: Thu, 19 Dec 2019 18:24:40 +0100
Message-Id: <20191219172441.7289-30-kwolf@redhat.com>
In-Reply-To: <20191219172441.7289-1-kwolf@redhat.com>
References: <20191219172441.7289-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 34k4uNdjPUiJdTIimAYxJA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to issue requests on an existing BlockBackend with the
'qemu-io' HMP command, allow specifying the BlockBackend not only with a
BlockBackend name, but also with a qdev ID/QOM path for a device that
owns the (possibly anonymous) BlockBackend.

Because qdev names could be conflicting with BlockBackend and node
names, introduce a -d option to explicitly address a device. If the
option is not given, a BlockBackend or a node is addressed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 monitor/hmp-cmds.c | 28 ++++++++++++++++++----------
 hmp-commands.hx    |  8 +++++---
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b2551c16d1..5f8941d298 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2468,23 +2468,31 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 {
     BlockBackend *blk;
     BlockBackend *local_blk =3D NULL;
+    bool qdev =3D qdict_get_try_bool(qdict, "qdev", false);
     const char* device =3D qdict_get_str(qdict, "device");
     const char* command =3D qdict_get_str(qdict, "command");
     Error *err =3D NULL;
     int ret;
=20
-    blk =3D blk_by_name(device);
-    if (!blk) {
-        BlockDriverState *bs =3D bdrv_lookup_bs(NULL, device, &err);
-        if (bs) {
-            blk =3D local_blk =3D blk_new(bdrv_get_aio_context(bs),
-                                      0, BLK_PERM_ALL);
-            ret =3D blk_insert_bs(blk, bs, &err);
-            if (ret < 0) {
+    if (qdev) {
+        blk =3D blk_by_qdev_id(device, &err);
+        if (!blk) {
+            goto fail;
+        }
+    } else {
+        blk =3D blk_by_name(device);
+        if (!blk) {
+            BlockDriverState *bs =3D bdrv_lookup_bs(NULL, device, &err);
+            if (bs) {
+                blk =3D local_blk =3D blk_new(bdrv_get_aio_context(bs),
+                                          0, BLK_PERM_ALL);
+                ret =3D blk_insert_bs(blk, bs, &err);
+                if (ret < 0) {
+                    goto fail;
+                }
+            } else {
                 goto fail;
             }
-        } else {
-            goto fail;
         }
     }
=20
diff --git a/hmp-commands.hx b/hmp-commands.hx
index cfcc044ce4..dc23185de4 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1875,9 +1875,11 @@ ETEXI
=20
     {
         .name       =3D "qemu-io",
-        .args_type  =3D "device:B,command:s",
-        .params     =3D "[device] \"[command]\"",
-        .help       =3D "run a qemu-io command on a block device",
+        .args_type  =3D "qdev:-d,device:B,command:s",
+        .params     =3D "[-d] [device] \"[command]\"",
+        .help       =3D "run a qemu-io command on a block device\n\t\t\t"
+                      "-d: [device] is a device ID rather than a "
+                      "drive ID or node name",
         .cmd        =3D hmp_qemu_io,
     },
=20
--=20
2.20.1


