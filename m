Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC2E2C98
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:52:23 +0200 (CEST)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYr0-00046p-Hz
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKu-0005cw-Ab
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKs-0005x2-63
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:19:12 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53191 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iNYKq-0005F9-Mg; Thu, 24 Oct 2019 04:19:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46zKrb5BH3z9sS3; Thu, 24 Oct 2019 19:18:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571905119;
 bh=Jy7FCp7Yn0XLreGhMwXC3M/9n37BHJsLOVJc7ykVS3o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m4hAIxE06FkIc5jenwxT3unfIYYlZ5gsGHjhn720zHEd7QcNZRH77Ly3lhdpOJlmM
 yRlt1htyoiylPSmbf8/WKILU1YxRaw5nQKQDzzoz7lSyps/vLW1/3K+QRvfbN2cC3k
 l5ZsQsDvbO0c9xwZPLhkpgrGrRCWwSup9ARwZV2o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 24/28] ppc/pnv: Introduce a PnvCore reset handler
Date: Thu, 24 Oct 2019 19:18:09 +1100
Message-Id: <20191024081813.2115-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024081813.2115-1-david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

in which individual CPUs are reset. It will ease the introduction of
future change reseting the interrupt presenter from the CPU reset
handler.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20191022163812.330-4-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index b1a7489e7a..9f981a4940 100644
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


