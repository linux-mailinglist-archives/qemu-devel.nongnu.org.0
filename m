Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61981467D0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:21:07 +0100 (CET)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubTu-0001ww-5Q
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatB-0007TV-Ae
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatA-0004tZ-54
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32577
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatA-0004tN-1E
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upnn6TZ2z+RGb5mRcWQbvzFreS/ItZVM5qv6MZwdjto=;
 b=SoChIcCH780dZL4eOw+pjpnVGYcx8DB45SVwhxVVTR0MzhKGP54rR1YjsOJgmbqFY4COIW
 Yo2SAaShx6YRNK3JpA9AdwHGk/xrhtxL+ruKV8xHRBVKHT4JAjMic3i3ynd/LvIFtIX97K
 veG+DkWm6gDKvaCSgchGEKo53kKptX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-No-b_eTEOGC0FEb_MkxDCA-1; Thu, 23 Jan 2020 06:43:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE4ACF98B;
 Thu, 23 Jan 2020 11:43:04 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8793E100032E;
 Thu, 23 Jan 2020 11:42:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 44/80] x86/pc: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:09 +0100
Message-Id: <1579779525-20065-45-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: No-b_eTEOGC0FEb_MkxDCA-1
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
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com, mst@redhat.com
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
CC: mst@redhat.com
CC: pbonzini@redhat.com
CC: rth@twiddle.net
CC: ehabkost@redhat.com
---
 hw/i386/pc.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8054bc4..21b8290 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -935,7 +935,7 @@ void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion **ram_memory)
 {
     int linux_boot, i;
-    MemoryRegion *ram, *option_rom_mr;
+    MemoryRegion *option_rom_mr;
     MemoryRegion *ram_below_4g, *ram_above_4g;
     FWCfgState *fw_cfg;
     MachineState *machine =3D MACHINE(pcms);
@@ -948,22 +948,20 @@ void pc_memory_init(PCMachineState *pcms,
=20
     linux_boot =3D (machine->kernel_filename !=3D NULL);
=20
-    /* Allocate RAM.  We allocate it as a single memory region and use
-     * aliases to address portions of it, mostly for backwards compatibili=
ty
-     * with older qemus that used qemu_ram_alloc().
+    /*
+     * Split single memory region and use aliases to address portions of i=
t,
+     * done for backwards compatibility with older qemus.
      */
-    ram =3D g_malloc(sizeof(*ram));
-    memory_region_allocate_system_memory(ram, NULL, "pc.ram",
-                                         machine->ram_size);
-    *ram_memory =3D ram;
+    *ram_memory =3D machine->ram;
     ram_below_4g =3D g_malloc(sizeof(*ram_below_4g));
-    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
+    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->=
ram,
                              0, x86ms->below_4g_mem_size);
     memory_region_add_subregion(system_memory, 0, ram_below_4g);
     e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
     if (x86ms->above_4g_mem_size > 0) {
         ram_above_4g =3D g_malloc(sizeof(*ram_above_4g));
-        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", ram,
+        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
+                                 machine->ram,
                                  x86ms->below_4g_mem_size,
                                  x86ms->above_4g_mem_size);
         memory_region_add_subregion(system_memory, 0x100000000ULL,
@@ -1950,6 +1948,7 @@ static void pc_machine_class_init(ObjectClass *oc, vo=
id *data)
     mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported =3D true;
     mc->numa_mem_supported =3D true;
+    mc->default_ram_id =3D "pc.ram";
=20
     object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
         pc_machine_get_device_memory_region_size, NULL,
--=20
2.7.4


