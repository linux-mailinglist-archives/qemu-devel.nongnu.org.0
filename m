Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B06414EFCF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:40:15 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYP0-0005Dx-7O
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39459)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyW-0004g7-DK
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyV-0004Sd-9K
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59773
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyV-0004S0-5q
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kw+4DlgM0odpHEZGphhJaCNVvyRS1Ybjd47rhhOmDls=;
 b=hNFPR3KXZzp2waWVBnMTvs5RYh/z9UrQdKInPk6Ye9xkrBLZUkUawhuhKypc3hzWKua2V6
 z9vywebs1CXHatd9suf/rUXiCgciRgMPuuV5kiRacCAYUoj9dZQKeuS4wFjgeseWQCk6RS
 SFS7XmUvLb1OKA8mCViW6T5yXq57OI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-BiU_0ttzOParRxKAT0GZjw-1; Fri, 31 Jan 2020 10:12:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B90508017CC;
 Fri, 31 Jan 2020 15:12:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E6789E7A;
 Fri, 31 Jan 2020 15:12:43 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/80] arm/sbsa-ref: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:00 +0100
Message-Id: <1580483390-131164-31-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BiU_0ttzOParRxKAT0GZjw-1
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
Cc: radoslaw.biernacki@linaro.org, leif.lindholm@linaro.org
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
---
CC: radoslaw.biernacki@linaro.org
CC: leif.lindholm@linaro.org
---
 hw/arm/sbsa-ref.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9b5bcb5..1cba9fc 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -593,7 +593,6 @@ static void sbsa_ref_init(MachineState *machine)
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *secure_sysmem =3D g_new(MemoryRegion, 1);
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     bool firmware_loaded;
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
@@ -685,9 +684,8 @@ static void sbsa_ref_init(MachineState *machine)
         object_unref(cpuobj);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "sbsa-ref.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base, ra=
m);
+    memory_region_add_subregion(sysmem, sbsa_ref_memmap[SBSA_MEM].base,
+                                machine->ram);
=20
     create_fdt(sms);
=20
@@ -785,6 +783,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *=
data)
     mc->block_default_type =3D IF_IDE;
     mc->no_cdrom =3D 1;
     mc->default_ram_size =3D 1 * GiB;
+    mc->default_ram_id =3D "sbsa-ref.ram";
     mc->default_cpus =3D 4;
     mc->possible_cpu_arch_ids =3D sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props =3D sbsa_ref_cpu_index_to_props;
--=20
2.7.4


