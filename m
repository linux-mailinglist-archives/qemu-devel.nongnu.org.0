Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192A14EF5B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:16:29 +0100 (CET)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixY20-00018B-KQ
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyC-000422-En
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyB-0003pA-7L
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51733
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyB-0003oI-3O
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gs254Dd5S29mm2jyWymxZ0S+6fhUmXvuGvqpl32c7Pc=;
 b=TceX5RXN4nyybybPZ3yz8KLDRU8jWUkhlj0dCc6OtPM/xYSKF/HyawEgpwYFYAJUbLME3G
 7UuZxBKz+S08o7qcvJg+AZocjNJABAmLDQ3KCZ8+mdxkJOSX/F9j5K04ILAVBn5P+4oxMU
 vOxYJUsrDfyy1c/OuNjFvpwds/6PkBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-WYnla8fAPyWPg-PnYVteew-1; Fri, 31 Jan 2020 10:12:25 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 857FB800D41;
 Fri, 31 Jan 2020 15:12:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9BEC86C4B;
 Fri, 31 Jan 2020 15:12:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/80] arm/cubieboard: use memdev for RAM
Date: Fri, 31 Jan 2020 16:08:42 +0100
Message-Id: <1580483390-131164-13-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: WYnla8fAPyWPg-PnYVteew-1
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
Cc: b.galvani@gmail.com
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
While at it, get rid of no longer needed CubieBoardState wrapper.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
CC: b.galvani@gmail.com
---
 hw/arm/cubieboard.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 6dc2f1d..089f9a3 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -28,52 +28,42 @@ static struct arm_boot_info cubieboard_binfo =3D {
     .board_id =3D 0x1008,
 };
=20
-typedef struct CubieBoardState {
-    AwA10State *a10;
-    MemoryRegion sdram;
-} CubieBoardState;
-
 static void cubieboard_init(MachineState *machine)
 {
-    CubieBoardState *s =3D g_new(CubieBoardState, 1);
+    AwA10State *a10 =3D AW_A10(object_new(TYPE_AW_A10));
     Error *err =3D NULL;
=20
-    s->a10 =3D AW_A10(object_new(TYPE_AW_A10));
-
-    object_property_set_int(OBJECT(&s->a10->emac), 1, "phy-addr", &err);
+    object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set phy address: ");
         exit(1);
     }
=20
-    object_property_set_int(OBJECT(&s->a10->timer), 32768, "clk0-freq", &e=
rr);
+    object_property_set_int(OBJECT(&a10->timer), 32768, "clk0-freq", &err)=
;
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set clk0 frequency: ");
         exit(1);
     }
=20
-    object_property_set_int(OBJECT(&s->a10->timer), 24000000, "clk1-freq",
-                            &err);
+    object_property_set_int(OBJECT(&a10->timer), 24000000, "clk1-freq", &e=
rr);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't set clk1 frequency: ");
         exit(1);
     }
=20
-    object_property_set_bool(OBJECT(s->a10), true, "realized", &err);
+    object_property_set_bool(OBJECT(a10), true, "realized", &err);
     if (err !=3D NULL) {
         error_reportf_err(err, "Couldn't realize Allwinner A10: ");
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(&s->sdram, NULL, "cubieboard.ram"=
,
-                                         machine->ram_size);
     memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
-                                &s->sdram);
+                                machine->ram);
=20
     /* TODO create and connect IDE devices for ide_drive_get() */
=20
     cubieboard_binfo.ram_size =3D machine->ram_size;
-    arm_load_kernel(&s->a10->cpu, machine, &cubieboard_binfo);
+    arm_load_kernel(&a10->cpu, machine, &cubieboard_binfo);
 }
=20
 static void cubieboard_machine_init(MachineClass *mc)
@@ -84,6 +74,7 @@ static void cubieboard_machine_init(MachineClass *mc)
     mc->block_default_type =3D IF_IDE;
     mc->units_per_default_bus =3D 1;
     mc->ignore_memory_transaction_failures =3D true;
+    mc->default_ram_id =3D "cubieboard.ram";
 }
=20
 DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
--=20
2.7.4


