Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BC4B538A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:41:29 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcXe-0002cp-I4
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:41:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nJc5r-0001e6-2D; Mon, 14 Feb 2022 09:12:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nJc5o-00056h-Ts; Mon, 14 Feb 2022 09:12:42 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ECrlu7031221; 
 Mon, 14 Feb 2022 14:12:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785t3me1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:12:05 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21ECjj7D015273;
 Mon, 14 Feb 2022 14:12:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e785t3mcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:12:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EE7nZx029039;
 Mon, 14 Feb 2022 14:12:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9p6c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:12:02 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EEC0je39846298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 14:12:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC276AE05A;
 Mon, 14 Feb 2022 14:11:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A28AAE057;
 Mon, 14 Feb 2022 14:11:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 14:11:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C4BC32201DE;
 Mon, 14 Feb 2022 15:11:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] ppc/spapr: Advertise StoreEOI for POWER10 compat guests
Date: Mon, 14 Feb 2022 15:11:57 +0100
Message-Id: <20220214141157.3800212-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SZoJbD9UP5xZHoR0gzrck4K1hg6-9op4
X-Proofpoint-ORIG-GUID: mMMc6ivUYCX_fCWEqnrxxz0UyxMi0OLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=783
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140086
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an interrupt has been handled, the OS notifies the interrupt
controller with a EOI sequence. On a POWER9 and POWER10 systems using
the XIVE interrupt controller, this can be done with a load or a store
operation on the ESB interrupt management page of the interrupt. The
StoreEOI operation has less latency and improves interrupt handling
performance but it was deactivated during the POWER9 DD2.0 timeframe
because of ordering issues. POWER9 systems use the LoadEOI instead.
POWER10 compat guests should have fixed the issue with
Load-after-Store ordering and StoreEOI can be activated for them
again.

To maintain performance, this ordering is only enforced for the
XIVE_ESB_SET_PQ_10 load operation. This operation can be used to
disable temporarily an interrupt source. If StoreEOI is active, a
source could be left enabled if the load and store operations come
out of order.

Add a check in our XIVE emulation model for Load-after-Store when
StoreEOI is active. It should catch unreliable sequences. Other load
operations should be fine without it.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/spapr_xive.h |  1 +
 include/hw/ppc/xive.h       |  8 ++++++++
 hw/intc/spapr_xive.c        | 15 +++++++++++++++
 hw/intc/spapr_xive_kvm.c    | 15 +++++++++++++++
 hw/intc/xive.c              |  6 ++++++
 hw/ppc/spapr_hcall.c        |  7 +++++++
 6 files changed, 52 insertions(+)

diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index b282960ad90d..9c247d8bf57d 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -73,6 +73,7 @@ void spapr_xive_map_mmio(SpaprXive *xive);
=20
 int spapr_xive_end_to_target(uint8_t end_blk, uint32_t end_idx,
                              uint32_t *out_server, uint8_t *out_prio);
+void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable);
=20
 /*
  * KVM XIVE device helpers
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 126e4e2c3a17..133f308c2792 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -285,6 +285,14 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
 #define XIVE_ESB_SET_PQ_10      0xe00 /* Load */
 #define XIVE_ESB_SET_PQ_11      0xf00 /* Load */
=20
+/*
+ * Load-after-store ordering
+ *
+ * Adding this offset to the load address will enforce
+ * load-after-store ordering. This is required to use with StoreEOI.
+ */
+#define XIVE_ESB_LD_ST_MO       0x40 /* Load-after-store ordering */
+
 uint8_t xive_source_esb_get(XiveSource *xsrc, uint32_t srcno);
 uint8_t xive_source_esb_set(XiveSource *xsrc, uint32_t srcno, uint8_t pq=
);
=20
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index dc641cc604bf..0b8a246ad594 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -25,6 +25,7 @@
 #include "hw/ppc/xive_regs.h"
 #include "hw/qdev-properties.h"
 #include "trace.h"
+#include "cpu-models.h"
=20
 /*
  * XIVE Virtualization Controller BAR and Thread Managment BAR that we
@@ -1854,3 +1855,17 @@ void spapr_xive_hcall_init(SpaprMachineState *spap=
r)
     spapr_register_hypercall(H_INT_SYNC, h_int_sync);
     spapr_register_hypercall(H_INT_RESET, h_int_reset);
 }
+
+/*
+ * Advertise StoreEOI for a P10 compat guest. OS is required to
+ * enforce load-after-store ordering.
+ */
+void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable)
+{
+    if (enable) {
+        xive->source.esb_flags |=3D XIVE_SRC_STORE_EOI;
+    } else {
+        xive->source.esb_flags &=3D ~XIVE_SRC_STORE_EOI;
+    }
+
+}
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 61fe7bd2d322..bd023407bd7f 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -296,6 +296,21 @@ static uint64_t xive_esb_rw(XiveSource *xsrc, int sr=
cno, uint32_t offset,
=20
 static uint8_t xive_esb_read(XiveSource *xsrc, int srcno, uint32_t offse=
t)
 {
+    /*
+     * The XIVE_ESB_SET_PQ_10 load operation is used to disable
+     * temporarily an interrupt source. If StoreEOI is active, a
+     * source could be left enabled if the load and store operations
+     * come out of order.
+     *
+     * As we don't know the characteristics of the host source
+     * interrupts (StoreEOI or not), enforce the load-after-store
+     * ordering always. The performance penalty will be very small for
+     * QEMU.
+     */
+    if (offset =3D=3D XIVE_ESB_SET_PQ_10) {
+        offset |=3D XIVE_ESB_LD_ST_MO;
+    }
+
     return xive_esb_rw(xsrc, srcno, offset, 0, 0) & 0x3;
 }
=20
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index b8e4c7294d59..d62881873b1b 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1024,6 +1024,12 @@ static uint64_t xive_source_esb_read(void *opaque,=
 hwaddr addr, unsigned size)
     case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
     case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
     case XIVE_ESB_SET_PQ_11 ... XIVE_ESB_SET_PQ_11 + 0x0FF:
+        if (offset =3D=3D XIVE_ESB_SET_PQ_10 &&
+            xsrc->esb_flags & XIVE_SRC_STORE_EOI) {
+            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: load-after-store order=
ing "
+                          "not enforced with Store EOI active for IRQ %d=
\n",
+                          srcno);
+        }
         ret =3D xive_source_esb_set(xsrc, srcno, (offset >> 8) & 0x3);
         break;
     default:
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 8ffb13ada08e..6b888c963ac4 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1210,11 +1210,18 @@ target_ulong do_client_architecture_support(Power=
PCCPU *cpu,
      * otherwise terminate the boot.
      */
     if (guest_xive) {
+        bool enable;
+
         if (!spapr->irq->xive) {
             error_report(
 "Guest requested unavailable interrupt mode (XIVE), try the ic-mode=3Dxi=
ve or ic-mode=3Ddual machine property");
             exit(EXIT_FAILURE);
         }
+
+        /* Advertise StoreEOI for a P10 compat guest. */
+        enable =3D ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_10, 0,
+                                  cpu->compat_pvr);
+        spapr_xive_enable_store_eoi(spapr->xive, enable);
     } else {
         if (!spapr->irq->xics) {
             error_report(
--=20
2.34.1


