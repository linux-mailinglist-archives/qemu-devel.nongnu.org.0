Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454B3164B12
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:53:14 +0100 (CET)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4Sb3-0005lv-9X
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwZ-0004rH-65
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RwY-0001VY-2h
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60084
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RwX-0001Ue-Tw
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBNAKNrszZ09AhmAsroqoLIGgR9NqYzL+uRDH4izwjg=;
 b=i1Xm68+tY28ShtoVgfyb3HXe5A46dzog4TSFYfVkW6s7syWfZmt1sJhPj9zuD9XszK0hKC
 WsFf0U1ZLBWX/hcWLDp/e/Rb82i4TO+QPvYTGkHCKg9fIHeu4R+xqSEDImxwtNa5TnvzYN
 qMdji6QSBmEdm9SvxW3L+RNm/t+pE6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-5i3IqX_FM5idShCWQ-jYwA-1; Wed, 19 Feb 2020 11:11:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C14612E63B
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:11:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BA6048;
 Wed, 19 Feb 2020 16:11:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 71/79] sparc/niagara: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:45 -0500
Message-Id: <20200219160953.13771-72-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5i3IqX_FM5idShCWQ-jYwA-1
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/sparc64/niagara.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 5eb2d097b9..ab5ef8c5b3 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -40,7 +40,6 @@
=20
 typedef struct NiagaraBoardState {
     MemoryRegion hv_ram;
-    MemoryRegion partition_ram;
     MemoryRegion nvram;
     MemoryRegion md_rom;
     MemoryRegion hv_rom;
@@ -111,11 +110,8 @@ static void niagara_init(MachineState *machine)
                            NIAGARA_HV_RAM_SIZE, &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_HV_RAM_BASE, &s->hv_ram);
=20
-    memory_region_allocate_system_memory(&s->partition_ram, NULL,
-                                         "sun4v-partition.ram",
-                                         machine->ram_size);
     memory_region_add_subregion(sysmem, NIAGARA_PARTITION_RAM_BASE,
-                                &s->partition_ram);
+                                machine->ram);
=20
     memory_region_init_ram(&s->nvram, NULL, "sun4v.nvram", NIAGARA_NVRAM_S=
IZE,
                            &error_fatal);
@@ -173,6 +169,7 @@ static void niagara_class_init(ObjectClass *oc, void *d=
ata)
     mc->max_cpus =3D 1; /* XXX for now */
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
+    mc->default_ram_id =3D "sun4v-partition.ram";
 }
=20
 static const TypeInfo niagara_type =3D {
--=20
2.18.1


