Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E7E13C761
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:23:05 +0100 (CET)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkVc-00078F-6X
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkK1-0007e0-V5
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkK0-00089P-Og
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36032
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkK0-000894-KH
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv9ibWkOXWHCxmXtNabFmyN9KfubzhKVBTnx2DQY9WY=;
 b=YOoViOrMtY3gPPHk9xYELje1hY1Rh+ajjqaeqEsxqpLtZE7nvjBbUsTUznoBuyzlJ513nI
 Ap87fwaLEEHeUE1fFHcQJUpnc2AUMg9OHu4gJN1ZKJHOOyb0tVMCk5vUXRxgWU727GyMuV
 mPdcu76cTFsb3yW+i2jUS7o4KOdb2sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-saKUpjjCPcKQFAFRs-w4vg-1; Wed, 15 Jan 2020 10:11:01 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2431D90115E;
 Wed, 15 Jan 2020 15:11:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 276E3381;
 Wed, 15 Jan 2020 15:10:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/86] arm:kzm: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:34 +0100
Message-Id: <1579100861-73692-20-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: saKUpjjCPcKQFAFRs-w4vg-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, peter.chubb@nicta.com.au
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
---
CC: peter.chubb@nicta.com.au
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/kzm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 27800c5..f63902e 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -51,7 +51,6 @@
=20
 typedef struct IMX31KZM {
     FslIMX31State soc;
-    MemoryRegion ram;
     MemoryRegion ram_alias;
 } IMX31KZM;
=20
@@ -84,10 +83,8 @@ static void kzm_init(MachineState *machine)
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
@@ -107,7 +104,8 @@ static void kzm_init(MachineState *machine)
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
@@ -139,6 +137,7 @@ static void kzm_machine_init(MachineClass *mc)
     mc->desc =3D "ARM KZM Emulation Baseboard (ARM1136)";
     mc->init =3D kzm_init;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "kzm.ram";
 }
=20
 DEFINE_MACHINE("kzm", kzm_machine_init)
--=20
2.7.4


