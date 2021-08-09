Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1AE3E473A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:08:59 +0200 (CEST)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5xa-0001XW-DV
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bi-0000x1-67; Mon, 09 Aug 2021 09:46:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bf-00018F-PV; Mon, 09 Aug 2021 09:46:21 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DdCjc081941; Mon, 9 Aug 2021 09:46:08 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab1j86wmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:07 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DVq1E023222;
 Mon, 9 Aug 2021 13:46:05 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3a9ht8kmek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Dk2Ru46006650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:46:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E5FA4060;
 Mon,  9 Aug 2021 13:46:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFC36A405B;
 Mon,  9 Aug 2021 13:46:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:01 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 32180220032;
 Mon,  9 Aug 2021 15:46:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 18/26] ppc/xive: Add support for PQ state bits offload
Date: Mon,  9 Aug 2021 15:45:39 +0200
Message-Id: <20210809134547.689560-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BYNHnrEB9bYOaTMqNiULmBnWXoDLwpXj
X-Proofpoint-ORIG-GUID: BYNHnrEB9bYOaTMqNiULmBnWXoDLwpXj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1034 impostorscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trigger message coming from a HW source contains a special bit
informing the XIVE interrupt controller that the PQ bits have been
checked at the source or not. Depending on the value, the IC can
perform the check and the state transition locally using its own PQ
state bits.

The following changes add new accessors to the XiveRouter required to
query and update the PQ state bits. This only applies to the PowerNV
machine. sPAPR accessors are provided but the pSeries machine should
not be concerned by such complex configuration for the moment.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/xive.h  |  8 +++++--
 include/hw/ppc/xive2.h |  6 +++++-
 hw/intc/pnv_xive.c     | 37 +++++++++++++++++++++++++++++---
 hw/intc/pnv_xive2.c    | 37 +++++++++++++++++++++++++++++---
 hw/intc/spapr_xive.c   | 25 ++++++++++++++++++++++
 hw/intc/xive.c         | 48 ++++++++++++++++++++++++++++++++++++------
 hw/intc/xive2.c        | 42 +++++++++++++++++++++++++++++++++++-
 hw/pci-host/pnv_phb4.c |  9 ++++++--
 hw/ppc/pnv_psi.c       |  8 +++++--
 9 files changed, 199 insertions(+), 21 deletions(-)

diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 33a52963cb12..ef5992c6f05b 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -160,7 +160,7 @@ DECLARE_CLASS_CHECKERS(XiveNotifierClass, XIVE_NOTIFI=
ER,
=20
 struct XiveNotifierClass {
     InterfaceClass parent;
-    void (*notify)(XiveNotifier *xn, uint32_t lisn);
+    void (*notify)(XiveNotifier *xn, uint32_t lisn, bool pq_checked);
 };
=20
 /*
@@ -357,6 +357,10 @@ struct XiveRouterClass {
     /* XIVE table accessors */
     int (*get_eas)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
                    XiveEAS *eas);
+    int (*get_pq)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
+    int (*set_pq)(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
     int (*get_end)(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx,
                    XiveEND *end);
     int (*write_end)(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_idx=
,
@@ -378,7 +382,7 @@ int xive_router_get_nvt(XiveRouter *xrtr, uint8_t nvt=
_blk, uint32_t nvt_idx,
                         XiveNVT *nvt);
 int xive_router_write_nvt(XiveRouter *xrtr, uint8_t nvt_blk, uint32_t nv=
t_idx,
                           XiveNVT *nvt, uint8_t word_number);
-void xive_router_notify(XiveNotifier *xn, uint32_t lisn);
+void xive_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked=
);
=20
 /*
  * XIVE Presenter
diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
index 8a74fa7e4c7e..082222d978bb 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -36,6 +36,10 @@ typedef struct Xive2RouterClass {
     /* XIVE table accessors */
     int (*get_eas)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
                    Xive2Eas *eas);
+    int (*get_pq)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
+    int (*set_pq)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
+                  uint8_t *pq);
     int (*get_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
                    Xive2End *end);
     int (*write_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_id=
x,
@@ -58,7 +62,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp=
_blk, uint32_t nvp_idx,
 int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t =
nvp_idx,
                           Xive2Nvp *nvp, uint8_t word_number);
