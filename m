Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526814EFB8
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:37:43 +0100 (CET)
Received: from localhost ([::1]:54870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYMY-0001tR-2W
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyP-0004QI-4e
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyM-0004AY-TQ
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:45 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41321
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyM-00047e-JB
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ieFcMPPP4JrVG3eYMyf1FNWtXiKeNrQp8ffTFFPxBUk=;
 b=V7zYYf6iz5bUGvpraan3HGmgn9tP/VNNHIqzTZ/CPfBTDxMh6pr34XAKdAFhQiHv1xte62
 cMhN7gEW9kaKiW9CLx5qWPOw86bwBOSfo5iSe77/tZRtfpShJ3Nq7Ob5EJGDzxs/VIPZwI
 H8eauOYE0N7bGdYEIVPa6fZwtSXTXTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-qnw-mhk2P8eQYErb3Fgjow-1; Fri, 31 Jan 2020 10:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B52C13F5
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6EA386C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:37 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/80] arm/omap_sx1: use memdev for RAM
Date: Fri, 31 Jan 2020 16:08:56 +0100
Message-Id: <1580483390-131164-27-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: qnw-mhk2P8eQYErb3Fgjow-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 while at it add check for user supplied RAM size and error
 out if it mismatches board expected value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)
---
 hw/arm/omap_sx1.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index be24571..2bebab4 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -35,6 +35,7 @@
 #include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
+#include "qemu/cutils.h"
=20
 /*************************************************************************=
****/
 /* Siemens SX1 Cellphone V1 */
@@ -102,8 +103,8 @@ static struct arm_boot_info sx1_binfo =3D {
 static void sx1_init(MachineState *machine, const int version)
 {
     struct omap_mpu_state_s *mpu;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *address_space =3D get_system_memory();
-    MemoryRegion *dram =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
     MemoryRegion *cs =3D g_new(MemoryRegion, 4);
     static uint32_t cs0val =3D 0x00213090;
@@ -115,15 +116,20 @@ static void sx1_init(MachineState *machine, const int=
 version)
     uint32_t flash_size =3D flash0_size;
     int be;
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     if (version =3D=3D 2) {
         flash_size =3D flash2_size;
     }
=20
-    memory_region_allocate_system_memory(dram, NULL, "omap1.dram",
-                                         sx1_binfo.ram_size);
-    memory_region_add_subregion(address_space, OMAP_EMIFF_BASE, dram);
+    memory_region_add_subregion(address_space, OMAP_EMIFF_BASE, machine->r=
am);
=20
-    mpu =3D omap310_mpu_init(dram, machine->cpu_type);
+    mpu =3D omap310_mpu_init(machine->ram, machine->cpu_type);
=20
     /* External Flash (EMIFS) */
     memory_region_init_ram(flash, NULL, "omap_sx1.flash0-0", flash_size,
@@ -223,6 +229,8 @@ static void sx1_machine_v2_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D sx1_init_v2;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("ti925t");
+    mc->default_ram_size =3D sdram_size;
+    mc->default_ram_id =3D "omap1.dram";
 }
=20
 static const TypeInfo sx1_machine_v2_type =3D {
@@ -239,6 +247,8 @@ static void sx1_machine_v1_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D sx1_init_v1;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("ti925t");
+    mc->default_ram_size =3D sdram_size;
+    mc->default_ram_id =3D "omap1.dram";
 }
=20
 static const TypeInfo sx1_machine_v1_type =3D {
--=20
2.7.4


