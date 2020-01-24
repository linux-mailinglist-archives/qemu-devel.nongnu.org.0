Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF96148D1E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 18:42:13 +0100 (CET)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv2yC-0005KS-Gp
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 12:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iv2x3-0003fP-SJ
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iv2x2-0001ho-Qd
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:41:01 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:38470 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iv2x2-0001hH-JD
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 12:41:00 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A45811A2158;
 Fri, 24 Jan 2020 18:40:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 680641A2140;
 Fri, 24 Jan 2020 18:40:55 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] mips/mips_jazz: use memdev for RAM
Date: Fri, 24 Jan 2020 18:40:43 +0100
Message-Id: <1579887646-5949-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579887646-5949-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1579887646-5949-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <1579779525-20065-54-git-send-email-imammedo@redhat.com>
---
 hw/mips/mips_jazz.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 66fd4d8..85d49cf 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -159,7 +159,6 @@ static void mips_jazz_init(MachineState *machine,
     ISABus *isa_bus;
     ISADevice *pit;
     DriveInfo *fds[MAX_FD];
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios2 =3D g_new(MemoryRegion, 1);
     SysBusESPState *sysbus_esp;
@@ -191,9 +190,7 @@ static void mips_jazz_init(MachineState *machine,
     cc->do_transaction_failed =3D mips_jazz_do_transaction_failed;
=20
     /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "mips_jazz.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(address_space, 0, ram);
+    memory_region_add_subregion(address_space, 0, machine->ram);
=20
     memory_region_init_ram(bios, NULL, "mips_jazz.bios", MAGNUM_BIOS_SIZ=
E,
                            &error_fatal);
@@ -393,6 +390,7 @@ static void mips_magnum_class_init(ObjectClass *oc, v=
oid *data)
     mc->init =3D mips_magnum_init;
     mc->block_default_type =3D IF_SCSI;
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("R4000");
+    mc->default_ram_id =3D "mips_jazz.ram";
 }
=20
 static const TypeInfo mips_magnum_type =3D {
@@ -409,6 +407,7 @@ static void mips_pica61_class_init(ObjectClass *oc, v=
oid *data)
     mc->init =3D mips_pica61_init;
     mc->block_default_type =3D IF_SCSI;
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("R4000");
+    mc->default_ram_id =3D "mips_jazz.ram";
 }
=20
 static const TypeInfo mips_pica61_type =3D {
--=20
2.7.4


