Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AFA48C45B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:05:31 +0100 (CET)
Received: from localhost ([::1]:48352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dJi-0006y9-A5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:05:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFN-00074z-17; Wed, 12 Jan 2022 06:56:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFJ-0007Z0-6v; Wed, 12 Jan 2022 06:56:55 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBLUkw012837; 
 Wed, 12 Jan 2022 11:56:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhv9qvdjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:23 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBj8nS024310;
 Wed, 12 Jan 2022 11:56:22 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhv9qvdh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:22 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBlpfE025184;
 Wed, 12 Jan 2022 11:56:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3dfwhjc6mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBlF1b47907316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:47:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0573B11C094;
 Wed, 12 Jan 2022 11:56:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B255511C09A;
 Wed, 12 Jan 2022 11:56:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BB5E322016C;
 Wed, 12 Jan 2022 12:56:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 22/34] ppc/pnv: Reparent user created PHB3 devices to the
 PnvChip
Date: Wed, 12 Jan 2022 12:55:39 +0100
Message-Id: <20220112115551.987666-23-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iUyjCI1F-CTL7WHghZslQCPUluoF5mcU
X-Proofpoint-ORIG-GUID: XELaXTlMsPk8pbs8mUAgGokseBZ0_3mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1034 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201120075
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The powernv machine uses the object hierarchy to populate the device
tree and each device should be parented to the chip it belongs to.
This is not the case for user created devices which are parented to
the container "/unattached".

Make sure a PHB3 device is parented to its chip by reparenting the
object if necessary.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220105212338.49899-8-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h   |  1 +
 hw/pci-host/pnv_phb3.c |  6 ++++++
 hw/ppc/pnv.c           | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 64bab7112be3..f4219da7c516 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -178,6 +178,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
=20
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 void pnv_phb_attach_root_port(PCIHostState *pci, const char *name);
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
=20
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 1ebe43df5dd1..a52aedcad31b 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -998,6 +998,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error=
 **errp)
             error_setg(errp, "invalid chip id: %d", phb->chip_id);
             return;
         }
+
+        /*
+         * Reparent user created devices to the chip to build
+         * correctly the device tree.
+         */
+        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
     }
=20
     if (phb->phb_id >=3D PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ad02d56aa75e..fa5e7bc75192 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1814,6 +1814,23 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int i=
rq)
     return NULL;
 }
=20
+void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
+{
+    Object *parent =3D OBJECT(chip);
+    g_autofree char *default_id =3D
+        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
+
+    if (obj->parent =3D=3D parent) {
+        return;
+    }
+
+    object_ref(obj);
+    object_unparent(obj);
+    object_property_add_child(
+        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
+    object_unref(obj);
+}
+
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
 {
     int i;
--=20
2.31.1


