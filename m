Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148FDCC90
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 19:24:14 +0200 (CEST)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLVz3-0003NK-0E
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 13:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iLVxb-00024d-1L
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iLVxZ-0007j0-4e
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:22:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8998
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iLVxY-0007iU-Uv
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:22:41 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9IHJFxK110636
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 13:22:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vqetxy1mj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 13:22:39 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <clg@kaod.org>;
 Fri, 18 Oct 2019 18:22:37 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 18 Oct 2019 18:22:35 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9IHM27l22872368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 17:22:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A29CDA405B;
 Fri, 18 Oct 2019 17:22:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8475EA4054;
 Fri, 18 Oct 2019 17:22:34 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Oct 2019 17:22:34 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-27-7.uk.ibm.com [9.145.27.7])
 by smtp.tls.ibm.com (Postfix) with ESMTP id EC15D2201F3;
 Fri, 18 Oct 2019 19:22:33 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 1/2] spapr: Introduce a interrupt presenter reset handler
Date: Fri, 18 Oct 2019 19:22:18 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018172219.10039-1-clg@kaod.org>
References: <20191018172219.10039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19101817-4275-0000-0000-00000373623C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101817-4276-0000-0000-000038867F25
Message-Id: <20191018172219.10039-2-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=8 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=973 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910180154
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id x9IHJFxK110636
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The interrupt presenters are created by a machine handler at the core
level and are reseted independently. This is not consistent and it
raises some issues when it comes to handle hot-plugged CPUs. These are
reseted from the realize handler of the core and the presenters are
not. This is less of an issue in XICS, although a zero MFFR could be a
concern, but in XIVE, the OS CAM line is not set and this breaks the
presenting algorithm. The current code has workarounds which need a
global cleanup.

Extend the sPAPR IRQ backend with a new cpu_intc_reset() handler which
will be called by the CPU reset handler and remove the XiveTCTX reset
handler which is redundant.

spapr_realize_vcpu() is modified to call the CPU reset only after the
intc presenter has been created.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 The change of order of the CPU reset and the intc creation could be
 in its own patch for bisect. This is fragile.
=20
 include/hw/ppc/spapr_irq.h |  2 ++
 include/hw/ppc/xics.h      |  1 +
 include/hw/ppc/xive.h      |  1 +
 hw/intc/spapr_xive.c       |  7 +++++++
 hw/intc/xics.c             |  8 ++------
 hw/intc/xics_spapr.c       |  7 +++++++
 hw/intc/xive.c             | 12 +-----------
 hw/ppc/spapr_cpu_core.c    | 14 ++++++++++----
 hw/ppc/spapr_irq.c         | 14 ++++++++++++++
 9 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
