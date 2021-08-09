Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0666C3E4724
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:05:06 +0200 (CEST)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5tn-0001zY-VV
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5be-0000o9-Ja; Mon, 09 Aug 2021 09:46:18 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bb-00013U-Hq; Mon, 09 Aug 2021 09:46:18 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DXTJX097717; Mon, 9 Aug 2021 09:46:08 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aam0m4yeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:07 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DdYnY022136;
 Mon, 9 Aug 2021 13:46:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3a9ht8kmd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Dk3Kh58262010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:46:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED11F11C054;
 Mon,  9 Aug 2021 13:46:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EC9811C050;
 Mon,  9 Aug 2021 13:46:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:46:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D4DCC22016C;
 Mon,  9 Aug 2021 15:46:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 19/26] ppc/pnv: Add support for PQ offload on PHB5
Date: Mon,  9 Aug 2021 15:45:40 +0200
Message-Id: <20210809134547.689560-20-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b2t17wp5cHPOjSGYy4ruCxULQPQqKJMN
X-Proofpoint-ORIG-GUID: b2t17wp5cHPOjSGYy4ruCxULQPQqKJMN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1034 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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

The PQ_disable configuration bit disables the check done on the PQ
state bits when processing new MSI interrupts. When bit 9 is enabled,
the PHB forwards any MSI trigger to the XIVE interrupt controller
without checking the PQ state bits. The XIVE IC knows from the trigger
message that the PQ bits have not been checked and performs the check
locally.

This configuration bit only applies to MSIs and LSIs are still checked
on the PHB to handle the assertion level.

PQ_disable enablement is a requirement for StoreEOI.

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
index ef5992c6f05b..e0215c79e312 100644
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
index 7ac0c1816c86..633f3e5cd8f4 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -902,6 +902,16 @@ static bool xive_source_lsi_trigger(XiveSource *xsrc=
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
@@ -911,6 +921,10 @@ static bool xive_source_esb_trigger(XiveSource *xsrc=
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
@@ -931,6 +945,11 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, ui=
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
@@ -952,9 +971,10 @@ static bool xive_source_esb_eoi(XiveSource *xsrc, ui=
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
index 3edd5845ebde..cf506d1623c3 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -475,6 +475,15 @@ static void pnv_phb4_update_xsrc(PnvPHB4 *phb)
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
2.31.1


