Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F01467E6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:25:59 +0100 (CET)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubYb-0000ND-P4
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatQ-0007t2-RD
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatP-00050G-PK
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49354
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatP-000507-L7
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vlaI+NJqkKpJDj2h8l4U32ZK5Hv+WnO0QkVhHI/Z08E=;
 b=OdPL64rEOZcV8b9y1Y0HwzxZB2S6NQN42O67RFwe+2iKmPN5EOC3mDHhZwh1fvHzCxZ5aL
 zfVF9xosYtmNQZp+Tuu+dRgOW0HNWeO8liB8ynR76EQpeEPFHwf+Lp8RJ8YSIpRwLAiNK1
 RAw0AU5W67UAFYosMjNCzy8iyU2osIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-nKDpze0LObCnJq4h2sx0Gw-1; Thu, 23 Jan 2020 06:43:21 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA434100551D
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:43:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23CBC100164D
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:43:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 56/80] mips/mips_r4k: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:21 +0100
Message-Id: <1579779525-20065-57-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: nKDpze0LObCnJq4h2sx0Gw-1
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
---
 hw/mips/mips_r4k.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index fd926a3..69b6549 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -171,13 +171,11 @@ static const int sector_len =3D 32 * KiB;
 static
 void mips_r4k_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     const char *initrd_filename =3D machine->initrd_filename;
     char *filename;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios;
     MemoryRegion *iomem =3D g_new(MemoryRegion, 1);
     MemoryRegion *isa_io =3D g_new(MemoryRegion, 1);
@@ -203,14 +201,12 @@ void mips_r4k_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, reset_info);
=20
     /* allocate RAM */
-    if (ram_size > 256 * MiB) {
+    if (machine->ram_size > 256 * MiB) {
         error_report("Too much memory for this machine: %" PRId64 "MB,"
                      " maximum 256MB", ram_size / MiB);
         exit(1);
     }
-    memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_si=
ze);
-
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     memory_region_init_io(iomem, NULL, &mips_qemu_ops,
                           NULL, "mips-qemu", 0x10000);
@@ -261,7 +257,7 @@ void mips_r4k_init(MachineState *machine)
     g_free(filename);
=20
     if (kernel_filename) {
-        loaderparams.ram_size =3D ram_size;
+        loaderparams.ram_size =3D machine->ram_size;
         loaderparams.kernel_filename =3D kernel_filename;
         loaderparams.kernel_cmdline =3D kernel_cmdline;
         loaderparams.initrd_filename =3D initrd_filename;
@@ -316,7 +312,7 @@ static void mips_machine_init(MachineClass *mc)
 #else
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
 #endif
-
+    mc->default_ram_id =3D "mips_r4k.ram";
 }
=20
 DEFINE_MACHINE("mips", mips_machine_init)
--=20
2.7.4


