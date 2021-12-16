Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77D478004
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:32:13 +0100 (CET)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzIK-0006Fw-J6
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:32:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLv-0003z7-Er; Thu, 16 Dec 2021 15:27:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLt-0007Xv-K6; Thu, 16 Dec 2021 15:27:47 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJTrgi012337; 
 Thu, 16 Dec 2021 20:27:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyq8v3qx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:22 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKQBat017334;
 Thu, 16 Dec 2021 20:27:22 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyq8v3qwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:22 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDCZO004772;
 Thu, 16 Dec 2021 20:27:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jravyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKRIMw23986608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B456A4055;
 Thu, 16 Dec 2021 20:27:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02A39A4051;
 Thu, 16 Dec 2021 20:27:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3B1982201A0;
 Thu, 16 Dec 2021 21:27:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 092/101] ppc/pnv: Move mapping of the PHB3 CQ regions under
 pnv_pbcq_realize()
Date: Thu, 16 Dec 2021 21:26:05 +0100
Message-Id: <20211216202614.414266-93-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BnkYhghb8IZJVlmgl0PKgUYmLE4KaWBS
X-Proofpoint-GUID: ib5NDq3pgT0B8E7BtX_RlNQQJhlwwVVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 bulkscore=0 mlxlogscore=767 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change will help us providing support for user created PHB3
devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-6-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3_pbcq.c | 11 +++++++++++
 hw/ppc/pnv.c                | 12 ------------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
index a0526aa1eca3..c7426cd27a20 100644
--- a/hw/pci-host/pnv_phb3_pbcq.c
+++ b/hw/pci-host/pnv_phb3_pbcq.c
@@ -284,6 +284,17 @@ static void pnv_pbcq_realize(DeviceState *dev, Error=
 **errp)
     pnv_xscom_region_init(&pbcq->xscom_spci_regs, OBJECT(dev),
                           &pnv_pbcq_spci_xscom_ops, pbcq, name,
                           PNV_XSCOM_PBCQ_SPCI_SIZE);
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(phb->chip,
+                            PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_=
id,
+                            &pbcq->xscom_nest_regs);
+    pnv_xscom_add_subregion(phb->chip,
+                            PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_i=
d,
+                            &pbcq->xscom_pci_regs);
+    pnv_xscom_add_subregion(phb->chip,
+                            PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_=
id,
+                            &pbcq->xscom_spci_regs);
 }
=20
 static int pnv_pbcq_dt_xscom(PnvXScomInterface *dev, void *fdt,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index bbebd21d7522..c97fe77e88e6 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1226,7 +1226,6 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
     /* PHB3 controllers */
     for (i =3D 0; i < chip->num_phbs; i++) {
         PnvPHB3 *phb =3D &chip8->phbs[i];
-        PnvPBCQState *pbcq =3D &phb->pbcq;
=20
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1236,17 +1235,6 @@ static void pnv_chip_power8_realize(DeviceState *d=
ev, Error **errp)
         if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
             return;
         }
-
-        /* Populate the XSCOM address space. */
-        pnv_xscom_add_subregion(chip,
-                                PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->=
phb_id,
-                                &pbcq->xscom_nest_regs);
-        pnv_xscom_add_subregion(chip,
-                                PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->p=
hb_id,
-                                &pbcq->xscom_pci_regs);
-        pnv_xscom_add_subregion(chip,
-                                PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->=
phb_id,
-                                &pbcq->xscom_spci_regs);
     }
 }
=20
--=20
2.31.1


