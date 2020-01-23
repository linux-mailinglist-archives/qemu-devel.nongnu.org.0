Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B81467F1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:29:12 +0100 (CET)
Received: from localhost ([::1]:56176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubbj-0004c4-3V
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatP-0007qj-DX
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatO-0004zF-9O
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27818
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatO-0004yi-5a
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHoKY9J5E8J/BPiPXiGZkiHQGBFuo4Aw55mWZXozIOM=;
 b=On+LK/QLR5a4sLwHi67oqH/ucNd8e4z5P6YwOtynXKlBQ7pqZrTbu74FG6Fy0kyJ1IFNjq
 fVnDS3Bsbp2Wcwdmtlr+MUaHt1YlQ+5riAwPJ0D/peIUCqrrJ359HmxWOlmoRdmhFnXC58
 2Y4uPrdZ4Y6H+89c27i1MgN4IYO1np0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-x9EhYaniNvK15cfvH9COxQ-1; Thu, 23 Jan 2020 06:43:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A71E190D35B;
 Thu, 23 Jan 2020 11:43:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 409ED10016E8;
 Thu, 23 Jan 2020 11:43:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 52/80] mips/mips_fulong2e: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:17 +0100
Message-Id: <1579779525-20065-53-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: x9EhYaniNvK15cfvH9COxQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: aleksandar.rikalo@rt-rk.com, philmd@redhat.com, aurelien@aurel32.net,
 amarkovic@wavecomp.com
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
CC: philmd@redhat.com
CC: amarkovic@wavecomp.com
CC: aurelien@aurel32.net
CC: aleksandar.rikalo@rt-rk.com
---
 hw/mips/mips_fulong2e.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index e4fba88..0a77af3 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -294,7 +294,6 @@ static void mips_fulong2e_init(MachineState *machine)
     const char *initrd_filename =3D machine->initrd_filename;
     char *filename;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios =3D g_new(MemoryRegion, 1);
     long bios_size;
     uint8_t *spd_data;
@@ -320,13 +319,11 @@ static void mips_fulong2e_init(MachineState *machine)
     }
=20
     /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram",
-                                         machine->ram_size);
     memory_region_init_ram(bios, NULL, "fulong2e.bios", BIOS_SIZE,
                            &error_fatal);
     memory_region_set_readonly(bios, true);
=20
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
     memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
=20
     /*
@@ -402,6 +399,7 @@ static void mips_fulong2e_machine_init(MachineClass *mc=
)
     mc->block_default_type =3D IF_IDE;
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-2E");
     mc->default_ram_size =3D 256 * MiB;
+    mc->default_ram_id =3D "fulong2e.ram";
 }
=20
 DEFINE_MACHINE("fulong2e", mips_fulong2e_machine_init)
--=20
2.7.4


