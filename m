Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789D13C8C5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:07:40 +0100 (CET)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlCk-000367-DD
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKx-0000mp-3G
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKv-0000PC-OR
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:02 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36522
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKv-0000Nf-JO
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxPRlMST9oPmn843nydB0D784tYpIxW/LjVUrUowxME=;
 b=POu7YG3qjkA8yuXeyztGoHYQEgwglt3vK2WnjUlVOTQNFMwMjidlHop21r56BFas9VE6OS
 BXkUR18XEQoZaN20u4RXWMiPDi98peQPdgyyXL+6IiXLqH8wLpTFqHPhWphndnnZ5lDHGa
 PwLhk3MmSfuwhUCE44ng3sAcPtdkVZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-2JSMm_aCMO28N7_MggZXUA-1; Wed, 15 Jan 2020 10:11:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D5B3593DB;
 Wed, 15 Jan 2020 15:11:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FB1719757;
 Wed, 15 Jan 2020 15:11:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 61/86] ppc:mac_newworld: use memdev for RAM
Date: Wed, 15 Jan 2020 16:07:16 +0100
Message-Id: <1579100861-73692-62-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 2JSMm_aCMO28N7_MggZXUA-1
X-Mimecast-Spam-Score: 0
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
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
CC: mark.cave-ayland@ilande.co.uk
---
 hw/ppc/mac_newworld.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 3594517..2546d33 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -118,7 +118,7 @@ static void ppc_core99_init(MachineState *machine)
     char *filename;
     IrqLines *openpic_irqs;
     int linux_boot, i, j, k;
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1), *bios =3D g_new(MemoryRe=
gion, 1);
+    MemoryRegion *bios =3D g_new(MemoryRegion, 1);
     hwaddr kernel_base, initrd_base, cmdline_base =3D 0;
     long kernel_size, initrd_size;
     UNINHostState *uninorth_pci;
@@ -152,8 +152,7 @@ static void ppc_core99_init(MachineState *machine)
     }
=20
     /* allocate RAM */
-    memory_region_allocate_system_memory(ram, NULL, "ppc_core99.ram", ram_=
size);
-    memory_region_add_subregion(get_system_memory(), 0, ram);
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
=20
     /* allocate and load BIOS */
     memory_region_init_ram(bios, NULL, "ppc_core99.bios", BIOS_SIZE,
@@ -586,6 +585,7 @@ static void core99_machine_class_init(ObjectClass *oc, =
void *data)
 #else
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("7400_v2.9");
 #endif
+    mc->default_ram_id =3D "ppc_core99.ram";
     mc->ignore_boot_device_suffixes =3D true;
     fwc->get_dev_path =3D core99_fw_dev_path;
 }
--=20
2.7.4


