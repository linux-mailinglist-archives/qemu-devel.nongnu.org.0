Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E338713C727
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:15:56 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkOh-00061P-T0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJg-00074K-Be
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJe-0007uV-V0
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51071
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJe-0007uF-Qf
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8awN4P0WwSqyx16McqXDdRI3eTQEN2sGsjcV2vZABQ=;
 b=VwKvBvPnbMJTD4qK6OzQqA+rl8HoFj75xQIqMwWboIcX/5ovosLNhmT8IE5uJTNXim71Z2
 q5jl24TkWy0GunmOQaaTGQOcYryXKyN8Amj0AIX6prcqNec0VnQoqAN++ialbLFDzjePXJ
 Ke9dy5e2kVdVWWpWXBVeDAjb8mzA70A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-JTy5XjZQP8u6R0aNOIUoeg-1; Wed, 15 Jan 2020 10:10:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DBB98DADC9
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:10:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B50262937A
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:10:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/86] alpha:dp264: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:21 +0100
Message-Id: <1579100861-73692-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: JTy5XjZQP8u6R0aNOIUoeg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/alpha/alpha_sys.h | 2 +-
 hw/alpha/dp264.c     | 3 ++-
 hw/alpha/typhoon.c   | 8 ++------
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index 95033d7..bc0a286 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -11,7 +11,7 @@
 #include "hw/intc/i8259.h"
=20
=20
-PCIBus *typhoon_init(ram_addr_t, ISABus **, qemu_irq *, AlphaCPU *[4],
+PCIBus *typhoon_init(MemoryRegion *, ISABus **, qemu_irq *, AlphaCPU *[4],
                      pci_map_irq_fn);
=20
 /* alpha_pci.c.  */
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f2026fd..29439c7 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -75,7 +75,7 @@ static void clipper_init(MachineState *machine)
     cpus[0]->env.trap_arg2 =3D smp_cpus;
=20
     /* Init the chipset.  */
-    pci_bus =3D typhoon_init(ram_size, &isa_bus, &rtc_irq, cpus,
+    pci_bus =3D typhoon_init(machine->ram, &isa_bus, &rtc_irq, cpus,
                            clipper_pci_map_irq);
=20
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
@@ -183,6 +183,7 @@ static void clipper_machine_init(MachineClass *mc)
     mc->max_cpus =3D 4;
     mc->is_default =3D 1;
     mc->default_cpu_type =3D ALPHA_CPU_TYPE_NAME("ev67");
+    mc->default_ram_id =3D "ram";
 }
=20
 DEFINE_MACHINE("clipper", clipper_machine_init)
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 179e1f7..1795e2f 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -58,7 +58,6 @@ typedef struct TyphoonState {
     TyphoonCchip cchip;
     TyphoonPchip pchip;
     MemoryRegion dchip_region;
-    MemoryRegion ram_region;
 } TyphoonState;
=20
 /* Called when one of DRIR or DIM changes.  */
@@ -817,8 +816,7 @@ static void typhoon_alarm_timer(void *opaque)
     cpu_interrupt(CPU(s->cchip.cpu[cpu]), CPU_INTERRUPT_TIMER);
 }
=20
-PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
-                     qemu_irq *p_rtc_irq,
+PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_=
irq,
                      AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq)
 {
     MemoryRegion *addr_space =3D get_system_memory();
@@ -851,9 +849,7 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_=
bus,
=20
     /* Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
        but the address space hole reserved at this point is 8TB.  */
-    memory_region_allocate_system_memory(&s->ram_region, OBJECT(s), "ram",
-                                         ram_size);
-    memory_region_add_subregion(addr_space, 0, &s->ram_region);
+    memory_region_add_subregion(addr_space, 0, ram);
=20
     /* TIGbus, 0x801.0000.0000, 1GB.  */
     /* ??? The TIGbus is used for delivering interrupts, and access to
--=20
2.7.4