index 5e150a667902..09232999b07e 100644
--- a/include/hw/ppc/spapr_irq.h
+++ b/include/hw/ppc/spapr_irq.h
@@ -52,6 +52,7 @@ typedef struct SpaprInterruptControllerClass {
      */
     int (*cpu_intc_create)(SpaprInterruptController *intc,
                             PowerPCCPU *cpu, Error **errp);
+    void (*cpu_intc_reset)(SpaprInterruptController *intc, PowerPCCPU *c=
pu);
     int (*claim_irq)(SpaprInterruptController *intc, int irq, bool lsi,
                      Error **errp);
     void (*free_irq)(SpaprInterruptController *intc, int irq);
@@ -68,6 +69,7 @@ void spapr_irq_update_active_intc(SpaprMachineState *sp=
apr);
=20
 int spapr_irq_cpu_intc_create(SpaprMachineState *spapr,
                               PowerPCCPU *cpu, Error **errp);
+void spapr_irq_cpu_intc_reset(SpaprMachineState *spapr, PowerPCCPU *cpu)=
;
 void spapr_irq_print_info(SpaprMachineState *spapr, Monitor *mon);
 void spapr_irq_dt(SpaprMachineState *spapr, uint32_t nr_servers,
                   void *fdt, uint32_t phandle);
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 1e6a9300eb2b..602173c12250 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -161,6 +161,7 @@ void icp_set_mfrr(ICPState *icp, uint8_t mfrr);
 uint32_t icp_accept(ICPState *ss);
 uint32_t icp_ipoll(ICPState *ss, uint32_t *mfrr);
 void icp_eoi(ICPState *icp, uint32_t xirr);
+void icp_reset(ICPState *icp);
=20
 void ics_write_xive(ICSState *ics, int nr, int server,
                     uint8_t priority, uint8_t saved_priority);
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index fd3319bd3202..99381639f50c 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -415,6 +415,7 @@ uint64_t xive_tctx_tm_read(XiveTCTX *tctx, hwaddr off=
set, unsigned size);
=20
 void xive_tctx_pic_print_info(XiveTCTX *tctx, Monitor *mon);
 Object *xive_tctx_create(Object *cpu, XiveRouter *xrtr, Error **errp);
+void xive_tctx_reset(XiveTCTX *tctx);
=20
 static inline uint32_t xive_nvt_cam_line(uint8_t nvt_blk, uint32_t nvt_i=
dx)
 {
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index ba32d2cc5b0f..258b1c5fb5ff 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -553,6 +553,12 @@ static int spapr_xive_cpu_intc_create(SpaprInterrupt=
Controller *intc,
     return 0;
 }
=20
+static void spapr_xive_cpu_intc_reset(SpaprInterruptController *intc,
+                                     PowerPCCPU *cpu)
+{
+    xive_tctx_reset(spapr_cpu_state(cpu)->tctx);
+}
+
 static void spapr_xive_set_irq(SpaprInterruptController *intc, int irq, =
int val)
 {
     SpaprXive *xive =3D SPAPR_XIVE(intc);
@@ -697,6 +703,7 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     sicc->activate =3D spapr_xive_activate;
     sicc->deactivate =3D spapr_xive_deactivate;
     sicc->cpu_intc_create =3D spapr_xive_cpu_intc_create;
+    sicc->cpu_intc_reset =3D spapr_xive_cpu_intc_reset;
     sicc->claim_irq =3D spapr_xive_claim_irq;
     sicc->free_irq =3D spapr_xive_free_irq;
     sicc->set_irq =3D spapr_xive_set_irq;
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index b5ac408f7b74..6da05763f9db 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -274,10 +274,8 @@ static const VMStateDescription vmstate_icp_server =3D=
 {
     },
 };
=20
-static void icp_reset_handler(void *dev)
+void icp_reset(ICPState *icp)
 {
-    ICPState *icp =3D ICP(dev);
-
     icp->xirr =3D 0;
     icp->pending_priority =3D 0xff;
     icp->mfrr =3D 0xff;
@@ -288,7 +286,7 @@ static void icp_reset_handler(void *dev)
     if (kvm_irqchip_in_kernel()) {
         Error *local_err =3D NULL;
=20
-        icp_set_kvm_state(ICP(dev), &local_err);
+        icp_set_kvm_state(icp, &local_err);
         if (local_err) {
             error_report_err(local_err);
         }
@@ -351,7 +349,6 @@ static void icp_realize(DeviceState *dev, Error **err=
p)
         }
     }
=20
-    qemu_register_reset(icp_reset_handler, dev);
     vmstate_register(NULL, icp->cs->cpu_index, &vmstate_icp_server, icp)=
;
 }
=20
@@ -360,7 +357,6 @@ static void icp_unrealize(DeviceState *dev, Error **e=
rrp)
     ICPState *icp =3D ICP(dev);
=20
     vmstate_unregister(NULL, &vmstate_icp_server, icp);
-    qemu_unregister_reset(icp_reset_handler, dev);
 }
=20
 static void icp_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
index 4f64b9a9fc66..7418fb9f370c 100644
--- a/hw/intc/xics_spapr.c
+++ b/hw/intc/xics_spapr.c
@@ -346,6 +346,12 @@ static int xics_spapr_cpu_intc_create(SpaprInterrupt=
Controller *intc,
     return 0;
 }
=20
+static void xics_spapr_cpu_intc_reset(SpaprInterruptController *intc,
+                                     PowerPCCPU *cpu)
+{
+    icp_reset(spapr_cpu_state(cpu)->icp);
+}
+
 static int xics_spapr_claim_irq(SpaprInterruptController *intc, int irq,
                                 bool lsi, Error **errp)
 {
@@ -433,6 +439,7 @@ static void ics_spapr_class_init(ObjectClass *klass, =
void *data)
     sicc->activate =3D xics_spapr_activate;
     sicc->deactivate =3D xics_spapr_deactivate;
     sicc->cpu_intc_create =3D xics_spapr_cpu_intc_create;
+    sicc->cpu_intc_reset =3D xics_spapr_cpu_intc_reset;
     sicc->claim_irq =3D xics_spapr_claim_irq;
     sicc->free_irq =3D xics_spapr_free_irq;
     sicc->set_irq =3D xics_spapr_set_irq;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index d420c6571e14..f066be5eb5e3 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -547,10 +547,8 @@ void xive_tctx_pic_print_info(XiveTCTX *tctx, Monito=
r *mon)
     }
 }
