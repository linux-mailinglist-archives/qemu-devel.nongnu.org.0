Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7013C756
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:22:06 +0100 (CET)
Received: from localhost ([::1]:55682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkUe-0005LP-Ti
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48664)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJq-0007Nm-P7
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJp-00080I-Ie
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29099
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJp-000800-FB
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPleiLJ/04894h/2DSFT87BPgugvG+wCtyZO9N79I/0=;
 b=iCxKs4L50iqvCNP2QcpXrzAmzuBkPWCppdqj8CVSs5ERwb8wp8MicyeOR5fMM3TQBYDU3v
 fj0LEkWOgZjg3aDQVI4bJ8rOfSJbUga3I93iART1NafFwjD5i8HVEGsNJ6T2R9FKvfW65z
 bKFxijFtb6hI5xLPkYReZuAUP3cX8UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-0JnxhDzeOdqPmtehVQh6Tg-1; Wed, 15 Jan 2020 10:10:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF5E190019B;
 Wed, 15 Jan 2020 15:10:48 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15A4EA7D2;
 Wed, 15 Jan 2020 15:10:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/86] arm:aspeed: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:25 +0100
Message-Id: <1579100861-73692-11-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0JnxhDzeOdqPmtehVQh6Tg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
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
CC: clg@kaod.org
CC: peter.maydell@linaro.org
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: qemu-arm@nongnu.org
---
 hw/arm/aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 525c547..330254b 100644
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
@@ -184,6 +183,7 @@ static void aspeed_machine_init(MachineState *machine)
=20
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
                        UINT32_MAX);
+    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
=20
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
                             (sizeof(bmc->soc)), amc->soc_name, &error_abor=
t,
@@ -215,8 +215,6 @@ static void aspeed_machine_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_fatal);
=20
-    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size)=
;
-    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_SDRAM],
                                 &bmc->ram_container);
@@ -393,6 +391,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, =
void *data)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
+    mc->default_ram_id =3D "ram";
 }
=20
 static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data=
)
--=20
2.7.4


