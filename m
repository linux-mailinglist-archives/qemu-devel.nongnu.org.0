Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C813C819
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:40:39 +0100 (CET)
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkma-00084p-N3
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKK-00088N-5T
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKI-0008QQ-U4
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26697
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKI-0008Pl-QE
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnkWfqZgLL9NyjYJbbglm28wjhMlX3z/tFvLQGDTGbY=;
 b=W62C/enVCz2K5xre3pUVfu8O+qkk8wpjZNzLJHuGGE+/yBaP+my8xStGTw9l+cPmEj7Fkb
 8JKQnfqZqKybuxVax/P7zoo+tgay+DtTaVkesH+MOHVvwArwPpAPS7NjDsMkKPcut8e2Cf
 JkHDh1lwYNw3osa+O1UMacJuDrPrUdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-4TbMnQAROaqWNC9rD8vTWA-1; Wed, 15 Jan 2020 10:11:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E79DB1098D2E;
 Wed, 15 Jan 2020 15:11:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6A819757;
 Wed, 15 Jan 2020 15:11:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/86] arm:virt: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:48 +0100
Message-Id: <1579100861-73692-34-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4TbMnQAROaqWNC9rD8vTWA-1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away,
so replace it with memdev allocated MemoryRegion.
The later is initialized by generic code, so board only
needs to opt in to memdev scheme by providing
  MachineClass::default_ram_id
and then map memory region provided by
  MachineState::ram_memdev

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
---
 hw/arm/virt.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f4..e2fbca3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1512,7 +1512,6 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *secure_sysmem =3D NULL;
     int n, virt_max_cpus;
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     bool firmware_loaded;
     bool aarch64 =3D true;
     bool has_ged =3D !vmc->no_ged;
@@ -1701,9 +1700,8 @@ static void machvirt_init(MachineState *machine)
         }
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
+    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
+                                machine->ram);
     if (machine->device_memory) {
         memory_region_add_subregion(sysmem, machine->device_memory->base,
                                     &machine->device_memory->mr);
@@ -2053,6 +2051,7 @@ static void virt_machine_class_init(ObjectClass *oc, =
void *data)
     hc->unplug_request =3D virt_machine_device_unplug_request_cb;
     mc->numa_mem_supported =3D true;
     mc->auto_enable_numa_with_memhp =3D true;
+    mc->default_ram_id =3D "mach-virt.ram";
 }
=20
 static void virt_instance_init(Object *obj)
--=20
2.7.4


