Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A213C91E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:20:13 +0100 (CET)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlOt-0004g8-Rh
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkL7-00016s-HZ
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkL6-0000Yv-Dv
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33032
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkL6-0000YZ-9y
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBP0HRWwL1d0gc9dRSfgF4N2Pubd2Q3dfgsMuE19woA=;
 b=LJAB0t/jqrju6EFz3lMM+fgWYk+0iuiwMoz5tzyj/7weWK7O/B5lliwd8y5cvaKRuD/7fq
 skvZ1qr07gnpRs4sq1djGHJmAwSWqCGoButdo/1ED9qGlIivfTPn+kD9n5/qX2frBBsVQY
 BmGdyb0ODur13Ac3Mb/aczvT9b614PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-4H8hGei-Ovu9bRIZBZMzPA-1; Wed, 15 Jan 2020 10:12:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C7E2100730E
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:12:09 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6464196AE
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:12:08 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 74/86] sparc:niagara: use memdev for RAM
Date: Wed, 15 Jan 2020 16:07:29 +0100
Message-Id: <1579100861-73692-75-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4H8hGei-Ovu9bRIZBZMzPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
---
 hw/sparc64/niagara.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 5eb2d09..ab5ef8c 100644
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
2.7.4


