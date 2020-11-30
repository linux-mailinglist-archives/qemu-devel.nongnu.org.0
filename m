Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA352C89F4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:55:04 +0100 (CET)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmS7-00083g-9h
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kjmQM-0005sW-4x
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:53:14 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:47114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kjmQK-0004ql-6Y
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:53:13 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-NcvSXOTqM32ZwVn1mzMWdQ-1; Mon, 30 Nov 2020 11:53:05 -0500
X-MC-Unique: NcvSXOTqM32ZwVn1mzMWdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0450B10151E6;
 Mon, 30 Nov 2020 16:53:04 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0794660C64;
 Mon, 30 Nov 2020 16:53:02 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH for-6.0 v2 2/3] spapr/xive: Fix size of END table and number
 of claimed IPIs
Date: Mon, 30 Nov 2020 17:52:57 +0100
Message-Id: <20201130165258.744611-3-groug@kaod.org>
In-Reply-To: <20201130165258.744611-1-groug@kaod.org>
References: <20201130165258.744611-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sPAPR XIVE device has an internal ENDT table the size of
which is configurable by the machine. This table is supposed
to contain END structures for all possible vCPUs that may
enter the guest. The machine must also claim IPIs for all
possible vCPUs since this is expected by the guest.

spapr_irq_init() takes care of that under the assumption that
spapr_max_vcpu_ids() returns the number of possible vCPUs.
This happens to be the case when the VSMT mode is set to match
the number of threads per core in the guest (default behavior).
With non-default VSMT settings, this limit is > to the number
of vCPUs. In the worst case, we can end up allocating an 8 times
bigger ENDT and claiming 8 times more IPIs than needed. But more
importantly, this creates a confusion between number of vCPUs and
vCPU ids, which can lead to subtle bugs like [1].

Use smp.max_cpus instead of spapr_max_vcpu_ids() in
spapr_irq_init() for the latest machine type. Older machine
types continue to use spapr_max_vcpu_ids() since the size of
the ENDT is migration visible.

[1] https://bugs.launchpad.net/qemu/+bug/1900241

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h |  1 +
 hw/ppc/spapr.c         |  3 +++
 hw/ppc/spapr_irq.c     | 16 +++++++++++++---
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index dc99d45e2852..95bf210d0bf6 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -139,6 +139,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_0_xive_max_cpus;
=20
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,=20
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index ab59bfe941d0..227a926dfd48 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4530,8 +4530,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
+
     spapr_machine_6_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    smc->pre_6_0_xive_max_cpus =3D true;
 }
=20
 DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 552e30e93036..4d9ecd5d0af8 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -324,17 +324,27 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
     }
=20
     if (spapr->irq->xive) {
-        uint32_t max_vcpu_ids =3D spapr_max_vcpu_ids(spapr);
+        uint32_t max_cpus =3D MACHINE(spapr)->smp.max_cpus;
         DeviceState *dev;
         int i;
=20
+        /*
+         * Older machine types used to size the ENDT and IPI range
+         * according to the upper limit of vCPU ids, which can be
+         * higher than smp.max_cpus with custom VSMT settings. Keep
+         * the previous behavior for compatibility with such setups.
+         */
+        if (smc->pre_6_0_xive_max_cpus) {
+            max_cpus =3D spapr_max_vcpu_ids(spapr);
+        }
+
         dev =3D qdev_new(TYPE_SPAPR_XIVE);
         qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_BA=
SE);
         /*
          * 8 XIVE END structures per CPU. One for each available
          * priority
          */
-        qdev_prop_set_uint32(dev, "nr-ends", max_vcpu_ids << 3);
+        qdev_prop_set_uint32(dev, "nr-ends", max_cpus << 3);
         object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr)=
,
                                  &error_abort);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -342,7 +352,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **e=
rrp)
         spapr->xive =3D SPAPR_XIVE(dev);
=20
         /* Enable the CPU IPIs */
-        for (i =3D 0; i < max_vcpu_ids; ++i) {
+        for (i =3D 0; i < max_cpus; ++i) {
             SpaprInterruptControllerClass *sicc
                 =3D SPAPR_INTC_GET_CLASS(spapr->xive);
=20
--=20
2.26.2


