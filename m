Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65D13C8A2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:01:51 +0100 (CET)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irl77-0004Wv-PA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKs-0000dB-Uw
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKr-0000Ld-I7
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44693
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKr-0000LT-F3
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2cMPzB/BttyfsQJ2mwxXlljEu9LF/vYka3x2een714=;
 b=T4uDmXuahNNTQQedqRjJSro4jVYvTxG4sjutNOsElwY8XmilBDT4xBrTWHdlDMzW/nOJiX
 XDo/26oN3xYT3Ynf6HpdATRyQJ9KDRXjzJx180NKTm0FAHmjo6qec2N3zJGKwI/qJt0lQ5
 eGai70Pfp2yoAVyB1PoYhVdA65NWOc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-5MkSSdgBOaiXZyLPsPG38g-1; Wed, 15 Jan 2020 10:11:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB233910657;
 Wed, 15 Jan 2020 15:11:51 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEB4B19757;
 Wed, 15 Jan 2020 15:11:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 60/86] ppc:e500: use memdev for RAM
Date: Wed, 15 Jan 2020 16:07:15 +0100
Message-Id: <1579100861-73692-61-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 5MkSSdgBOaiXZyLPsPG38g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
---
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
---
 hw/ppc/e500.c      | 5 +----
 hw/ppc/e500plat.c  | 1 +
 hw/ppc/mpc8544ds.c | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 6d119fe..256ab5a 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -831,7 +831,6 @@ static void ppce500_power_off(void *opaque, int line, i=
nt on)
 void ppce500_init(MachineState *machine)
 {
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     PPCE500MachineState *pms =3D PPCE500_MACHINE(machine);
     const PPCE500MachineClass *pmc =3D PPCE500_MACHINE_GET_CLASS(machine);
     PCIBus *pci_bus;
@@ -912,9 +911,7 @@ void ppce500_init(MachineState *machine)
     }
=20
     /* Register Memory */
-    memory_region_allocate_system_memory(ram, NULL, "mpc8544ds.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     dev =3D qdev_create(NULL, "e500-ccsr");
     object_property_add_child(qdev_get_machine(), "e500-ccsr",
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index 7078386..bddd5e7 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -97,6 +97,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D e500plat_init;
     mc->max_cpus =3D 32;
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("e500v2_v30");
+    mc->default_ram_id =3D "mpc8544ds.ram";
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);
  }
=20
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index c2c5e11..8117750 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -55,6 +55,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, =
void *data)
     mc->init =3D mpc8544ds_init;
     mc->max_cpus =3D 15;
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("e500v2_v30");
+    mc->default_ram_id =3D "mpc8544ds.ram";
 }
=20
 #define TYPE_MPC8544DS_MACHINE  MACHINE_TYPE_NAME("mpc8544ds")
--=20
2.7.4


