Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9314F01C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:49:35 +0100 (CET)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYY2-0003Y3-Ie
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyt-0005Nw-LC
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXys-0005Zj-FX
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55302
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyr-0005V2-C8
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEZKSZZWhyv4YHvEIiiO69yAzU4fD9AsJDitY/5+rtM=;
 b=BGyJamGA4cccPuShC/u/CI5GrHu1eMCtQb6sZ1jk9iIhCW3X6+2QuNavBxTZxPWiTGgm0n
 tkIbB66Rh2LjXxmgh9Ys4fj+9HDZKKvY+Azu9mWbuGtFbZ4ro66amJUqb7C6znXQ++8u3d
 i2WE32PjPOc8XF6drqgN097XdxG04LI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-pzoQb7VuOY6oNhn4bepVVg-1; Fri, 31 Jan 2020 10:13:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53E91801E7B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE7DF86C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 47/80] m68k/q800: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:17 +0100
Message-Id: <1580483390-131164-48-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: pzoQb7VuOY6oNhn4bepVVg-1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to using generic main RAM allocation. To do this set
MachineClass::default_ram_id to m68k_mac.ram and use
MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1e32363..a4c4bc1 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -160,7 +160,6 @@ static void q800_init(MachineState *machine)
     ram_addr_t initrd_base;
     int32_t initrd_size;
     MemoryRegion *rom;
-    MemoryRegion *ram;
     MemoryRegion *io;
     const int io_slice_nb =3D (IO_SIZE / IO_SLICE) - 1;
     int i;
@@ -194,9 +193,7 @@ static void q800_init(MachineState *machine)
     qemu_register_reset(main_cpu_reset, cpu);
=20
     /* RAM */
-    ram =3D g_malloc(sizeof(*ram));
-    memory_region_init_ram(ram, NULL, "m68k_mac.ram", ram_size, &error_abo=
rt);
-    memory_region_add_subregion(get_system_memory(), 0, ram);
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
=20
     /*
      * Memory from IO_BASE to IO_BASE + IO_SLICE is repeated
@@ -443,6 +440,7 @@ static void q800_machine_class_init(ObjectClass *oc, vo=
id *data)
     mc->max_cpus =3D 1;
     mc->is_default =3D 0;
     mc->block_default_type =3D IF_SCSI;
+    mc->default_ram_id =3D "m68k_mac.ram";
 }
=20
 static const TypeInfo q800_machine_typeinfo =3D {
--=20
2.7.4


