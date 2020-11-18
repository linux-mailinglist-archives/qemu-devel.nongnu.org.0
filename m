Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A42B806B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:29:37 +0100 (CET)
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPOq-0002VG-T2
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kfPN5-0000pM-T8
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:27:47 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kfPN3-00037y-TJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:27:47 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Wk2ffxToMq6dEBRxogK0aQ-1; Wed, 18 Nov 2020 10:27:41 -0500
X-MC-Unique: Wk2ffxToMq6dEBRxogK0aQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC9318B6145;
 Wed, 18 Nov 2020 15:27:39 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA78210016DB;
 Wed, 18 Nov 2020 15:27:37 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] Revert series "spapr/xive: Allocate vCPU IPIs from the
 vCPU contexts"
Date: Wed, 18 Nov 2020 16:26:39 +0100
Message-Id: <20201118152639.173860-2-groug@kaod.org>
In-Reply-To: <20201118152639.173860-1-groug@kaod.org>
References: <20201118152639.173860-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cedric Le Goater <clg@fr.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series was largely built on the assumption that IPI numbers are
numerically equal to vCPU ids. Even if this happens to be the case
in practice with the default machine settings, this ceases to be true
if VSMT is set to a different value than the number of vCPUs per core.
This causes bogus IPI numbers to be created in KVM from a guest stand
point. This leads to unknow results in the guest, including crashes
or missing vCPUs (see BugLink) and even non-fatal oopses in current
KVM that lacks a check before accessing misconfigured HW (see [1]).

A tentative patch was sent (see [2]) but it seems too complex to be
merged in an RC. Since the original changes are essentially an
optimization, it seems safer to revert them for now. The damage is
done by commit acbdb9956fe9 ("spapr/xive: Allocate IPIs independently
from the other sources") but the previous patches in the series are
really preparatory patches. So this reverts the whole series:

eab0a2d06e97 ("spapr/xive: Allocate vCPU IPIs from the vCPU contexts")
acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the other sourc=
es")
fa94447a2cd6 ("spapr/xive: Use kvmppc_xive_source_reset() in post_load")
235d3b116213 ("spapr/xive: Modify kvm_cpu_is_enabled() interface")

[1] https://marc.info/?l=3Dkvm-ppc&m=3D160458409722959&w=3D4
[2] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03626.html

Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Fixes: acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the othe=
r sources")
BugLink: https://bugs.launchpad.net/qemu/+bug/1900241
Signed-off-by: Greg Kurz <groug@kaod.org>
Acked-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <160554086275.1325084.12110142252189044646.stgit@bahia.lan>
---
 hw/intc/spapr_xive_kvm.c | 102 +++++++--------------------------------
 1 file changed, 18 insertions(+), 84 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 66bf4c06fe55..e8667ce5f621 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -36,9 +36,10 @@ typedef struct KVMEnabledCPU {
 static QLIST_HEAD(, KVMEnabledCPU)
     kvm_enabled_cpus =3D QLIST_HEAD_INITIALIZER(&kvm_enabled_cpus);
=20
-static bool kvm_cpu_is_enabled(unsigned long vcpu_id)
+static bool kvm_cpu_is_enabled(CPUState *cs)
 {
     KVMEnabledCPU *enabled_cpu;
+    unsigned long vcpu_id =3D kvm_arch_vcpu_id(cs);
=20
     QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
         if (enabled_cpu->vcpu_id =3D=3D vcpu_id) {
@@ -146,45 +147,6 @@ int kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx, =
Error **errp)
     return s.ret;
 }
=20
-/*
- * Allocate the vCPU IPIs from the vCPU context. This will allocate
- * the XIVE IPI interrupt on the chip on which the vCPU is running.
- * This gives a better distribution of IPIs when the guest has a lot
- * of vCPUs. When the vCPUs are pinned, this will make the IPI local
- * to the chip of the vCPU. It will reduce rerouting between interrupt
- * controllers and gives better performance.
- */
-typedef struct {
-    SpaprXive *xive;
-    Error *err;
-    int rc;
-} XiveInitIPI;
-
-static void kvmppc_xive_reset_ipi_on_cpu(CPUState *cs, run_on_cpu_data arg=
)
-{
-    unsigned long ipi =3D kvm_arch_vcpu_id(cs);
-    XiveInitIPI *s =3D arg.host_ptr;
-    uint64_t state =3D 0;
-
-    s->rc =3D kvm_device_access(s->xive->fd, KVM_DEV_XIVE_GRP_SOURCE, ipi,
-                              &state, true, &s->err);
-}
-
-static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, Error **er=
rp)
-{
-    XiveInitIPI s =3D {
-        .xive =3D xive,
-        .err  =3D NULL,
-        .rc   =3D 0,
-    };
-
-    run_on_cpu(cs, kvmppc_xive_reset_ipi_on_cpu, RUN_ON_CPU_HOST_PTR(&s));
-    if (s.err) {
-        error_propagate(errp, s.err);
-    }
-    return s.rc;
-}
-
 int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
 {
     ERRP_GUARD();
@@ -195,7 +157,7 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **err=
p)
     assert(xive->fd !=3D -1);
=20
     /* Check if CPU was hot unplugged and replugged. */
-    if (kvm_cpu_is_enabled(kvm_arch_vcpu_id(tctx->cs))) {
+    if (kvm_cpu_is_enabled(tctx->cs)) {
         return 0;
     }
=20
@@ -214,12 +176,6 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **er=
rp)
         return ret;
     }
