Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9F14EF96
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:30:25 +0100 (CET)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYFT-0002Iq-W8
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyH-0004HJ-Az
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyG-0003za-5p
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:37 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26671
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyG-0003yn-21
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRRsPrJSiElldlw1MhgF6EPQ2Nbemnq6nIPy1neuJJ4=;
 b=hA64I3gDfQRS9AfU0BU3MKkRvOe4Gxf9PG4CwC15MhIKt3I3udjD8etr7voyE7KNWmU9so
 lAvsy0N6VfjJjAhcVwXDxzqmHF+xQXtqHYwTWAWUGaXTSWkNUOE7R61VIowVo292rHdzxh
 37U25uyECnxWZ2YA1yTXGeSHWTVuYuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Rj89Xz87O06-R589EWW4Sw-1; Fri, 31 Jan 2020 10:12:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55515107ACC4;
 Fri, 31 Jan 2020 15:12:30 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7776A8887E;
 Fri, 31 Jan 2020 15:12:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/80] arm/integratorcp: use memdev for RAM
Date: Fri, 31 Jan 2020 16:08:47 +0100
Message-Id: <1580483390-131164-18-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Rj89Xz87O06-R589EWW4Sw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: peter.chubb@nicta.com.au
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
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
CC: peter.chubb@nicta.com.au
---
 hw/arm/integratorcp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 0cd94d9..cc845b8 100644
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


