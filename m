Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9DD4C7112
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:56:46 +0100 (CET)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiOD-0003fe-BK
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKQ-0006m5-Ej; Mon, 28 Feb 2022 10:52:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKO-0001C4-5O; Mon, 28 Feb 2022 10:52:50 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SEC5rE010342; 
 Mon, 28 Feb 2022 15:52:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egyxjatff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:38 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SEjAwx007164;
 Mon, 28 Feb 2022 15:52:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egyxjatec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlWJA008946;
 Mon, 28 Feb 2022 15:52:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjguw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21SFqXJ419595524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DA49A4060;
 Mon, 28 Feb 2022 15:52:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE4A0A405C;
 Mon, 28 Feb 2022 15:52:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0B1F32201B4;
 Mon, 28 Feb 2022 16:52:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 12/18] ppc/pnv: Add support for PHB5 "Address-based
 trigger" mode
Date: Mon, 28 Feb 2022 16:52:16 +0100
Message-Id: <20220228155222.643974-13-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zc7XTcst4A8fhBBv47N1B9GyJN44L0z_
X-Proofpoint-GUID: Ks1zxV1tJk59b1Q0tux0bEenvH1qpMbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280083
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the Address-Based Interrupt Trigger mode is activated, the PHB
maps the interrupt source number into the interrupt command address.
The PHB directly triggers the IC ESB page of the interrupt number and
not the notify page of the IC anymore.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4_regs.h |  2 +
 hw/pci-host/pnv_phb4.c              | 73 ++++++++++++++++++++++++++---
 hw/pci-host/trace-events            |  2 +
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4_regs.h b/include/hw/pci-host/pn=
v_phb4_regs.h
index 64f326b7158e..4a0d3b28efb3 100644
--- a/include/hw/pci-host/pnv_phb4_regs.h
+++ b/include/hw/pci-host/pnv_phb4_regs.h
@@ -220,12 +220,14 @@
 #define   PHB_PAPR_ERR_INJ_MASK_MMIO            PPC_BITMASK(16, 63)
 #define PHB_ETU_ERR_SUMMARY             0x2c8
 #define PHB_INT_NOTIFY_ADDR             0x300
+#define   PHB_INT_NOTIFY_ADDR_64K       PPC_BIT(1)   /* P10 */
 #define PHB_INT_NOTIFY_INDEX            0x308
=20
 /* Fundamental register set B */
 #define PHB_VERSION                     0x800
 #define PHB_CTRLR                       0x810
 #define   PHB_CTRLR_IRQ_PQ_DISABLE      PPC_BIT(9)   /* P10 */
+#define   PHB_CTRLR_IRQ_ABT_MODE        PPC_BIT(10)  /* P10 */
 #define   PHB_CTRLR_IRQ_PGSZ_64K        PPC_BIT(11)
 #define   PHB_CTRLR_IRQ_STORE_EOI       PPC_BIT(12)
 #define   PHB_CTRLR_MMIO_RD_STRICT      PPC_BIT(13)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 0b407ac69ba6..b5b384e9ee4f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1669,10 +1669,54 @@ static const char *pnv_phb4_root_bus_path(PCIHost=
State *host_bridge,
     return phb->bus_path;
 }
