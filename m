Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B42D4790
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:11:32 +0100 (CET)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2zz-0006Pv-US
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2pz-0006Th-8m
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:11 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2pw-0000qa-VB
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:10 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-7YL6mpyEP3KxcjVP4aScNA-1; Wed, 09 Dec 2020 12:01:04 -0500
X-MC-Unique: 7YL6mpyEP3KxcjVP4aScNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2BFE803627;
 Wed,  9 Dec 2020 17:01:02 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8BDF5D6CF;
 Wed,  9 Dec 2020 17:01:01 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/ppc: Add mce_req_event() handler to
 PPCVirtualHypervisorClass
Date: Wed,  9 Dec 2020 18:00:52 +0100
Message-Id: <20201209170052.1431440-7-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_handle_nmi() directly calls spapr_mce_req_event() which is machine
level code. Apart from being ugly, this forces spapr_mce_req_event()
to rely on qdev_get_machine() to get a pointer to the machine state.
This is a bit unfortunate since POWER CPUs have a backlink to the
virtual hypervisor, which happens to be the machine itself with
sPAPR.

Turn spapr_mce_req_event() into a PPC virtual hypervisor operation,
and adapt kvm_handle_nmi() to call it as such.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h | 3 ++-
 target/ppc/cpu.h       | 2 ++
 hw/ppc/spapr.c         | 1 +
 hw/ppc/spapr_events.c  | 5 +++--
 target/ppc/kvm.c       | 9 +++++++--
 5 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index e0f10f252c08..476c5b809794 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -852,7 +852,8 @@ void spapr_clear_pending_hotplug_events(SpaprMachineSta=
te *spapr);
 int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
-void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
+void spapr_mce_req_event(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                         bool recovered);
 bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr);
=20
 /* DRC callbacks. */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e4082ed8..5bac68aec826 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1219,6 +1219,8 @@ struct PPCVirtualHypervisorClass {
     target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
     void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
+    void (*mce_req_event)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                          bool recovered);
 };
=20
 #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index aca7d7af283a..09fc605f11ba 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4441,6 +4441,7 @@ static void spapr_machine_class_init(ObjectClass *oc,=
 void *data)
     vhc->encode_hpt_for_kvm_pr =3D spapr_encode_hpt_for_kvm_pr;
     vhc->cpu_exec_enter =3D spapr_cpu_exec_enter;
     vhc->cpu_exec_exit =3D spapr_cpu_exec_exit;
+    vhc->mce_req_event =3D spapr_mce_req_event;
     xic->ics_get =3D spapr_ics_get;
     xic->ics_resend =3D spapr_ics_resend;
     xic->icp_get =3D spapr_icp_get;
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 3f37b49fd8ad..8e988eb939da 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -868,9 +868,10 @@ static void spapr_mce_dispatch_elog(SpaprMachineState =
*spapr, PowerPCCPU *cpu,
     ppc_cpu_do_fwnmi_machine_check(cs, spapr->fwnmi_machine_check_addr);
 }
=20
-void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
+void spapr_mce_req_event(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                         bool recovered)
 {
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
+    SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
     CPUState *cs =3D CPU(cpu);
     int ret;
     Error *local_err =3D NULL;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index daf690a67820..ba6edf178a39 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2816,10 +2816,15 @@ int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run =
*run)
 {
     uint16_t flags =3D run->flags & KVM_RUN_PPC_NMI_DISP_MASK;
=20
-    cpu_synchronize_state(CPU(cpu));
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc =3D
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
=20
-    spapr_mce_req_event(cpu, flags =3D=3D KVM_RUN_PPC_NMI_DISP_FULLY_RECOV=
);
+        cpu_synchronize_state(CPU(cpu));
=20
+        vhc->mce_req_event(cpu->vhyp, cpu,
+                           flags =3D=3D KVM_RUN_PPC_NMI_DISP_FULLY_RECOV);
+    }
     return 0;
 }
 #endif
--=20
2.26.2


