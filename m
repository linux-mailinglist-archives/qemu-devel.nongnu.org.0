Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DF14680D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:32:39 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubf4-0008Tx-Em
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatd-0008EF-J1
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatb-000571-Us
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30475
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatb-00056l-RZ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+76V2msg3tzlGOCpR51XbXwexlhar+iqxL1JYUG8cw8=;
 b=MbIZRWwWMtgpqF/XbCa2zDrTK7pdmWfKQbs51jxF5ZKMeQjNVEvg8Jo9pB8aWGxABy+LxS
 t5B6ZzJ/7p/6/hFE1StcI8FLKDK/lUEhVbHc/3ZH1e4KkhTpWxZvhZReUMLU3TPRMzn0EZ
 GmgZXmFhSA8R0TBt+Tp0ZlKZ6RIivRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-VJwCMGZdNSOqu2QXXv8grw-1; Thu, 23 Jan 2020 06:43:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA5B98045CD;
 Thu, 23 Jan 2020 11:43:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCA9E100164D;
 Thu, 23 Jan 2020 11:43:27 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 62/80] ppc/ppc405_boards: add RAM size checks
Date: Thu, 23 Jan 2020 12:38:27 +0100
Message-Id: <1579779525-20065-63-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: VJwCMGZdNSOqu2QXXv8grw-1
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If user provided non-sense RAM size, board will ignore it
and continue running with fixed RAM size.

Also RAM is going to be allocated by generic code, so it
won't be possible for board to fix CLI.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

PS:
move fixed RAM size into mc->default_ram_size, so that
generic code will know how much to allocate.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)
v3:
  * use size_to_str() to pretty print size in MiB
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>/
     BALATON Zoltan <balaton@eik.bme.hu>)

CC: david@gibson.dropbear.id.au
CC: balaton@eik.bme.hu
CC: qemu-ppc@nongnu.org
---
 hw/ppc/ppc405_boards.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 1f721fe..057882a 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -40,6 +40,7 @@
 #include "qemu/error-report.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
+#include "qemu/cutils.h"
=20
 #define BIOS_FILENAME "ppc405_rom.bin"
 #define BIOS_SIZE (2 * MiB)
@@ -137,7 +138,7 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, ui=
nt32_t base)
=20
 static void ref405ep_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
@@ -161,15 +162,21 @@ static void ref405ep_init(MachineState *machine)
     DriveInfo *dinfo;
     MemoryRegion *sysmem =3D get_system_memory();
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     /* XXX: fix this */
     memory_region_allocate_system_memory(&ram_memories[0], NULL, "ef405ep.=
ram",
-                                         0x08000000);
+                                         machine->ram_size);
     ram_bases[0] =3D 0;
-    ram_sizes[0] =3D 0x08000000;
+    ram_sizes[0] =3D machine->ram_size;
     memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
     ram_bases[1] =3D 0x00000000;
     ram_sizes[1] =3D 0x00000000;
-    ram_size =3D 128 * MiB;
     env =3D ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &pic, kernel_filename =3D=3D NULL ? 0 : =
1);
     /* allocate SRAM */
@@ -227,7 +234,7 @@ static void ref405ep_init(MachineState *machine)
     if (linux_boot) {
         memset(&bd, 0, sizeof(bd));
         bd.bi_memstart =3D 0x00000000;
-        bd.bi_memsize =3D ram_size;
+        bd.bi_memsize =3D machine->ram_size;
         bd.bi_flashstart =3D -bios_size;
         bd.bi_flashsize =3D -bios_size;
         bd.bi_flashoffset =3D 0;
@@ -255,7 +262,7 @@ static void ref405ep_init(MachineState *machine)
         kernel_base =3D KERNEL_LOAD_ADDR;
         /* now we can load the kernel */
         kernel_size =3D load_image_targphys(kernel_filename, kernel_base,
-                                          ram_size - kernel_base);
+                                          machine->ram_size - kernel_base)=
;
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
@@ -266,7 +273,7 @@ static void ref405ep_init(MachineState *machine)
         if (initrd_filename) {
             initrd_base =3D INITRD_LOAD_ADDR;
             initrd_size =3D load_image_targphys(initrd_filename, initrd_ba=
se,
-                                              ram_size - initrd_base);
+                                              machine->ram_size - initrd_b=
ase);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
                              initrd_filename);
@@ -304,6 +311,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *=
data)
=20
     mc->desc =3D "ref405ep";
     mc->init =3D ref405ep_init;
+    mc->default_ram_size =3D 0x08000000;
 }
=20
 static const TypeInfo ref405ep_type =3D {
@@ -408,7 +416,7 @@ static void taihu_cpld_init(MemoryRegion *sysmem, uint3=
2_t base)
=20
 static void taihu_405ep_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const char *kernel_filename =3D machine->kernel_filename;
     const char *initrd_filename =3D machine->initrd_filename;
     char *filename;
@@ -425,10 +433,14 @@ static void taihu_405ep_init(MachineState *machine)
     int fl_idx;
     DriveInfo *dinfo;
=20
-    /* RAM is soldered to the board so the size cannot be changed */
-    ram_size =3D 0x08000000;
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
     memory_region_allocate_system_memory(ram, NULL, "taihu_405ep.ram",
-                                         ram_size);
+                                         machine->ram_size);
=20
     ram_bases[0] =3D 0;
     ram_sizes[0] =3D 0x04000000;
@@ -500,7 +512,7 @@ static void taihu_405ep_init(MachineState *machine)
         kernel_base =3D KERNEL_LOAD_ADDR;
         /* now we can load the kernel */
         kernel_size =3D load_image_targphys(kernel_filename, kernel_base,
-                                          ram_size - kernel_base);
+                                          machine->ram_size - kernel_base)=
;
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
@@ -509,7 +521,7 @@ static void taihu_405ep_init(MachineState *machine)
         if (initrd_filename) {
             initrd_base =3D INITRD_LOAD_ADDR;
             initrd_size =3D load_image_targphys(initrd_filename, initrd_ba=
se,
-                                              ram_size - initrd_base);
+                                              machine->ram_size - initrd_b=
ase);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
                              initrd_filename);
@@ -533,6 +545,7 @@ static void taihu_class_init(ObjectClass *oc, void *dat=
a)
=20
     mc->desc =3D "taihu";
     mc->init =3D taihu_405ep_init;
+    mc->default_ram_size =3D 0x08000000;
 }
=20
 static const TypeInfo taihu_type =3D {
--=20
2.7.4


