Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9697C16191F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 18:51:19 +0100 (CET)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3kYA-00067G-J6
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 12:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j3kIq-0001YI-Un
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j3kIp-0001vd-K2
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39095
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j3kIp-0001uR-Ey
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581960927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHuC4/i8RhKr6ZW/nPMVPCCUOUPbmPrGva4aX3bS4eU=;
 b=QJ7a1Sj9Hy6LKIp90MGGjrcvciLGfVP7Lh2vJEtkMQnlJSDWXCatwDaSNkWhZVlK5t1T2H
 pUkemukm2n2IK+WKeo7RWfDCWNZDVY/Hwq6p4w+1O47q98wklPspDtmPbMqDSBSqwdAl7i
 9s8B1Ke+Aqf7Ypx2/6mq5nys+xVwTdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-xEnqwN-4NAK0pTmlwse_Zw-1; Mon, 17 Feb 2020 12:35:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 454501005513;
 Mon, 17 Feb 2020 17:35:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B00190508;
 Mon, 17 Feb 2020 17:35:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/79] arm/mcimx6ul-evk: use memdev for RAM
Date: Mon, 17 Feb 2020 12:33:53 -0500
Message-Id: <20200217173452.15243-21-imammedo@redhat.com>
In-Reply-To: <20200217173452.15243-1-imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: xEnqwN-4NAK0pTmlwse_Zw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
  remove no longer needed MCIMX6ULEVK

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
CC: jcd@tribudubois.net
---
 hw/arm/mcimx6ul-evk.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index e90b393a44..23a71ed378 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -19,15 +19,10 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
=20
-typedef struct {
-    FslIMX6ULState soc;
-    MemoryRegion ram;
-} MCIMX6ULEVK;
-
 static void mcimx6ul_evk_init(MachineState *machine)
 {
     static struct arm_boot_info boot_info;
-    MCIMX6ULEVK *s =3D g_new0(MCIMX6ULEVK, 1);
+    FslIMX6ULState *s;
     int i;
=20
     if (machine->ram_size > FSL_IMX6UL_MMDC_SIZE) {
@@ -43,15 +38,12 @@ static void mcimx6ul_evk_init(MachineState *machine)
         .nb_cpus =3D machine->smp.cpus,
     };
=20
-    object_initialize_child(OBJECT(machine), "soc", &s->soc,  sizeof(s->so=
c),
-                            TYPE_FSL_IMX6UL, &error_fatal, NULL);
-
-    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fat=
al);
+    s =3D FSL_IMX6UL(object_new(TYPE_FSL_IMX6UL));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s), &error_fa=
tal);
+    object_property_set_bool(OBJECT(s), true, "realized", &error_fatal);
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx6ul-evk.ram"=
,
-                                         machine->ram_size);
-    memory_region_add_subregion(get_system_memory(),
-                                FSL_IMX6UL_MMDC_ADDR, &s->ram);
+    memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
+                                machine->ram);
=20
     for (i =3D 0; i < FSL_IMX6UL_NUM_USDHCS; i++) {
         BusState *bus;
@@ -61,7 +53,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
=20
         di =3D drive_get_next(IF_SD);
         blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
-        bus =3D qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
+        bus =3D qdev_get_child_bus(DEVICE(&s->usdhc[i]), "sd-bus");
         carddev =3D qdev_create(bus, TYPE_SD_CARD);
         qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
         object_property_set_bool(OBJECT(carddev), true,
@@ -69,7 +61,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
=20
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu, machine, &boot_info);
+        arm_load_kernel(&s->cpu, machine, &boot_info);
     }
 }
=20
@@ -78,5 +70,6 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
     mc->desc =3D "Freescale i.MX6UL Evaluation Kit (Cortex A7)";
     mc->init =3D mcimx6ul_evk_init;
     mc->max_cpus =3D FSL_IMX6UL_NUM_CPUS;
+    mc->default_ram_id =3D "mcimx6ul-evk.ram";
 }
 DEFINE_MACHINE("mcimx6ul-evk", mcimx6ul_evk_machine_init)
--=20
2.18.1


