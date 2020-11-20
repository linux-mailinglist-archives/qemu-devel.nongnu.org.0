Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D92BB1B7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:49:32 +0100 (CET)
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAXL-0001mk-MD
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAUv-0008Qx-Oc
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:02 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:58736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kgAUt-000588-UW
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:47:01 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-WD4bcnprPv-SeQuirOs03g-1; Fri, 20 Nov 2020 12:46:56 -0500
X-MC-Unique: WD4bcnprPv-SeQuirOs03g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6FB1DDEE;
 Fri, 20 Nov 2020 17:46:54 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 926BF5C1D5;
 Fri, 20 Nov 2020 17:46:53 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 4/8] spapr/xive: Add "nr-ipis" property
Date: Fri, 20 Nov 2020 18:46:42 +0100
Message-Id: <20201120174646.619395-5-groug@kaod.org>
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

The sPAPR XIVE device exposes a range of LISNs that the guest uses
for IPIs. This range is currently sized according to the highest
vCPU id, ie. spapr_max_server_number(), as obtained from the machine
through the "nr_servers" argument of the generic spapr_irq_dt() call.

This makes sense for the "ibm,interrupt-server-ranges" property of
sPAPR XICS, but certainly not for "ibm,xive-lisn-ranges". The range
should be sized to the maximum number of possible vCPUs. It happens
that spapr_max_server_number() =3D=3D smp.max_cpus in practice with the
machine default settings. This might not be the case though when
VSMT is in use : we can end up with a much larger range (up to 8
times bigger) than needed and waste LISNs. But most importantly, this
lures people into thinking that IPI numbers are always equal to
vCPU ids, which is wrong and bit us recently:

https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg01476.html

Introduce an "nr-ipis" property that the machine sets to smp.max_cpus
before realizing the deice. Use that instead of "nr_servers" in
spapr_xive_dt(). Have the machine to claim the same number of IPIs
in spapr_irq_init().

This doesn't cause any guest visible change when using the machine
default settings (ie. VSMT =3D=3D smp.threads).

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_xive.h | 8 ++++++++
 hw/intc/spapr_xive.c        | 4 +++-
 hw/ppc/spapr_irq.c          | 4 +++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 7123ea07ed78..69b9fbc1b9a5 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -43,6 +43,14 @@ typedef struct SpaprXive {
=20
     /* DT */
     gchar *nodename;
+    /*
+     * The sPAPR XIVE device needs to know how many vCPUs it
+     * might be exposed to in order to size the IPI range in
+     * "ibm,interrupt-server-ranges". It is the purpose of the
+     * "nr-ipis" property which *must* be set to a non-null
+     * value before realizing the sPAPR XIVE device.
+     */
+    uint32_t nr_ipis;
=20
     /* Routing table */
     XiveEAS       *eat;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index e4dbf9c2c409..d13a2955ce9b 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -311,6 +311,7 @@ static void spapr_xive_realize(DeviceState *dev, Error =
**errp)
     /* Set by spapr_irq_init() */
     g_assert(xive->nr_irqs);
     g_assert(xive->nr_servers);
+    g_assert(xive->nr_ipis);
=20
     sxc->parent_realize(dev, &local_err);
     if (local_err) {
@@ -608,6 +609,7 @@ static Property spapr_xive_properties[] =3D {
      */
     DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
     DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
+    DEFINE_PROP_UINT32("nr-ipis", SpaprXive, nr_ipis, 0),
     DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BASE),
     DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BASE),
     DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
@@ -698,7 +700,7 @@ static void spapr_xive_dt(SpaprInterruptController *int=
c, uint32_t nr_servers,
     /* Interrupt number ranges for the IPIs */
     uint32_t lisn_ranges[] =3D {
         cpu_to_be32(SPAPR_IRQ_IPI),
-        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
+        cpu_to_be32(SPAPR_IRQ_IPI + xive->nr_ipis),
     };
     /*
      * EQ size - the sizes of pages supported by the system 4K, 64K,
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 8c5627225636..a0fc474ecb06 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -325,12 +325,14 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
=20
     if (spapr->irq->xive) {
         uint32_t nr_servers =3D spapr_max_server_number(spapr);
+        uint32_t max_cpus =3D MACHINE(spapr)->smp.max_cpus;
         DeviceState *dev;
         int i;
=20
         dev =3D qdev_new(TYPE_SPAPR_XIVE);
         qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_BA=
SE);
         qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
+        qdev_prop_set_uint32(dev, "nr-ipis", max_cpus);
         object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr)=
,
                                  &error_abort);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -338,7 +340,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **e=
rrp)
         spapr->xive =3D SPAPR_XIVE(dev);
=20
         /* Enable the CPU IPIs */
-        for (i =3D 0; i < nr_servers; ++i) {
+        for (i =3D 0; i < max_cpus; ++i) {
             SpaprInterruptControllerClass *sicc
                 =3D SPAPR_INTC_GET_CLASS(spapr->xive);
=20
--=20
2.26.2


