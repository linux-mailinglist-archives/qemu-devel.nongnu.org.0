Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DCC1467DB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:23:46 +0100 (CET)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubWS-0005TX-VD
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatF-0007aU-Fn
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatE-0004uo-3g
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38388
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatD-0004ue-WE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGIITkb7D8G5xvTi1dy158LZCvjOPmhSPxsTKC64JOs=;
 b=T07tmMaFJMKVnUk9UWDZW7XcUSaH3CwAy25KRMI04kDat5CHfdcOMkoqV4Aw118Yc8DntM
 SyA8P+uiihsTMzi6yZ8tu2fQuMAZ/CB5mF46VN/yfQytKVzCGw3boC0gnV4JWS2F2GtpOx
 L3TUzv738BH023PvBIfvmZeckx7fCx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-IHImOq_VNEe43Yk8w4h02A-1; Thu, 23 Jan 2020 06:43:08 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40550DB2F;
 Thu, 23 Jan 2020 11:43:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89F0B100164D;
 Thu, 23 Jan 2020 11:43:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 46/80] lm32/milkymist: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:11 +0100
Message-Id: <1579779525-20065-47-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: IHImOq_VNEe43Yk8w4h02A-1
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
Cc: michael@walle.cc
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)
v3:
  * use size_to_str() to pretty print size in MiB
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

CC: michael@walle.cc
---
 hw/lm32/milkymist.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 460d322..22edb68 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -36,6 +36,7 @@
 #include "hw/display/milkymist_tmu2.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
+#include "qemu/cutils.h"
=20
 #define BIOS_FILENAME    "mmone-bios.bin"
 #define BIOS_OFFSET      0x00860000
@@ -82,6 +83,7 @@ static void main_cpu_reset(void *opaque)
 static void
 milkymist_init(MachineState *machine)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
@@ -90,22 +92,27 @@ milkymist_init(MachineState *machine)
     int kernel_size;
     DriveInfo *dinfo;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *phys_sdram =3D g_new(MemoryRegion, 1);
     qemu_irq irq[32];
     int i;
     char *bios_filename;
     ResetInfo *reset_info;
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     /* memory map */
     hwaddr flash_base   =3D 0x00000000;
     size_t flash_sector_size        =3D 128 * KiB;
     size_t flash_size               =3D 32 * MiB;
     hwaddr sdram_base   =3D 0x40000000;
-    size_t sdram_size               =3D 128 * MiB;
=20
     hwaddr initrd_base  =3D sdram_base + 0x1002000;
     hwaddr cmdline_base =3D sdram_base + 0x1000000;
-    size_t initrd_max =3D sdram_size - 0x1002000;
+    size_t initrd_max =3D machine->ram_size - 0x1002000;
=20
     reset_info =3D g_malloc0(sizeof(ResetInfo));
=20
@@ -116,9 +123,7 @@ milkymist_init(MachineState *machine)
=20
     cpu_lm32_set_phys_msb_ignore(env, 1);
=20
-    memory_region_allocate_system_memory(phys_sdram, NULL, "milkymist.sdra=
m",
-                                         sdram_size);
-    memory_region_add_subregion(address_space_mem, sdram_base, phys_sdram)=
;
+    memory_region_add_subregion(address_space_mem, sdram_base, machine->ra=
m);
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     /* Numonyx JS28F256J3F105 */
@@ -183,7 +188,7 @@ milkymist_init(MachineState *machine)
=20
         if (kernel_size < 0) {
             kernel_size =3D load_image_targphys(kernel_filename, sdram_bas=
e,
-                                              sdram_size);
+                                              machine->ram_size);
             reset_info->bootstrap_pc =3D sdram_base;
         }
=20
@@ -216,6 +221,8 @@ static void milkymist_machine_init(MachineClass *mc)
     mc->init =3D milkymist_init;
     mc->is_default =3D 0;
     mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
+    mc->default_ram_size =3D 128 * MiB;
+    mc->default_ram_id =3D "milkymist.sdram";
 }
=20
 DEFINE_MACHINE("milkymist", milkymist_machine_init)
--=20
2.7.4