=20
-    /* Create/reset the vCPU IPI */
-    ret =3D kvmppc_xive_reset_ipi(xive, tctx->cs, errp);
-    if (ret < 0) {
-        return ret;
-    }
-
     kvm_cpu_enable(tctx->cs);
     return 0;
 }
@@ -279,12 +235,6 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int=
 srcno, Error **errp)
=20
     assert(xive->fd !=3D -1);
=20
-    /*
-     * The vCPU IPIs are now allocated in kvmppc_xive_cpu_connect()
-     * and not with all sources in kvmppc_xive_source_reset()
-     */
-    assert(srcno >=3D SPAPR_XIRQ_BASE);
-
     if (xive_source_irq_is_lsi(xsrc, srcno)) {
         state |=3D KVM_XIVE_LEVEL_SENSITIVE;
         if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
@@ -296,28 +246,12 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, in=
t srcno, Error **errp)
                              true, errp);
 }
=20
-/*
- * To be valid, a source must have been claimed by the machine (valid
- * entry in the EAS table) and if it is a vCPU IPI, the vCPU should
- * have been enabled, which means the IPI has been allocated in
- * kvmppc_xive_cpu_connect().
- */
-static bool xive_source_is_valid(SpaprXive *xive, int i)
-{
-    return xive_eas_is_valid(&xive->eat[i]) &&
-        (i >=3D SPAPR_XIRQ_BASE || kvm_cpu_is_enabled(i));
-}
-
 static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
 {
     SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
     int i;
=20
-    /*
-     * Skip the vCPU IPIs. These are created/reset when the vCPUs are
-     * connected in kvmppc_xive_cpu_connect()
-     */
-    for (i =3D SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
+    for (i =3D 0; i < xsrc->nr_irqs; i++) {
         int ret;
=20
         if (!xive_eas_is_valid(&xive->eat[i])) {
@@ -399,7 +333,7 @@ static void kvmppc_xive_source_get_state(XiveSource *xs=
rc)
     for (i =3D 0; i < xsrc->nr_irqs; i++) {
         uint8_t pq;
=20
-        if (!xive_source_is_valid(xive, i)) {
+        if (!xive_eas_is_valid(&xive->eat[i])) {
             continue;
         }
=20
@@ -582,7 +516,7 @@ static void kvmppc_xive_change_state_handler(void *opaq=
ue, int running,
             uint8_t pq;
             uint8_t old_pq;
=20
-            if (!xive_source_is_valid(xive, i)) {
+            if (!xive_eas_is_valid(&xive->eat[i])) {
                 continue;
             }
=20
@@ -610,7 +544,7 @@ static void kvmppc_xive_change_state_handler(void *opaq=
ue, int running,
     for (i =3D 0; i < xsrc->nr_irqs; i++) {
         uint8_t pq;
=20
-        if (!xive_source_is_valid(xive, i)) {
+        if (!xive_eas_is_valid(&xive->eat[i])) {
             continue;
         }
=20
@@ -713,22 +647,22 @@ int kvmppc_xive_post_load(SpaprXive *xive, int versio=
n_id)
         }
     }
=20
-    /*
-     * We can only restore the source config if the source has been
-     * previously set in KVM. Since we don't do that at reset time
-     * when restoring a VM, let's do it now.
-     */
-    ret =3D kvmppc_xive_source_reset(&xive->source, &local_err);
-    if (ret < 0) {
-        goto fail;
-    }
-
     /* Restore the EAT */
     for (i =3D 0; i < xive->nr_irqs; i++) {
-        if (!xive_source_is_valid(xive, i)) {
+        if (!xive_eas_is_valid(&xive->eat[i])) {
             continue;
         }
=20
+        /*
+         * We can only restore the source config if the source has been
+         * previously set in KVM. Since we don't do that for all interrupt=
s
+         * at reset time anymore, let's do it now.
+         */
+        ret =3D kvmppc_xive_source_reset_one(&xive->source, i, &local_err)=
;
+        if (ret < 0) {
+            goto fail;
+        }
+
         ret =3D kvmppc_xive_set_source_config(xive, i, &xive->eat[i], &loc=
al_err);
         if (ret < 0) {
             goto fail;
--=20
2.26.2


