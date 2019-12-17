Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E470122398
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:23:50 +0100 (CET)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5Kn-0004y9-20
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4ir-0000rk-SU
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4iq-0006JT-Rp
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:44:37 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46691 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4iq-0005ql-Hw; Mon, 16 Dec 2019 23:44:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWX22l1z9sT1; Tue, 17 Dec 2019 15:43:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557816;
 bh=C8HKUXcfECjE3sXrMS4Qa0Rb0MODe28HXahNg2u1FYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KNHRyfEPGlseVZsr985epRYy4vFfO2ioRwHUlmVeFXSj4zwZIihF2na44zjOdNGs6
 b4z9OBuyKLxaV9DYtjmSkVns8T7hlL3kKlxgbA6nro0s+cIbgNEchSllmYdCjG0mfd
 xPdmgQrSfMTrO5cn4AvpBinzyVXKpeTd1Q2XtDz0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 31/88] ppc: Introduce a ppc_cpu_pir() helper
Date: Tue, 17 Dec 2019 15:42:25 +1100
Message-Id: <20191217044322.351838-32-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191125065820.927-6-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c         | 9 +++++++--
 include/hw/ppc/ppc.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 52a18eb7d7..8dd982fc1e 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1495,15 +1495,20 @@ void PPC_debug_write (void *opaque, uint32_t addr=
, uint32_t val)
     }
 }
=20
+int ppc_cpu_pir(PowerPCCPU *cpu)
+{
+    CPUPPCState *env =3D &cpu->env;
+    return env->spr_cb[SPR_PIR].default_value;
+}
+
 PowerPCCPU *ppc_get_vcpu_by_pir(int pir)
 {
     CPUState *cs;
=20
     CPU_FOREACH(cs) {
         PowerPCCPU *cpu =3D POWERPC_CPU(cs);
-        CPUPPCState *env =3D &cpu->env;
=20
-        if (env->spr_cb[SPR_PIR].default_value =3D=3D pir) {
+        if (ppc_cpu_pir(cpu) =3D=3D pir) {
             return cpu;
         }
     }
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 4bdcb8bacd..585be6ab98 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -5,6 +5,7 @@
=20
 void ppc_set_irq(PowerPCCPU *cpu, int n_IRQ, int level);
 PowerPCCPU *ppc_get_vcpu_by_pir(int pir);
+int ppc_cpu_pir(PowerPCCPU *cpu);
=20
 /* PowerPC hardware exceptions management helpers */
 typedef void (*clk_setup_cb)(void *opaque, uint32_t freq);
--=20
2.23.0