=20
-void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
+void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checke=
d);
=20
 /*
  * XIVE2 Presenter (POWER10)
diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
index ad43483612e5..5022f85350f4 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -393,6 +393,34 @@ static int pnv_xive_get_eas(XiveRouter *xrtr, uint8_=
t blk, uint32_t idx,
     return pnv_xive_vst_read(xive, VST_TSEL_IVT, blk, idx, eas);
 }
=20
+static int pnv_xive_get_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
+                           uint8_t *pq)
+{
+    PnvXive *xive =3D PNV_XIVE(xrtr);
+
+    if (pnv_xive_block_id(xive) !=3D blk) {
+        xive_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx))=
;
+        return -1;
+    }
+
+    *pq =3D xive_source_esb_get(&xive->ipi_source, idx);
+    return 0;
+}
+
+static int pnv_xive_set_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx,
+                           uint8_t *pq)
+{
+    PnvXive *xive =3D PNV_XIVE(xrtr);
+
+    if (pnv_xive_block_id(xive) !=3D blk) {
+        xive_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx))=
;
+        return -1;
+    }
+
+    *pq =3D xive_source_esb_set(&xive->ipi_source, idx, *pq);
+    return 0;
+}
+
 /*
  * One bit per thread id. The first register PC_THREAD_EN_REG0 covers
  * the first cores 0-15 (normal) of the chip or 0-7 (fused). The
@@ -489,12 +517,12 @@ static PnvXive *pnv_xive_tm_get_xive(PowerPCCPU *cp=
u)
  * event notification to the Router. This is required on a multichip
  * system.
  */
-static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno)
+static void pnv_xive_notify(XiveNotifier *xn, uint32_t srcno, bool pq_ch=
ecked)
 {
     PnvXive *xive =3D PNV_XIVE(xn);
     uint8_t blk =3D pnv_xive_block_id(xive);
=20
-    xive_router_notify(xn, XIVE_EAS(blk, srcno));
+    xive_router_notify(xn, XIVE_EAS(blk, srcno), pq_checked);
 }
=20
 /*
@@ -1336,7 +1364,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, h=
waddr addr, uint64_t val)
     blk =3D XIVE_EAS_BLOCK(val);
     idx =3D XIVE_EAS_INDEX(val);
=20
-    xive_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
+    xive_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx),
+                       !!(val & XIVE_TRIGGER_PQ));
 }
=20
 static void pnv_xive_ic_notify_write(void *opaque, hwaddr addr, uint64_t=
 val,
@@ -1956,6 +1985,8 @@ static void pnv_xive_class_init(ObjectClass *klass,=
 void *data)
     device_class_set_props(dc, pnv_xive_properties);
=20
     xrc->get_eas =3D pnv_xive_get_eas;
+    xrc->get_pq =3D pnv_xive_get_pq;
+    xrc->set_pq =3D pnv_xive_set_pq;
     xrc->get_end =3D pnv_xive_get_end;
     xrc->write_end =3D pnv_xive_write_end;
     xrc->get_nvt =3D pnv_xive_get_nvt;
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index b9abd022cf08..186ab66e105d 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -284,6 +284,34 @@ static int pnv_xive2_vst_write(PnvXive2 *xive, uint3=
2_t type, uint8_t blk,
     return 0;
 }
=20
+static int pnv_xive2_get_pq(Xive2Router *xrtr, uint8_t blk, uint32_t idx=
,
+                             uint8_t *pq)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xrtr);
+
+    if (pnv_xive2_block_id(xive) !=3D blk) {
+        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx)=
);
+        return -1;
+    }
+
+    *pq =3D xive_source_esb_get(&xive->ipi_source, idx);
+    return 0;
+}
+
+static int pnv_xive2_set_pq(Xive2Router *xrtr, uint8_t blk, uint32_t idx=
,
+                             uint8_t *pq)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xrtr);
+
+    if (pnv_xive2_block_id(xive) !=3D blk) {
+        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx)=
);
+        return -1;
+    }
+
+    *pq =3D xive_source_esb_set(&xive->ipi_source, idx, *pq);
+    return 0;
+}
+
 static int pnv_xive2_get_end(Xive2Router *xrtr, uint8_t blk, uint32_t id=
x,
                              Xive2End *end)
 {
@@ -486,12 +514,12 @@ static PnvXive2 *pnv_xive2_tm_get_xive(PowerPCCPU *=
cpu)
  * source interrupt number before forwarding the source event
  * notification to the Router. This is required on a multichip system.
  */
-static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno)
+static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno, bool pq_c=
hecked)
 {
     PnvXive2 *xive =3D PNV_XIVE2(xn);
     uint8_t blk =3D pnv_xive2_block_id(xive);
=20
-    xive2_router_notify(xn, XIVE_EAS(blk, srcno));
+    xive2_router_notify(xn, XIVE_EAS(blk, srcno), pq_checked);
 }
