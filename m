Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31B1467AF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:14:19 +0100 (CET)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubNK-0002md-Ms
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasV-0006Of-4w
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasU-0004ZR-1G
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59275
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasT-0004Yz-UL
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hONHx6K9/w9SK1Gd2hE8dPAHj7cwlhqn5ur3r2kgxOw=;
 b=GpFa8CTXhJxPnGsATlc2MorHWVinLqA5lpIysCShxY82PnumuZ8N9GB/VTN8ao+OU79WvZ
 S6EC6lcymJRw+6qkw1LKB6JosQr1cmDubSFBdxv4LBbWSkFxNBE1vI3/HAb360BHG2IJ/g
 S0ssmBVT+7gDPs23L+lSWLoKPVH5AN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-zSVScAVmP1ORUOEfVUexug-1; Thu, 23 Jan 2020 06:42:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 213B2800D41;
 Thu, 23 Jan 2020 11:42:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 746721001DDE;
 Thu, 23 Jan 2020 11:42:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 38/80] cris/axis_dev88: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:03 +0100
Message-Id: <1579779525-20065-39-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: zSVScAVmP1ORUOEfVUexug-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: edgar.iglesias@gmail.com
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
CC: edgar.iglesias@gmail.com
---
 hw/cris/axis_dev88.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index be77604..cf6790f 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -249,7 +249,6 @@ static struct cris_load_info li;
 static
 void axisdev88_init(MachineState *machine)
 {
-    ram_addr_t ram_size =3D machine->ram_size;
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     CRISCPU *cpu;
@@ -261,16 +260,12 @@ void axisdev88_init(MachineState *machine)
     struct etraxfs_dma_client *dma_eth;
     int i;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *phys_ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *phys_intmem =3D g_new(MemoryRegion, 1);
=20
     /* init CPUs */
     cpu =3D CRIS_CPU(cpu_create(machine->cpu_type));
=20
-    /* allocate RAM */
-    memory_region_allocate_system_memory(phys_ram, NULL, "axisdev88.ram",
-                                         ram_size);
-    memory_region_add_subregion(address_space_mem, 0x40000000, phys_ram);
+    memory_region_add_subregion(address_space_mem, 0x40000000, machine->ra=
m);
=20
     /* The ETRAX-FS has 128Kb on chip ram, the docs refer to it as the=20
        internal memory.  */
@@ -351,6 +346,7 @@ static void axisdev88_machine_init(MachineClass *mc)
     mc->init =3D axisdev88_init;
     mc->is_default =3D 1;
     mc->default_cpu_type =3D CRIS_CPU_TYPE_NAME("crisv32");
+    mc->default_ram_id =3D "axisdev88.ram";
 }
=20
 DEFINE_MACHINE("axis-dev88", axisdev88_machine_init)
--=20
2.7.4


