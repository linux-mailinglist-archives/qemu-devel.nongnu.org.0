Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440A164AC7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:42:22 +0100 (CET)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SQX-0007hX-72
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwX-0004oq-TI
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RwW-0001To-PB
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:21 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35341
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RwW-0001TV-Kq
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HmzwIeJ0iHIbZYeNnb62FpqEZG/A/Yvv3iSk8HeWyM=;
 b=REFwxu6+TId2+vGo7ycGzL0N26WPmkz2fthHVUJc+Z2wOUBul+RXAXYndcQUXa3M0u8sX/
 dyS+753JHpcIVK9LSf1B9zDvRJ2qZS/A+p5KL+miq5IuSbkwNlI8a9zteBCQjepw+Zlx7b
 1xfX1JH6sGXRwgwYL8xTipbVMYro0vY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-xtwEGk17NAqmNcf0BwzqVg-1; Wed, 19 Feb 2020 11:11:07 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6114D10B01B1
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:11:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B063D8ECF3;
 Wed, 19 Feb 2020 16:11:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 60/79] ppc/mac_newworld: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:34 -0500
Message-Id: <20200219160953.13771-61-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: xtwEGk17NAqmNcf0BwzqVg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
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
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/mac_newworld.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 464d012103..b8189bf7a4 100644
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
2.18.1


