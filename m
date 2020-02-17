Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1816192C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 18:53:03 +0100 (CET)
Received: from localhost ([::1]:49641 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3kZq-0001DM-5P
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 12:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j3kJJ-0002L2-Hp
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j3kJE-0002CY-Sc
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55922
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j3kJE-0002CJ-Nd
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581960952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOoRqXxjeiKVKYqG0clNdTCyG8bZDSCIzwlXeYSDidc=;
 b=NGuS8Xdbstn1wsB2IXOEEx8vKVdvpDC6WFNkaj36zl7pulJWRE+bTBKnB7nY3iNzIo7Roj
 AzXGrt1pOdBbKl2ltvtua1ssRLY95o8m06t9Clb7HDEA/WeSYxr4IM9yTmUrQgnHQEVVyx
 /fl5g52AbmVqVsQmHNaHr2UGmIoSOgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-9674rs5ZO-qlUtyC7sT2rw-1; Mon, 17 Feb 2020 12:35:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3C7800D6C
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 17:35:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7731A90508;
 Mon, 17 Feb 2020 17:35:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 35/79] arm/xilinx_zynq: use memdev for RAM
Date: Mon, 17 Feb 2020 12:34:08 -0500
Message-Id: <20200217173452.15243-36-imammedo@redhat.com>
In-Reply-To: <20200217173452.15243-1-imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 9674rs5ZO-qlUtyC7sT2rw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/arm/xilinx_zynq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index df950fc400..0ef9688c5a 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -160,7 +160,6 @@ static void zynq_init(MachineState *machine)
 {
     ARMCPU *cpu;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ext_ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *ocm_ram =3D g_new(MemoryRegion, 1);
     DeviceState *dev;
     SysBusDevice *busdev;
@@ -190,9 +189,7 @@ static void zynq_init(MachineState *machine)
     object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);
=20
     /* DDR remapped to address zero.  */
-    memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(address_space_mem, 0, ext_ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     /* 256K of on-chip memory */
     memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
@@ -318,6 +315,7 @@ static void zynq_machine_init(MachineClass *mc)
     mc->no_sdcard =3D 1;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->default_ram_id =3D "zynq.ext_ram";
 }
=20
 DEFINE_MACHINE("xilinx-zynq-a9", zynq_machine_init)
--=20
2.18.1


