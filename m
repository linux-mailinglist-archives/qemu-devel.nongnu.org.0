Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11B313C7FE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:36:58 +0100 (CET)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkj3-0001ia-EC
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKT-0008PC-1u
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKR-00008j-Tw
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39995
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKR-00007o-Px
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WV1vSk+tjh6xNbYHYgEON0N9FleWECMsdzY10U96mGg=;
 b=czz3tLy2Li3j3cSzV4aACCvCT5fE2N2+NxqtsNGHa7G/ti8oacq9rhD2kazedxQii0ieK7
 BkF6vfz3/Hz0RXdUORwlVpwyOKm53GT7MFsF4Nu2C+OhXagP2h+Mivs5GGhDWcEDtBrU6U
 8EfFhN3Qov9BEIj/iHJMmkFFBhzXmXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-ThXDhk6KPdyyTljHtiNhxg-1; Wed, 15 Jan 2020 10:11:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D7F179DD5
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:11:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB60D19757
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:11:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/86] hw/hppa/machine: Map the PDC memory region with
 higher priority
Date: Wed, 15 Jan 2020 16:06:58 +0100
Message-Id: <1579100861-73692-44-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ThXDhk6KPdyyTljHtiNhxg-1
X-Mimecast-Spam-Score: 0
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

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The region in range [0xf0000000 - 0xf1000000] is the PDC area
(Processor Dependent Code), where the firmware is loaded.
This region has higher priority than the main memory.

When the machine has more than 3840MB of RAM, there is an
overlap. Since the PDC is closer to the CPU in the bus
hierarchy, it gets accessed first, and the CPU does not have
access to the RAM in this range.

To model the same behavior and keep a simple memory layout,
reduce the priority of the RAM region. The PDC region ends
overlapping the RAM.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/hppa/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 119ae4d..810e671 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -98,7 +98,7 @@ static void machine_hppa_init(MachineState *machine)
     ram_region =3D g_new(MemoryRegion, 1);
     memory_region_allocate_system_memory(ram_region, OBJECT(machine),
                                          "ram", ram_size);
-    memory_region_add_subregion(addr_space, 0, ram_region);
+    memory_region_add_subregion_overlap(addr_space, 0, ram_region, -1);
=20
     /* Init Dino (PCI host bus chip).  */
     pci_bus =3D dino_init(addr_space, &rtc_irq, &serial_irq);
--=20
2.7.4


