Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2244CA47C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:13:16 +0100 (CET)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNr1-00087Y-BU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrI-0001Pp-Gc; Wed, 02 Mar 2022 06:09:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrE-0001sv-T6; Wed, 02 Mar 2022 06:09:28 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AqQax009960; 
 Wed, 2 Mar 2022 11:08:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej779rc58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:57 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AuOgK023345;
 Wed, 2 Mar 2022 11:08:57 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej779rc3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:56 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B327c030113;
 Wed, 2 Mar 2022 11:08:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu9524h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B8pfr47645054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDB4F42047;
 Wed,  2 Mar 2022 11:08:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FED042042;
 Wed,  2 Mar 2022 11:08:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:51 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E5AC7220294;
 Wed,  2 Mar 2022 12:08:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 65/87] ppc/xive: Add support for PQ state bits offload
Date: Wed,  2 Mar 2022 12:07:41 +0100
Message-Id: <20220302110803.849505-66-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 494_V4bRMaD7-fOm_wU7GzgFfGn6lWvX
X-Proofpoint-GUID: ZRQAAG2ZFGl8AxRR4Uf-T-hByCNK_8mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 clxscore=1034 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
index 875c7f639689..649b58a08f0c 100644
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
@@ -386,6 +386,10 @@ struct XiveRouterClass {
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
@@ -407,7 +411,7 @@ int xive_router_get_nvt(XiveRouter *xrtr, uint8_t nvt=
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
index 0897ddbd4874..eb255b6dd8f3 100644
--- a/include/hw/ppc/xive2.h
+++ b/include/hw/ppc/xive2.h
@@ -31,6 +31,10 @@ typedef struct Xive2RouterClass {
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
@@ -53,7 +57,7 @@ int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp=
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
index 621b20a03f5f..1ce1d7b07d63 100644
--- a/hw/intc/pnv_xive.c
+++ b/hw/intc/pnv_xive.c
@@ -403,6 +403,34 @@ static int pnv_xive_get_eas(XiveRouter *xrtr, uint8_=
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
@@ -499,12 +527,12 @@ static PnvXive *pnv_xive_tm_get_xive(PowerPCCPU *cp=
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
@@ -1351,7 +1379,8 @@ static void pnv_xive_ic_hw_trigger(PnvXive *xive, h=
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
@@ -1971,6 +2000,8 @@ static void pnv_xive_class_init(ObjectClass *klass,=
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
index 35a7f7ae4dd8..1fa89c779287 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -285,6 +285,34 @@ static int pnv_xive2_vst_write(PnvXive2 *xive, uint3=
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
@@ -487,12 +515,12 @@ static PnvXive2 *pnv_xive2_tm_get_xive(PowerPCCPU *=
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
@@ -1381,7 +1409,8 @@ static void pnv_xive2_ic_hw_trigger(PnvXive2 *xive,=
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
@@ -1880,6 +1909,8 @@ static void pnv_xive2_class_init(ObjectClass *klass=
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
index eae95c716f14..dc641cc604bf 100644
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
index 0d98b9539cd9..deb0db21e093 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -938,7 +938,7 @@ static void xive_source_notify(XiveSource *xsrc, int =
srcno)
     XiveNotifierClass *xnc =3D XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
=20
     if (xnc->notify) {
-        xnc->notify(xsrc->xive, srcno);
+        xnc->notify(xsrc->xive, srcno, true);
     }
 }
=20
@@ -1370,6 +1370,24 @@ int xive_router_get_eas(XiveRouter *xrtr, uint8_t =
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
@@ -1721,7 +1739,7 @@ do_escalation:
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
@@ -1734,11 +1752,27 @@ void xive_router_notify(XiveNotifier *xn, uint32_=
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
index 2836bbdc83fc..3720e704227d 100644
--- a/hw/intc/xive2.c
+++ b/hw/intc/xive2.c
@@ -171,6 +171,24 @@ int xive2_router_get_eas(Xive2Router *xrtr, uint8_t =
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
@@ -480,7 +498,7 @@ do_escalation:
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
@@ -493,6 +511,28 @@ void xive2_router_notify(XiveNotifier *xn, uint32_t =
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
index 5344a6d4a693..58498feace48 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1660,14 +1660,19 @@ static const char *pnv_phb4_root_bus_path(PCIHost=
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
2.34.1