=20
-static void xive_tctx_reset(void *dev)
+void xive_tctx_reset(XiveTCTX *tctx)
 {
-    XiveTCTX *tctx =3D XIVE_TCTX(dev);
-
     memset(tctx->regs, 0, sizeof(tctx->regs));
=20
     /* Set some defaults */
@@ -607,13 +605,6 @@ static void xive_tctx_realize(DeviceState *dev, Erro=
r **errp)
             return;
         }
     }
-
-    qemu_register_reset(xive_tctx_reset, dev);
-}
-
-static void xive_tctx_unrealize(DeviceState *dev, Error **errp)
-{
-    qemu_unregister_reset(xive_tctx_reset, dev);
 }
=20
 static int vmstate_xive_tctx_pre_save(void *opaque)
@@ -668,7 +659,6 @@ static void xive_tctx_class_init(ObjectClass *klass, =
void *data)
=20
     dc->desc =3D "XIVE Interrupt Thread Context";
     dc->realize =3D xive_tctx_realize;
-    dc->unrealize =3D xive_tctx_unrealize;
     dc->vmsd =3D &vmstate_xive_tctx;
     /*
      * Reason: part of XIVE interrupt controller, needs to be wired up
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 3e4302c7d596..d04baa7cde4f 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -33,6 +33,7 @@ static void spapr_cpu_reset(void *opaque)
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
     target_ulong lpcr;
+    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
=20
     cpu_reset(cs);
=20
@@ -77,9 +78,11 @@ static void spapr_cpu_reset(void *opaque)
     spapr_cpu->dtl_addr =3D 0;
     spapr_cpu->dtl_size =3D 0;
=20
-    spapr_caps_cpu_apply(SPAPR_MACHINE(qdev_get_machine()), cpu);
+    spapr_caps_cpu_apply(spapr, cpu);
=20
     kvm_check_mmu(cpu, &error_fatal);
+
+    spapr_irq_cpu_intc_reset(spapr, cpu);
 }
=20
 void spapr_cpu_set_entry_state(PowerPCCPU *cpu, target_ulong nip, target=
_ulong r3)
@@ -234,13 +237,16 @@ static void spapr_realize_vcpu(PowerPCCPU *cpu, Spa=
prMachineState *spapr,
     cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
     kvmppc_set_papr(cpu);
=20
-    qemu_register_reset(spapr_cpu_reset, cpu);
-    spapr_cpu_reset(cpu);
-
     if (spapr_irq_cpu_intc_create(spapr, cpu, &local_err) < 0) {
         goto error_unregister;
     }
=20
+    /*
+     * Hot-plugged CPUs are not reseted. Do it here.
+     */
+    qemu_register_reset(spapr_cpu_reset, cpu);
+    spapr_cpu_reset(cpu);
+
     if (!sc->pre_3_0_migration) {
         vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
                          cpu->machine_data);
diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
index 234d1073e518..b941608b69ba 100644
--- a/hw/ppc/spapr_irq.c
+++ b/hw/ppc/spapr_irq.c
@@ -220,6 +220,20 @@ int spapr_irq_cpu_intc_create(SpaprMachineState *spa=
pr,
     return 0;
 }
=20
+void spapr_irq_cpu_intc_reset(SpaprMachineState *spapr, PowerPCCPU *cpu)
+{
+    SpaprInterruptController *intcs[] =3D ALL_INTCS(spapr);
+    int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(intcs); i++) {
+        SpaprInterruptController *intc =3D intcs[i];
+        if (intc) {
+            SpaprInterruptControllerClass *sicc =3D SPAPR_INTC_GET_CLASS=
(intc);
+            sicc->cpu_intc_reset(intc, cpu);
+        }
+    }
+}
+
 static void spapr_set_irq(void *opaque, int irq, int level)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(opaque);
--=20
2.21.0


