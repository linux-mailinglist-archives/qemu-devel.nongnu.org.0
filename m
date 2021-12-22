Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED7247CD26
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 07:55:43 +0100 (CET)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvXK-0007yq-5c
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 01:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvH2-0007ky-JQ; Wed, 22 Dec 2021 01:38:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvGv-0002vu-KV; Wed, 22 Dec 2021 01:38:51 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM4X27g016909; 
 Wed, 22 Dec 2021 06:38:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3w35sryb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:28 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6V4w8015689;
 Wed, 22 Dec 2021 06:38:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3w35sry4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:27 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6Yd1O012137;
 Wed, 22 Dec 2021 06:38:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3d1799huxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:38:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BM6cMVk43122946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:38:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F076AE04D;
 Wed, 22 Dec 2021 06:38:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E10AAE055;
 Wed, 22 Dec 2021 06:38:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:38:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C407422028A;
 Wed, 22 Dec 2021 07:38:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 5/5] ppc/pnv: Attach PHB4 root port device when defaults are
 enabled
Date: Wed, 22 Dec 2021 07:38:17 +0100
Message-Id: <20211222063817.1541058-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222063817.1541058-1-clg@kaod.org>
References: <20211222063817.1541058-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XmXvL-IAWCf0uBqvijWpe4LHJxtxw7Nz
X-Proofpoint-ORIG-GUID: 58b4igKn6a4szBvknUm0t7KI6OwNED4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=851 bulkscore=0 suspectscore=0 clxscore=1034
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
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

This cleanups the PHB4 model a bit more since the root port is an
independent device and it will ease our task when adding user created
PHB4s.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  2 --
 hw/pci-host/pnv_phb4.c         | 11 -----------
 hw/ppc/pnv.c                   |  9 ++++++++-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 4a19338db35e..ea63df967678 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -78,8 +78,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 struct PnvPHB4 {
     PCIExpressHost parent_obj;
=20
-    PnvPHB4RootPort root;
-
     uint32_t chip_id;
     uint32_t phb_id;
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 3b50a22b97cd..3b4758c42e26 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1158,12 +1158,6 @@ static void pnv_phb4_instance_init(Object *obj)
=20
     /* XIVE interrupt source object */
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE)=
;
-
-    /* Root Port */
-    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB4_ROOT_=
PORT);
-
-    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
-    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
 }
=20
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
@@ -1207,11 +1201,6 @@ static void pnv_phb4_realize(DeviceState *dev, Err=
or **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
=20
-    /* Add a single Root port */
-    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
-
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs =3D PNV_PHB4_MAX_INTs;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 6edfd6876fd0..7a397698e984 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1403,7 +1403,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, =
Error **errp)
 static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
-    int i;
+    int i, j;
=20
     for (i =3D 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec =3D &chip9->pecs[i];
@@ -1425,6 +1425,13 @@ static void pnv_chip_power9_pec_realize(PnvChip *c=
hip, Error **errp)
=20
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr)=
;
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
+
+        for (j =3D 0; j < pec->num_stacks; j++) {
+            PnvPHB4 *phb =3D &pec->stacks[j].phb;
+
+            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
+                                     TYPE_PNV_PHB4_ROOT_PORT);
+        }
     }
 }
=20
--=20
2.31.1


