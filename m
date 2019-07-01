Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD929E69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 20:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUFGE-0001dj-Pb
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 14:49:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFBk-0006cv-EV
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFBi-0005z5-9t
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13432)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hUFBh-0005w8-Up
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 374105F793;
	Fri, 24 May 2019 18:45:03 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C2A919C6F;
	Fri, 24 May 2019 18:44:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri, 24 May 2019 15:44:33 -0300
Message-Id: <20190524184447.16678-4-ehabkost@redhat.com>
In-Reply-To: <20190524184447.16678-1-ehabkost@redhat.com>
References: <20190524184447.16678-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 24 May 2019 18:45:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/17] hw/misc/macio: Use
 object_initialize_child for correct ref. counting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script
(with a bit of manual fix-up for overly long lines):

 @use_object_initialize_child@
 expression parent_obj;
 expression child_ptr;
 expression child_name;
 expression child_type;
 expression child_size;
 expression errp;
 @@
 (
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                           child_type, &error_abort, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
     ...
 ?-  object_unref(OBJECT(child_ptr));
 |
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                            child_type, errp, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
     ...
 ?-  object_unref(OBJECT(child_ptr));
 )

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190507163416.24647-3-philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/misc/macio/macio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 94da85c8d7..b726c73022 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -346,12 +346,12 @@ static void macio_newworld_realize(PCIDevice *d, Er=
ror **errp)
         object_property_set_bool(OBJECT(&ns->gpio), true, "realized", &e=
rr);
=20
         /* PMU */
-        object_initialize(&s->pmu, sizeof(s->pmu), TYPE_VIA_PMU);
+        object_initialize_child(OBJECT(s), "pmu", &s->pmu, sizeof(s->pmu=
),
+                                TYPE_VIA_PMU, &error_abort, NULL);
         object_property_set_link(OBJECT(&s->pmu), OBJECT(sysbus_dev), "g=
pio",
                                  &error_abort);
         qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
         qdev_set_parent_bus(DEVICE(&s->pmu), BUS(&s->macio_bus));
-        object_property_add_child(OBJECT(s), "pmu", OBJECT(&s->pmu), NUL=
L);
=20
         object_property_set_bool(OBJECT(&s->pmu), true, "realized", &err=
);
         if (err) {
@@ -365,9 +365,9 @@ static void macio_newworld_realize(PCIDevice *d, Erro=
r **errp)
                                     sysbus_mmio_get_region(sysbus_dev, 0=
));
     } else {
         /* CUDA */
-        object_initialize(&s->cuda, sizeof(s->cuda), TYPE_CUDA);
+        object_initialize_child(OBJECT(s), "cuda", &s->cuda, sizeof(s->c=
uda),
+                                TYPE_CUDA, &error_abort, NULL);
         qdev_set_parent_bus(DEVICE(&s->cuda), BUS(&s->macio_bus));
-        object_property_add_child(OBJECT(s), "cuda", OBJECT(&s->cuda), N=
ULL);
         qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
                              s->frequency);
=20
--=20
2.18.0.rc1.1.g3f1ff2140


