Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937364CA4C2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:25:27 +0100 (CET)
Received: from localhost ([::1]:36372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO2o-0004sY-JF
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:25:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrH-0001OH-V5; Wed, 02 Mar 2022 06:09:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrE-0001sm-VY; Wed, 02 Mar 2022 06:09:27 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229IpGU025686; 
 Wed, 2 Mar 2022 11:08:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5uc239b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:57 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AIilh021093;
 Wed, 2 Mar 2022 11:08:57 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5uc237k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:57 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2fPI022365;
 Wed, 2 Mar 2022 11:08:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8qeV54526262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67502A407C;
 Wed,  2 Mar 2022 11:08:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BDA2A4070;
 Wed,  2 Mar 2022 11:08:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 819572201C1;
 Wed,  2 Mar 2022 12:08:51 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 66/87] ppc/pnv: Add support for PQ offload on PHB5
Date: Wed,  2 Mar 2022 12:07:42 +0100
Message-Id: <20220302110803.849505-67-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wQDcXMUPqi-A5lsRoB3hiycLg7c3e98X
X-Proofpoint-GUID: X4L3DHdAcVPm_I3nosIWkMeTBbVMxtWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=913 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1034 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203020047
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

The PQ_disable configuration bit disables the check done on the PQ
state bits when processing new MSI interrupts. When bit 9 is enabled,
the PHB forwards any MSI trigger to the XIVE interrupt controller
without checking the PQ state bits. The XIVE IC knows from the trigger
message that the PQ bits have not been checked and performs the check
locally.

This configuration bit only applies to MSIs and LSIs are still checked
on the PHB to handle the assertion level.

PQ_disable enablement is a requirement for StoreEOI.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4_regs.h |  1 +
 include/hw/ppc/xive.h               |  1 +
 hw/intc/xive.c                      | 22 +++++++++++++++++++++-
 hw/pci-host/pnv_phb4.c              |  9 +++++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4_regs.h b/include/hw/pci-host/pn=
v_phb4_regs.h
index 55df2c3e5ece..64f326b7158e 100644
--- a/include/hw/pci-host/pnv_phb4_regs.h
+++ b/include/hw/pci-host/pnv_phb4_regs.h
@@ -225,6 +225,7 @@
 /* Fundamental register set B */
 #define PHB_VERSION                     0x800
 #define PHB_CTRLR                       0x810
+#define   PHB_CTRLR_IRQ_PQ_DISABLE      PPC_BIT(9)   /* P10 */
 #define   PHB_CTRLR_IRQ_PGSZ_64K        PPC_BIT(11)
 #define   PHB_CTRLR_IRQ_STORE_EOI       PPC_BIT(12)
 #define   PHB_CTRLR_MMIO_RD_STRICT      PPC_BIT(13)
diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
index 649b58a08f0c..126e4e2c3a17 100644
--- a/include/hw/ppc/xive.h
+++ b/include/hw/ppc/xive.h
@@ -176,6 +176,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XiveSource, XIVE_SOURCE)
  */
 #define XIVE_SRC_H_INT_ESB     0x1 /* ESB managed with hcall H_INT_ESB *=
/
 #define XIVE_SRC_STORE_EOI     0x2 /* Store EOI supported */
+#define XIVE_SRC_PQ_DISABLE    0x4 /* Disable check on the PQ state bits=
 */
=20
 struct XiveSource {
     DeviceState parent;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index deb0db21e093..b8e4c7294d59 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -886,6 +886,16 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc=
, uint32_t srcno)
     }
 }
=20
+/*
+ * Sources can be configured with PQ offloading in which case the check
+ * on the PQ state bits of MSIs is disabled
+ */
+static bool xive_source_esb_disabled(XiveSource *xsrc, uint32_t srcno)
+{
+    return (xsrc->esb_flags & XIVE_SRC_PQ_DISABLE) &&
+        !xive_source_irq_is_lsi(xsrc, srcno);
+}
+
 /*
  * Returns whether the event notification should be forwarded.
  */
@@ -895,6 +905,10 @@ static bool xive_source_esb_trigger(XiveSource *xsrc=
, uint32_t srcno)
=20
     assert(srcno < xsrc->nr_irqs);
=20
+    if (xive_source_esb_disabled(xsrc, srcno)) {
+        return true;
+    }
+
     ret =3D xive_esb_trigger(&xsrc->status[srcno]);
=20
     if (xive_source_irq_is_lsi(xsrc, srcno) &&
@@ -915,6 +929,11 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, ui=
nt32_t srcno)
=20
     assert(srcno < xsrc->nr_irqs);
=20
+    if (xive_source_esb_disabled(xsrc, srcno)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid EOI for IRQ %d\n",=
 srcno);
+        return false;
+    }
+
     ret =3D xive_esb_eoi(&xsrc->status[srcno]);
=20
     /*
@@ -936,9 +955,10 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, ui=
nt32_t srcno)
 static void xive_source_notify(XiveSource *xsrc, int srcno)
 {
     XiveNotifierClass *xnc =3D XIVE_NOTIFIER_GET_CLASS(xsrc->xive);
+    bool pq_checked =3D !xive_source_esb_disabled(xsrc, srcno);
=20
     if (xnc->notify) {
-        xnc->notify(xsrc->xive, srcno, true);
+        xnc->notify(xsrc->xive, srcno, pq_checked);
     }
 }
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 58498feace48..0b407ac69ba6 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -485,6 +485,15 @@ static void pnv_phb4_update_xsrc(PnvPHB4 *phb)
         flags =3D 0;
     }
=20
+    /*
+     * When the PQ disable configuration bit is set, the check on the
+     * PQ state bits is disabled on the PHB side (for MSI only) and it
+     * is performed on the IC side instead.
+     */
+    if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_PQ_DISABLE) {
+        flags |=3D XIVE_SRC_PQ_DISABLE;
+    }
+
     phb->xsrc.esb_shift =3D shift;
     phb->xsrc.esb_flags =3D flags;
=20
--=20
2.34.1


