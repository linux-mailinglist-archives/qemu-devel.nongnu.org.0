Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505B1467E8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:26:25 +0100 (CET)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubZ1-0000zX-Mz
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatW-00082z-PU
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuatV-000536-Iu
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46126
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuatV-00052m-Ek
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6T9ruHRYCMRHKJtD/G2SkWBbK/VsMCOdXwuj6yehZQ=;
 b=RJ6/B0bkyw9ENKH6Pc3P5gvPxZRAHCi52bdFUxjdHIts37X25X5TOjjEIMWJ3H1cMw3M8d
 c3D8sFaXIstMgMX+qU0VRTQp2PM42+xTF8SvZhVA/S8XVPJE2qlzzKr0nhCq6tvuzfgXpw
 TZVXGzQ7CMkxsGdzpSCTgdzzg4zHqcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-2bFJEbT9NhyJnHctnjlJeA-1; Thu, 23 Jan 2020 06:43:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B6D4190D347;
 Thu, 23 Jan 2020 11:43:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3E410016E8;
 Thu, 23 Jan 2020 11:43:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 60/80] ppc/mac_oldworld: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:25 +0100
Message-Id: <1579779525-20065-61-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 2bFJEbT9NhyJnHctnjlJeA-1
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
Cc: qemu-ppc@nongnu.org, mark.cave-ayland@ilande.co.uk,
 david@gibson.dropbear.id.au
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
CC: mark.cave-ayland@ilande.co.uk
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
---
 hw/ppc/mac_oldworld.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 0fa680b..2be0602 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -91,7 +91,6 @@ static void ppc_heathrow_init(MachineState *machine)
     CPUPPCState *env =3D NULL;
     char *filename;
     int linux_boot, i;
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *bios =3D g_new(MemoryRegion, 1);
     uint32_t kernel_base, initrd_base, cmdline_base =3D 0;
     int32_t kernel_size, initrd_size;
@@ -127,9 +126,7 @@ static void ppc_heathrow_init(MachineState *machine)
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "ppc_heathrow.ram",
-                                         ram_size);
-    memory_region_add_subregion(sysmem, 0, ram);
+    memory_region_add_subregion(sysmem, 0, machine->ram);
=20
     /* allocate and load BIOS */
     memory_region_init_ram(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
@@ -446,6 +443,7 @@ static void heathrow_class_init(ObjectClass *oc, void *=
data)
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("750_v3.1");
     mc->default_display =3D "std";
     mc->ignore_boot_device_suffixes =3D true;
+    mc->default_ram_id =3D "ppc_heathrow.ram";
     fwc->get_dev_path =3D heathrow_fw_dev_path;
 }
=20
--=20
2.7.4


