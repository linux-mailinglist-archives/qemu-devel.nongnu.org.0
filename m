Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67C13C803
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:37:45 +0100 (CET)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkjo-000314-Ce
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKI-000855-Jh
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKH-0008OR-Bv
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29894
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKF-0008NR-Kj
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovi4L6r2hJG1Juwt0b2mvX98jB4EFXKWukA8YL8rU1I=;
 b=FfCeYKXBkg+GHywvFomDaWtyAwTJlcL8bvtCtzXeSyaDyyCVdezvmCaLWjoyRI+wy+kLHt
 AuYD4TjqebvGhgHd0izbU1KhllyBs+rzGgMTnFSrX0Qpb6fCeRCHSlzrqmhZmCAqVXggri
 o11tDJbzrPfmnf2y+qh43fyCp231oGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-ZtmZj0d2NyqwpKIziK3Vtw-1; Wed, 15 Jan 2020 10:11:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6F21098D1D;
 Wed, 15 Jan 2020 15:11:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF91196AE;
 Wed, 15 Jan 2020 15:11:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/86] arm:vexpress: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:47 +0100
Message-Id: <1579100861-73692-33-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ZtmZj0d2NyqwpKIziK3Vtw-1
X-Mimecast-Spam-Score: 0
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/vexpress.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 4673a88..ed683ee 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -273,7 +273,6 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
 {
     MachineState *machine =3D MACHINE(vms);
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *lowram =3D g_new(MemoryRegion, 1);
     ram_addr_t low_ram_size;
=20
@@ -283,8 +282,6 @@ static void a9_daughterboard_init(const VexpressMachine=
State *vms,
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
-                                         ram_size);
     low_ram_size =3D ram_size;
     if (low_ram_size > 0x4000000) {
         low_ram_size =3D 0x4000000;
@@ -293,9 +290,10 @@ static void a9_daughterboard_init(const VexpressMachin=
eState *vms,
      * address space should in theory be remappable to various
      * things including ROM or RAM; we always map the RAM there.
      */
-    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", ram, 0, low_=
ram_size);
+    memory_region_init_alias(lowram, NULL, "vexpress.lowmem", machine->ram=
,
+                             0, low_ram_size);
     memory_region_add_subregion(sysmem, 0x0, lowram);
-    memory_region_add_subregion(sysmem, 0x60000000, ram);
+    memory_region_add_subregion(sysmem, 0x60000000, machine->ram);
=20
     /* 0x1e000000 A9MPCore (SCU) private memory region */
     init_cpus(machine, cpu_type, TYPE_A9MPCORE_PRIV, 0x1e000000, pic,
@@ -360,7 +358,6 @@ static void a15_daughterboard_init(const VexpressMachin=
eState *vms,
 {
     MachineState *machine =3D MACHINE(vms);
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
     {
@@ -375,10 +372,8 @@ static void a15_daughterboard_init(const VexpressMachi=
neState *vms,
         }
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
-                                         ram_size);
     /* RAM is from 0x80000000 upwards; there is no low-memory alias for it=
. */
-    memory_region_add_subregion(sysmem, 0x80000000, ram);
+    memory_region_add_subregion(sysmem, 0x80000000, machine->ram);
=20
     /* 0x2c000000 A15MPCore private memory region (GIC) */
     init_cpus(machine, cpu_type, TYPE_A15MPCORE_PRIV,
@@ -795,6 +790,7 @@ static void vexpress_class_init(ObjectClass *oc, void *=
data)
     mc->init =3D vexpress_common_init;
     mc->max_cpus =3D 4;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "vexpress.highmem";
 }
=20
 static void vexpress_a9_class_init(ObjectClass *oc, void *data)
--=20
2.7.4


