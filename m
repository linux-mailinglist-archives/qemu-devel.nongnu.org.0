Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859414F063
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 17:08:08 +0100 (CET)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYpz-00005P-4c
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 11:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXz3-0005ja-EV
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXz2-0006CU-8W
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36882
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXz2-0006AQ-3q
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpz++9MC9J/xw9EMwaLlmSSaNVzyVBQ/A8wZaBbbuvk=;
 b=Q+Itn0dJncZpf7C5kvkTM4HcUl4Y89mrxCSMcrGMzR/zT8NH117VTljTpdq308z+HqVbnJ
 ztjhq+MikfFV+6ug0Atzxzl4c+7IhlZxLlh8DC42PVTnEX6hLbaFhaYDH4rfbk+wSfsVRU
 YFE/ePTvT01rfMpig1nRmybh2FAgLq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-OFIoa3K0OGu_S_A4N6VDrQ-1; Fri, 31 Jan 2020 10:13:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B45818C43C2
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22F8986C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 60/80] ppc/mac_oldworld: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:30 +0100
Message-Id: <1580483390-131164-61-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OFIoa3K0OGu_S_A4N6VDrQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
 hw/ppc/mac_oldworld.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7318d7e..66e434b 100644
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


