Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05C1467F2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:29:16 +0100 (CET)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubbm-0004i1-VD
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatc-0008C6-AD
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuata-00056L-VZ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43453
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuata-000563-Sd
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3pEIjYR0xiNmIz6tTLqkBi/ZzcmSkOiQcAKmR75F04=;
 b=YCyocOnvDSop66f8riyUPgpayB6FjkotpzoBJy1eRuAE6YqQHt2NRREJgjvozosZJbpo6s
 Xm/Qg4CLmCH5d3ruyme4JO0Xibt8IWPtFzotS1usUfsf0Z0v61woOJafZyVkUCo+D0Css/
 zOi7SgAzZkGCS9HzY/thpjOxGnHtPEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-X6l_0Sc4Phq2mE39ABAuPg-1; Thu, 23 Jan 2020 06:43:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129BFDB20;
 Thu, 23 Jan 2020 11:43:30 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB0710016E8;
 Thu, 23 Jan 2020 11:43:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 63/80] ppc/ppc405_boards: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:28 +0100
Message-Id: <1579779525-20065-64-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: X6l_0Sc4Phq2mE39ABAuPg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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
in ref405ep alias RAM into ram_memories[] to avoid re-factoring
its user ppc405ep_init(), which would be invasive and out of
scope this patch.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
---
 hw/ppc/ppc405_boards.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 057882a..f9c5b77 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -170,8 +170,8 @@ static void ref405ep_init(MachineState *machine)
     }
=20
     /* XXX: fix this */
-    memory_region_allocate_system_memory(&ram_memories[0], NULL, "ef405ep.=
ram",
-                                         machine->ram_size);
+    memory_region_init_alias(&ram_memories[0], NULL, "ef405ep.ram.alias",
+                             machine->ram, 0, machine->ram_size);
     ram_bases[0] =3D 0;
     ram_sizes[0] =3D machine->ram_size;
     memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
@@ -312,6 +312,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *=
data)
     mc->desc =3D "ref405ep";
     mc->init =3D ref405ep_init;
     mc->default_ram_size =3D 0x08000000;
+    mc->default_ram_id =3D "ef405ep.ram";
 }
=20
 static const TypeInfo ref405ep_type =3D {
@@ -424,7 +425,6 @@ static void taihu_405ep_init(MachineState *machine)
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *bios;
     MemoryRegion *ram_memories =3D g_new(MemoryRegion, 2);
-    MemoryRegion *ram =3D g_malloc0(sizeof(*ram));
     hwaddr ram_bases[2], ram_sizes[2];
     long bios_size;
     target_ulong kernel_base, initrd_base;
@@ -439,18 +439,16 @@ static void taihu_405ep_init(MachineState *machine)
         g_free(sz);
         exit(EXIT_FAILURE);
     }
-    memory_region_allocate_system_memory(ram, NULL, "taihu_405ep.ram",
-                                         machine->ram_size);
=20
     ram_bases[0] =3D 0;
     ram_sizes[0] =3D 0x04000000;
     memory_region_init_alias(&ram_memories[0], NULL,
-                             "taihu_405ep.ram-0", ram, ram_bases[0],
+                             "taihu_405ep.ram-0", machine->ram, ram_bases[=
0],
                              ram_sizes[0]);
     ram_bases[1] =3D 0x04000000;
     ram_sizes[1] =3D 0x04000000;
     memory_region_init_alias(&ram_memories[1], NULL,
-                             "taihu_405ep.ram-1", ram, ram_bases[1],
+                             "taihu_405ep.ram-1", machine->ram, ram_bases[=
1],
                              ram_sizes[1]);
     ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                   33333333, &pic, kernel_filename =3D=3D NULL ? 0 : 1);
@@ -546,6 +544,7 @@ static void taihu_class_init(ObjectClass *oc, void *dat=
a)
     mc->desc =3D "taihu";
     mc->init =3D taihu_405ep_init;
     mc->default_ram_size =3D 0x08000000;
+    mc->default_ram_id =3D "ef405ep.ram";
 }
=20
 static const TypeInfo taihu_type =3D {
--=20
2.7.4


