Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB512D90F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:34:40 +0100 (CET)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHfS-0000d3-Jh
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHC8-0005Xd-8s
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHC6-0003P3-Mm
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51193
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHC6-0003MW-Gy
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxyCrdRVG0QvRGArtkKQlZEV6GW4AMxyzBj5Ko2oEY4=;
 b=JXg1btmmZI6te1xlVeZD++bvIGEgsXU/6wJ8zr1i7mecM8zYGbi3zeNo1lR56aPh0TX9zW
 LifzPFRVMt2aqo2NmfqkZeHQgpD178vWea2D9mvaWFrcwaTr6W4uLx/Kf/VQBSfN+vMCk9
 UbVzVua2QkEEFbVpaZxn+ddepJGBB2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-Lz_VPp7dMaGMGxNbqDt-4Q-1; Tue, 31 Dec 2019 08:04:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F17800D41
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C3F620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/86] arm:sabrelite: use memdev for RAM
Date: Tue, 31 Dec 2019 14:03:15 +0100
Message-Id: <1577797450-88458-32-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Lz_VPp7dMaGMGxNbqDt-4Q-1
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
 remove no longer needed IMX6Sabrelite

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/sabrelite.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 96cc455..e31694b 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -19,11 +19,6 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
=20
-typedef struct IMX6Sabrelite {
-    FslIMX6State soc;
-    MemoryRegion ram;
-} IMX6Sabrelite;
-
 static struct arm_boot_info sabrelite_binfo =3D {
     /* DDR memory start */
     .loader_start =3D FSL_IMX6_MMDC_ADDR,
@@ -45,7 +40,7 @@ static void sabrelite_reset_secondary(ARMCPU *cpu,
=20
 static void sabrelite_init(MachineState *machine)
 {
-    IMX6Sabrelite *s =3D g_new0(IMX6Sabrelite, 1);
+    FslIMX6State *s;
     Error *err =3D NULL;
=20
     /* Check the amount of memory is compatible with the SOC */
@@ -55,19 +50,16 @@ static void sabrelite_init(MachineState *machine)
         exit(1);
     }
=20
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
-                            TYPE_FSL_IMX6, &error_abort, NULL);
-
-    object_property_set_bool(OBJECT(&s->soc), true, "realized", &err);
+    s =3D FSL_IMX6(object_new(TYPE_FSL_IMX6));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s), &error_fa=
tal);
+    object_property_set_bool(OBJECT(s), true, "realized", &err);
     if (err !=3D NULL) {
         error_report("%s", error_get_pretty(err));
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "sabrelite.ram",
-                                         machine->ram_size);
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
-                                &s->ram);
+                                machine->ram);
=20
     {
         /*
@@ -78,7 +70,7 @@ static void sabrelite_init(MachineState *machine)
         /* Add the sst25vf016b NOR FLASH memory to first SPI */
         Object *spi_dev;
=20
-        spi_dev =3D object_resolve_path_component(OBJECT(&s->soc), "spi1")=
;
+        spi_dev =3D object_resolve_path_component(OBJECT(s), "spi1");
         if (spi_dev) {
             SSIBus *spi_bus;
=20
@@ -109,7 +101,7 @@ static void sabrelite_init(MachineState *machine)
     sabrelite_binfo.secondary_cpu_reset_hook =3D sabrelite_reset_secondary=
;
=20
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu[0], machine, &sabrelite_binfo);
+        arm_load_kernel(&s->cpu[0], machine, &sabrelite_binfo);
     }
 }
=20
@@ -119,6 +111,7 @@ static void sabrelite_machine_init(MachineClass *mc)
     mc->init =3D sabrelite_init;
     mc->max_cpus =3D FSL_IMX6_NUM_CPUS;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "sabrelite.ram";
 }
=20
 DEFINE_MACHINE("sabrelite", sabrelite_machine_init)
--=20
2.7.4


