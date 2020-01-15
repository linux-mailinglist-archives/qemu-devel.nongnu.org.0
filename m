Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3E13C8E3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:12:50 +0100 (CET)
Received: from localhost ([::1]:56497 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlHl-00051C-EU
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkL5-00011s-Dp
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkL4-0000W2-4F
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58437
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkL3-0000Vc-V8
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/Y+TeQhJLFvkD1utNmQya59Mk0HjE69BPP5CGsPWis=;
 b=GEtjmT3JPcqj0MTBPwCmQm/wOTprzyBFS2bR9z718srMSoZEqXWD/AL4uMHibZ50UwQwH+
 tf4RKM0mXhdWNBABfOF+ZebP6lmalKNK+UrcDK9g9HpDu7fDHeX9raLrlQnP+CjvjF/Uwl
 39dtrViikxRTnxWYWMF/j0VmoPU5mvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-ZSt2cz2cP3WoHArRq5o2jw-1; Wed, 15 Jan 2020 10:12:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 508A3188ED9
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:12:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C999B19757
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:12:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 72/86] sparc:leon3: use memdev for RAM
Date: Wed, 15 Jan 2020 16:07:27 +0100
Message-Id: <1579100861-73692-73-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ZSt2cz2cP3WoHArRq5o2jw-1
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
---
 hw/sparc/leon3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 8038887..64399eb 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -189,7 +189,6 @@ static void leon3_generic_hw_init(MachineState *machine=
)
     SPARCCPU *cpu;
     CPUSPARCState   *env;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *prom =3D g_new(MemoryRegion, 1);
     int         ret;
     char       *filename;
@@ -251,8 +250,8 @@ static void leon3_generic_hw_init(MachineState *machine=
)
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "leon3.ram", ram_size)=
;
-    memory_region_add_subregion(address_space_mem, LEON3_RAM_OFFSET, ram);
+    memory_region_add_subregion(address_space_mem, LEON3_RAM_OFFSET,
+                                machine->ram);
=20
     /* Allocate BIOS */
     prom_size =3D 8 * MiB;
@@ -358,6 +357,7 @@ static void leon3_generic_machine_init(MachineClass *mc=
)
     mc->desc =3D "Leon-3 generic";
     mc->init =3D leon3_generic_hw_init;
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("LEON3");
+    mc->default_ram_id =3D "leon3.ram";
 }
=20
 DEFINE_MACHINE("leon3_generic", leon3_generic_machine_init)
--=20
2.7.4


