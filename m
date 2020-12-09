Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E45F2D47BF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:22:26 +0100 (CET)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3AX-0001WA-Kp
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q9-0006h9-SG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:21 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:50879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q0-0000pf-TZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:21 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-9WOFJV-4PX2tqYjZCRBPng-1; Wed, 09 Dec 2020 12:00:57 -0500
X-MC-Unique: 9WOFJV-4PX2tqYjZCRBPng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42454803620;
 Wed,  9 Dec 2020 17:00:56 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 978535D6BA;
 Wed,  9 Dec 2020 17:00:54 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
Date: Wed,  9 Dec 2020 18:00:47 +0100
Message-Id: <20201209170052.1431440-2-groug@kaod.org>
In-Reply-To: <20201209170052.1431440-1-groug@kaod.org>
References: <20201209170052.1431440-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sPAPR CPU core device can only work with pseries machine types.
This is currently checked in the realize function with a dynamic
cast of qdev_get_machine(). Some other places also need to reach
out to the machine using qdev_get_machine().

Make this dependency explicit by introducing an "spapr" link
property which officialy points to the machine. This link is
set by pseries machine types only in the pre-plug handler. This
allows to drop some users of qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_cpu_core.h |  2 ++
 hw/ppc/spapr.c                  |  4 ++++
 hw/ppc/spapr_cpu_core.c         | 17 +++++++----------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_cor=
e.h
index dab3dfc76c0a..0969b29fd96c 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -10,6 +10,7 @@
 #define HW_SPAPR_CPU_CORE_H
=20
 #include "hw/cpu/core.h"
+#include "hw/ppc/spapr.h"
 #include "hw/qdev-core.h"
 #include "target/ppc/cpu-qom.h"
 #include "target/ppc/cpu.h"
@@ -24,6 +25,7 @@ OBJECT_DECLARE_TYPE(SpaprCpuCore, SpaprCpuCoreClass,
 struct SpaprCpuCore {
     /*< private >*/
     CPUCore parent_obj;
+    SpaprMachineState *spapr;
=20
     /*< public >*/
     PowerPCCPU **threads;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d1dcf3ab2c94..4cc51723c62e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3816,6 +3816,10 @@ static void spapr_core_pre_plug(HotplugHandler *hotp=
lug_dev, DeviceState *dev,
     int index;
     unsigned int smp_threads =3D machine->smp.threads;
=20
+    /* Required by spapr_cpu_core_realize() */
+    object_property_set_link(OBJECT(dev), "spapr", OBJECT(hotplug_dev),
+                             &error_abort);
+
     if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
         error_setg(errp, "CPU hotplug not supported for this machine");
         return;
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 2f7dc3c23ded..dec09367e4a0 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -25,14 +25,13 @@
 #include "sysemu/hw_accel.h"
 #include "qemu/error-report.h"
=20
-static void spapr_reset_vcpu(PowerPCCPU *cpu)
+static void spapr_reset_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
     target_ulong lpcr;
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
=20
     cpu_reset(cs);
=20
@@ -186,7 +185,7 @@ static void spapr_unrealize_vcpu(PowerPCCPU *cpu, Spapr=
CpuCore *sc)
     if (!sc->pre_3_0_migration) {
         vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_da=
ta);
     }
-    spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
+    spapr_irq_cpu_intc_destroy(sc->spapr, cpu);
     qdev_unrealize(DEVICE(cpu));
 }
=20
@@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *dev)
     int i;
=20
     for (i =3D 0; i < cc->nr_threads; i++) {
-        spapr_reset_vcpu(sc->threads[i]);
+        spapr_reset_vcpu(sc->threads[i], sc->spapr);
     }
 }
=20
@@ -314,16 +313,12 @@ err:
=20
 static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
 {
-    /* We don't use SPAPR_MACHINE() in order to exit gracefully if the use=
r
-     * tries to add a sPAPR CPU core to a non-pseries machine.
-     */
-    SpaprMachineState *spapr =3D
-        (SpaprMachineState *) object_dynamic_cast(qdev_get_machine(),
-                                                  TYPE_SPAPR_MACHINE);
     SpaprCpuCore *sc =3D SPAPR_CPU_CORE(OBJECT(dev));
+    SpaprMachineState *spapr =3D sc->spapr;
     CPUCore *cc =3D CPU_CORE(OBJECT(dev));
     int i;
=20
+    /* Set in spapr_core_pre_plug() */
     if (!spapr) {
         error_setg(errp, TYPE_SPAPR_CPU_CORE " needs a pseries machine");
         return;
@@ -345,6 +340,8 @@ static Property spapr_cpu_core_properties[] =3D {
     DEFINE_PROP_INT32("node-id", SpaprCpuCore, node_id, CPU_UNSET_NUMA_NOD=
E_ID),
     DEFINE_PROP_BOOL("pre-3.0-migration", SpaprCpuCore, pre_3_0_migration,
                      false),
+    DEFINE_PROP_LINK("spapr", SpaprCpuCore, spapr, TYPE_SPAPR_MACHINE,
+                     SpaprMachineState *),
     DEFINE_PROP_END_OF_LIST()
 };
=20
--=20
2.26.2


