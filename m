Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3643613C757
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:22:17 +0100 (CET)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkUp-0005hU-Ly
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJs-0007QH-5e
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJq-00081G-Vr
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:56 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59081
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJq-000810-Sx
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJqtx+lOHfB/bjYlcvw7jxeHLwVYdX0zbsYDihnMQ1E=;
 b=O9qNa1mqc+9chGNWYKTR5zNY2weX6/tSvq0J3sZsjkie2ETL6h0k2uplddRAHSAXL8MTPq
 QD/1v6mIS8oVItiiHcjgN3mVxhMURKINfpq10hmVhXetxmIahfc8jj7842N78aSPeNe2eg
 oZSjpbP1ljr6WFbeNOWAujfNXJqb+C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-DPT58MZAP0WSibA2p0zluQ-1; Wed, 15 Jan 2020 10:10:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64BDD10A8DE7;
 Wed, 15 Jan 2020 15:10:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 304DC289A8;
 Wed, 15 Jan 2020 15:10:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/86] arm:collie: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:26 +0100
Message-Id: <1579100861-73692-12-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: DPT58MZAP0WSibA2p0zluQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 - while at it add check for user supplied RAM size and error
   out if it mismatches board expected value.
 - introduce RAM_ADDR_UFMT to avoid build errors on 32-bit hosts
   when specifying format string for ram_addr_t type

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  * fix format string causing build failure on 32-bit host
    (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 include/exec/cpu-common.h |  2 ++
 hw/arm/collie.c           | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 81753bb..0ea4886 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -33,10 +33,12 @@ enum device_endian {
 typedef uint64_t ram_addr_t;
 #  define RAM_ADDR_MAX UINT64_MAX
 #  define RAM_ADDR_FMT "%" PRIx64
+#  define RAM_ADDR_UFMT "%" PRIu64
 #else
 typedef uintptr_t ram_addr_t;
 #  define RAM_ADDR_MAX UINTPTR_MAX
 #  define RAM_ADDR_FMT "%" PRIxPTR
+#  define RAM_ADDR_UFMT "%" PRIuPTR
 #endif
=20
 extern ram_addr_t ram_size;
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 970a440..176cf09 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -20,20 +20,23 @@
=20
 static struct arm_boot_info collie_binfo =3D {
     .loader_start =3D SA_SDCS0,
-    .ram_size =3D 0x20000000,
 };
=20
 static void collie_init(MachineState *machine)
 {
     StrongARMState *s;
     DriveInfo *dinfo;
-    MemoryRegion *sdram =3D g_new(MemoryRegion, 1);
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
+
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        error_report("Invalid RAM size, should be " RAM_ADDR_UFMT " Bytes"=
,
+                     mc->default_ram_size);
+        exit(EXIT_FAILURE);
+    }
=20
     s =3D sa1110_init(machine->cpu_type);
=20
-    memory_region_allocate_system_memory(sdram, NULL, "strongarm.sdram",
-                                         collie_binfo.ram_size);
-    memory_region_add_subregion(get_system_memory(), SA_SDCS0, sdram);
+    memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ra=
m);
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
@@ -57,6 +60,8 @@ static void collie_machine_init(MachineClass *mc)
     mc->init =3D collie_init;
     mc->ignore_memory_transaction_failures =3D true;
     mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("sa1110");
+    mc->default_ram_size =3D 0x20000000;
+    mc->default_ram_id =3D "strongarm.sdram";
 }
=20
 DEFINE_MACHINE("collie", collie_machine_init)
--=20
2.7.4


