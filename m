Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4A14EF86
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:26:09 +0100 (CET)
Received: from localhost ([::1]:54696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYBM-0004xc-9M
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyg-00054y-9a
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXye-00052w-UL
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26784
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXye-00051n-PE
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U4gb2Xo410r3o0B2sU80dG/y/4utoJAV5xJrNbXhE0=;
 b=cZ+tFE+kHV16eeG4YTPTuA7RdpuUDpOBOT+bA24AKO89dZEfNofMnQMLd/nerrCy1pNR58
 V619RMfzaVtYLR+SOvoWZvwDOGsAQGl7Y8oIwXmNFuoXvoyxWdJL9oZuPJm2eb3C5oANsY
 pMkNkKbmV2W5MSsZ91JWktvD7UdFAB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-uv8aIJoXMuer5IVYpLWulA-1; Fri, 31 Jan 2020 10:12:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD4D100550E;
 Fri, 31 Jan 2020 15:12:54 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EBF686C4B;
 Fri, 31 Jan 2020 15:12:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/80] hppa: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:11 +0100
Message-Id: <1580483390-131164-42-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: uv8aIJoXMuer5IVYpLWulA-1
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
Cc: deller@gmx.de, rth@twiddle.net
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
CC: rth@twiddle.net
CC: deller@gmx.de
---
 hw/hppa/machine.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index d8755ec..67181e7 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -71,14 +71,11 @@ static void machine_hppa_init(MachineState *machine)
     uint64_t kernel_entry =3D 0, kernel_low, kernel_high;
     MemoryRegion *addr_space =3D get_system_memory();
     MemoryRegion *rom_region;
-    MemoryRegion *ram_region;
     MemoryRegion *cpu_region;
     long i;
     unsigned int smp_cpus =3D machine->smp.cpus;
     SysBusDevice *s;
=20
-    ram_size =3D machine->ram_size;
-
     /* Create CPUs.  */
     for (i =3D 0; i < smp_cpus; i++) {
         char *name =3D g_strdup_printf("cpu%ld-io-eir", i);
@@ -97,10 +94,8 @@ static void machine_hppa_init(MachineState *machine)
         error_report("RAM size is currently restricted to 3GB");
         exit(EXIT_FAILURE);
     }
-    ram_region =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(ram_region, OBJECT(machine),
-                                         "ram", ram_size);
-    memory_region_add_subregion_overlap(addr_space, 0, ram_region, -1);
+    memory_region_add_subregion_overlap(addr_space, 0, machine->ram, -1);
+
=20
     /* Init Lasi chip */
     lasi_init(addr_space);
@@ -298,6 +293,7 @@ static void machine_hppa_machine_init(MachineClass *mc)
     mc->is_default =3D 1;
     mc->default_ram_size =3D 512 * MiB;
     mc->default_boot_order =3D "cd";
+    mc->default_ram_id =3D "ram";
 }
=20
 DEFINE_MACHINE("hppa", machine_hppa_machine_init)
--=20
2.7.4


