Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA51467D9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:23:29 +0100 (CET)
Received: from localhost ([::1]:56096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubWB-00057n-Hz
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatE-0007Y3-3b
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatC-0004uM-Tt
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53842
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatC-0004u8-QE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQGphAKYlFne4I+9P4+J325qf+HsV/nJrS3YY9oV5Ik=;
 b=cLgwIMxtPjcm/KLcGxQa7El/aKGqvhGE0q2E9FJvIFNCz3N+Q7h1EGM5hny+Jbs7m5CK4/
 qqlgo8601oCWwoU+rhsqcJlti3EyK04TisZ0BqqRBMUhQ5UxTIV5gIiGkdX2+THr1fWyxi
 owEbHMYeoA3V7y8i8iproHnhnBpoElQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-BKZcemA8NcKjl9ZucX1geg-1; Thu, 23 Jan 2020 06:43:08 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15212190B2BB
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:43:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86707100164D
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:43:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 47/80] m68k/an5206: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:12 +0100
Message-Id: <1579779525-20065-48-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: BKZcemA8NcKjl9ZucX1geg-1
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
Acked-by: Thomas Huth <thuth@redhat.com>
---
 hw/m68k/an5206.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index 54ccbe1..69a8ffa 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -33,7 +33,6 @@ static void an5206_init(MachineState *machine)
     uint64_t elf_entry;
     hwaddr entry;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
     cpu =3D M68K_CPU(cpu_create(machine->cpu_type));
@@ -46,8 +45,7 @@ static void an5206_init(MachineState *machine)
     env->rambar0 =3D AN5206_RAMBAR_ADDR | 1;
=20
     /* DRAM at address zero */
-    memory_region_allocate_system_memory(ram, NULL, "an5206.ram", ram_size=
);
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     /* Internal SRAM.  */
     memory_region_init_ram(sram, NULL, "an5206.sram", 512, &error_fatal);
@@ -89,6 +87,7 @@ static void an5206_machine_init(MachineClass *mc)
     mc->desc =3D "Arnewsh 5206";
     mc->init =3D an5206_init;
     mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m5206");
+    mc->default_ram_id =3D "an5206.ram";
 }
=20
 DEFINE_MACHINE("an5206", an5206_machine_init)
--=20
2.7.4


