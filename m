Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE1164AFB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:51:35 +0100 (CET)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SZS-0002OO-JF
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwY-0004pY-9B
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RwW-0001Se-1m
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33777
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RwV-0001Rz-UA
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsYxiu6YvnaT4AAjxumgcSt1+tXxYOS38kIDCWBQsBs=;
 b=SwW+HdJva5mm1QmyAPmlz+jcnoM4o5rc9gQLj1rVjBJM8zm+CAU0zyTUvw54ZfDW4ydXr2
 XtrgT5y9uz/eK/wNvbI1WMX0RWv8tOG9UVuo5Xc8cYRf7HdILaGYOS+PFAydRA63lbO0gd
 K1iRSN0xSn7hcOKMb9DlO0JYRSosNgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-VNPwSrwEMWysEjQSXrwyRg-1; Wed, 19 Feb 2020 11:11:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C7D102CE28
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:11:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7F648;
 Wed, 19 Feb 2020 16:11:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 69/79] sparc/leon3: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:43 -0500
Message-Id: <20200219160953.13771-70-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: VNPwSrwEMWysEjQSXrwyRg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 hw/sparc/leon3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index f5a087dd86..5fa58aa55f 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -189,7 +189,6 @@ static void leon3_generic_hw_init(MachineState *machine=
)
     SPARCCPU *cpu;
     CPUSPARCState   *env;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *prom =3D g_new(MemoryRegion, 1);
     int         ret;
     char       *filename;
@@ -251,8 +250,8 @@ static void leon3_generic_hw_init(MachineState *machine=
)
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "leon3.ram", ram_size)=
;
-    memory_region_add_subregion(address_space_mem, LEON3_RAM_OFFSET, ram);
+    memory_region_add_subregion(address_space_mem, LEON3_RAM_OFFSET,
+                                machine->ram);
=20
     /* Allocate BIOS */
     prom_size =3D 8 * MiB;
@@ -358,6 +357,7 @@ static void leon3_generic_machine_init(MachineClass *mc=
)
     mc->desc =3D "Leon-3 generic";
     mc->init =3D leon3_generic_hw_init;
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("LEON3");
+    mc->default_ram_id =3D "leon3.ram";
 }
=20
 DEFINE_MACHINE("leon3_generic", leon3_generic_machine_init)
--=20
2.18.1


