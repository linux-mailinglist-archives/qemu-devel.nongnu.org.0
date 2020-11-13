Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43B2B1E66
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:16:19 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdaoE-00077C-9s
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kdamX-0006S1-7p
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:14:33 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kdamQ-00026V-QM
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:14:32 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-qKkJvsY5NIuXPcDmjRnMTw-1; Fri, 13 Nov 2020 10:14:14 -0500
X-MC-Unique: qKkJvsY5NIuXPcDmjRnMTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3755E1075621;
 Fri, 13 Nov 2020 15:14:13 +0000 (UTC)
Received: from bahia.lan (ovpn-112-64.ams2.redhat.com [10.36.112.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 393A655785;
 Fri, 13 Nov 2020 15:14:10 +0000 (UTC)
Subject: [PATCH for-5.2] spapr/xive: Create IPIs in KVM on demand
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Date: Fri, 13 Nov 2020 16:14:10 +0100
Message-ID: <160528045027.804522.6161091782230763832.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 10:14:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Satheesh Rajendran <sathnaga@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent commit acbdb9956fe9 introduced a dedicated path to create
IPIs in KVM. This is done from under kvmppc_xive_cpu_connect() with
the assumption that the IPI number is equal to the vCPU id. The
latter is wrong: the guest chooses an arbitrary LISN from the
"ibm,xive-lisn-ranges" and assigns it to a target vCPU with the
H_INT_SET_SOURCE_CONFIG hcall. This went unnoticed so far because
IPI numbers and vCPU ids happen to match by default. This is no
longer the case though when setting the VSMT machine property to
a value that is different from (ie. bigger than) the number of
vCPUs per core (ie. -smp threads). Wrong IPIs end up being created
in KVM but the guest still uses the ones it has allocated and gets
very confused (see BugLink below).

Fix this by creating the IPI at the only place where we have
its appropriate number : when the guest allocates it with the
H_INT_SET_SOURCE_CONFIG hcall. We detect this is an IPI because
it is < SPAPR_XIRQ_BASE and we get the vCPU id from the hcall
arguments. The EAS of the IPI is tracked in the kvm_enabled_cpus
list. It is now used instead of vcpu_id to filter unallocated IPIs
out in xive_source_is_valid(). It also allows to only reset the
IPI on the first call to H_INT_SET_SOURCE_CONFIG.

Restore unmasked IPIs from the vCPU contexts in kvmppc_xive_post_load().
Masked ones will be created when the guests eventually unmask them
with H_INT_SET_SOURCE_CONFIG.

Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Fixes: acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the othe=
r sources")
BugLink: https://bugs.launchpad.net/qemu/+bug/1900241
Cc: clg@kaod.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/spapr_xive_kvm.c |  141 +++++++++++++++++++++++++++++++++++++++++-=
----
 1 file changed, 127 insertions(+), 14 deletions(-)

diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 66bf4c06fe55..4e5871c3aac2 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -30,6 +30,7 @@
  */
 typedef struct KVMEnabledCPU {
     unsigned long vcpu_id;
+    XiveEAS *ipi_eas;
     QLIST_ENTRY(KVMEnabledCPU) node;
 } KVMEnabledCPU;
=20
@@ -55,6 +56,7 @@ static void kvm_cpu_enable(CPUState *cs)
=20
     enabled_cpu =3D g_malloc(sizeof(*enabled_cpu));
     enabled_cpu->vcpu_id =3D vcpu_id;
+    enabled_cpu->ipi_eas =3D NULL;
     QLIST_INSERT_HEAD(&kvm_enabled_cpus, enabled_cpu, node);
 }
=20
@@ -156,26 +158,29 @@ int kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx,=
 Error **errp)
  */
 typedef struct {
     SpaprXive *xive;
+    uint32_t lisn;
     Error *err;
     int rc;
 } XiveInitIPI;
=20
 static void kvmppc_xive_reset_ipi_on_cpu(CPUState *cs, run_on_cpu_data arg=
)
 {
-    unsigned long ipi =3D kvm_arch_vcpu_id(cs);
     XiveInitIPI *s =3D arg.host_ptr;
+    unsigned long ipi =3D s->lisn;
     uint64_t state =3D 0;
=20
     s->rc =3D kvm_device_access(s->xive->fd, KVM_DEV_XIVE_GRP_SOURCE, ipi,
                               &state, true, &s->err);
 }
=20
-static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, Error **er=
rp)
+static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, uint32_t l=
isn,
+                                 Error **errp)
 {
     XiveInitIPI s =3D {
         .xive =3D xive,
         .err  =3D NULL,
         .rc   =3D 0,
+        .lisn =3D lisn,
     };
=20
     run_on_cpu(cs, kvmppc_xive_reset_ipi_on_cpu, RUN_ON_CPU_HOST_PTR(&s));
@@ -214,12 +219,6 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **er=
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
@@ -228,6 +227,62 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **er=
rp)
  * XIVE Interrupt Source (KVM)
  */
