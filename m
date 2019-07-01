Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8D2D6A5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVtF6-00022Z-A7
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:43:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQU-0000O6-5s
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQS-0002tK-KM
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:51:06 -0400
Received: from ozlabs.org ([203.11.71.1]:59449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQS-0002r0-2l; Wed, 29 May 2019 02:51:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv66W1kz9sPY; Wed, 29 May 2019 16:50:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112626;
	bh=16AGf39GQvUUOXsFzfzt0lmFBK2V4jWCzoJOCtOAvXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AW7VrtUPZajnwGmMU7rTCstEbUogi1cGLQdXI+poZJsiqON4g9FQM3HKT1OCrEgX+
	D+yl6Fz+PGQnvz9a8MbuLG9lXwK8kPLHomJfiLjezY9mAIuNpIvdUNpPBsb6mQLWuE
	0qSrJiXRzAHVLeEB8iXASsx7tkxwol5tnSl7dTdE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:50:07 +1000
Message-Id: <20190529065017.15149-35-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 34/44] spapr: check for the activation of the
 KVM IRQ device
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
	David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

The activation of the KVM IRQ device depends on the interrupt mode
chosen at CAS time by the machine and some methods used at reset or by
the migration need to be protected.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190513084245.25755-11-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive_kvm.c | 33 +++++++++++++++++++++++++++++++++
 hw/intc/xics_kvm.c       | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 259cd1db95..078d18d775 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -90,9 +90,15 @@ static void kvmppc_xive_cpu_set_state(XiveTCTX *tctx, =
Error **errp)
=20
 void kvmppc_xive_cpu_get_state(XiveTCTX *tctx, Error **errp)
 {
+    SpaprXive *xive =3D SPAPR_MACHINE(qdev_get_machine())->xive;
     uint64_t state[2] =3D { 0 };
     int ret;
=20
+    /* The KVM XIVE device is not in use */
+    if (xive->fd =3D=3D -1) {
+        return;
+    }
+
     ret =3D kvm_get_one_reg(tctx->cs, KVM_REG_PPC_VP_STATE, state);
     if (ret !=3D 0) {
         error_setg_errno(errp, errno,
@@ -143,6 +149,11 @@ void kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error *=
*errp)
     unsigned long vcpu_id;
     int ret;
=20
+    /* The KVM XIVE device is not in use */
+    if (xive->fd =3D=3D -1) {
+        return;
+    }
+
     /* Check if CPU was hot unplugged and replugged. */
     if (kvm_cpu_is_enabled(tctx->cs)) {
         return;
@@ -219,6 +230,11 @@ void kvmppc_xive_source_reset_one(XiveSource *xsrc, =
int srcno, Error **errp)
     SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     uint64_t state =3D 0;
=20
+    /* The KVM XIVE device is not in use */
+    if (xive->fd =3D=3D -1) {
+        return;
+    }
+
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
         state |=3D KVM_XIVE_LEVEL_SENSITIVE;
         if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
@@ -319,9 +335,13 @@ static void kvmppc_xive_source_get_state(XiveSource =
*xsrc)
 void kvmppc_xive_source_set_irq(void *opaque, int srcno, int val)
 {
     XiveSource *xsrc =3D opaque;
+    SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     struct kvm_irq_level args;
     int rc;
=20
+    /* The KVM XIVE device should be in use */
+    assert(xive->fd !=3D -1);
+
     args.irq =3D srcno;
     if (!xive_source_irq_is_lsi(xsrc, srcno)) {
         if (!val) {
@@ -546,6 +566,11 @@ static void kvmppc_xive_change_state_handler(void *o=
paque, int running,
=20
 void kvmppc_xive_synchronize_state(SpaprXive *xive, Error **errp)
 {
+    /* The KVM XIVE device is not in use */
+    if (xive->fd =3D=3D -1) {
+        return;
+    }
+
     /*
      * When the VM is stopped, the sources are masked and the previous
      * state is saved in anticipation of a migration. We should not
@@ -571,6 +596,11 @@ int kvmppc_xive_pre_save(SpaprXive *xive)
 {
     Error *local_err =3D NULL;
=20
+    /* The KVM XIVE device is not in use */
+    if (xive->fd =3D=3D -1) {
+        return 0;
+    }
+
     /* EAT: there is no extra state to query from KVM */
=20
     /* ENDT */
@@ -595,6 +625,9 @@ int kvmppc_xive_post_load(SpaprXive *xive, int versio=
n_id)
     CPUState *cs;
     int i;
=20
+    /* The KVM XIVE device should be in use */
+    assert(xive->fd !=3D -1);
+
     /* Restore the ENDT first. The targetting depends on it. */
     for (i =3D 0; i < xive->nr_ends; i++) {
         if (!xive_end_is_valid(&xive->endt[i])) {
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 1185846ff1..12bd5190cf 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -69,6 +69,11 @@ void icp_get_kvm_state(ICPState *icp)
     uint64_t state;
     int ret;
=20
+    /* The KVM XICS device is not in use */
+    if (kernel_xics_fd =3D=3D -1) {
+        return;
+    }
+
     /* ICP for this CPU thread is not in use, exiting */
     if (!icp->cs) {
         return;
@@ -105,6 +110,11 @@ int icp_set_kvm_state(ICPState *icp)
     uint64_t state;
     int ret;
=20
+    /* The KVM XICS device is not in use */
+    if (kernel_xics_fd =3D=3D -1) {
+        return 0;
+    }
+
     /* ICP for this CPU thread is not in use, exiting */
     if (!icp->cs) {
         return 0;
@@ -133,8 +143,9 @@ void icp_kvm_realize(DeviceState *dev, Error **errp)
     unsigned long vcpu_id;
     int ret;
=20
+    /* The KVM XICS device is not in use */
     if (kernel_xics_fd =3D=3D -1) {
-        abort();
+        return;
     }
=20
     cs =3D icp->cs;
@@ -170,6 +181,11 @@ void ics_get_kvm_state(ICSState *ics)
     uint64_t state;
     int i;
=20
+    /* The KVM XICS device is not in use */
+    if (kernel_xics_fd =3D=3D -1) {
+        return;
+    }
+
     for (i =3D 0; i < ics->nr_irqs; i++) {
         ICSIRQState *irq =3D &ics->irqs[i];
=20
@@ -230,6 +246,11 @@ int ics_set_kvm_state_one(ICSState *ics, int srcno)
     ICSIRQState *irq =3D &ics->irqs[srcno];
     int ret;
=20
+    /* The KVM XICS device is not in use */
+    if (kernel_xics_fd =3D=3D -1) {
+        return 0;
+    }
+
     state =3D irq->server;
     state |=3D (uint64_t)(irq->saved_priority & KVM_XICS_PRIORITY_MASK)
         << KVM_XICS_PRIORITY_SHIFT;
@@ -269,6 +290,11 @@ int ics_set_kvm_state(ICSState *ics)
 {
     int i;
=20
+    /* The KVM XICS device is not in use */
+    if (kernel_xics_fd =3D=3D -1) {
+        return 0;
+    }
+
     for (i =3D 0; i < ics->nr_irqs; i++) {
         int ret;
=20
@@ -286,6 +312,9 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int va=
l)
     struct kvm_irq_level args;
     int rc;
=20
+    /* The KVM XICS device should be in use */
+    assert(kernel_xics_fd !=3D -1);
+
     args.irq =3D srcno + ics->offset;
     if (ics->irqs[srcno].flags & XICS_FLAGS_IRQ_MSI) {
         if (!val) {
--=20
2.21.0


