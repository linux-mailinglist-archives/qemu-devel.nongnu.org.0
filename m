Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEBA161918
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 18:49:01 +0100 (CET)
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3kVw-0002dr-OZ
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 12:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j3kIp-0001VM-F2
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j3kIo-0001tt-9u
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32975
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j3kIo-0001tP-4b
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581960925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2lucjeC1vK/ETg4bQp3/tEek3Z9NgL/LGMUgmObzmA=;
 b=LkKTAkdLUr3pzfo8rvpChvLaMATgAVTGE4sKrp08r2QhcAhZouddAm3pyfGWP582j7FrgU
 B5vLt+xwBbmXNt7opWN2Ggi+Ba4pkB9osaU8PtSN+1LA0ZXambEg4fnu15JmolappncplL
 /B+WyorkadvsqX6yYQgOMN6csbGlJR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-BksC2vKfN3m8S_DrtQPz8w-1; Mon, 17 Feb 2020 12:35:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 213D318FE860
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 17:35:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5AE90508;
 Mon, 17 Feb 2020 17:35:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/79] arm/kzm: use memdev for RAM
Date: Mon, 17 Feb 2020 12:33:52 -0500
Message-Id: <20200217173452.15243-20-imammedo@redhat.com>
In-Reply-To: <20200217173452.15243-1-imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BksC2vKfN3m8S_DrtQPz8w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>
---
 hw/arm/kzm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 94cbac11de..34f6bcb491 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -52,7 +52,6 @@
=20
 typedef struct IMX31KZM {
     FslIMX31State soc;
-    MemoryRegion ram;
     MemoryRegion ram_alias;
 } IMX31KZM;
=20
@@ -85,10 +84,8 @@ static void kzm_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
=20
-    memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
-                                         machine->ram_size);
     memory_region_add_subregion(get_system_memory(), FSL_IMX31_SDRAM0_ADDR=
,
-                                &s->ram);
+                                machine->ram);
=20
     /* initialize the alias memory if any */
     for (i =3D 0, ram_size =3D machine->ram_size, alias_offset =3D 0;
@@ -108,7 +105,8 @@ static void kzm_init(MachineState *machine)
=20
         if (size < ram[i].size) {
             memory_region_init_alias(&s->ram_alias, NULL, "ram.alias",
-                                     &s->ram, alias_offset, ram[i].size - =
size);
+                                     machine->ram,
+                                     alias_offset, ram[i].size - size);
             memory_region_add_subregion(get_system_memory(),
                                         ram[i].addr + size, &s->ram_alias)=
;
         }
@@ -140,6 +138,7 @@ static void kzm_machine_init(MachineClass *mc)
     mc->desc =3D "ARM KZM Emulation Baseboard (ARM1136)";
     mc->init =3D kzm_init;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "kzm.ram";
 }
=20
 DEFINE_MACHINE("kzm", kzm_machine_init)
--=20
2.18.1


