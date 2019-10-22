Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D25E09E4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 18:58:46 +0200 (CEST)
Received: from localhost ([::1]:36445 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMxUb-00065Q-ET
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 12:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iMxBm-0001Mk-BZ
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iMxBl-0006oU-6u
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:39:18 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:34113)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iMxBl-0006ns-0B
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:39:17 -0400
Received: from player688.ha.ovh.net (unknown [10.109.143.18])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 20B871B01B9
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 18:39:15 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 1D9E2B32C394;
 Tue, 22 Oct 2019 16:39:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v5 3/7] ppc/pnv: Introduce a PnvCore reset handler
Date: Tue, 22 Oct 2019 18:38:08 +0200
Message-Id: <20191022163812.330-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022163812.330-1-clg@kaod.org>
References: <20191022163812.330-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3509148538540035046
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.48.182
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

in which individual CPUs are reset. It will ease the introduction of
future change reseting the interrupt presenter from the CPU reset
handler.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/pnv_core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index b1a7489e7abf..9f981a4940e6 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -40,9 +40,8 @@ static const char *pnv_core_cpu_typename(PnvCore *pc)
     return cpu_type;
 }
=20
-static void pnv_cpu_reset(void *opaque)
+static void pnv_core_cpu_reset(PowerPCCPU *cpu)
 {
-    PowerPCCPU *cpu =3D opaque;
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
@@ -192,8 +191,17 @@ static void pnv_realize_vcpu(PowerPCCPU *cpu, PnvChi=
p *chip, Error **errp)
=20
     /* Set time-base frequency to 512 MHz */
     cpu_ppc_tb_init(env, PNV_TIMEBASE_FREQ);
+}
+
+static void pnv_core_reset(void *dev)
+{
+    CPUCore *cc =3D CPU_CORE(dev);
+    PnvCore *pc =3D PNV_CORE(dev);
+    int i;
=20
-    qemu_register_reset(pnv_cpu_reset, cpu);
+    for (i =3D 0; i < cc->nr_threads; i++) {
+        pnv_core_cpu_reset(pc->threads[i]);
+    }
 }
=20
 static void pnv_core_realize(DeviceState *dev, Error **errp)
@@ -244,6 +252,8 @@ static void pnv_core_realize(DeviceState *dev, Error =
**errp)
     snprintf(name, sizeof(name), "xscom-core.%d", cc->core_id);
     pnv_xscom_region_init(&pc->xscom_regs, OBJECT(dev), pcc->xscom_ops,
                           pc, name, PNV_XSCOM_EX_SIZE);
+
+    qemu_register_reset(pnv_core_reset, pc);
     return;
=20
 err:
@@ -259,7 +269,6 @@ static void pnv_unrealize_vcpu(PowerPCCPU *cpu)
 {
     PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
=20
-    qemu_unregister_reset(pnv_cpu_reset, cpu);
     object_unparent(OBJECT(pnv_cpu_state(cpu)->intc));
     cpu_remove_sync(CPU(cpu));
     cpu->machine_data =3D NULL;
@@ -273,6 +282,8 @@ static void pnv_core_unrealize(DeviceState *dev, Erro=
r **errp)
     CPUCore *cc =3D CPU_CORE(dev);
     int i;
=20
+    qemu_unregister_reset(pnv_core_reset, pc);
+
     for (i =3D 0; i < cc->nr_threads; i++) {
         pnv_unrealize_vcpu(pc->threads[i]);
     }
--=20
2.21.0


