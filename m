Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB4314F03A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:57:04 +0100 (CET)
Received: from localhost ([::1]:55168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYfH-0007xk-3E
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyt-0005Mr-7h
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXys-0005ZE-66
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXys-0005Yc-2D
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HW2hOlGHatT+KWCr9tF0l4lc+WU/7nCQ2rjNsVVusxs=;
 b=HH7n4ZYS8zslU8XXGS5/JLb9Soyh/HTBaOfdmSeu9q0aSwqwkCd6x+lnEtVHsyvA0KhewB
 4utVSNaTyUkfO5USvhLKCo6V0UiVH5v9nGblS4f+YGgypFOeVraWbukaYBwCAxxaKYSQwn
 AQfqoDu5jXIAkiV5v0petOl9bSwvbHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-CiRIqco3MtmwIb5cAKChtw-1; Fri, 31 Jan 2020 10:13:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B150C107ACCC
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37CC389E7A
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:10 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 50/80] mips/boston: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:20 +0100
Message-Id: <1580483390-131164-51-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: CiRIqco3MtmwIb5cAKChtw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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


