Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A814EF82
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:25:29 +0100 (CET)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYAi-0003o3-EF
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyA-0003yG-Ts
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXy9-0003mY-TA
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:30 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36865
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXy9-0003lZ-PR
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EG5+62k3gzvZtIUlzZyFd51D8qdLEsOXv7JNNvIzUk=;
 b=ajGnz3nhVd75AI57Z5avYud5xrT3pFm497CfHqX4IAlTWhWLMwj4901a6tm0uJPiNpFY10
 GdcR8bEK3cpWt+u3gLk20rfWslDixhxqqk9RuwqzL+/XuccJbe6/Gu6Vm/kKnw8wB+mefY
 gqxVaWZ1RrDsyEaWkGeRIK9fZpDSE1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-mTQQ5mOaPj2qAEZ1IvXWAQ-1; Fri, 31 Jan 2020 10:12:27 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763A4800D53;
 Fri, 31 Jan 2020 15:12:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3C3986C4B;
 Fri, 31 Jan 2020 15:12:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/80] arm/highbank: use memdev for RAM
Date: Fri, 31 Jan 2020 16:08:44 +0100
Message-Id: <1580483390-131164-15-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: mTQQ5mOaPj2qAEZ1IvXWAQ-1
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
Cc: robh@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
CC: robh@kernel.org
---
 hw/arm/highbank.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 518d935..ac9de94 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -236,7 +236,6 @@ enum cxmachines {
  */
 static void calxeda_init(MachineState *machine, enum cxmachines machine_id=
)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     DeviceState *dev =3D NULL;
     SysBusDevice *busdev;
     qemu_irq pic[128];
@@ -247,7 +246,6 @@ static void calxeda_init(MachineState *machine, enum cx=
machines machine_id)
     qemu_irq cpu_virq[4];
     qemu_irq cpu_vfiq[4];
     MemoryRegion *sysram;
-    MemoryRegion *dram;
     MemoryRegion *sysmem;
     char *sysboot_filename;
=20
@@ -290,10 +288,8 @@ static void calxeda_init(MachineState *machine, enum c=
xmachines machine_id)
     }
=20
     sysmem =3D get_system_memory();
-    dram =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(dram, NULL, "highbank.dram", ram_=
size);
     /* SDRAM at address zero.  */
-    memory_region_add_subregion(sysmem, 0, dram);
+    memory_region_add_subregion(sysmem, 0, machine->ram);
=20
     sysram =3D g_new(MemoryRegion, 1);
     memory_region_init_ram(sysram, NULL, "highbank.sysram", 0x8000,
@@ -387,7 +383,7 @@ static void calxeda_init(MachineState *machine, enum cx=
machines machine_id)
=20
     /* TODO create and connect IDE devices for ide_drive_get() */
=20
-    highbank_binfo.ram_size =3D ram_size;
+    highbank_binfo.ram_size =3D machine->ram_size;
     /* highbank requires a dtb in order to boot, and the dtb will override
      * the board ID. The following value is ignored, so set it to -1 to be
      * clear that the value is meaningless.
@@ -430,6 +426,7 @@ static void highbank_class_init(ObjectClass *oc, void *=
data)
     mc->units_per_default_bus =3D 1;
     mc->max_cpus =3D 4;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "highbank.dram";
 }
=20
 static const TypeInfo highbank_type =3D {
@@ -448,6 +445,7 @@ static void midway_class_init(ObjectClass *oc, void *da=
ta)
     mc->units_per_default_bus =3D 1;
     mc->max_cpus =3D 4;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "highbank.dram";
 }
=20
 static const TypeInfo midway_type =3D {
--=20
2.7.4


