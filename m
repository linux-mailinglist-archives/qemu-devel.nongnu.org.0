Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC6161942
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 18:59:26 +0100 (CET)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3kg1-00079A-7t
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 12:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j3kJu-0003g3-U4
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j3kJt-0002ev-P1
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:36:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36074
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j3kJt-0002ef-Kw
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581960993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1bWrUj/KCwwnuvPpGGXlz+J/CysSxEzX45M5DJZmtI=;
 b=K2lrCawDiU2lf2p2eCsTSYwmm9p/qSC9UQARDS5BUVbRQHyU3kRVejobpCbtjRMn2PmlKc
 CEObm7M4qBbJrCQqWY5td0X7qf/yLWaDZXDgV+bKh/Z2cWfxF2aPHnYmtHVB+yDSIgWDJq
 mh6jrvcEpJDyvP0B9vdzOXzv/VXEsoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-36qQfUi7OOybrIldKBrcqw-1; Mon, 17 Feb 2020 12:36:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C67F2100EE01
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 17:36:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 212E990508;
 Mon, 17 Feb 2020 17:36:27 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 68/79] ppc/virtex_ml507: use memdev for RAM
Date: Mon, 17 Feb 2020 12:34:41 -0500
Message-Id: <20200217173452.15243-69-imammedo@redhat.com>
In-Reply-To: <20200217173452.15243-1-imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 36qQfUi7OOybrIldKBrcqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
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
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/virtex_ml507.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 91dd00ee91..b6f4507dcf 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -193,7 +193,6 @@ static int xilinx_load_device_tree(hwaddr addr,
=20
 static void virtex_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     hwaddr initrd_base =3D 0;
@@ -204,7 +203,6 @@ static void virtex_init(MachineState *machine)
     CPUPPCState *env;
     hwaddr ram_base =3D 0;
     DriveInfo *dinfo;
-    MemoryRegion *phys_ram =3D g_new(MemoryRegion, 1);
     qemu_irq irq[32], *cpu_irq;
     int kernel_size;
     int i;
@@ -221,8 +219,7 @@ static void virtex_init(MachineState *machine)
=20
     qemu_register_reset(main_cpu_reset, cpu);
=20
-    memory_region_allocate_system_memory(phys_ram, NULL, "ram", ram_size);
-    memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
+    memory_region_add_subregion(address_space_mem, ram_base, machine->ram)=
;
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     pflash_cfi01_register(PFLASH_BASEADDR, "virtex.flash", FLASH_SIZE,
@@ -265,7 +262,7 @@ static void virtex_init(MachineState *machine)
             /* If we failed loading ELF's try a raw image.  */
             kernel_size =3D load_image_targphys(kernel_filename,
                                               boot_offset,
-                                              ram_size);
+                                              machine->ram_size);
             boot_info.bootstrap_pc =3D boot_offset;
             high =3D boot_info.bootstrap_pc + kernel_size + 8192;
         }
@@ -276,7 +273,7 @@ static void virtex_init(MachineState *machine)
         if (machine->initrd_filename) {
             initrd_base =3D high =3D ROUND_UP(high, 4);
             initrd_size =3D load_image_targphys(machine->initrd_filename,
-                                              high, ram_size - high);
+                                              high, machine->ram_size - hi=
gh);
=20
             if (initrd_size < 0) {
                 error_report("couldn't load ram disk '%s'",
@@ -290,7 +287,7 @@ static void virtex_init(MachineState *machine)
         boot_info.fdt =3D high + (8192 * 2);
         boot_info.fdt &=3D ~8191;
=20
-        xilinx_load_device_tree(boot_info.fdt, ram_size,
+        xilinx_load_device_tree(boot_info.fdt, machine->ram_size,
                                 initrd_base, initrd_size,
                                 kernel_cmdline);
     }
@@ -302,6 +299,7 @@ static void virtex_machine_init(MachineClass *mc)
     mc->desc =3D "Xilinx Virtex ML507 reference design";
     mc->init =3D virtex_init;
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("440-xilinx");
+    mc->default_ram_id =3D "ram";
 }
=20
 DEFINE_MACHINE("virtex-ml507", virtex_machine_init)
--=20
2.18.1


