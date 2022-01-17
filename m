Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1534908BF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:33:33 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9RCW-0006CV-Ik
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9R7L-0003Ar-PU; Mon, 17 Jan 2022 07:28:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9R7K-0007w5-6s; Mon, 17 Jan 2022 07:28:11 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HCRfae024860; 
 Mon, 17 Jan 2022 12:28:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn8fw007u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:28:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HCS0kP025814;
 Mon, 17 Jan 2022 12:28:00 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn8fw006q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:28:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HCD36c008138;
 Mon, 17 Jan 2022 12:27:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3dknhj3w9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 12:27:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HCRuN141812406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 12:27:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 016A3A4040;
 Mon, 17 Jan 2022 12:27:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB89FA4057;
 Mon, 17 Jan 2022 12:27:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Jan 2022 12:27:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 34F5C2201D5;
 Mon, 17 Jan 2022 13:27:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/3] ppc/pnv: Move root port allocation under
 pnv_pec_default_phb_realize()
Date: Mon, 17 Jan 2022 13:27:51 +0100
Message-Id: <20220117122753.1655504-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220117122753.1655504-1-clg@kaod.org>
References: <20220117122753.1655504-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HkvDy5wPOrmoJXcYlPrMfCcZeQx9MZ0D
X-Proofpoint-ORIG-GUID: xeCnm4I02gEfx5UIKY98AXbfLjXnfgpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_05,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1034 mlxlogscore=999
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170077
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

The root port device is currently created and attached to the PHB
early in pnv_phb4_realize(). Do it under pnv_pec_default_phb_realize()
after the PHB is fully realized. It's cleaner and avoids an extra
test on defaults_enabled().

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c     | 7 -------
 hw/pci-host/pnv_phb4_pec.c | 3 +++
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 1db815b1aba0..c688976caec9 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -22,7 +22,6 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
-#include "sysemu/sysemu.h"
 #include "trace.h"
=20
 #define phb_error(phb, fmt, ...)                                        =
\
@@ -1639,12 +1638,6 @@ static void pnv_phb4_realize(DeviceState *dev, Err=
or **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
=20
-    /* Add a single Root port if running with defaults */
-    if (defaults_enabled()) {
-        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                                 TYPE_PNV_PHB4_ROOT_PORT);
-    }
-
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs =3D PNV_PHB4_MAX_INTs;
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 12aa4596282b..b19e89236a63 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -132,6 +132,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
+
+    /* Add a single Root port if running with defaults */
+    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB4_ROOT_PO=
RT);
 }
=20
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
--=20
2.31.1


