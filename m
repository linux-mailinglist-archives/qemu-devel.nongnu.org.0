Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AF14EFD3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:40:41 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYPQ-00065o-2t
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyX-0004jr-Rc
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyW-0004YQ-KP
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34896
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyW-0004XO-GI
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ugwl90ufNYXHPA7DKd9lvX4MfIFuo/BcRpCGS6HC9+k=;
 b=dcI7cEl0am2lqXuhvz5C00QSMFDHWOKVl9ur6KHrfS7kcKWD4FxcowfGKC01I6UGE8xyx+
 /l48sR0iRkFjJzNXMSMTzvtbG7jUeQ5dZoDuxueeEP734FNwrFBsWf8KPuYTOnaZB113Ty
 HelTNr4P73pJd5HTppXMcaSjP5E4HZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-CqBKt5qbMUihiIH_Lr15Ww-1; Fri, 31 Jan 2020 10:12:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80155107ACC5
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 065B486C4B
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/80] arm/xlnx-versal-virt: use memdev for RAM
Date: Fri, 31 Jan 2020 16:09:06 +0100
Message-Id: <1580483390-131164-37-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: CqBKt5qbMUihiIH_Lr15Ww-1
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


