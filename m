Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E78B164AF3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:49:55 +0100 (CET)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SXq-0006sp-6z
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwX-0004ne-GB
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RwW-0001Td-DH
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43117
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RwW-0001SU-90
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MyyH/O/aATUGgcmHzInkbZymc7rhyP3lnamU2rQlAc8=;
 b=h1fM/4fcDt+vPQi0SSpDeqyO86cl587oUahh/W7J1XfNEU+0euUnEv7jmmzvs8xXLETBbd
 cpLMuY9gBx7NaQNd7RcPecGQaLPqVrsPVb2TSOKiARf3CDp3axkX/fM1cITWRer2IJGO2k
 Wys4vx84LZ0UjWauJztngijsIwZjTEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-nzbfAibJPCCddT85OwJ8FQ-1; Wed, 19 Feb 2020 11:11:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AF26A2733
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:11:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8ADA9051B;
 Wed, 19 Feb 2020 16:11:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 62/79] ppc/pnv: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:36 -0500
Message-Id: <20200219160953.13771-63-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nzbfAibJPCCddT85OwJ8FQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ppc/pnv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 139c857b1e..ea20a1dc3e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -690,7 +690,6 @@ static void pnv_init(MachineState *machine)
 {
     PnvMachineState *pnv =3D PNV_MACHINE(machine);
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
-    MemoryRegion *ram;
     char *fw_filename;
     long fw_size;
     int i;
@@ -702,11 +701,7 @@ static void pnv_init(MachineState *machine)
     if (machine->ram_size < (1 * GiB)) {
         warn_report("skiboot may not work with < 1GB of RAM");
     }
-
-    ram =3D g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(ram, NULL, "pnv.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(get_system_memory(), 0, ram);
+    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
=20
     /*
      * Create our simple PNOR device
@@ -1976,6 +1971,7 @@ static void pnv_machine_class_init(ObjectClass *oc, v=
oid *data)
      * enough to fit the maximum initrd size at it's load address
      */
     mc->default_ram_size =3D INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
+    mc->default_ram_id =3D "pnv.ram";
     ispc->print_info =3D pnv_pic_print_info;
=20
     object_class_property_add_bool(oc, "hb-mode",
--=20
2.18.1


