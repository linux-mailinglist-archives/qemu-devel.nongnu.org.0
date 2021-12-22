Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157FC47CD1B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 07:51:56 +0100 (CET)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvTe-0002gf-GL
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 01:51:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGw-0007j4-4E; Wed, 22 Dec 2021 01:38:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGs-0002vo-4f; Wed, 22 Dec 2021 01:38:45 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM66Dtp017067; 
 Wed, 22 Dec 2021 06:38:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3gyqeu3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:27 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6FI08004624;
 Wed, 22 Dec 2021 06:38:27 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3gyqeu3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6aenb023618;
 Wed, 22 Dec 2021 06:38:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3d1799su1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BM6cMYP39780806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:38:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07FB8A4065;
 Wed, 22 Dec 2021 06:38:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D41C9A4068;
 Wed, 22 Dec 2021 06:38:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:38:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 40D3622010B;
 Wed, 22 Dec 2021 07:38:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 4/5] ppc/pnv: Attach PHB3 root port device when defaults are
 enabled
Date: Wed, 22 Dec 2021 07:38:16 +0100
Message-Id: <20211222063817.1541058-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222063817.1541058-1-clg@kaod.org>
References: <20211222063817.1541058-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u5gaOx_cED10NqaM_QJdVEuVVIz3rwun
X-Proofpoint-ORIG-GUID: JZ-jpjgMedCW91MCjItvv609dR_L9nUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1034 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112220038
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This cleanups the PHB3 model a bit more since the root port is an
independent device and it will ease our task when adding user created
PHB3s.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb3.h |  2 --
 hw/pci-host/pnv_phb3.c         |  8 --------
 hw/ppc/pnv.c                   | 14 ++++++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb=
3.h
index e9c13e6bd821..2e423c3890bc 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -155,8 +155,6 @@ struct PnvPHB3 {
=20
     PnvPBCQState pbcq;
=20
-    PnvPHB3RootPort root;
-
     QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
=20
     PnvChip *chip;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 9c4451ca0d1c..39f03bd256d0 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -980,10 +980,6 @@ static void pnv_phb3_instance_init(Object *obj)
     /* Power Bus Common Queue */
     object_initialize_child(obj, "pbcq", &phb->pbcq, TYPE_PNV_PBCQ);
=20
-    /* Root Port */
-    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB3_ROOT_=
PORT);
-    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
-    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
 }
=20
 static void pnv_phb3_realize(DeviceState *dev, Error **errp)
@@ -1051,10 +1047,6 @@ static void pnv_phb3_realize(DeviceState *dev, Err=
or **errp)
=20
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
=20
-    /* Add a single Root port */
-    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
 }
=20
 void pnv_phb3_update_regions(PnvPHB3 *phb)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9de8b8353014..6edfd6876fd0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1156,6 +1156,17 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, =
Error **errp)
     }
 }
=20
+/* Attach a root port device */
+static void pnv_phb_attach_root_port(PCIHostState *pci, int id,
+                                     const char *name)
+{
+    PCIDevice *root =3D pci_new(PCI_DEVFN(0, 0), name);
+
+    qdev_prop_set_uint8(&root->qdev, "chassis", id);
+    qdev_prop_set_uint16(&root->qdev, "slot", id);
+    pci_realize_and_unref(root, pci->bus, &error_fatal);
+}
+
 static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
@@ -1250,6 +1261,9 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
             return;
         }
+
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
+                                 TYPE_PNV_PHB3_ROOT_PORT);
     }
 }
=20
--=20
2.31.1