=20
+static bool spapr_xive_is_ipi(uint32_t lisn)
+{
+    return lisn < SPAPR_XIRQ_BASE;
+}
+
+static bool kvm_ipi_is_enabled(SpaprXive *xive, uint32_t lisn)
+{
+    KVMEnabledCPU *enabled_cpu;
+
+    g_assert(spapr_xive_is_ipi(lisn));
+
+    QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
+        if (enabled_cpu->ipi_eas =3D=3D &xive->eat[lisn]) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static int kvm_ipi_enable(SpaprXive *xive, uint32_t lisn, uint32_t vcpu_id=
,
+                          Error **errp)
+{
+    KVMEnabledCPU *enabled_cpu;
+
+    g_assert(spapr_xive_is_ipi(lisn));
+
+    QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
+        if (enabled_cpu->vcpu_id =3D=3D vcpu_id) {
+            CPUState *cs =3D CPU(spapr_find_cpu(vcpu_id));
+            XiveEAS *eas =3D &xive->eat[lisn];
+
+            /* No change ? */
+            if (enabled_cpu->ipi_eas && enabled_cpu->ipi_eas =3D=3D eas) {
+                return 0;
+            }
+
+            /* XXX: abort ? */
+            if (!cs) {
+                break;
+            }
+
+            /* Create/reset the vCPU IPI */
+            int ret =3D kvmppc_xive_reset_ipi(xive, cs, lisn, errp);
+            if (ret < 0) {
+                return ret;
+            }
+
+            enabled_cpu->ipi_eas =3D eas;
+            return 0;
+        }
+    }
+
+    error_setg(errp, "vCPU #%d not found", vcpu_id);
+    return -ESRCH;
+}
+
 int kvmppc_xive_set_source_config(SpaprXive *xive, uint32_t lisn, XiveEAS =
*eas,
                                   Error **errp)
 {
@@ -248,6 +303,14 @@ int kvmppc_xive_set_source_config(SpaprXive *xive, uin=
t32_t lisn, XiveEAS *eas,
=20
     spapr_xive_end_to_target(end_blk, end_idx, &server, &priority);
=20
+    if (spapr_xive_is_ipi(lisn)) {
+        /* Create the vCPU IPI */
+        int ret =3D kvm_ipi_enable(xive, lisn, server, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     kvm_src =3D priority << KVM_XIVE_SOURCE_PRIORITY_SHIFT &
         KVM_XIVE_SOURCE_PRIORITY_MASK;
     kvm_src |=3D server << KVM_XIVE_SOURCE_SERVER_SHIFT &
@@ -280,7 +343,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int =
srcno, Error **errp)
     assert(xive->fd !=3D -1);
=20
     /*
-     * The vCPU IPIs are now allocated in kvmppc_xive_cpu_connect()
+     * The vCPU IPIs are now allocated in kvmppc_xive_set_source_config()
      * and not with all sources in kvmppc_xive_source_reset()
      */
     assert(srcno >=3D SPAPR_XIRQ_BASE);
@@ -300,12 +363,12 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, in=
t srcno, Error **errp)
  * To be valid, a source must have been claimed by the machine (valid
  * entry in the EAS table) and if it is a vCPU IPI, the vCPU should
  * have been enabled, which means the IPI has been allocated in
- * kvmppc_xive_cpu_connect().
+ * kvmppc_xive_set_source_config().
  */
 static bool xive_source_is_valid(SpaprXive *xive, int i)
 {
     return xive_eas_is_valid(&xive->eat[i]) &&
-        (i >=3D SPAPR_XIRQ_BASE || kvm_cpu_is_enabled(i));
+        (!spapr_xive_is_ipi(i) || kvm_ipi_is_enabled(xive, i));
 }
=20
 static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
@@ -314,8 +377,8 @@ static int kvmppc_xive_source_reset(XiveSource *xsrc, E=
rror **errp)
     int i;
=20
     /*
-     * Skip the vCPU IPIs. These are created/reset when the vCPUs are
-     * connected in kvmppc_xive_cpu_connect()
+     * Skip the vCPU IPIs. These are created/reset on-demand in
+     * kvmppc_xive_set_source_config().
      */
     for (i =3D SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
         int ret;
@@ -724,7 +787,57 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version=
_id)
     }
=20
     /* Restore the EAT */
-    for (i =3D 0; i < xive->nr_irqs; i++) {
+
+    /* IPIs are restored from the appropriate vCPU context */
+    CPU_FOREACH(cs) {
+        /*
+         * The EAT has valid entries to accomodate all possible vCPUs,
+         * but we only want to allocate in KVM the IPIs that were
+         * actually allocated before migration. Let's consider the full
+         * list of IPIs to find an EAS that matches the vCPU id.
+         *
+         * If an IPI appears unmasked in the EAT, it is a proof that the
+         * guest did successfully call H_INT_SET_SOURCE_CONFIG and we
+         * should thus create the IPI at the KVM level if the END index
+         * matches the vCPU id.
+         *
+         * If an IPI appears masked in the EAT, then we don't know exactly
+         * what happened before migration but we don't care. The IPI will
+         * be created when the guest eventually unmasks it with a subseque=
nt
+         * call to H_INT_SET_SOURCE_CONFIG.
+         */
+        for (i =3D 0; i < SPAPR_XIRQ_BASE; i++) {
+            XiveEAS *eas =3D &xive->eat[i];
+            uint32_t end_idx;
+            uint32_t end_blk;
+            uint8_t priority;
+            uint32_t server;
+
+            if (!xive_eas_is_valid(eas)) {
+                continue;
+            }
+
+            if (xive_eas_is_masked(eas)) {
+                continue;
+            }
+
+            end_idx =3D xive_get_field64(EAS_END_INDEX, eas->w);
+            end_blk =3D xive_get_field64(EAS_END_BLOCK, eas->w);
+            spapr_xive_end_to_target(end_blk, end_idx, &server, &priority)=
;
+            if (server !=3D kvm_arch_vcpu_id(cs)) {
+                continue;
+            }
+
+            ret =3D kvmppc_xive_set_source_config(xive, i, eas, &local_err=
);
+            if (ret < 0) {
+                goto fail;
+            }
+            break;
+        }
+    }
+
+    /* Now restore non-IPIs */
+    for (i =3D SPAPR_XIRQ_BASE; i < xive->nr_irqs; i++) {
         if (!xive_source_is_valid(xive, i)) {
             continue;
         }