=20
 /*
@@ -1380,7 +1408,8 @@ static void pnv_xive2_ic_hw_trigger(PnvXive2 *xive,=
 hwaddr addr,
     blk =3D XIVE_EAS_BLOCK(val);
     idx =3D XIVE_EAS_INDEX(val);
=20
-    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
+    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx),
+                         !!(val & XIVE_TRIGGER_PQ));
 }
=20
 static void pnv_xive2_ic_notify_write(void *opaque, hwaddr offset,
@@ -1879,6 +1908,8 @@ static void pnv_xive2_class_init(ObjectClass *klass=
, void *data)
     device_class_set_props(dc, pnv_xive2_properties);
=20
     xrc->get_eas   =3D pnv_xive2_get_eas;
+    xrc->get_pq    =3D pnv_xive2_get_pq;
+    xrc->set_pq    =3D pnv_xive2_set_pq;
     xrc->get_end   =3D pnv_xive2_get_end;
     xrc->write_end =3D pnv_xive2_write_end;
     xrc->get_nvp   =3D pnv_xive2_get_nvp;
diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 89cfa018f598..d203f98fc766 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -480,6 +480,29 @@ static uint8_t spapr_xive_get_block_id(XiveRouter *x=
rtr)
     return SPAPR_XIVE_BLOCK_ID;
 }
=20
+static int spapr_xive_get_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx=
,
+                             uint8_t *pq)
+{
+    SpaprXive *xive =3D SPAPR_XIVE(xrtr);
+
+    assert(SPAPR_XIVE_BLOCK_ID =3D=3D blk);
+
+    *pq =3D xive_source_esb_get(&xive->source, idx);
+    return 0;
+}
+
+static int spapr_xive_set_pq(XiveRouter *xrtr, uint8_t blk, uint32_t idx=
,
+                             uint8_t *pq)
+{
+    SpaprXive *xive =3D SPAPR_XIVE(xrtr);
+
+    assert(SPAPR_XIVE_BLOCK_ID =3D=3D blk);
+
+    *pq =3D xive_source_esb_set(&xive->source, idx, *pq);
+    return 0;
+}
+
+
 static const VMStateDescription vmstate_spapr_xive_end =3D {
     .name =3D TYPE_SPAPR_XIVE "/end",
     .version_id =3D 1,
@@ -788,6 +811,8 @@ static void spapr_xive_class_init(ObjectClass *klass,=
 void *data)
     dc->vmsd    =3D &vmstate_spapr_xive;
=20
     xrc->get_eas =3D spapr_xive_get_eas;
+    xrc->get_pq  =3D spapr_xive_get_pq;
+    xrc->set_pq  =3D spapr_xive_set_pq;
     xrc->get_end =3D spapr_xive_get_end;
     xrc->write_end =3D spapr_xive_write_end;
     xrc->get_nvt =3D spapr_xive_get_nvt;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 5ecd0bb21c31..7ac0c1816c86 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -954,7 +954,7 @@ static void xive_source_notify(XiveSource *xsrc, int =
srcno)
     XiveNotifierClass *xnc =3D XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
=20
     if (xnc->notify) {
-        xnc->notify(xsrc->xive, srcno);
+        xnc->notify(xsrc->xive, srcno, true);
     }
 }
=20
@@ -1385,6 +1385,24 @@ int xive_router_get_eas(XiveRouter *xrtr, uint8_t =
eas_blk, uint32_t eas_idx,
     return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
 }
=20
+static
+int xive_router_get_pq(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_i=
dx,
+                       uint8_t *pq)
+{
+    XiveRouterClass *xrc =3D XIVE_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
+static
+int xive_router_set_pq(XiveRouter *xrtr, uint8_t eas_blk, uint32_t eas_i=
dx,
+                       uint8_t *pq)
+{
+    XiveRouterClass *xrc =3D XIVE_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->set_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
 int xive_router_get_end(XiveRouter *xrtr, uint8_t end_blk, uint32_t end_=
idx,
                         XiveEND *end)
 {
@@ -1734,7 +1752,7 @@ do_escalation:
                            xive_get_field32(END_W5_ESC_END_DATA,  end.w5=
));
 }
=20
-void xive_router_notify(XiveNotifier *xn, uint32_t lisn)
+void xive_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checked=
)
 {
     XiveRouter *xrtr =3D XIVE_ROUTER(xn);
     uint8_t eas_blk =3D XIVE_EAS_BLOCK(lisn);
@@ -1747,11 +1765,27 @@ void xive_router_notify(XiveNotifier *xn, uint32_=
t lisn)
         return;
     }
=20
-    /*
-     * The IVRE checks the State Bit Cache at this point. We skip the
-     * SBC lookup because the state bits of the sources are modeled
-     * internally in QEMU.
-     */
+    if (!pq_checked) {
+        bool notify;
+        uint8_t pq;
+
+        /* PQ cache lookup */
+        if (xive_router_get_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        notify =3D xive_esb_trigger(&pq);
+
+        if (xive_router_set_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        if (!notify) {
+            return;
+        }
+    }
=20
     if (!xive_eas_is_valid(&eas)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid LISN %x\n", lisn);
diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
index 775b9199a5b1..8243391e8c09 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -181,6 +181,24 @@ int xive2_router_get_eas(Xive2Router *xrtr, uint8_t =
eas_blk, uint32_t eas_idx,
     return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
 }
=20
+static
+int xive2_router_get_pq(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas=
_idx,
+                       uint8_t *pq)
+{
+    Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->get_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
+static
+int xive2_router_set_pq(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas=
_idx,
+                       uint8_t *pq)
+{
+    Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
+
+    return xrc->set_pq(xrtr, eas_blk, eas_idx, pq);
+}
+
 int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t en=
d_idx,
                          Xive2End *end)
 {
@@ -490,7 +508,7 @@ do_escalation:
                            xive_get_field32(END2_W5_ESC_END_DATA,  end.w=
5));
 }
=20
-void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
+void xive2_router_notify(XiveNotifier *xn, uint32_t lisn, bool pq_checke=
d)
 {
     Xive2Router *xrtr =3D XIVE2_ROUTER(xn);
     uint8_t eas_blk =3D XIVE_EAS_BLOCK(lisn);
@@ -503,6 +521,28 @@ void xive2_router_notify(XiveNotifier *xn, uint32_t =
lisn)
         return;
     }
=20
+    if (!pq_checked) {
+        bool notify;
+        uint8_t pq;
+
+        /* PQ cache lookup */
+        if (xive2_router_get_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        notify =3D xive_esb_trigger(&pq);
+
+        if (xive2_router_set_pq(xrtr, eas_blk, eas_idx, &pq)) {
+            /* Set FIR */
+            g_assert_not_reached();
+        }
+
+        if (!notify) {
+            return;
+        }
+    }
+
     if (!xive2_eas_is_valid(&eas)) {
         qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Invalid LISN %x\n", lisn);
         return;
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5c375a9f285d..3edd5845ebde 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1250,14 +1250,19 @@ static const char *pnv_phb4_root_bus_path(PCIHost=
State *host_bridge,
     return phb->bus_path;
 }
=20
-static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno)
+static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
+                                 bool pq_checked)
 {
     PnvPHB4 *phb =3D PNV_PHB4(xf);
     uint64_t notif_port =3D phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
     uint32_t offset =3D phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
-    uint64_t data =3D XIVE_TRIGGER_PQ | offset | srcno;
+    uint64_t data =3D offset | srcno;
     MemTxResult result;
=20
+    if (pq_checked) {
+        data |=3D XIVE_TRIGGER_PQ;
+    }
+
     trace_pnv_phb4_xive_notify(notif_port, data);
=20
     address_space_stq_be(&address_space_memory, notif_port, data,
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 737486046d5a..466fb7979887 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -653,7 +653,7 @@ static const TypeInfo pnv_psi_power8_info =3D {
 #define PSIHB10_ESB_CI_BASE              PSIHB9_ESB_CI_BASE
 #define   PSIHB10_ESB_CI_64K             PPC_BIT(1)
=20
-static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
+static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno, bool pq_che=
cked)
 {
     PnvPsi *psi =3D PNV_PSI(xf);
     uint64_t notif_port =3D psi->regs[PSIHB_REG(PSIHB9_ESB_NOTIF_ADDR)];
@@ -662,9 +662,13 @@ static void pnv_psi_notify(XiveNotifier *xf, uint32_=
t srcno)
=20
     uint32_t offset =3D
         (psi->regs[PSIHB_REG(PSIHB9_IVT_OFFSET)] >> PSIHB9_IVT_OFF_SHIFT=
);
-    uint64_t data =3D XIVE_TRIGGER_PQ | offset | srcno;
+    uint64_t data =3D offset | srcno;
     MemTxResult result;
=20
+    if (pq_checked) {
+        data |=3D XIVE_TRIGGER_PQ;
+    }
+
     if (!valid) {
         return;
     }
--=20
2.31.1


