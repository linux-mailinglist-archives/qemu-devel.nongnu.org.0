Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6718914685F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:48:45 +0100 (CET)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubud-0003IX-Lt
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuatl-0008Oo-RH
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuati-0005C1-9m
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:45 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58293
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuati-0005AU-4J
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDKbBbAWWOkkiIWFBWLIbRth9yEyr7d7mcqC9bU3rvU=;
 b=B+iwZy8mYYSQtN5GMBChndKDnGS2AvgGlKuTUwCniTsvXKLYTBFiv4OFn5gSFBmI3iQQ8i
 3Rlm5TaiONAAX11hbNdaJgHdjzym9pPg8HMGoKL0gsljz6K6Z4br2tZlo38b6pYbqnvghJ
 5ED0gMooPUEIfvjXrDO0URWsmJlWI/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-KHCuqhxHMvWFG2SYUCBk5Q-1; Thu, 23 Jan 2020 06:43:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC434801E7A;
 Thu, 23 Jan 2020 11:43:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E82DF100164D;
 Thu, 23 Jan 2020 11:43:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 67/80] ppc/spapr: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:32 +0100
Message-Id: <1579779525-20065-68-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: KHCuqhxHMvWFG2SYUCBk5Q-1
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
---
 hw/ppc/spapr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 02cf53f..ff0343b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2587,7 +2587,6 @@ static void spapr_machine_init(MachineState *machine)
     PCIHostState *phb;
     int i;
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     hwaddr node0_size =3D spapr_node0_size(machine);
     long load_limit, fw_size;
     char *filename;
@@ -2766,10 +2765,8 @@ static void spapr_machine_init(MachineState *machine=
)
         kvmppc_enable_h_page_init();
     }
=20
-    /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "ppc_spapr.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, 0, ram);
+    /* map RAM */
+    memory_region_add_subregion(sysmem, 0, machine->ram);
=20
     /* always allocate the device memory information */
     machine->device_memory =3D g_malloc0(sizeof(*machine->device_memory));
@@ -4344,6 +4341,7 @@ static void spapr_machine_class_init(ObjectClass *oc,=
 void *data)
     mc->no_parallel =3D 1;
     mc->default_boot_order =3D "";
     mc->default_ram_size =3D 512 * MiB;
+    mc->default_ram_id =3D "ppc_spapr.ram";
     mc->default_display =3D "std";
     mc->kvm_type =3D spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE)=
;
--=20
2.7.4


