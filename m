Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28D146753
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 12:56:32 +0100 (CET)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iub66-0005ZC-HZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 06:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuark-0005Ln-3M
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuari-00047f-UM
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44730
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuari-00047M-OH
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAyYPKkdkdprTIHFktTiJMfQe0dGnOl2at16/JTbpb0=;
 b=YgXgfuXv/y70eE+jMP7QP1eJ5ZLFmgMfWfc1w9bDpvwvA6TQembMoQydD82RkfJ17jy/Zj
 nOr6yKd71YMb6jjlGMox6TjhW6EE5EoJ+/IhlOrrMBkoiQLtGSBVZxGRQa4nOiFJsQNKt3
 eBxpmejbLoEGGv5xn14jTWPrn6fluOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-F-dPSeh9MHSlZf6hWzSTiA-1; Thu, 23 Jan 2020 06:41:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3608E107ACC4;
 Thu, 23 Jan 2020 11:41:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F297C100164D;
 Thu, 23 Jan 2020 11:41:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 15/80] arm/integratorcp: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:40 +0100
Message-Id: <1579779525-20065-16-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: F-dPSeh9MHSlZf6hWzSTiA-1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au
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
CC: drjones@redhat.com
CC: peter.chubb@nicta.com.au
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/integratorcp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 5249708..89c223b 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -585,7 +585,6 @@ static void integratorcp_init(MachineState *machine)
     Object *cpuobj;
     ARMCPU *cpu;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ram_alias =3D g_new(MemoryRegion, 1);
     qemu_irq pic[32];
     DeviceState *dev, *sic, *icp;
@@ -605,14 +604,13 @@ static void integratorcp_init(MachineState *machine)
=20
     cpu =3D ARM_CPU(cpuobj);
=20
-    memory_region_allocate_system_memory(ram, NULL, "integrator.ram",
-                                         ram_size);
     /* ??? On a real system the first 1Mb is mapped as SSRAM or boot flash=
.  */
     /* ??? RAM should repeat to fill physical memory space.  */
     /* SDRAM at address zero*/
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
     /* And again at address 0x80000000 */
-    memory_region_init_alias(ram_alias, NULL, "ram.alias", ram, 0, ram_siz=
e);
+    memory_region_init_alias(ram_alias, NULL, "ram.alias", machine->ram,
+                             0, ram_size);
     memory_region_add_subregion(address_space_mem, 0x80000000, ram_alias);
=20
     dev =3D qdev_create(NULL, TYPE_INTEGRATOR_CM);
@@ -660,6 +658,7 @@ static void integratorcp_machine_init(MachineClass *mc)
     mc->init =3D integratorcp_init;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
+    mc->default_ram_id =3D "integrator.ram";
 }
=20
 DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
--=20
2.7.4


