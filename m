Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0F4D94F9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:02:16 +0100 (CET)
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1CB-0000ck-LF
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:02:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0pB-0002U1-Q7; Tue, 15 Mar 2022 02:38:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0pA-0007vm-0e; Tue, 15 Mar 2022 02:38:29 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F6ZfxW018129; 
 Tue, 15 Mar 2022 06:38:18 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etdvgfufm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:38:17 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XFhf027473;
 Tue, 15 Mar 2022 06:38:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58n0ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:38:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22F6cERm45941186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:38:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 481F2A4D81;
 Tue, 15 Mar 2022 06:37:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6D1BA4D39;
 Tue, 15 Mar 2022 06:37:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:49 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 26380220383;
 Tue, 15 Mar 2022 07:37:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 18/20] ppc/pnv: Introduce a pnv-phb5 device to match root port
Date: Tue, 15 Mar 2022 07:37:34 +0100
Message-Id: <20220315063736.592808-19-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qoqzAYYLkmA7o8WkhXOnXWZCR-_JcQAz
X-Proofpoint-GUID: qoqzAYYLkmA7o8WkhXOnXWZCR-_JcQAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=783
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1034 phishscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

We already have the pnv-phb3 and pnv-phb4 devices for POWER8 and
POWER9 respectively. POWER10 uses version 5 of the PHB. It is very
close to the PHB4 from POWER9, at least in our model and we could
almost keep using the PHB4 model. However the matching root port
pnv-phb5-root-port is specific to POWER10 so to avoid confusion as
well as making it easy to introduce differences later, we create a
pnv-phb5 class, which is mostly an alias for pnv-phb4 for now.

With this patch, the command line for a user-created PHB on powernv10
becomes:
  -machine powernv10 -nodefaults -device pnv-phb5 -device pnv-phb5-root-p=
ort

Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridg=
e")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220310155101.294568-2-fbarrat@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 5 +++++
 hw/pci-host/pnv_phb4.c         | 7 +++++++
 hw/pci-host/pnv_phb4_pec.c     | 9 +++++----
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index fbcf5bfb5585..b02ecdceaa4c 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -203,6 +203,7 @@ struct PnvPhb4PecClass {
     const char *stk_compat;
     int stk_compat_size;
     uint64_t version;
+    const char *phb_type;
     const uint32_t *num_phbs;
     const char *rp_model;
 };
@@ -211,6 +212,10 @@ struct PnvPhb4PecClass {
  * POWER10 definitions
  */
=20
+#define TYPE_PNV_PHB5 "pnv-phb5"
+#define PNV_PHB5(obj) \
+    OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
+
 #define PNV_PHB5_VERSION           0x000000a500000001ull
 #define PNV_PHB5_DEVICE_ID         0x0652
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b5b384e9ee4f..d1a911f988b7 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1783,6 +1783,12 @@ static const TypeInfo pnv_phb4_type_info =3D {
     }
 };
=20
+static const TypeInfo pnv_phb5_type_info =3D {
+    .name          =3D TYPE_PNV_PHB5,
+    .parent        =3D TYPE_PNV_PHB4,
+    .instance_size =3D sizeof(PnvPHB4),
+};
+
 static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k =3D BUS_CLASS(klass);
@@ -1907,6 +1913,7 @@ static void pnv_phb4_register_types(void)
     type_register_static(&pnv_phb5_root_port_info);
     type_register_static(&pnv_phb4_root_port_info);
     type_register_static(&pnv_phb4_type_info);
+    type_register_static(&pnv_phb5_type_info);
     type_register_static(&pnv_phb4_iommu_memory_region_info);
 }
=20
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 0ab36e9c8f3c..a0dfa77c8432 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -116,7 +116,8 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
                                         int stack_no,
                                         Error **errp)
 {
-    PnvPHB4 *phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    PnvPHB4 *phb =3D PNV_PHB4(qdev_new(pecc->phb_type));
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack_no);
=20
     object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
@@ -131,9 +132,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecSta=
te *pec,
     }
=20
     /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                             PNV_PHB4_PEC_GET_CLASS(pec)->rp_model);
-
+    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
 }
=20
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
@@ -265,6 +264,7 @@ static void pnv_pec_class_init(ObjectClass *klass, vo=
id *data)
     pecc->stk_compat =3D stk_compat;
     pecc->stk_compat_size =3D sizeof(stk_compat);
     pecc->version =3D PNV_PHB4_VERSION;
+    pecc->phb_type =3D TYPE_PNV_PHB4;
     pecc->num_phbs =3D pnv_pec_num_phbs;
     pecc->rp_model =3D TYPE_PNV_PHB4_ROOT_PORT;
 }
@@ -317,6 +317,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klas=
s, void *data)
     pecc->stk_compat =3D stk_compat;
     pecc->stk_compat_size =3D sizeof(stk_compat);
     pecc->version =3D PNV_PHB5_VERSION;
+    pecc->phb_type =3D TYPE_PNV_PHB5;
     pecc->num_phbs =3D pnv_phb5_pec_num_stacks;
     pecc->rp_model =3D TYPE_PNV_PHB5_ROOT_PORT;
 }
--=20
2.34.1


