Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60571241CE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:33:41 +0100 (CET)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihUm4-0001QH-BJ
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ihUWX-000621-2F
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ihUWU-0002WE-ES
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40684
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ihUWT-0002U7-24
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C93fgCuYkcySyFZzbNYaKAJAO/+ByfBxZR60vnYOo/s=;
 b=POWD+u6ZkM3OF1QQSHOhiPi7OP6H2M3hdvQKyMW3TP12wPvkZT6oprhaH5mu6o3qnfkgtc
 NJ9C/MddOpeliJqa54tL0rFaobBFjpQVNHeC4r8USF3T+L2iiPRpSjkBfmNWIaepOYTNDw
 gVsw7+rRlV2yveyw5wdMBxoN1OPzSZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-NWwVYIJ3Mt-OlFxdTGo2Qw-1; Wed, 18 Dec 2019 03:17:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20AE4185432C;
 Wed, 18 Dec 2019 08:17:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F167D8FA;
 Wed, 18 Dec 2019 08:17:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE3FD1136427; Wed, 18 Dec 2019 09:17:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/35] hw/core/qdev: cleanup Error ** variables
Date: Wed, 18 Dec 2019 09:17:09 +0100
Message-Id: <20191218081721.23520-24-armbru@redhat.com>
In-Reply-To: <20191218081721.23520-1-armbru@redhat.com>
References: <20191218081721.23520-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: NWwVYIJ3Mt-OlFxdTGo2Qw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Rename Error ** parameter in check_only_migratable to common errp.

In device_set_realized:

 - Move "if (local_err !=3D NULL)" closer to error setters.

 - Drop 'Error **local_errp': it doesn't save any LoCs, but it's very
   unusual.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191205174635.18758-10-vsementsov@virtuozzo.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cf1ba28fe3..82d3ee590a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -820,12 +820,12 @@ static bool device_get_realized(Object *obj, Error **=
errp)
     return dev->realized;
 }
=20
-static bool check_only_migratable(Object *obj, Error **err)
+static bool check_only_migratable(Object *obj, Error **errp)
 {
     DeviceClass *dc =3D DEVICE_GET_CLASS(obj);
=20
     if (!vmstate_check_only_migratable(dc->vmsd)) {
-        error_setg(err, "Device %s is not migratable, but "
+        error_setg(errp, "Device %s is not migratable, but "
                    "--only-migratable was specified",
                    object_get_typename(obj));
         return false;
@@ -874,10 +874,9 @@ static void device_set_realized(Object *obj, bool valu=
e, Error **errp)
=20
         if (dc->realize) {
             dc->realize(dev, &local_err);
-        }
-
-        if (local_err !=3D NULL) {
-            goto fail;
+            if (local_err !=3D NULL) {
+                goto fail;
+            }
         }
=20
         DEVICE_LISTENER_CALL(realize, Forward, dev);
@@ -918,27 +917,26 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
        }
=20
     } else if (!value && dev->realized) {
-        Error **local_errp =3D NULL;
+        /* We want local_err to track only the first error */
         QLIST_FOREACH(bus, &dev->child_bus, sibling) {
-            local_errp =3D local_err ? NULL : &local_err;
             object_property_set_bool(OBJECT(bus), false, "realized",
-                                     local_errp);
+                                     local_err ? NULL : &local_err);
         }
         if (qdev_get_vmsd(dev)) {
             vmstate_unregister(dev, qdev_get_vmsd(dev), dev);
         }
         if (dc->unrealize) {
-            local_errp =3D local_err ? NULL : &local_err;
-            dc->unrealize(dev, local_errp);
+            dc->unrealize(dev, local_err ? NULL : &local_err);
         }
         dev->pending_deleted_event =3D true;
         DEVICE_LISTENER_CALL(unrealize, Reverse, dev);
-    }
=20
-    if (local_err !=3D NULL) {
-        goto fail;
+        if (local_err !=3D NULL) {
+            goto fail;
+        }
     }
=20
+    assert(local_err =3D=3D NULL);
     dev->realized =3D value;
     return;
=20
@@ -976,7 +974,7 @@ static bool device_get_hotpluggable(Object *obj, Error =
**errp)
                                 qbus_is_hotpluggable(dev->parent_bus));
 }
=20
-static bool device_get_hotplugged(Object *obj, Error **err)
+static bool device_get_hotplugged(Object *obj, Error **errp)
 {
     DeviceState *dev =3D DEVICE(obj);
=20
--=20
2.21.0


