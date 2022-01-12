Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5E48C463
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:07:10 +0100 (CET)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dLJ-0000fn-E5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:07:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFI-000727-Cl; Wed, 12 Jan 2022 06:56:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFG-0007Xr-E5; Wed, 12 Jan 2022 06:56:52 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBdWWO029037; 
 Wed, 12 Jan 2022 11:56:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhac0kft6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:21 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBsspd024414;
 Wed, 12 Jan 2022 11:56:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhac0kfry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:21 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBlpQ7025188;
 Wed, 12 Jan 2022 11:56:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3dfwhjc6m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBuHqV35455398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17B3B11C08E;
 Wed, 12 Jan 2022 11:56:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA36711C07B;
 Wed, 12 Jan 2022 11:56:16 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:16 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1A42C2201C6;
 Wed, 12 Jan 2022 12:56:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 21/34] ppc/pnv: Introduce support for user created PHB3 devices
Date: Wed, 12 Jan 2022 12:55:38 +0100
Message-Id: <20220112115551.987666-22-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JXbylMKPqnwq_040XbKhOZWfDVKZM-p_
X-Proofpoint-ORIG-GUID: bxHPklVmY4xYlp3ZztBVoEoLidn2QVmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB3 devices and PCI devices can now be added to the powernv8 machine
using :

  -device pnv-phb3,chip-id=3D0,index=3D1 \
  -device nec-usb-xhci,bus=3Dpci.1,addr=3D0x0

The 'index' property identifies the PHB3 in the chip. In case of user
created devices, a lookup on 'chip-id' is required to assign the
owning chip.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220105212338.49899-7-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h   |  2 ++
 hw/pci-host/pnv_phb3.c | 11 ++++++++++-
 hw/ppc/pnv.c           | 23 ++++++++++++++++++-----
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index c726288e5e5a..64bab7112be3 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -218,6 +218,8 @@ struct PnvMachineState {
     hwaddr       fw_load_addr;
 };
=20
+PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
+
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
=20
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index fdc8d0b437e4..1ebe43df5dd1 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -991,6 +991,15 @@ static void pnv_phb3_realize(DeviceState *dev, Error=
 **errp)
     PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
     int i;
=20
+    /* User created devices */
+    if (!phb->chip) {
+        phb->chip =3D pnv_get_chip(pnv, phb->chip_id);
+        if (!phb->chip) {
+            error_setg(errp, "invalid chip id: %d", phb->chip_id);
+            return;
+        }
+    }
+
     if (phb->phb_id >=3D PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
         error_setg(errp, "invalid PHB index: %d", phb->phb_id);
         return;
@@ -1104,7 +1113,7 @@ static void pnv_phb3_class_init(ObjectClass *klass,=
 void *data)
     dc->realize =3D pnv_phb3_realize;
     device_class_set_props(dc, pnv_phb3_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable =3D false;
+    dc->user_creatable =3D true;
 }
=20
 static const TypeInfo pnv_phb3_type_info =3D {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3a263f631a27..ad02d56aa75e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1117,14 +1117,14 @@ static void pnv_chip_power8_instance_init(Object =
*obj)
=20
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER=
);
=20
-    for (i =3D 0; i < pcc->num_phbs; i++) {
+    if (defaults_enabled()) {
+        chip->num_phbs =3D pcc->num_phbs;
+    }
+
+    for (i =3D 0; i < chip->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV=
_PHB3);
     }
=20
-    /*
-     * Number of PHBs is the chip default
-     */
-    chip->num_phbs =3D pcc->num_phbs;
 }
=20
 static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
@@ -1814,6 +1814,19 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int i=
rq)
     return NULL;
 }
=20
+PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
+{
+    int i;
+
+    for (i =3D 0; i < pnv->num_chips; i++) {
+        PnvChip *chip =3D pnv->chips[i];
+        if (chip->chip_id =3D=3D chip_id) {
+            return chip;
+        }
+    }
+    return NULL;
+}
+
 static int pnv_ics_resend_child(Object *child, void *opaque)
 {
     PnvPHB3 *phb3 =3D (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PH=
B3);
--=20
2.31.1


