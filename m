Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48514EF7F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:25:19 +0100 (CET)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYAX-0003ej-8I
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyM-0004Ol-Th
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyK-00046E-LD
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28049
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyJ-00044N-Hm
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIYyilFCoL6m5TGDVFNbHK8YbvAASy4w6a7B4ebDo+k=;
 b=S7ynfrKXiM7qcfMVSVx3PlZBaKPKJ0h3dNgzZbtrbxEFoWsI+zIa/KmTIuBpjYY8z7M8Br
 KvKkk6YcfMgFcwieAnfYz45ML2qw+CWfoTnM1A3VeJ0WmDgJrxXV2Q/eVgHdD0Grn5EOyR
 mTt9gOVS/Z+9r0BSbQ4wRqc8uNTNCi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-njva4qyeMUCVrrdNMEqz_A-1; Fri, 31 Jan 2020 10:12:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664BE18C43C0;
 Fri, 31 Jan 2020 15:12:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B928886C4B;
 Fri, 31 Jan 2020 15:12:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/80] arm/musicpal: use memdev for RAM
Date: Fri, 31 Jan 2020 16:08:54 +0100
Message-Id: <1580483390-131164-25-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: njva4qyeMUCVrrdNMEqz_A-1
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
Cc: jan.kiszka@web.de
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
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

CC: jan.kiszka@web.de
---
 hw/arm/musicpal.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index dc551bb..db8b03c 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -32,6 +32,7 @@
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
 #include "ui/pixel_ops.h"
+#include "qemu/cutils.h"
=20
 #define MP_MISC_BASE            0x80002000
 #define MP_MISC_SIZE            0x00001000
@@ -1589,16 +1590,21 @@ static void musicpal_init(MachineState *machine)
     int i;
     unsigned long flash_size;
     DriveInfo *dinfo;
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
+    /* For now we use a fixed - the original - RAM size */
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        char *sz =3D size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
+    }
+
     cpu =3D ARM_CPU(cpu_create(machine->cpu_type));
=20
-    /* For now we use a fixed - the original - RAM size */
-    memory_region_allocate_system_memory(ram, NULL, "musicpal.ram",
-                                         MP_RAM_DEFAULT_SIZE);
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     memory_region_init_ram(sram, NULL, "musicpal.sram", MP_SRAM_SIZE,
                            &error_fatal);
@@ -1714,6 +1720,8 @@ static void musicpal_machine_init(MachineClass *mc)
     mc->init =3D musicpal_init;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
+    mc->default_ram_size =3D MP_RAM_DEFAULT_SIZE;
+    mc->default_ram_id =3D "musicpal.ram";
 }
=20
 DEFINE_MACHINE("musicpal", musicpal_machine_init)
--=20
2.7.4