=20
-static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
-                                 bool pq_checked)
+/*
+ * Address base trigger mode (POWER10)
+ *
+ * Trigger directly the IC ESB page
+ */
+static void pnv_phb4_xive_notify_abt(PnvPHB4 *phb, uint32_t srcno,
+                                     bool pq_checked)
+{
+    uint64_t notif_port =3D phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
+    uint64_t data =3D 0; /* trigger data : don't care */
+    hwaddr addr;
+    MemTxResult result;
+    int esb_shift;
+
+    if (notif_port & PHB_INT_NOTIFY_ADDR_64K) {
+        esb_shift =3D 16;
+    } else {
+        esb_shift =3D 12;
+    }
+
+    /* Compute the address of the IC ESB management page */
+    addr =3D (notif_port & ~PHB_INT_NOTIFY_ADDR_64K);
+    addr |=3D (1ull << (esb_shift + 1)) * srcno;
+    addr |=3D (1ull << esb_shift);
+
+    /*
+     * When the PQ state bits are checked on the PHB, the associated
+     * PQ state bits on the IC should be ignored. Use the unconditional
+     * trigger offset to inject a trigger on the IC. This is always
+     * the case for LSIs
+     */
+    if (pq_checked) {
+        addr |=3D XIVE_ESB_INJECT;
+    }
+
+    trace_pnv_phb4_xive_notify_ic(addr, data);
+
+    address_space_stq_be(&address_space_memory, addr, data,
+                         MEMTXATTRS_UNSPECIFIED, &result);
+    if (result !=3D MEMTX_OK) {
+        phb_error(phb, "trigger failed @%"HWADDR_PRIx "\n", addr);
+        return;
+    }
+}
+
+static void pnv_phb4_xive_notify_ic(PnvPHB4 *phb, uint32_t srcno,
+                                    bool pq_checked)
 {
-    PnvPHB4 *phb =3D PNV_PHB4(xf);
     uint64_t notif_port =3D phb->regs[PHB_INT_NOTIFY_ADDR >> 3];
     uint32_t offset =3D phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
     uint64_t data =3D offset | srcno;
@@ -1682,7 +1726,7 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, =
uint32_t srcno,
         data |=3D XIVE_TRIGGER_PQ;
     }
=20
-    trace_pnv_phb4_xive_notify(notif_port, data);
+    trace_pnv_phb4_xive_notify_ic(notif_port, data);
=20
     address_space_stq_be(&address_space_memory, notif_port, data,
                          MEMTXATTRS_UNSPECIFIED, &result);
@@ -1692,6 +1736,18 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf,=
 uint32_t srcno,
     }
 }
=20
+static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
+                                 bool pq_checked)
+{
+    PnvPHB4 *phb =3D PNV_PHB4(xf);
+
+    if (phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE) {
+        pnv_phb4_xive_notify_abt(phb, srcno, pq_checked);
+    } else {
+        pnv_phb4_xive_notify_ic(phb, srcno, pq_checked);
+    }
+}
+
 static Property pnv_phb4_properties[] =3D {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
@@ -1858,10 +1914,15 @@ type_init(pnv_phb4_register_types);
=20
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon)
 {
+    uint64_t notif_port =3D
+        phb->regs[PHB_INT_NOTIFY_ADDR >> 3] & ~PHB_INT_NOTIFY_ADDR_64K;
     uint32_t offset =3D phb->regs[PHB_INT_NOTIFY_INDEX >> 3];
+    bool abt =3D !!(phb->regs[PHB_CTRLR >> 3] & PHB_CTRLR_IRQ_ABT_MODE);
=20
-    monitor_printf(mon, "PHB4[%x:%x] Source %08x .. %08x\n",
+    monitor_printf(mon, "PHB4[%x:%x] Source %08x .. %08x %s @%"HWADDR_PR=
Ix"\n",
                    phb->chip_id, phb->phb_id,
-                   offset, offset + phb->xsrc.nr_irqs - 1);
+                   offset, offset + phb->xsrc.nr_irqs - 1,
+                   abt ? "ABT" : "",
+                   notif_port);
     xive_source_pic_print_info(&phb->xsrc, 0, mon);
 }
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 630e9fcc5e77..6e5d8d335525 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -32,3 +32,5 @@ unin_read(uint64_t addr, uint64_t value) "addr=3D0x%" P=
RIx64 " val=3D0x%"PRIx64
=20
 # pnv_phb4.c
 pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=3D@0x%"P=
RIx64" data=3D0x%"PRIx64
+pnv_phb4_xive_notify_ic(uint64_t addr, uint64_t data) "addr=3D@0x%"PRIx6=
4" data=3D0x%"PRIx64
+pnv_phb4_xive_notify_abt(uint64_t notif_port, uint64_t data) "notif=3D@0=
x%"PRIx64" data=3D0x%"PRIx64
--=20
2.34.1


