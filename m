Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554303E46FC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:57:41 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5me-00078h-CE
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bb-0000dj-OX; Mon, 09 Aug 2021 09:46:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32766
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bX-00011P-Tc; Mon, 09 Aug 2021 09:46:15 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DWf2o137984; Mon, 9 Aug 2021 09:46:05 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ab4j0ht3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:05 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179DVnM0023205;
 Mon, 9 Aug 2021 13:46:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3a9ht8kmej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179DgsJL61342066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:42:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E926852063;
 Mon,  9 Aug 2021 13:46:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 999F15204E;
 Mon,  9 Aug 2021 13:46:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DC5A0220032;
 Mon,  9 Aug 2021 15:45:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 16/26] ppc/psi: Add support for StoreEOI and 64k ESB pages
 (POWER10)
Date: Mon,  9 Aug 2021 15:45:37 +0200
Message-Id: <20210809134547.689560-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WNGfpP3VJdwL_Wi9mvcHluRlWmvSebfT
X-Proofpoint-GUID: WNGfpP3VJdwL_Wi9mvcHluRlWmvSebfT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1034 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

POWER10 adds support for StoreEOI operation and 64K ESB pages on PSIHB
to be consistent with the other interrupt sources of the system.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c     |  6 ++++++
 hw/ppc/pnv_psi.c | 30 ++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 2d7eade23ccc..836147d81e1c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1519,6 +1519,9 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip9->psi), "bar", PNV9_PSIHB_BASE(=
chip),
                             &error_fatal);
+    /* This is the only device with 4k ESB pages */
+    object_property_set_int(OBJECT(&chip9->psi), "shift", XIVE_ESB_4K,
+                            &error_fatal);
     if (!qdev_realize(DEVICE(&chip9->psi), NULL, errp)) {
         return;
     }
@@ -1770,6 +1773,9 @@ static void pnv_chip_power10_realize(DeviceState *d=
ev, Error **errp)
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip10->psi), "bar",
                             PNV10_PSIHB_BASE(chip), &error_fatal);
+    /* PSI can now be configured to use 64k ESB pages on POWER10 */
+    object_property_set_int(OBJECT(&chip10->psi), "shift", XIVE_ESB_64K,
+                            &error_fatal);
     if (!qdev_realize(DEVICE(&chip10->psi), NULL, errp)) {
         return;
     }
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index cd9a2c5952a6..737486046d5a 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -601,7 +601,6 @@ static const TypeInfo pnv_psi_power8_info =3D {
 #define   PSIHB9_IRQ_METHOD             PPC_BIT(0)
 #define   PSIHB9_IRQ_RESET              PPC_BIT(1)
 #define PSIHB9_ESB_CI_BASE              0x60
-#define   PSIHB9_ESB_CI_64K             PPC_BIT(1)
 #define   PSIHB9_ESB_CI_ADDR_MASK       PPC_BITMASK(8, 47)
 #define   PSIHB9_ESB_CI_VALID           PPC_BIT(63)
 #define PSIHB9_ESB_NOTIF_ADDR           0x68
@@ -646,6 +645,14 @@ static const TypeInfo pnv_psi_power8_info =3D {
 #define   PSIHB9_IRQ_STAT_DIO           PPC_BIT(12)
 #define   PSIHB9_IRQ_STAT_PSU           PPC_BIT(13)
=20
+/* P10 register extensions */
+
+#define PSIHB10_CR                       PSIHB9_CR
+#define    PSIHB10_CR_STORE_EOI          PPC_BIT(12)
+
+#define PSIHB10_ESB_CI_BASE              PSIHB9_ESB_CI_BASE
+#define   PSIHB10_ESB_CI_64K             PPC_BIT(1)
+
 static void pnv_psi_notify(XiveNotifier *xf, uint32_t srcno)
 {
     PnvPsi *psi =3D PNV_PSI(xf);
@@ -704,6 +711,13 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwad=
dr addr,
=20
     switch (addr) {
     case PSIHB9_CR:
+        if (val & PSIHB10_CR_STORE_EOI) {
+            psi9->source.esb_flags |=3D XIVE_SRC_STORE_EOI;
+        } else {
+            psi9->source.esb_flags &=3D ~XIVE_SRC_STORE_EOI;
+        }
+        break;
+
     case PSIHB9_SEMR:
         /* FSP stuff */
         break;
@@ -715,15 +729,20 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwa=
ddr addr,
         break;
=20
     case PSIHB9_ESB_CI_BASE:
+        if (val & PSIHB10_ESB_CI_64K) {
+            psi9->source.esb_shift =3D XIVE_ESB_64K;
+        } else {
+            psi9->source.esb_shift =3D XIVE_ESB_4K;
+        }
         if (!(val & PSIHB9_ESB_CI_VALID)) {
             if (psi->regs[reg] & PSIHB9_ESB_CI_VALID) {
                 memory_region_del_subregion(sysmem, &psi9->source.esb_mm=
io);
             }
         } else {
             if (!(psi->regs[reg] & PSIHB9_ESB_CI_VALID)) {
-                memory_region_add_subregion(sysmem,
-                                        val & ~PSIHB9_ESB_CI_VALID,
-                                        &psi9->source.esb_mmio);
+                hwaddr addr =3D val & ~(PSIHB9_ESB_CI_VALID | PSIHB10_ES=
B_CI_64K);
+                memory_region_add_subregion(sysmem, addr,
+                                            &psi9->source.esb_mmio);
             }
         }
         psi->regs[reg] =3D val;
@@ -831,6 +850,7 @@ static void pnv_psi_power9_instance_init(Object *obj)
     Pnv9Psi *psi =3D PNV9_PSI(obj);
=20
     object_initialize_child(obj, "source", &psi->source, TYPE_XIVE_SOURC=
E);
+    object_property_add_alias(obj, "shift", OBJECT(&psi->source), "shift=
");
 }
=20
 static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
@@ -839,8 +859,6 @@ static void pnv_psi_power9_realize(DeviceState *dev, =
Error **errp)
     XiveSource *xsrc =3D &PNV9_PSI(psi)->source;
     int i;
=20
-    /* This is the only device with 4k ESB pages */
-    object_property_set_int(OBJECT(xsrc), "shift", XIVE_ESB_4K, &error_f=
atal);
     object_property_set_int(OBJECT(xsrc), "nr-irqs", PSIHB9_NUM_IRQS,
                             &error_fatal);
     object_property_set_link(OBJECT(xsrc), "xive", OBJECT(psi), &error_a=
bort);
--=20
2.31.1


