Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48312D92C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:42:34 +0100 (CET)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHn7-0003TI-5w
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCS-0005pG-4R
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCM-00048D-OY
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60722
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCL-00045T-0p
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrL8I1SkCsSDFF30iuDDx8C/6wBz5QBq+/mFshQ7As4=;
 b=eHtDv2lLHEF5eTN+xb9t8Pccse8cr6haPxmsYJAHRDoUj6ZKGJcQ/NZjlFls+MHrRd17i3
 dzdeLePR8U6CbexPUq6TD9GV4I7/YceV7Yx9Unl1/gnE0OQf68lpbdrnjIke7DAln4KKlw
 YBM8SMyBE1f0wVSMHiyR1jQDRJd9sVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-oVfP028pP12WOQa0u1ZnLA-1; Tue, 31 Dec 2019 08:04:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 944F41005502
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B48F620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:27 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 48/86] lm32:milkymist: use memdev for RAM
Date: Tue, 31 Dec 2019 14:03:32 +0100
Message-Id: <1577797450-88458-49-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: oVfP028pP12WOQa0u1ZnLA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
---
 hw/lm32/milkymist.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 460d322..cc9db7d 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -82,6 +82,7 @@ static void main_cpu_reset(void *opaque)
 static void
 milkymist_init(MachineState *machine)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
@@ -90,22 +91,26 @@ milkymist_init(MachineState *machine)
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
+        error_report("Invalid RAM size, should be %" PRIi64 " Bytes",
+                     mc->default_ram_size);
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
@@ -116,9 +121,7 @@ milkymist_init(MachineState *machine)
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
@@ -183,7 +186,7 @@ milkymist_init(MachineState *machine)
=20
         if (kernel_size < 0) {
             kernel_size =3D load_image_targphys(kernel_filename, sdram_bas=
e,
-                                              sdram_size);
+                                              machine->ram_size);
             reset_info->bootstrap_pc =3D sdram_base;
         }
=20
@@ -216,6 +219,8 @@ static void milkymist_machine_init(MachineClass *mc)
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


