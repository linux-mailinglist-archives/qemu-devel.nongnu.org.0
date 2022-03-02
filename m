Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF134CA45F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:03:21 +0100 (CET)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNhQ-0005cs-BU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrC-0001NO-Ss; Wed, 02 Mar 2022 06:09:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001rl-4T; Wed, 02 Mar 2022 06:09:22 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AqQu5009967; 
 Wed, 2 Mar 2022 11:08:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej779rc3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:55 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222B8UQ9008297;
 Wed, 2 Mar 2022 11:08:55 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej779rc29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:55 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B37E6017746;
 Wed, 2 Mar 2022 11:08:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19jt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8ou456688980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A181CAE058;
 Wed,  2 Mar 2022 11:08:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 662C5AE051;
 Wed,  2 Mar 2022 11:08:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BBD70220294;
 Wed,  2 Mar 2022 12:08:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 63/87] ppc/psi: Add support for StoreEOI and 64k ESB pages
 (POWER10)
Date: Wed,  2 Mar 2022 12:07:39 +0100
Message-Id: <20220302110803.849505-64-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xnJYlMAH9Z_EPd7Wk7gWHNIp2VMTUaoe
X-Proofpoint-GUID: Vg-Vl9l8mo2qDo2eegPMb4S5gtL2a_ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=888 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 clxscore=1034 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER10 adds support for StoreEOI operation and 64K ESB pages on PSIHB
to be consistent with the other interrupt sources of the system.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c     |  6 ++++++
 hw/ppc/pnv_psi.c | 30 ++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 10ad16c1c55c..0ac86e104fa0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1500,6 +1500,9 @@ static void pnv_chip_power9_realize(DeviceState *de=
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
@@ -1704,6 +1707,9 @@ static void pnv_chip_power10_realize(DeviceState *d=
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
2.34.1


