Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3325E2C52
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 10:38:56 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNYdz-0001Ov-GP
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 04:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKZ-0004vn-2c
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iNYKX-0005Lv-7T
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 04:18:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49623 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iNYKW-0005FO-Pm; Thu, 24 Oct 2019 04:18:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46zKrb69vtz9sSD; Thu, 24 Oct 2019 19:18:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571905119;
 bh=2GQELmF9NAz3E1thmQgh3U2TnmTQMJ3gjnRXnpahuIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xvsykxd6jwZn4ReHp/D4yUtr5IeKL8+irxtwHROhf9at1/Eh+gn3U5SKNnMNedmRm
 17xtJAViYO4VAaUnbx47gXR3/XrO4DRv93LhAhZyOnOYQFuxJCmq5rjngJF0SuTnB/
 IucIC4f/2ATIkni6i0ZNLKIITfhCYnqcTEIZB30s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 22/28] spapr: move CPU reset after presenter creation
Date: Thu, 24 Oct 2019 19:18:07 +1100
Message-Id: <20191024081813.2115-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024081813.2115-1-david@gibson.dropbear.id.au>
References: <20191024081813.2115-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

This change prepares ground for future changes which will reset the
interrupt presenter in the reset handler of the sPAPR and PowerNV
cores.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20191022163812.330-2-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_cpu_core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 3e4302c7d5..2b21285d20 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -234,13 +234,16 @@ static void spapr_realize_vcpu(PowerPCCPU *cpu, Spa=
prMachineState *spapr,
     cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
     kvmppc_set_papr(cpu);
=20
-    qemu_register_reset(spapr_cpu_reset, cpu);
-    spapr_cpu_reset(cpu);
-
     if (spapr_irq_cpu_intc_create(spapr, cpu, &local_err) < 0) {
-        goto error_unregister;
+        goto error_intc_create;
     }
=20
+    /*
+     * FIXME: Hot-plugged CPUs are not reset. Do it at realize.
+     */
+    qemu_register_reset(spapr_cpu_reset, cpu);
+    spapr_cpu_reset(cpu);
+
     if (!sc->pre_3_0_migration) {
         vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
                          cpu->machine_data);
@@ -248,8 +251,7 @@ static void spapr_realize_vcpu(PowerPCCPU *cpu, Spapr=
MachineState *spapr,
=20
     return;
=20
-error_unregister:
-    qemu_unregister_reset(spapr_cpu_reset, cpu);
+error_intc_create:
     cpu_remove_sync(CPU(cpu));
 error:
     error_propagate(errp, local_err);
--=20
2.21.0


