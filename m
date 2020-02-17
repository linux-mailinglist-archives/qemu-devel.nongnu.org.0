Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC60161907
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 18:44:35 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3kRe-0003eg-5i
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 12:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j3kJ9-00023q-Sj
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j3kJ8-00026V-95
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:47 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27518
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j3kJ6-00023V-TB
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 12:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581960939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=478cMgXnQQn6uBqWbiBoJBtEQ56RPg5biorvv/HMFu0=;
 b=eT9O2/vjgZM9iih7FzCbP8Mo21cn/HrQ0Kxv/P2F+sSW2Izz9DcFtJ6RE79DVYBWvFVd/s
 sR45IjDeqScCjoDw+FsrXOz2Cl7gla3nSEdxvuQnSvrkWhvOqr6Yce74NGK17D6Kfnxk+M
 /LOL7mbkP81o0KuK0gDzSVZo1Z8F7U8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-N4tep2PjOhCuCcQPGJ3Buw-1; Mon, 17 Feb 2020 12:35:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4A62800D55;
 Mon, 17 Feb 2020 17:35:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C83890508;
 Mon, 17 Feb 2020 17:35:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/79] arm/raspi: use memdev for RAM
Date: Mon, 17 Feb 2020 12:34:02 -0500
Message-Id: <20200217173452.15243-30-imammedo@redhat.com>
In-Reply-To: <20200217173452.15243-1-imammedo@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: N4tep2PjOhCuCcQPGJ3Buw-1
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Andrew.Baumann@microsoft.com
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
---
CC: Andrew.Baumann@microsoft.com
CC: philmd@redhat.com

v5:
      * fixed rebase conflicts once more
v4:
      * fixed rebase conflicts
---
 hw/arm/raspi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 90ad9b8115..acd2bb794d 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -39,7 +39,6 @@ typedef struct RaspiMachineState {
     MachineState parent_obj;
     /*< public >*/
     BCM283XState soc;
-    MemoryRegion ram;
 } RaspiMachineState;
=20
 typedef struct RaspiMachineClass {
@@ -277,16 +276,14 @@ static void raspi_machine_init(MachineState *machine)
         exit(1);
     }
=20
-    /* Allocate and map RAM */
-    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
-                                         machine->ram_size);
     /* FIXME: Remove when we have custom CPU address space support */
-    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0=
);
+    memory_region_add_subregion_overlap(get_system_memory(), 0,
+                                        machine->ram, 0);
=20
     /* Setup the SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             board_soc_type(board_rev), &error_abort, NULL)=
;
-    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram)=
,
+    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine-=
>ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
                             &error_abort);
@@ -324,6 +321,7 @@ static void raspi_machine_class_init(ObjectClass *oc, v=
oid *data)
     mc->no_cdrom =3D 1;
     mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D cores_count(boa=
rd_rev);
     mc->default_ram_size =3D board_ram_size(board_rev);
+    mc->default_ram_id =3D "ram";
     if (board_version(board_rev) =3D=3D 2) {
         mc->ignore_memory_transaction_failures =3D true;
     }
--=20
2.18.1


