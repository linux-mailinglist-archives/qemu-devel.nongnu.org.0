Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6A13C7C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:32:46 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkez-0004zb-7K
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK5-0007iy-9p
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK3-0008C2-Ts
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29012
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK3-0008BV-QD
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTCjJPgQpHfnZZ1nXbLsFiLhwDWvpB7MKlP26piVLe0=;
 b=OrY+HDUod7akTRIr7nHrYm7lso9L5Bk74eyI4w/IRNWVyUk1W4fINprMoWFPoS9ciZhSmg
 pv1U8HYBxlrIIdeHwu2tFRPKpbgCJZ2z7SD49Ca/5J7hoZiOPM3wWweFqSt0S1o+XqQn0Q
 IP/n15aYRH0ildaY6i5zV+LpBlfyxVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-2giqHw8kN52rOfwvCV5NIg-1; Wed, 15 Jan 2020 10:11:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5D21933B22;
 Wed, 15 Jan 2020 15:11:02 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1870196AE;
 Wed, 15 Jan 2020 15:11:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/86] arm:mcimx7d-sabre: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:36 +0100
Message-Id: <1579100861-73692-22-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 2giqHw8kN52rOfwvCV5NIg-1
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
Cc: andrew.smirnov@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 remove no longer needed MCIMX7Sabre

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: andrew.smirnov@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/mcimx7d-sabre.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 0d1f62d..de1e264 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -21,15 +21,10 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
=20
-typedef struct {
-    FslIMX7State soc;
-    MemoryRegion ram;
-} MCIMX7Sabre;
-
 static void mcimx7d_sabre_init(MachineState *machine)
 {
     static struct arm_boot_info boot_info;
-    MCIMX7Sabre *s =3D g_new0(MCIMX7Sabre, 1);
+    FslIMX7State *s;
     int i;
=20
     if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
@@ -45,15 +40,12 @@ static void mcimx7d_sabre_init(MachineState *machine)
         .nb_cpus =3D machine->smp.cpus,
     };
=20
-    object_initialize_child(OBJECT(machine), "soc",
-                            &s->soc, sizeof(s->soc),
-                            TYPE_FSL_IMX7, &error_fatal, NULL);
-    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fat=
al);
+    s =3D FSL_IMX7(object_new(TYPE_FSL_IMX7));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s), &error_fa=
tal);
+    object_property_set_bool(OBJECT(s), true, "realized", &error_fatal);
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx7d-sabre.ram=
",
-                                         machine->ram_size);
-    memory_region_add_subregion(get_system_memory(),
-                                FSL_IMX7_MMDC_ADDR, &s->ram);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX7_MMDC_ADDR,
+                                machine->ram);
=20
     for (i =3D 0; i < FSL_IMX7_NUM_USDHCS; i++) {
         BusState *bus;
@@ -63,7 +55,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
=20
         di =3D drive_get_next(IF_SD);
         blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
-        bus =3D qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
+        bus =3D qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev =3D qdev_create(bus, TYPE_SD_CARD);
         qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
         object_property_set_bool(OBJECT(carddev), true,
@@ -71,7 +63,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
     }
=20
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu[0], machine, &boot_info);
+        arm_load_kernel(&s->cpu[0], machine, &boot_info);
     }
 }
=20
@@ -80,5 +72,6 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
     mc->desc =3D "Freescale i.MX7 DUAL SABRE (Cortex A7)";
     mc->init =3D mcimx7d_sabre_init;
     mc->max_cpus =3D FSL_IMX7_NUM_CPUS;
+    mc->default_ram_id =3D "mcimx7d-sabre.ram";
 }
 DEFINE_MACHINE("mcimx7d-sabre", mcimx7d_sabre_machine_init)
--=20
2.7.4


