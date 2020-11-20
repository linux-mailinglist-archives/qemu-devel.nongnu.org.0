Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55212BBA5A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 00:49:23 +0100 (CET)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgG9a-0005nR-O9
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 18:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2z-00064k-FJ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:33 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:23082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgG2w-0003p3-6s
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 18:42:33 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-YmoUWXCHMnCSpOqAD4tUUw-1; Fri, 20 Nov 2020 18:42:18 -0500
X-MC-Unique: YmoUWXCHMnCSpOqAD4tUUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472CD8030A8;
 Fri, 20 Nov 2020 23:42:17 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D93260BFA;
 Fri, 20 Nov 2020 23:42:15 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Date: Sat, 21 Nov 2020 00:42:03 +0100
Message-Id: <20201120234208.683521-5-groug@kaod.org>
In-Reply-To: <20201120234208.683521-1-groug@kaod.org>
References: <20201120234208.683521-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When it comes to resetting the compat mode of the vCPUS, there are
two situations to consider:
(1) machine reset should set the compat mode back to the machine default,
    ie. spapr->max_compat_pvr
(2) hot plugged vCPUs should set their compat mode to mach the boot vCPU,
    ie. POWERPC_CPU(first_cpu)->compat_pvr

This is currently handled in two separate places: globally for all vCPUs
from the machine reset code for (1) and for each thread of a core from
the hotplug path for (2).

Since the machine reset code already resets all vCPUs, starting with boot
vCPU, consolidate the logic in spapr_reset_vcpu(). Special case the boot
vCPU so that it resets its compat mode back to the machine default. Any
other vCPU just need to match the compat mode of the boot vCPU.

Failing to set the compat mode during machine reset is a fatal error,
but not for hot plugged vCPUs. This is arguable because if we've been
able to set the boot vCPU compat mode at CAS or during machine reset,
it should definitely not fail for other vCPUs. Since spapr_reset_vcpu()
already has a fatal error path for kvm_check_mmu() failures, do the
same for ppc_set_compat().

This gets rid of an error path in spapr_core_plug(). It will allow
further simplifications.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c          | 16 ----------------
 hw/ppc/spapr_cpu_core.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f58f77389e8e..da7586f548df 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1606,8 +1606,6 @@ static void spapr_machine_reset(MachineState *machine=
)
     spapr_ovec_cleanup(spapr->ov5_cas);
     spapr->ov5_cas =3D spapr_ovec_new();
=20
-    ppc_set_compat_all(spapr->max_compat_pvr, &error_fatal);
-
     /*
      * This is fixing some of the default configuration of the XIVE
      * devices. To be called after the reset of the machine devices.
@@ -3785,20 +3783,6 @@ static void spapr_core_plug(HotplugHandler *hotplug_=
dev, DeviceState *dev,
=20
     core_slot->cpu =3D OBJECT(dev);
=20
-    /*
-     * Set compatibility mode to match the boot CPU, which was either set
-     * by the machine reset code or by CAS.
-     */
-    if (hotplugged) {
-        for (i =3D 0; i < cc->nr_threads; i++) {
-            if (ppc_set_compat(core->threads[i],
-                               POWERPC_CPU(first_cpu)->compat_pvr,
-                               errp) < 0) {
-                return;
-            }
-        }
-    }
-
     if (smc->pre_2_10_has_unused_icps) {
         for (i =3D 0; i < cc->nr_threads; i++) {
             cs =3D CPU(core->threads[i]);
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 2f7dc3c23ded..17741a3fb77f 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -27,6 +27,7 @@
=20
 static void spapr_reset_vcpu(PowerPCCPU *cpu)
 {
+    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
@@ -69,6 +70,18 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
     kvm_check_mmu(cpu, &error_fatal);
=20
     spapr_irq_cpu_intc_reset(spapr, cpu);
+
+    /*
+     * The boot CPU is only reset during machine reset : reset its
+     * compatibility mode to the machine default. For other CPUs,
+     * either cold plugged or hot plugged, set the compatibility mode
+     * to match the boot CPU, which was either set by the machine reset
+     * code or by CAS.
+     */
+    ppc_set_compat(cpu,
+                   cpu =3D=3D first_ppc_cpu ?
+                   spapr->max_compat_pvr : first_ppc_cpu->compat_pvr,
+                   &error_fatal);
 }
=20
 void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip,
--=20
2.26.2


