Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B714EF9A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:31:53 +0100 (CET)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYGv-0003kV-0R
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyy-0005ad-Fh
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyx-0005tn-5Y
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39355
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyx-0005rp-1c
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yjjaNlmMGk9JG33NCZabj3rZ7GdibEfWiRrzgV2n9U=;
 b=d5R9IxanKng+cYLYM5NXW16Mc7owfWYxX8UZHGVx7xrEBr2YyBPKZLDjZ//HSCrjeGGKlM
 hkORcUyd/C7duu1OTMR0+ZiohccSFmVrQxwyI16/a9eXnzwz0PM4QtRDoAhqi0AlcfterA
 oTdLgFBoELIkINlixzl/JMs7HePMSw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-ULq1g-NQP6CfzlZOH_8cUQ-1; Fri, 31 Jan 2020 10:13:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D46AC800D41
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C78386C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 54/80] mips/mips_malta: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:24 +0100
Message-Id: <1580483390-131164-55-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ULq1g-NQP6CfzlZOH_8cUQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/mips/mips_malta.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 34b76bb..6e7ba92 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1224,7 +1224,6 @@ void mips_malta_init(MachineState *machine)
     char *filename;
     PFlashCFI01 *fl;
     MemoryRegion *system_memory =3D get_system_memory();
-    MemoryRegion *ram_high =3D g_new(MemoryRegion, 1);
     MemoryRegion *ram_low_preio =3D g_new(MemoryRegion, 1);
     MemoryRegion *ram_low_postio;
     MemoryRegion *bios, *bios_copy =3D g_new(MemoryRegion, 1);
@@ -1262,13 +1261,11 @@ void mips_malta_init(MachineState *machine)
     }
=20
     /* register RAM at high address where it is undisturbed by IO */
-    memory_region_allocate_system_memory(ram_high, NULL, "mips_malta.ram",
-                                         ram_size);
-    memory_region_add_subregion(system_memory, 0x80000000, ram_high);
+    memory_region_add_subregion(system_memory, 0x80000000, machine->ram);
=20
     /* alias for pre IO hole access */
     memory_region_init_alias(ram_low_preio, NULL, "mips_malta_low_preio.ra=
m",
-                             ram_high, 0, MIN(ram_size, 256 * MiB));
+                             machine->ram, 0, MIN(ram_size, 256 * MiB));
     memory_region_add_subregion(system_memory, 0, ram_low_preio);
=20
     /* alias for post IO hole access, if there is enough RAM */
@@ -1276,7 +1273,7 @@ void mips_malta_init(MachineState *machine)
         ram_low_postio =3D g_new(MemoryRegion, 1);
         memory_region_init_alias(ram_low_postio, NULL,
                                  "mips_malta_low_postio.ram",
-                                 ram_high, 512 * MiB,
+                                 machine->ram, 512 * MiB,
                                  ram_size - 512 * MiB);
         memory_region_add_subregion(system_memory, 512 * MiB,
                                     ram_low_postio);
@@ -1448,6 +1445,7 @@ static void mips_malta_machine_init(MachineClass *mc)
 #else
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("24Kf");
 #endif
+    mc->default_ram_id =3D "mips_malta.ram";
 }
=20
 DEFINE_MACHINE("malta", mips_malta_machine_init)
--=20
2.7.4


