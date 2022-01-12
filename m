Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DDE48C3C9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:12:56 +0100 (CET)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cUp-0007N1-DW
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:12:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEv-0006Tk-Dj; Wed, 12 Jan 2022 06:56:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEr-0007WN-En; Wed, 12 Jan 2022 06:56:28 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBSkkX019176; 
 Wed, 12 Jan 2022 11:56:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dht5pf2vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:20 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBsCjf016210;
 Wed, 12 Jan 2022 11:56:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dht5pf2tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:19 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBlpQ5025188;
 Wed, 12 Jan 2022 11:56:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3dfwhjc6k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuFwZ37814768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19082A4DFF;
 Wed, 12 Jan 2022 11:56:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3540A4DF1;
 Wed, 12 Jan 2022 11:56:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2586E22016C;
 Wed, 12 Jan 2022 12:56:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 18/34] ppc/pnv: Attach PHB3 root port device when defaults are
 enabled
Date: Wed, 12 Jan 2022 12:55:35 +0100
Message-Id: <20220112115551.987666-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3Avt6qYIrzWJhbAdMc5Bk13ENnsd3lm_
X-Proofpoint-ORIG-GUID: tSCATdCLTm_G7_vtTkbXSyggcVLmNcwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1034 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120075
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This cleanups the PHB3 model a bit more since the root port is an
independent device and it will ease our task when adding user created
PHB3s.

pnv_phb_attach_root_port() is made public in pnv.c so it can be reused
with the pnv_phb4 root port later.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220105212338.49899-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb3.h |  2 --
 include/hw/ppc/pnv.h           |  1 +
 hw/pci-host/pnv_phb3.c         | 15 ++++++---------
 hw/ppc/pnv.c                   |  8 ++++++++
 4 files changed, 15 insertions(+), 11 deletions(-)

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
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index c781525277db..c726288e5e5a 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -177,6 +177,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
=20
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
=20
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3467bbb5d9d8..fdc8d0b437e4 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -19,6 +19,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
=20
 #define phb3_error(phb, fmt, ...)                                       =
\
     qemu_log_mask(LOG_GUEST_ERROR, "phb3[%d:%d]: " fmt "\n",            =
\
@@ -981,10 +982,6 @@ static void pnv_phb3_instance_init(Object *obj)
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
@@ -1053,10 +1050,10 @@ static void pnv_phb3_realize(DeviceState *dev, Er=
ror **errp)
=20
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
=20
-    /* Add a single Root port */
-    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                                 TYPE_PNV_PHB3_ROOT_PORT);
+    }
 }
=20
 void pnv_phb3_update_regions(PnvPHB3 *phb)
@@ -1177,7 +1174,7 @@ static void pnv_phb3_root_port_class_init(ObjectCla=
ss *klass, void *data)
=20
     device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
                                     &rpc->parent_realize);
-    dc->user_creatable =3D false;
+    dc->user_creatable =3D true;
=20
     k->vendor_id =3D PCI_VENDOR_ID_IBM;
     k->device_id =3D 0x03dc;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9de8b8353014..3a263f631a27 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1156,6 +1156,14 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, =
Error **errp)
     }
 }
=20
+/* Attach a root port device */
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
+{
+    PCIDevice *root =3D pci_new(PCI_DEVFN(0, 0), name);
+
+    pci_realize_and_unref(root, pci->bus, &error_fatal);
+}
+
 static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
--=20
2.31.1


