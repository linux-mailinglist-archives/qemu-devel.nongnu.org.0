Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC915164A90
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:36:54 +0100 (CET)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SLF-0003V9-K0
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwF-00049T-BY
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RwE-00014r-9w
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39604
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RwE-00014X-5X
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zRXquUspfaMKxjK/ZwxOgmeva/U7Ez41JClop5CoXQ=;
 b=FeLEAfRjJwzhBQORh7tr06FNgX5mg9YfhhC8A3sz2UfvHBV1S/DQ11t8nN9TSpJFpFObYs
 jx5y+zw1Szb6BHF1GEOeLg9/e3Z53u4QoCyyS5cLNb2Ky+6hjl0sCHoUbbcGZUYbHRoPVt
 INxIGyNFpx1+bnV315EhWPITXxp7a0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-42SX2uZIMlay9Xw4a-SrTg-1; Wed, 19 Feb 2020 11:11:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED9A101E44B
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:10:59 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E7CD48;
 Wed, 19 Feb 2020 16:10:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 53/79] mips/mips_jazz: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:27 -0500
Message-Id: <20200219160953.13771-54-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 42SX2uZIMlay9Xw4a-SrTg-1
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
---
 hw/mips/mips_jazz.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 66fd4d867d..85d49cf155 100644
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
     memory_region_init_ram(bios, NULL, "mips_jazz.bios", MAGNUM_BIOS_SIZE,
                            &error_fatal);
@@ -393,6 +390,7 @@ static void mips_magnum_class_init(ObjectClass *oc, voi=
d *data)
     mc->init =3D mips_magnum_init;
     mc->block_default_type =3D IF_SCSI;
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("R4000");
+    mc->default_ram_id =3D "mips_jazz.ram";
 }
=20
 static const TypeInfo mips_magnum_type =3D {
@@ -409,6 +407,7 @@ static void mips_pica61_class_init(ObjectClass *oc, voi=
d *data)
     mc->init =3D mips_pica61_init;
     mc->block_default_type =3D IF_SCSI;
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("R4000");
+    mc->default_ram_id =3D "mips_jazz.ram";
 }
=20
 static const TypeInfo mips_pica61_type =3D {
--=20
2.18.1


