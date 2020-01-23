Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E7146787
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:06:27 +0100 (CET)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubFi-0008S9-3B
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasN-0006Bo-Qe
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasM-0004VO-MS
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56669
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasM-0004Ub-87
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ugwl90ufNYXHPA7DKd9lvX4MfIFuo/BcRpCGS6HC9+k=;
 b=GhIcjaPpXjOLDB+El/Rsd5XKZ3d3HPTrQ2PJKFf9/qfScKfehzSs8jztEd8GX/a3a4a5S5
 lIhTs1Hxr9as/lsEl77Z8NRPedi9VPVggUH29/0rloZtYYd6Ac09M89RjtF+KgHO6L2Amt
 boDV/h9cCfXR0EzXH1Eel/bLjh645pk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-1Vrux2g2NSWMOfFwx_RA4A-1; Thu, 23 Jan 2020 06:42:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA8D100551B
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:42:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E5CE10016E8
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:42:13 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 34/80] arm/xlnx-versal-virt: use memdev for RAM
Date: Thu, 23 Jan 2020 12:37:59 +0100
Message-Id: <1579779525-20065-35-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 1Vrux2g2NSWMOfFwx_RA4A-1
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
 hw/arm/xlnx-versal-virt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 462493c..c137ff4 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -30,7 +30,6 @@ typedef struct VersalVirt {
     MachineState parent_obj;
=20
     Versal soc;
-    MemoryRegion mr_ddr;
=20
     void *fdt;
     int fdt_size;
@@ -414,12 +413,9 @@ static void versal_virt_init(MachineState *machine)
         psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;
     }
=20
-    memory_region_allocate_system_memory(&s->mr_ddr, NULL, "ddr",
-                                         machine->ram_size);
-
     sysbus_init_child_obj(OBJECT(machine), "xlnx-ve", &s->soc,
                           sizeof(s->soc), TYPE_XLNX_VERSAL);
-    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->mr_ddr),
+    object_property_set_link(OBJECT(&s->soc), OBJECT(machine->ram),
                              "ddr", &error_abort);
     object_property_set_int(OBJECT(&s->soc), psci_conduit,
                             "psci-conduit", &error_abort);
@@ -473,6 +469,7 @@ static void versal_virt_machine_class_init(ObjectClass =
*oc, void *data)
     mc->max_cpus =3D XLNX_VERSAL_NR_ACPUS;
     mc->default_cpus =3D XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom =3D true;
+    mc->default_ram_id =3D "ddr";
 }
=20
 static const TypeInfo versal_virt_machine_init_typeinfo =3D {
--=20
2.7.4


