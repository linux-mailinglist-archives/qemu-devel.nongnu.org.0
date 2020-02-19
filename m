Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467AC164A11
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:21:42 +0100 (CET)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4S6X-0006J8-91
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4Rvm-00031M-CI
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4Rvl-0000jL-52
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23986
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4Rvl-0000j4-0B
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tx7ne2phGsJ/d42YpjVnMSRpXNL+68307FSeJHIUrCQ=;
 b=ckJ5zB15XSxERiP6f28/bRAAZ1jCU6HJeGvQmCVpdYXiX7Idc8cWEZzpd6vbXUSlOXjREl
 /QMuaQvVA0djCb8GU51AxwiB6ev8XptHBECNecpmV1xM3vHihUoC51zrAjC1Be/Fn3XPZa
 SciOWTZFo9R/Oq0YhASohtHs6hhzbpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-0YnYnG9fOEKvkU6hwM8qrA-1; Wed, 19 Feb 2020 11:10:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D0A10C6D3E;
 Wed, 19 Feb 2020 16:10:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A4E58ECF3;
 Wed, 19 Feb 2020 16:10:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 28/79] arm/sabrelite: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:02 -0500
Message-Id: <20200219160953.13771-29-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0YnYnG9fOEKvkU6hwM8qrA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, jcd@tribudubois.net
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
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
CC: jcd@tribudubois.net
---
 hw/arm/sabrelite.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 96cc455c5c..e31694bb92 100644
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
2.18.1


