Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A976814F024
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:51:09 +0100 (CET)
Received: from localhost ([::1]:55066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYZY-00067o-MV
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXz8-0005x8-Bt
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXz7-0006Vm-2P
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXz6-0006UQ-Tr
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0S99OnGe29mD+CqXywghiPbmlPjMn8f+9/A1v2PuMY=;
 b=BSFDzCoRG9+ZXBmP7PtY4thKkrCP94oemfrYsVz33NWgSqCTWrcC6+tTs/iEbtjxsx1RoT
 gTkTBZwzBrnQNA3VWYcSELcMtnQChYgkSTMRd7jKrGffAZ/AtmofmqP3pdBKpoWdkFsv1H
 DbHwQ1XoE61lXQGboAgp2qKsr18X4/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-5OYtxqH1MpKLjA56pgWDKQ-1; Fri, 31 Jan 2020 10:13:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62B77477
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEBEB86C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 66/80] ppc/prep: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:36 +0100
Message-Id: <1580483390-131164-67-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5OYtxqH1MpKLjA56pgWDKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/prep.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 862345c..bf75dde 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -400,7 +400,6 @@ static int PPC_NVRAM_set_params (Nvram *nvram, uint16_t=
 NVRAM_size,
 /* PowerPC PREP hardware initialisation */
 static void ppc_prep_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
@@ -413,7 +412,6 @@ static void ppc_prep_init(MachineState *machine)
     MemoryRegion *xcsr =3D g_new(MemoryRegion, 1);
 #endif
     int linux_boot, i, nb_nics1;
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     uint32_t kernel_base, initrd_base;
     long kernel_size, initrd_size;
     DeviceState *dev;
@@ -444,15 +442,14 @@ static void ppc_prep_init(MachineState *machine)
         qemu_register_reset(ppc_prep_reset, cpu);
     }
=20
-    /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "ppc_prep.ram", ram_si=
ze);
-    memory_region_add_subregion(sysmem, 0, ram);
+    /* map RAM */
+    memory_region_add_subregion(sysmem, 0, machine->ram);
=20
     if (linux_boot) {
         kernel_base =3D KERNEL_LOAD_ADDR;
         /* now we can load the kernel */
         kernel_size =3D load_image_targphys(kernel_filename, kernel_base,
-                                          ram_size - kernel_base);
+                                          machine->ram_size - kernel_base)=
;
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
@@ -461,7 +458,7 @@ static void ppc_prep_init(MachineState *machine)
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
@@ -576,7 +573,7 @@ static void ppc_prep_init(MachineState *machine)
     sysctrl->nvram =3D m48t59;
=20
     /* Initialise NVRAM */
-    PPC_NVRAM_set_params(m48t59, NVRAM_SIZE, "PREP", ram_size,
+    PPC_NVRAM_set_params(m48t59, NVRAM_SIZE, "PREP", machine->ram_size,
                          ppc_boot_device,
                          kernel_base, kernel_size,
                          kernel_cmdline,
@@ -596,6 +593,7 @@ static void prep_machine_init(MachineClass *mc)
     mc->default_boot_order =3D "cad";
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("602");
     mc->default_display =3D "std";
+    mc->default_ram_id =3D "ppc_prep.ram";
 }
=20
 static int prep_set_cmos_checksum(DeviceState *dev, void *opaque)
@@ -814,6 +812,7 @@ static void ibm_40p_machine_init(MachineClass *mc)
     mc->init =3D ibm_40p_init;
     mc->max_cpus =3D 1;
     mc->default_ram_size =3D 128 * MiB;
+    mc->default_ram_id =3D "ppc_prep.ram";
     mc->block_default_type =3D IF_SCSI;
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("604");
--=20
2.7.4


