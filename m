Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751B29E51
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 20:47:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUFDs-0007fn-6D
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 14:47:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFBe-0006Xb-Hu
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFBc-0005t7-1h
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hUFBb-0005sH-Pk
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:44:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84E0481F01;
	Fri, 24 May 2019 18:44:58 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DABD31001E65;
	Fri, 24 May 2019 18:44:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri, 24 May 2019 15:44:32 -0300
Message-Id: <20190524184447.16678-3-ehabkost@redhat.com>
In-Reply-To: <20190524184447.16678-1-ehabkost@redhat.com>
References: <20190524184447.16678-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 24 May 2019 18:44:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/17] hw/ppc/pnv: Use object_initialize_child
 for correct reference counting
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
?-   object_unref(OBJECT(child_ptr));
 |
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                            child_type, errp, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
     ...
?-   object_unref(OBJECT(child_ptr));
 )

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190507163416.24647-2-philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ppc/pnv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index dfb4ea5742..31aa20ee25 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -994,14 +994,12 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, =
Error **errp)
         PnvCore *pnv_core =3D PNV_CORE(chip->cores + (i * 4) * typesize)=
;
         int core_id =3D CPU_CORE(pnv_core)->core_id;
=20
-        object_initialize(eq, sizeof(*eq), TYPE_PNV_QUAD);
         snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
+        object_initialize_child(OBJECT(chip), eq_name, eq, sizeof(*eq),
+                                TYPE_PNV_QUAD, &error_fatal, NULL);
=20
-        object_property_add_child(OBJECT(chip), eq_name, OBJECT(eq),
-                                  &error_fatal);
         object_property_set_int(OBJECT(eq), core_id, "id", &error_fatal)=
;
         object_property_set_bool(OBJECT(eq), true, "realized", &error_fa=
tal);
-        object_unref(OBJECT(eq));
=20
         pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->id),
                                 &eq->xscom_regs);
@@ -1165,10 +1163,9 @@ static void pnv_chip_core_realize(PnvChip *chip, E=
rror **errp)
             continue;
         }
=20
-        object_initialize(pnv_core, typesize, typename);
         snprintf(core_name, sizeof(core_name), "core[%d]", core_hwid);
-        object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_co=
re),
-                                  &error_fatal);
+        object_initialize_child(OBJECT(chip), core_name, pnv_core, types=
ize,
+                                typename, &error_fatal, NULL);
         object_property_set_int(OBJECT(pnv_core), smp_threads, "nr-threa=
ds",
                                 &error_fatal);
         object_property_set_int(OBJECT(pnv_core), core_hwid,
@@ -1180,7 +1177,6 @@ static void pnv_chip_core_realize(PnvChip *chip, Er=
ror **errp)
                                        OBJECT(chip), &error_fatal);
         object_property_set_bool(OBJECT(pnv_core), true, "realized",
                                  &error_fatal);
-        object_unref(OBJECT(pnv_core));
=20
         /* Each core has an XSCOM MMIO region */
         if (!pnv_chip_is_power9(chip)) {
--=20
2.18.0.rc1.1.g3f1ff2140


