Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F614EFFA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:44:48 +0100 (CET)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYTP-0004tx-6f
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyj-0005CU-Ey
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyi-0005E5-9O
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46391
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyi-0005Cd-5Z
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtBrTPGkzliaCu4r5KKwM7eAW8m/oe4We31lrN0pMkM=;
 b=beGaY8iIhlcyvkqkn39X6GNS8lktmM+nOuVONBm36ENatdvzMKfzRz46XIVu0uab1XmaTz
 FRYTo3BDeQ0aIiMm+M71Mnxmu3Bb/ZUsW6vo30iFRbKn+QLvd+FIcH1dEKGMVmvIEOkP/l
 dEjclmS0X9ULoq3m3A7Yw/67uSnFfJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-c05CiNzaPVqU0VeT8cwZrQ-1; Fri, 31 Jan 2020 10:13:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8216618C43C1;
 Fri, 31 Jan 2020 15:13:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7573686C4B;
 Fri, 31 Jan 2020 15:12:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 42/80] x86/microvm: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:12 +0100
Message-Id: <1580483390-131164-43-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: c05CiNzaPVqU0VeT8cwZrQ-1
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
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com, slp@redhat.com,
 mst@redhat.com
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
CC: slp@redhat.com
CC: pbonzini@redhat.com
CC: mst@redhat.com
CC: rth@twiddle.net
CC: ehabkost@redhat.com
---
 hw/i386/microvm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index d234851..38d8e51 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -167,7 +167,7 @@ static void microvm_memory_init(MicrovmMachineState *mm=
s)
 {
     MachineState *machine =3D MACHINE(mms);
     X86MachineState *x86ms =3D X86_MACHINE(mms);
-    MemoryRegion *ram, *ram_below_4g, *ram_above_4g;
+    MemoryRegion *ram_below_4g, *ram_above_4g;
     MemoryRegion *system_memory =3D get_system_memory();
     FWCfgState *fw_cfg;
     ram_addr_t lowmem;
@@ -214,12 +214,8 @@ static void microvm_memory_init(MicrovmMachineState *m=
ms)
         x86ms->below_4g_mem_size =3D machine->ram_size;
     }
=20
-    ram =3D g_malloc(sizeof(*ram));
-    memory_region_allocate_system_memory(ram, NULL, "microvm.ram",
-                                         machine->ram_size);
-
     ram_below_4g =3D g_malloc(sizeof(*ram_below_4g));
-    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
+    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->=
ram,
                              0, x86ms->below_4g_mem_size);
     memory_region_add_subregion(system_memory, 0, ram_below_4g);
=20
@@ -227,7 +223,8 @@ static void microvm_memory_init(MicrovmMachineState *mm=
s)
=20
     if (x86ms->above_4g_mem_size > 0) {
         ram_above_4g =3D g_malloc(sizeof(*ram_above_4g));
-        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", ram,
+        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
+                                 machine->ram,
                                  x86ms->below_4g_mem_size,
                                  x86ms->above_4g_mem_size);
         memory_region_add_subregion(system_memory, 0x100000000ULL,
@@ -502,6 +499,7 @@ static void microvm_class_init(ObjectClass *oc, void *d=
ata)
     mc->auto_enable_numa_with_memhp =3D false;
     mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported =3D false;
+    mc->default_ram_id =3D "microvm.ram";
=20
     /* Avoid relying too much on kernel components */
     mc->default_kernel_irqchip_split =3D true;
--=20
2.7.4


