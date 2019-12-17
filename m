Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C5812234B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 05:54:39 +0100 (CET)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih4sY-0004lj-Ce
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 23:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33485)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4i0-00088F-4r
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4hy-0005PY-Tp
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:44 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34677 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4hy-0005Ip-Il; Mon, 16 Dec 2019 23:43:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWQ5YMDz9sSZ; Tue, 17 Dec 2019 15:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557810;
 bh=pG34byp+FTDvxI9Olx4WbQLypc0hfrTikv9BQlYsOr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CkIFCxxSJ4asBZRXXQ82IHNZKUR8ILRXCT0PIbs0n6b5oC2UgJG+EW2VrkKmiW9aJ
 XOQ3GTIEftefNbc2fVTjV7CXXVp3DPetrhBVpaUOqeDRm+UkUYqUhcEWtrIK8BfEVd
 elfS4k9ntMJ/VVVzr1PNP5OBL5+SvyXnD2TsvWFc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 13/88] xics: Link ICP_PROP_XICS property to ICPState::xics
 pointer
Date: Tue, 17 Dec 2019 15:42:07 +1100
Message-Id: <20191217044322.351838-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The ICP object has both a pointer and an ICP_PROP_XICS property pointing
to the XICS fabric. Confusing bugs could arise if these ever go out of
sync.

Change the property definition so that it explicitly sets the pointer.
The property isn't optional : not being able to set the link is a bug
and QEMU should rather abort than exit in this case.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157403284152.409804.17114564311521923733.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xics.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index f7a4548089..35dddb8867 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -310,15 +310,7 @@ static void icp_realize(DeviceState *dev, Error **er=
rp)
     Object *obj;
     Error *err =3D NULL;
=20
-    obj =3D object_property_get_link(OBJECT(dev), ICP_PROP_XICS, &err);
-    if (!obj) {
-        error_propagate_prepend(errp, err,
-                                "required link '" ICP_PROP_XICS
-                                "' not found: ");
-        return;
-    }
-
-    icp->xics =3D XICS_FABRIC(obj);
+    assert(icp->xics);
=20
     obj =3D object_property_get_link(OBJECT(dev), ICP_PROP_CPU, &err);
     if (!obj) {
@@ -368,12 +360,19 @@ static void icp_unrealize(DeviceState *dev, Error *=
*errp)
     vmstate_unregister(NULL, &vmstate_icp_server, icp);
 }
=20
+static Property icp_properties[] =3D {
+    DEFINE_PROP_LINK(ICP_PROP_XICS, ICPState, xics, TYPE_XICS_FABRIC,
+                     XICSFabric *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void icp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D icp_realize;
     dc->unrealize =3D icp_unrealize;
+    dc->props =3D icp_properties;
     /*
      * Reason: part of XICS interrupt controller, needs to be wired up
      * by icp_create().
@@ -397,9 +396,7 @@ Object *icp_create(Object *cpu, const char *type, XIC=
SFabric *xi, Error **errp)
     obj =3D object_new(type);
     object_property_add_child(cpu, type, obj, &error_abort);
     object_unref(obj);
-    object_ref(OBJECT(xi));
-    object_property_add_const_link(obj, ICP_PROP_XICS, OBJECT(xi),
-                                   &error_abort);
+    object_property_set_link(obj, OBJECT(xi), ICP_PROP_XICS, &error_abor=
t);
     object_ref(cpu);
     object_property_add_const_link(obj, ICP_PROP_CPU, cpu, &error_abort)=
;
     object_property_set_bool(obj, true, "realized", &local_err);
@@ -417,7 +414,6 @@ void icp_destroy(ICPState *icp)
     Object *obj =3D OBJECT(icp);
=20
     object_unref(object_property_get_link(obj, ICP_PROP_CPU, &error_abor=
t));
-    object_unref(object_property_get_link(obj, ICP_PROP_XICS, &error_abo=
rt));
     object_unparent(obj);
 }
=20
--=20
2.23.0


