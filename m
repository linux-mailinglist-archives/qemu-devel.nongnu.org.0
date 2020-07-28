Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E1230B82
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 15:31:21 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0PhQ-0006lR-6J
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 09:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k0Pg0-0005xD-9t
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 09:29:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23729
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k0Pfy-00015E-DH
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 09:29:51 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-eyU6gwVgOyml2gJWev25gQ-1; Tue, 28 Jul 2020 09:29:37 -0400
X-MC-Unique: eyU6gwVgOyml2gJWev25gQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 593EB100CEB6;
 Tue, 28 Jul 2020 13:29:36 +0000 (UTC)
Received: from bahia.lan (ovpn-112-26.ams2.redhat.com [10.36.112.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3134819C71;
 Tue, 28 Jul 2020 13:29:34 +0000 (UTC)
Subject: [PATCH v5 for-5.2] spapr: Use error_append_hint() in spapr_caps.c
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 28 Jul 2020 15:29:34 +0200
Message-ID: <159594297421.8262.14314530897345809924.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.31.120; envelope-from=groug@kaod.org;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:55:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a dedicated error API for hints. Use it instead of embedding
the hint in the error message, as recommanded in the "qapi/error.h"
header file.

While here, have cap_fwnmi_apply(), which already uses
error_append_hint(), to call ERRP_GUARD() as well.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
---
v5: same patch as v4 with an updated changelog (dropped misleading
    sentence about the need to use ERRP_GUARD) as suggested by Markus.

This is a replacement for commit ff9feac2a9291e9a7875ae289dfe7bc71abc2590
in the ppc-for-5.2 branch.
---
 hw/ppc/spapr_caps.c |   89 +++++++++++++++++++++++++++++------------------=
----
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 3225fc5a2edc..275f5bd0342c 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -180,24 +180,24 @@ static void spapr_cap_set_pagesize(Object *obj, Visit=
or *v, const char *name,
=20
 static void cap_htm_apply(SpaprMachineState *spapr, uint8_t val, Error **e=
rrp)
 {
+    ERRP_GUARD();
     if (!val) {
         /* TODO: We don't support disabling htm yet */
         return;
     }
     if (tcg_enabled()) {
-        error_setg(errp,
-                   "No Transactional Memory support in TCG,"
-                   " try appending -machine cap-htm=3Doff");
+        error_setg(errp, "No Transactional Memory support in TCG");
+        error_append_hint(errp, "Try appending -machine cap-htm=3Doff\n");
     } else if (kvm_enabled() && !kvmppc_has_cap_htm()) {
         error_setg(errp,
-"KVM implementation does not support Transactional Memory,"
-                   " try appending -machine cap-htm=3Doff"
-            );
+                   "KVM implementation does not support Transactional Memo=
ry");
+        error_append_hint(errp, "Try appending -machine cap-htm=3Doff\n");
     }
 }
=20
 static void cap_vsx_apply(SpaprMachineState *spapr, uint8_t val, Error **e=
rrp)
 {
+    ERRP_GUARD();
     PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
     CPUPPCState *env =3D &cpu->env;
=20
@@ -209,13 +209,14 @@ static void cap_vsx_apply(SpaprMachineState *spapr, u=
int8_t val, Error **errp)
      * rid of anything that doesn't do VMX */
     g_assert(env->insns_flags & PPC_ALTIVEC);
     if (!(env->insns_flags2 & PPC2_VSX)) {
-        error_setg(errp, "VSX support not available,"
-                   " try appending -machine cap-vsx=3Doff");
+        error_setg(errp, "VSX support not available");
+        error_append_hint(errp, "Try appending -machine cap-vsx=3Doff\n");
     }
 }
=20
 static void cap_dfp_apply(SpaprMachineState *spapr, uint8_t val, Error **e=
rrp)
 {
+    ERRP_GUARD();
     PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
     CPUPPCState *env =3D &cpu->env;
=20
@@ -224,8 +225,8 @@ static void cap_dfp_apply(SpaprMachineState *spapr, uin=
t8_t val, Error **errp)
         return;
     }
     if (!(env->insns_flags2 & PPC2_DFP)) {
-        error_setg(errp, "DFP support not available,"
-                   " try appending -machine cap-dfp=3Doff");
+        error_setg(errp, "DFP support not available");
+        error_append_hint(errp, "Try appending -machine cap-dfp=3Doff\n");
     }
 }
=20
@@ -239,6 +240,7 @@ SpaprCapPossible cap_cfpc_possible =3D {
 static void cap_safe_cache_apply(SpaprMachineState *spapr, uint8_t val,
                                  Error **errp)
 {
+    ERRP_GUARD();
     uint8_t kvm_val =3D  kvmppc_get_cap_safe_cache();
=20
     if (tcg_enabled() && val) {
@@ -247,9 +249,9 @@ static void cap_safe_cache_apply(SpaprMachineState *spa=
pr, uint8_t val,
                     cap_cfpc_possible.vals[val]);
     } else if (kvm_enabled() && (val > kvm_val)) {
         error_setg(errp,
-                   "Requested safe cache capability level not supported by=
 kvm,"
-                   " try appending -machine cap-cfpc=3D%s",
-                   cap_cfpc_possible.vals[kvm_val]);
+                   "Requested safe cache capability level not supported by=
 KVM");
+        error_append_hint(errp, "Try appending -machine cap-cfpc=3D%s\n",
+                          cap_cfpc_possible.vals[kvm_val]);
     }
 }
=20
@@ -263,6 +265,7 @@ SpaprCapPossible cap_sbbc_possible =3D {
 static void cap_safe_bounds_check_apply(SpaprMachineState *spapr, uint8_t =
val,
                                         Error **errp)
 {
+    ERRP_GUARD();
     uint8_t kvm_val =3D  kvmppc_get_cap_safe_bounds_check();
=20
     if (tcg_enabled() && val) {
@@ -271,9 +274,9 @@ static void cap_safe_bounds_check_apply(SpaprMachineSta=
te *spapr, uint8_t val,
                     cap_sbbc_possible.vals[val]);
     } else if (kvm_enabled() && (val > kvm_val)) {
         error_setg(errp,
-"Requested safe bounds check capability level not supported by kvm,"
-                   " try appending -machine cap-sbbc=3D%s",
-                   cap_sbbc_possible.vals[kvm_val]);
+"Requested safe bounds check capability level not supported by KVM");
+        error_append_hint(errp, "Try appending -machine cap-sbbc=3D%s\n",
+                          cap_sbbc_possible.vals[kvm_val]);
     }
 }
=20
@@ -290,6 +293,7 @@ SpaprCapPossible cap_ibs_possible =3D {
 static void cap_safe_indirect_branch_apply(SpaprMachineState *spapr,
                                            uint8_t val, Error **errp)
 {
+    ERRP_GUARD();
     uint8_t kvm_val =3D kvmppc_get_cap_safe_indirect_branch();
=20
     if (tcg_enabled() && val) {
@@ -298,9 +302,9 @@ static void cap_safe_indirect_branch_apply(SpaprMachine=
State *spapr,
                     cap_ibs_possible.vals[val]);
     } else if (kvm_enabled() && (val > kvm_val)) {
         error_setg(errp,
-"Requested safe indirect branch capability level not supported by kvm,"
-                   " try appending -machine cap-ibs=3D%s",
-                   cap_ibs_possible.vals[kvm_val]);
+"Requested safe indirect branch capability level not supported by KVM");
+        error_append_hint(errp, "Try appending -machine cap-ibs=3D%s\n",
+                          cap_ibs_possible.vals[kvm_val]);
     }
 }
=20
@@ -377,23 +381,25 @@ static void cap_hpt_maxpagesize_cpu_apply(SpaprMachin=
eState *spapr,
 static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
                                     uint8_t val, Error **errp)
 {
+    ERRP_GUARD();
     if (!val) {
         /* capability disabled by default */
         return;
     }
=20
     if (tcg_enabled()) {
-        error_setg(errp,
-                   "No Nested KVM-HV support in tcg,"
-                   " try appending -machine cap-nested-hv=3Doff");
+        error_setg(errp, "No Nested KVM-HV support in TCG");
+        error_append_hint(errp, "Try appending -machine cap-nested-hv=3Dof=
f\n");
     } else if (kvm_enabled()) {
         if (!kvmppc_has_cap_nested_kvm_hv()) {
             error_setg(errp,
-"KVM implementation does not support Nested KVM-HV,"
-                       " try appending -machine cap-nested-hv=3Doff");
+                       "KVM implementation does not support Nested KVM-HV"=
);
+            error_append_hint(errp,
+                              "Try appending -machine cap-nested-hv=3Doff\=
n");
         } else if (kvmppc_set_cap_nested_kvm_hv(val) < 0) {
-                error_setg(errp,
-"Error enabling cap-nested-hv with KVM, try cap-nested-hv=3Doff");
+                error_setg(errp, "Error enabling cap-nested-hv with KVM");
+                error_append_hint(errp,
+                                  "Try appending -machine cap-nested-hv=3D=
off\n");
         }
     }
 }
@@ -401,6 +407,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *=
spapr,
 static void cap_large_decr_apply(SpaprMachineState *spapr,
                                  uint8_t val, Error **errp)
 {
+    ERRP_GUARD();
     PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
=20
@@ -411,22 +418,23 @@ static void cap_large_decr_apply(SpaprMachineState *s=
papr,
     if (tcg_enabled()) {
         if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
-            error_setg(errp,
-                "Large decrementer only supported on POWER9, try -cpu POWE=
R9");
+            error_setg(errp, "Large decrementer only supported on POWER9")=
;
+            error_append_hint(errp, "Try -cpu POWER9\n");
             return;
         }
     } else if (kvm_enabled()) {
         int kvm_nr_bits =3D kvmppc_get_cap_large_decr();
=20
         if (!kvm_nr_bits) {
-            error_setg(errp,
-                       "No large decrementer support,"
-                        " try appending -machine cap-large-decr=3Doff");
+            error_setg(errp, "No large decrementer support");
+            error_append_hint(errp,
+                              "Try appending -machine cap-large-decr=3Doff=
\n");
         } else if (pcc->lrg_decr_bits !=3D kvm_nr_bits) {
             error_setg(errp,
-"KVM large decrementer size (%d) differs to model (%d),"
-                " try appending -machine cap-large-decr=3Doff",
-                kvm_nr_bits, pcc->lrg_decr_bits);
+                       "KVM large decrementer size (%d) differs to model (=
%d)",
+                       kvm_nr_bits, pcc->lrg_decr_bits);
+            error_append_hint(errp,
+                              "Try appending -machine cap-large-decr=3Doff=
\n");
         }
     }
 }
@@ -435,14 +443,15 @@ static void cap_large_decr_cpu_apply(SpaprMachineStat=
e *spapr,
                                      PowerPCCPU *cpu,
                                      uint8_t val, Error **errp)
 {
+    ERRP_GUARD();
     CPUPPCState *env =3D &cpu->env;
     target_ulong lpcr =3D env->spr[SPR_LPCR];
=20
     if (kvm_enabled()) {
         if (kvmppc_enable_cap_large_decr(cpu, val)) {
-            error_setg(errp,
-                       "No large decrementer support,"
-                       " try appending -machine cap-large-decr=3Doff");
+            error_setg(errp, "No large decrementer support");
+            error_append_hint(errp,
+                              "Try appending -machine cap-large-decr=3Doff=
\n");
         }
     }
=20
@@ -457,6 +466,7 @@ static void cap_large_decr_cpu_apply(SpaprMachineState =
*spapr,
 static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
                                  Error **errp)
 {
+    ERRP_GUARD();
     uint8_t kvm_val =3D kvmppc_get_cap_count_cache_flush_assist();
=20
     if (tcg_enabled() && val) {
@@ -479,14 +489,15 @@ static void cap_ccf_assist_apply(SpaprMachineState *s=
papr, uint8_t val,
             return;
         }
         error_setg(errp,
-"Requested count cache flush assist capability level not supported by kvm,=
"
-                   " try appending -machine cap-ccf-assist=3Doff");
+                   "Requested count cache flush assist capability level no=
t supported by KVM");
+        error_append_hint(errp, "Try appending -machine cap-ccf-assist=3Do=
ff\n");
     }
 }
=20
 static void cap_fwnmi_apply(SpaprMachineState *spapr, uint8_t val,
                                 Error **errp)
 {
+    ERRP_GUARD();
     if (!val) {
         return; /* Disabled by default */
     }



