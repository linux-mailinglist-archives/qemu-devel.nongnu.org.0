Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACA29E57
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 20:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUFEw-0000ML-8O
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 14:48:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFCR-0007It-8W
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFCQ-0006cu-4Z
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hUFCP-0006Ug-V7
	for qemu-devel@nongnu.org; Fri, 24 May 2019 14:45:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED34C58E5C;
	Fri, 24 May 2019 18:45:41 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D75C19C6A;
	Fri, 24 May 2019 18:45:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Fri, 24 May 2019 15:44:42 -0300
Message-Id: <20190524184447.16678-13-ehabkost@redhat.com>
In-Reply-To: <20190524184447.16678-1-ehabkost@redhat.com>
References: <20190524184447.16678-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 24 May 2019 18:45:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 12/17] hw/microblaze/zynqmp: Move the IPI state
 into the PMUSoC state
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The Inter Processor Interrupt is a block part of the SoC, not the
"machine" (talking about machine is borderline with the PMU, since
it is embedded into the ZynqMP SoC, but currentl QEMU doesn't
support multi-arch cores).

Move the IPI state to the SoC state, this will simplify the review
of the next patch.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190507163416.24647-12-philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
index 57dc1ccd42..eba9945c19 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -55,6 +55,7 @@ typedef struct XlnxZynqMPPMUSoCState {
     /*< public >*/
     MicroBlazeCPU cpu;
     XlnxPMUIOIntc intc;
+    XlnxZynqMPIPI ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
 }  XlnxZynqMPPMUSoCState;
=20
=20
@@ -144,7 +145,6 @@ static void xlnx_zynqmp_pmu_init(MachineState *machin=
e)
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *pmu_rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *pmu_ram =3D g_new(MemoryRegion, 1);
-    XlnxZynqMPIPI *ipi[XLNX_ZYNQMP_PMU_NUM_IPIS];
     qemu_irq irq[32];
     int i;
=20
@@ -172,16 +172,16 @@ static void xlnx_zynqmp_pmu_init(MachineState *mach=
ine)
=20
     /* Create and connect the IPI device */
     for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
-        ipi[i] =3D g_new0(XlnxZynqMPIPI, 1);
-        object_initialize(ipi[i], sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQM=
P_IPI);
-        qdev_set_parent_bus(DEVICE(ipi[i]), sysbus_get_default());
+        object_initialize(&pmu->ipi[i], sizeof(XlnxZynqMPIPI),
+                          TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(&pmu->ipi[i]), sysbus_get_default());
     }
=20
     for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
-        object_property_set_bool(OBJECT(ipi[i]), true, "realized",
+        object_property_set_bool(OBJECT(&pmu->ipi[i]), true, "realized",
                                  &error_abort);
-        sysbus_mmio_map(SYS_BUS_DEVICE(ipi[i]), 0, ipi_addr[i]);
-        sysbus_connect_irq(SYS_BUS_DEVICE(ipi[i]), 0, irq[ipi_irq[i]]);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, irq[ipi_irq[=
i]]);
     }
=20
     /* Load the kernel */
--=20
2.18.0.rc1.1.g3f1ff2140


