Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FDB14EFED
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:42:52 +0100 (CET)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYRX-0001Dm-2K
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyZ-0004oV-F0
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyY-0004fO-9P
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27981
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyY-0004cw-4h
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3rakMCxUgAH3dWxCFYk4146acKP6ac0k3bS4AoVXm8=;
 b=Mre2QGHBmEaaO5lBt9J2LwWRQwqLRiA9y0M8s89txHJYxpTdbqnnPE5OnH94zldpOHl8Bu
 WO9DuNng6ZM1Ve4czFhiz5P4qTf97z6B2/1MOKzIXuAoAxNgmu0NHhCNHS0tbHKNFNLBDo
 p+cNG7pdzRoULu19NlT2n4Mh84gZZBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-uNfhz-OwN323KzpqjeW31A-1; Fri, 31 Jan 2020 10:12:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 502A7800D5A
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9FA786C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/80] arm/xlnx-zcu102: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:07 +0100
Message-Id: <1580483390-131164-38-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: uNfhz-OwN323KzpqjeW31A-1
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/arm/xlnx-zcu102.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 53cfe7c..bd645ad 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -28,7 +28,6 @@ typedef struct XlnxZCU102 {
     MachineState parent_obj;
=20
     XlnxZynqMPState soc;
-    MemoryRegion ddr_ram;
=20
     bool secure;
     bool virt;
@@ -87,13 +86,10 @@ static void xlnx_zcu102_init(MachineState *machine)
                  ram_size);
     }
=20
-    memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
-                                         ram_size);
-
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             TYPE_XLNX_ZYNQMP, &error_abort, NULL);
=20
-    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
+    object_property_set_link(OBJECT(&s->soc), OBJECT(machine->ram),
                          "ddr-ram", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
                              &error_fatal);
@@ -211,6 +207,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass =
*oc, void *data)
     mc->ignore_memory_transaction_failures =3D true;
     mc->max_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
     mc->default_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS;
+    mc->default_ram_id =3D "ddr-ram";
 }
=20
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo =3D {
--=20
2.7.4


