Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638E13718A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 16:41:02 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipwPF-0000et-4O
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 10:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwJN-00022Q-Lw
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwJM-0006AF-KD
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:34:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21295
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ipwJM-00067t-F2
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578670496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azjO7RAgN5mSKPmT0jgzkYfdJoLVtbwkcHrE+XAg2zk=;
 b=B1cxtZ9LRmRBnfbzbuRHoQ1moxhD1ccVZbt4EoBGgLCPS3TnbCxsbb+mwfMk5z1MNLsjtT
 GluIZ3zN4+liSpexxIqpPwUmO35jMstcg0fZ5cunSQeAPXHMaDmDD7GEprCTpclrjBpxvL
 omIB0a1R74k3/JQ6Y8ocmRO0/a9ZC60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-MBYNe5QQPbyBXXsU1LGvKw-1; Fri, 10 Jan 2020 10:34:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 101C0800A02
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 15:34:52 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0164A4B60;
 Fri, 10 Jan 2020 15:34:45 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/26] qdev: move instance properties to class properties
Date: Fri, 10 Jan 2020 19:30:33 +0400
Message-Id: <20200110153039.1379601-21-marcandre.lureau@redhat.com>
In-Reply-To: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MBYNe5QQPbyBXXsU1LGvKw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/core/qdev.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0e314c051e..062106b067 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -943,14 +943,6 @@ static void device_initfn(Object *obj)
     dev->realized =3D false;
     dev->allow_unplug_during_migration =3D false;
=20
-    object_property_add_bool(obj, "realized",
-                             device_get_realized, device_set_realized, NUL=
L);
-    object_property_add_bool(obj, "hotpluggable",
-                             device_get_hotpluggable, NULL, NULL);
-    object_property_add_bool(obj, "hotplugged",
-                             device_get_hotplugged, NULL,
-                             &error_abort);
-
     class =3D object_get_class(OBJECT(dev));
     do {
         for (prop =3D DEVICE_CLASS(class)->props; prop && prop->name; prop=
++) {
@@ -960,9 +952,6 @@ static void device_initfn(Object *obj)
         class =3D object_class_get_parent(class);
     } while (class !=3D object_class_by_name(TYPE_DEVICE));
=20
-    object_property_add_link(OBJECT(dev), "parent_bus", TYPE_BUS,
-                             (Object **)&dev->parent_bus, NULL, 0,
-                             &error_abort);
     QLIST_INIT(&dev->gpios);
 }
=20
@@ -1058,6 +1047,19 @@ static void device_class_init(ObjectClass *class, vo=
id *data)
     dc->hotpluggable =3D true;
     dc->user_creatable =3D true;
     vc->get_id =3D device_vmstate_if_get_id;
+
+    object_class_property_add_bool(class, "realized",
+                                   device_get_realized, device_set_realize=
d,
+                                   &error_abort);
+    object_class_property_add_bool(class, "hotpluggable",
+                                   device_get_hotpluggable, NULL,
+                                   &error_abort);
+    object_class_property_add_bool(class, "hotplugged",
+                                   device_get_hotplugged, NULL,
+                                   &error_abort);
+    object_class_property_add_link(class, "parent_bus", TYPE_BUS,
+                                   offsetof(DeviceState, parent_bus), NULL=
, 0,
+                                   &error_abort);
 }
=20
 void device_class_set_props(DeviceClass *dc, Property *props)
--=20
2.25.0.rc1.20.g2443f3f80d.dirty


