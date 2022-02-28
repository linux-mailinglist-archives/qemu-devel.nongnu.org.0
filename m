Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76C4C7119
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:58:48 +0100 (CET)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiQB-0000TJ-Ba
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKN-0006kR-Ra; Mon, 28 Feb 2022 10:52:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKL-000178-F0; Mon, 28 Feb 2022 10:52:47 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SFhVo1001265; 
 Mon, 28 Feb 2022 15:52:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh19qg78r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:35 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SFi39A002823;
 Mon, 28 Feb 2022 15:52:35 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh19qg782-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:35 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlU4C028110;
 Mon, 28 Feb 2022 15:52:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3efbu8r1hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:32 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21SFfdON50069764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:41:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69F12A405B;
 Mon, 28 Feb 2022 15:52:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23394A4054;
 Mon, 28 Feb 2022 15:52:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6465B2201B4;
 Mon, 28 Feb 2022 16:52:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 08/18] ppc/psi: Add support for StoreEOI and 64k ESB pages
 (POWER10)
Date: Mon, 28 Feb 2022 16:52:12 +0100
Message-Id: <20220228155222.643974-9-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u07jxv7g7J-ZOSomPZpCd6hP4g9nARlJ
X-Proofpoint-ORIG-GUID: wquof9U6HSI4t12M7mlC3WQVSGMDZVih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxlogscore=860 clxscore=1034 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202280083
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
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
index 0b53406fe29c..9ef9e1b074bb 100644
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


