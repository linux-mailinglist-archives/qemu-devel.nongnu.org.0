Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BA1467E7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:26:15 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubYr-0000hn-Mo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatH-0007cx-51
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatF-0004vr-Px
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50348
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatF-0004vY-MU
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HW2hOlGHatT+KWCr9tF0l4lc+WU/7nCQ2rjNsVVusxs=;
 b=SIdrCzXEhTz5n6sb1HEu9IfIJUymCrAYIqqTEUeYjDs988Qyfcyc9r6xPgkxx+qZ5IRzB0
 rQ799aVnNNqfWr0DuaZCYQ3DCdNa4tPhE6XEDRpKQRAUrMPBB7K5bKGTrsGW78YYP3qL8V
 tNZBnuJo1SaggYgrAH5pI88nIYFR8PM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Yf3SQWI3My2qAT99hur8vw-1; Thu, 23 Jan 2020 06:43:12 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE9841800D48
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:43:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0AE100164D
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:43:10 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 50/80] mips/boston-cube: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:15 +0100
Message-Id: <1579779525-20065-51-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Yf3SQWI3My2qAT99hur8vw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/mips/boston.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 0df3a77..98ecd25 100644
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


