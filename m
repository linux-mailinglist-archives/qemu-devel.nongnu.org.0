Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D22BB1BA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:50:50 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAYb-0003Gm-Jo
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAV4-0008UK-Ks
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAUw-00058h-Ur
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:10 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Wx5zvgiBNhq2AqZzyYiYSw-1; Fri, 20 Nov 2020 12:46:54 -0500
X-MC-Unique: Wx5zvgiBNhq2AqZzyYiYSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4634D80ED8A;
 Fri, 20 Nov 2020 17:46:53 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DA3B5C1D5;
 Fri, 20 Nov 2020 17:46:51 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 3/8] spapr/xive: Add "nr-servers" property
Date: Fri, 20 Nov 2020 18:46:41 +0100
Message-Id: <20201120174646.619395-4-groug@kaod.org>
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sPAPR XIVE object has an "nr-ends" property that is used
to size the END table. This property is set by the machine
code to a value derived from spapr_max_server_number().

spapr_max_server_number() is also used to inform the KVM XIVE
device about the range of vCPU ids it might be exposed to,
in order to optimize resource allocation in the HW.

This is enough motivation to introduce an "nr-servers" property
and to use it for both purposes. The existing "nr-ends" property
is now longer used. It is kept around though because it is exposed
to -global. It will continue to be ignored as before without
causing QEMU to exit.

The associated nr_ends field cannot be dropped from SpaprXive
because it is explicitly used by vmstate_spapr_xive(). It is
thus renamed to nr_ends_vmstate.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_xive.h | 16 +++++++++++++++-
 hw/intc/spapr_xive.c        | 28 ++++++++++++++++++++++------
 hw/ppc/spapr_irq.c          |  6 +-----
 3 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 4b967f13c030..7123ea07ed78 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -23,6 +23,16 @@
 typedef struct SpaprXive {
     XiveRouter    parent;
=20
+    /*
+     * The XIVE device needs to know the highest vCPU id it might
+     * be exposed to in order to size the END table. It may also
+     * propagate the value to the KVM XIVE device in order to
+     * optimize resource allocation in the HW.
+     * This must be set to a non-null value using the "nr-servers"
+     * property, before realizing the device.
+     */
+    uint32_t      nr_servers;
+
     /* Internal interrupt source for IPIs and virtual devices */
     XiveSource    source;
     hwaddr        vc_base;
@@ -38,7 +48,11 @@ typedef struct SpaprXive {
     XiveEAS       *eat;
     uint32_t      nr_irqs;
     XiveEND       *endt;
-    uint32_t      nr_ends;
+    /*
+     * This is derived from nr_servers but it must be kept around because
+     * vmstate_spapr_xive uses it.
+     */
+    uint32_t      nr_ends_vmstate;
=20
     /* TIMA mapping address */
     hwaddr        tm_base;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index f473ad9cba47..e4dbf9c2c409 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -99,6 +99,12 @@ int spapr_xive_end_to_target(uint8_t end_blk, uint32_t e=
nd_idx,
     return 0;
 }
=20
+/*
+ * 8 XIVE END structures per CPU. One for each available
+ * priority
+ */
+#define spapr_xive_cpu_end_idx(vcpu, prio) (((vcpu) << 3) + prio)
+
 static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, uint8_t prio,
                                   uint8_t *out_end_blk, uint32_t *out_end_=
idx)
 {
@@ -109,7 +115,7 @@ static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, uint=
8_t prio,
     }
=20
     if (out_end_idx) {
-        *out_end_idx =3D (cpu->vcpu_id << 3) + prio;
+        *out_end_idx =3D spapr_xive_cpu_end_idx(cpu->vcpu_id, prio);
     }
 }
=20
@@ -290,7 +296,8 @@ static void spapr_xive_instance_init(Object *obj)
=20
 uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
 {
-    return xive->nr_ends;
+    g_assert(xive->nr_servers);
+    return spapr_xive_cpu_end_idx(xive->nr_servers, 0);
 }
=20
 static void spapr_xive_realize(DeviceState *dev, Error **errp)
@@ -303,7 +310,7 @@ static void spapr_xive_realize(DeviceState *dev, Error =
**errp)
=20
     /* Set by spapr_irq_init() */
     g_assert(xive->nr_irqs);
-    g_assert(xive->nr_ends);
+    g_assert(xive->nr_servers);
=20
     sxc->parent_realize(dev, &local_err);
     if (local_err) {
@@ -360,6 +367,8 @@ static void spapr_xive_realize(DeviceState *dev, Error =
**errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
     sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
     sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
+
+    xive->nr_ends_vmstate =3D spapr_xive_nr_ends(xive);
 }
=20
 static int spapr_xive_get_eas(XiveRouter *xrtr, uint8_t eas_blk,
@@ -547,7 +556,7 @@ static const VMStateDescription vmstate_spapr_xive =3D =
{
         VMSTATE_UINT32_EQUAL(nr_irqs, SpaprXive, NULL),
         VMSTATE_STRUCT_VARRAY_POINTER_UINT32(eat, SpaprXive, nr_irqs,
                                      vmstate_spapr_xive_eas, XiveEAS),
-        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends,
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends_vmst=
ate,
                                              vmstate_spapr_xive_end, XiveE=
ND),
         VMSTATE_END_OF_LIST()
     },
@@ -591,7 +600,14 @@ static void spapr_xive_free_irq(SpaprInterruptControll=
er *intc, int lisn)
=20
 static Property spapr_xive_properties[] =3D {
     DEFINE_PROP_UINT32("nr-irqs", SpaprXive, nr_irqs, 0),
-    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends, 0),
+    /*
+     * "nr-ends" is deprecated by "nr-servers" since QEMU 6.0.
+     * It is just kept around because it is exposed to the user
+     * through -global and we don't want it to fail, even if
+     * the value is actually overridden internally.
+     */
+    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
+    DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
     DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BASE),
     DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BASE),
     DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
@@ -742,7 +758,7 @@ static int spapr_xive_activate(SpaprInterruptController=
 *intc,
     SpaprXive *xive =3D SPAPR_XIVE(intc);
=20
     if (kvm_enabled()) {
-        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, nr_server=
s,
+        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, xive->nr_=
servers,
                                     errp);
         if (rc < 0) {
             return rc;
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index f59960339ec3..8c5627225636 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -330,11 +330,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **=
errp)
=20
         dev =3D qdev_new(TYPE_SPAPR_XIVE);
         qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_BA=
SE);
-        /*
-         * 8 XIVE END structures per CPU. One for each available
-         * priority
-         */
-        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
+        qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
         object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr)=
,
                                  &error_abort);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
--=20
2.26.2


