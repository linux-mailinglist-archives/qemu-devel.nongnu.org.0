Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095712D92F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:44:56 +0100 (CET)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHpO-0006yf-LM
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCX-0005rf-2G
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCS-0004IZ-IV
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCR-0004GE-Vx
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDNwLJ044g+O+8GeTRaa6og2q+g/2cxff7E/mWFvIGU=;
 b=DB6wOWC7P0ssFRyC4vylG4MRIHiGP9B/QUlowjeML+5ZqldHGTyovCFj546Nh9SBsvCAQU
 QqQqXTs6Vn8VJdUBYo4Bt5W/IQSSMpGvfKsuNbv2nOIDW49VTdECj21vIgd0OOxQ1oWnG0
 e8Mm0S1+Qd6BJIC4AbARx3u+yF1aElY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-odexrSEtP1awIlLN7cg4Ew-1; Tue, 31 Dec 2019 08:04:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAB4C107ACC4
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40D09620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 57/86] mips:mips_mipssim: use memdev for RAM
Date: Tue, 31 Dec 2019 14:03:41 +0100
Message-Id: <1577797450-88458-58-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: odexrSEtP1awIlLN7cg4Ew-1
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
 hw/mips/mips_mipssim.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 282bbec..be3972f 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -142,14 +142,12 @@ static void mipsnet_init(int base, qemu_irq irq, NICI=
nfo *nd)
 static void
 mips_mipssim_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
     char *filename;
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *isa =3D g_new(MemoryRegion, 1);
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios =3D g_new(MemoryRegion, 1);
     MIPSCPU *cpu;
     CPUMIPSState *env;
@@ -166,13 +164,11 @@ mips_mipssim_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, reset_info);
=20
     /* Allocate RAM. */
-    memory_region_allocate_system_memory(ram, NULL, "mips_mipssim.ram",
-                                         ram_size);
     memory_region_init_ram(bios, NULL, "mips_mipssim.bios", BIOS_SIZE,
                            &error_fatal);
     memory_region_set_readonly(bios, true);
=20
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     /* Map the BIOS / boot exception handler. */
     memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
@@ -199,7 +195,7 @@ mips_mipssim_init(MachineState *machine)
     }
=20
     if (kernel_filename) {
-        loaderparams.ram_size =3D ram_size;
+        loaderparams.ram_size =3D machine->ram_size;
         loaderparams.kernel_filename =3D kernel_filename;
         loaderparams.kernel_cmdline =3D kernel_cmdline;
         loaderparams.initrd_filename =3D initrd_filename;
@@ -237,6 +233,7 @@ static void mips_mipssim_machine_init(MachineClass *mc)
 #else
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
 #endif
+    mc->default_ram_id =3D "mips_mipssim.ram";
 }
=20
 DEFINE_MACHINE("mipssim", mips_mipssim_machine_init)
--=20
2.7.4


