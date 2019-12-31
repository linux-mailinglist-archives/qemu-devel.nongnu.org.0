Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BBE12D90E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:34:25 +0100 (CET)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHfE-0000As-3m
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCS-0005pD-5N
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCO-0004D0-TZ
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:39 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59990
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCO-0004Ar-Mj
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZsBA2hvcoYROt3tWDIWCuQieyiS5NVMiy7DIHg/k2Y=;
 b=fjreu+UoH5RS4iV9qy1Q6LKa1gcVUwxfeQ6M3CsQx4qNXuQiIEFEZiN82gc0F50OpMz/XR
 JGCM0gqHqXTTDi78fvw69ibWMzcQvUorqwGloDI01AbcNR49Rllw6KCtnNqFrdmO00Rm5H
 VDieE+9r3xRCnDKGeWUlI13ePzfs9CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-FKpLwin6M5aa_VeNQjvtGQ-1; Tue, 31 Dec 2019 08:04:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0B0F477
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489DB620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 52/86] mips:boston-cube: use memdev for RAM
Date: Tue, 31 Dec 2019 14:03:36 +0100
Message-Id: <1577797450-88458-53-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: FKpLwin6M5aa_VeNQjvtGQ-1
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/mips/boston.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index ca7d813..466054e 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -427,7 +427,7 @@ static void boston_mach_init(MachineState *machine)
     DeviceState *dev;
     BostonState *s;
     Error *err =3D NULL;
-    MemoryRegion *flash, *ddr, *ddr_low_alias, *lcd, *platreg;
+    MemoryRegion *flash, *ddr_low_alias, *lcd, *platreg;
     MemoryRegion *sys_mem =3D get_system_memory();
     XilinxPCIEHost *pcie2;
     PCIDevice *ahci;
@@ -473,14 +473,12 @@ static void boston_mach_init(MachineState *machine)
     memory_region_init_rom(flash, NULL, "boston.flash", 128 * MiB, &err);
     memory_region_add_subregion_overlap(sys_mem, 0x18000000, flash, 0);
=20
-    ddr =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(ddr, NULL, "boston.ddr",
-                                         machine->ram_size);
-    memory_region_add_subregion_overlap(sys_mem, 0x80000000, ddr, 0);
+    memory_region_add_subregion_overlap(sys_mem, 0x80000000, machine->ram,=
 0);
=20
     ddr_low_alias =3D g_new(MemoryRegion, 1);
     memory_region_init_alias(ddr_low_alias, NULL, "boston_low.ddr",
-                             ddr, 0, MIN(machine->ram_size, (256 * MiB)));
+                             machine->ram, 0,
+                             MIN(machine->ram_size, (256 * MiB)));
     memory_region_add_subregion_overlap(sys_mem, 0, ddr_low_alias, 0);
=20
     xilinx_pcie_init(sys_mem, 0,
@@ -552,6 +550,7 @@ static void boston_mach_class_init(MachineClass *mc)
     mc->init =3D boston_mach_init;
     mc->block_default_type =3D IF_IDE;
     mc->default_ram_size =3D 1 * GiB;
+    mc->default_ram_id =3D "boston.ddr";
     mc->max_cpus =3D 16;
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("I6400");
 }
--=20
2.7.4


