Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1414EF5C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:16:31 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixY22-0001G5-I8
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXy8-0003vz-Dh
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXy6-0003h2-8x
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37154
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXy6-0003gg-4t
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3u+06/6pmCLD2Hb7pH65KifvrO/ls92HbHU9yt5PokM=;
 b=U71fFWWKQYR/jabsprYwyHpTxBGkmQm3EBjqNs2o9eyqCdxM5U6aTR56Dd1GPla1UXGOwm
 bymBJa0crXfXwuKn2gn68AUcJzp/RBsoMOsA4F8AgFR+3E/fEafG3LeunxiHv+BzpLgUaN
 RiBtMuqZRGnRBwsxDeIydIzGpriIpS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-kGyr2gUkPGulzA2gExGAFQ-1; Fri, 31 Jan 2020 10:12:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25221088380
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 494F686C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/80] arm/aspeed: use memdev for RAM
Date: Fri, 31 Jan 2020 16:08:40 +0100
Message-Id: <1580483390-131164-11-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: kGyr2gUkPGulzA2gExGAFQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 805bebd..a6a2102 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -35,7 +35,6 @@ static struct arm_boot_info aspeed_board_binfo =3D {
 struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram_container;
-    MemoryRegion ram;
     MemoryRegion max_ram;
 };
=20
@@ -197,6 +196,7 @@ static void aspeed_machine_init(MachineState *machine)
=20
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
                        UINT32_MAX);
+    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
=20
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
                             (sizeof(bmc->soc)), amc->soc_name, &error_abor=
t,
@@ -232,8 +232,6 @@ static void aspeed_machine_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
-    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size)=
;
-    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_SDRAM],
                                 &bmc->ram_container);
@@ -436,6 +434,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
+    mc->default_ram_id =3D "ram";
=20
     aspeed_machine_class_props_init(oc);
 }
--=20
2.7.4


