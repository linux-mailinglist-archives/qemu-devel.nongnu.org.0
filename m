Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413D925D49
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJRN-0002q3-8T
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:05:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8y-0003Pt-PP
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ8w-0006jk-V2
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:24 -0400
Received: from ozlabs.org ([203.11.71.1]:44891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ8w-0006iB-Ak; Wed, 22 May 2019 00:46:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580Sy5RyDz9sPP; Wed, 22 May 2019 14:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500370;
	bh=LzYwwIlGfEvhgV7PTNG3ZY/kRSi2/VUEFH8zizDsTrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YiqLeVvmBzqHejnShb058rvwjs/FPh2G23qXIyYpT16bsvugSCwRXzTZF4DNOPrrg
	kz/x+XOEOhNXuTQp16HIsoLnRzC6kDCeK+WZoZvLU65ffqM++AT7wc6sf3enNntV/i
	LPi5UA2hElB//yhDY7p2t7GBrrccJCZmcPiIVL3U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:50 +1000
Message-Id: <20190522044600.16534-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 28/38] spapr/xive: introduce a VM state change
 handler
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

This handler is in charge of stabilizing the flow of event notifications
in the XIVE controller before migrating a guest. This is a requirement
before transferring the guest EQ pages to a destination.

When the VM is stopped, the handler sets the source PQs to PENDING to
stop the flow of events and to possibly catch a triggered interrupt
occuring while the VM is stopped. Their previous state is saved. The
XIVE controller is then synced through KVM to flush any in-flight
event notification and to stabilize the EQs. At this stage, the EQ
pages are marked dirty to make sure the EQ pages are transferred if a
migration sequence is in progress.

The previous configuration of the sources is restored when the VM
resumes, after a migration or a stop. If an interrupt was queued while
the VM was stopped, the handler simply generates the missing trigger.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20190513084245.25755-6-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c    | 96 ++++++++++++++++++++++++++++++++++++-
 include/hw/ppc/spapr_xive.h |  1 +
 2 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 8dd4f96e0b..735577a6f8 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -433,9 +433,100 @@ static void kvmppc_xive_get_queues(SpaprXive *xive,=
 Error **errp)
     }
 }
=20
+/*
+ * The primary goal of the XIVE VM change handler is to mark the EQ
+ * pages dirty when all XIVE event notifications have stopped.
+ *
+ * Whenever the VM is stopped, the VM change handler sets the source
+ * PQs to PENDING to stop the flow of events and to possibly catch a
+ * triggered interrupt occuring while the VM is stopped. The previous
+ * state is saved in anticipation of a migration. The XIVE controller
+ * is then synced through KVM to flush any in-flight event
+ * notification and stabilize the EQs.
+ *
+ * At this stage, we can mark the EQ page dirty and let a migration
+ * sequence transfer the EQ pages to the destination, which is done
+ * just after the stop state.
+ *
+ * The previous configuration of the sources is restored when the VM
+ * runs again. If an interrupt was queued while the VM was stopped,
+ * simply generate a trigger.
+ */
+static void kvmppc_xive_change_state_handler(void *opaque, int running,
+                                             RunState state)
+{
+    SpaprXive *xive =3D opaque;
+    XiveSource *xsrc =3D &xive->source;
+    Error *local_err =3D NULL;
+    int i;
+
+    /*
+     * Restore the sources to their initial state. This is called when
+     * the VM resumes after a stop or a migration.
+     */
+    if (running) {
+        for (i =3D 0; i < xsrc->nr_irqs; i++) {
+            uint8_t pq =3D xive_source_esb_get(xsrc, i);
+            uint8_t old_pq;
+
+            old_pq =3D xive_esb_read(xsrc, i, XIVE_ESB_SET_PQ_00 + (pq <=
< 8));
+
+            /*
+             * An interrupt was queued while the VM was stopped,
+             * generate a trigger.
+             */
+            if (pq =3D=3D XIVE_ESB_RESET && old_pq =3D=3D XIVE_ESB_QUEUE=
D) {
+                xive_esb_trigger(xsrc, i);
+            }
+        }
+
+        return;
+    }
+
+    /*
+     * Mask the sources, to stop the flow of event notifications, and
+     * save the PQs locally in the XiveSource object. The XiveSource
+     * state will be collected later on by its vmstate handler if a
+     * migration is in progress.
+     */
+    for (i =3D 0; i < xsrc->nr_irqs; i++) {
+        uint8_t pq =3D xive_esb_read(xsrc, i, XIVE_ESB_GET);
+
+        /*
+         * PQ is set to PENDING to possibly catch a triggered
+         * interrupt occuring while the VM is stopped (hotplug event
+         * for instance) .
+         */
+        if (pq !=3D XIVE_ESB_OFF) {
+            pq =3D xive_esb_read(xsrc, i, XIVE_ESB_SET_PQ_10);
+        }
+        xive_source_esb_set(xsrc, i, pq);
+    }
+
+    /*
+     * Sync the XIVE controller in KVM, to flush in-flight event
+     * notification that should be enqueued in the EQs and mark the
+     * XIVE EQ pages dirty to collect all updates.
+     */
+    kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_CTRL,
+                      KVM_DEV_XIVE_EQ_SYNC, NULL, true, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return;
+    }
+}
+
 void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp)
 {
-    kvmppc_xive_source_get_state(&xive->source);
+    /*
+     * When the VM is stopped, the sources are masked and the previous
+     * state is saved in anticipation of a migration. We should not
+     * synchronize the source state in that case else we will override
+     * the saved state.
+     */
+    if (runstate_is_running()) {
+        kvmppc_xive_source_get_state(&xive->source);
+    }
=20
     /* EAT: there is no extra state to query from KVM */
=20
@@ -515,6 +606,9 @@ void kvmppc_xive_connect(SpaprXive *xive, Error **err=
p)
                                       "xive.tima", tima_len, xive->tm_mm=
ap);
     sysbus_init_mmio(SYS_BUS_DEVICE(xive), &xive->tm_mmio);
=20
+    xive->change =3D qemu_add_vm_change_state_handler(
+        kvmppc_xive_change_state_handler, xive);
+
     kvm_kernel_irqchip =3D true;
     kvm_msi_via_irqfd_allowed =3D true;
     kvm_gsi_direct_mapping =3D true;
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index 7e49badd8c..734662c12a 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -42,6 +42,7 @@ typedef struct SpaprXive {
     /* KVM support */
     int           fd;
     void          *tm_mmap;
+    VMChangeStateEntry *change;
 } SpaprXive;
=20
 /*
--=20
2.21.0


