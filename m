Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A38477FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:08:32 +0100 (CET)
Received: from localhost ([::1]:41186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyvP-0002AA-96
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM0-0004Ee-Ad; Thu, 16 Dec 2021 15:27:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLx-0007Yq-CQ; Thu, 16 Dec 2021 15:27:52 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJI7nc025942; 
 Thu, 16 Dec 2021 20:27:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys71g31s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:24 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKHGEJ025669;
 Thu, 16 Dec 2021 20:27:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys71g30y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCwlZ004383;
 Thu, 16 Dec 2021 20:27:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3cy7vvsypn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKRIKW18153932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF7B252052;
 Thu, 16 Dec 2021 20:27:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 9AAE752051;
 Thu, 16 Dec 2021 20:27:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E8A93220238;
 Thu, 16 Dec 2021 21:27:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 093/101] ppc/pnv: Use QOM hierarchy to scan PHB3 devices
Date: Thu, 16 Dec 2021 21:26:06 +0100
Message-Id: <20211216202614.414266-94-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 10Bl83dBkfG5p9SOcJiqBmEysBDdEk_U
X-Proofpoint-GUID: N3s1d2GaDtsY2XkQllUw-ptrrfSEbQ-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=603 malwarescore=0 clxscore=1034 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When -nodefaults is supported for PHB3 devices, the phbs array under
the chip will be empty. This will break the XICSFabric handlers, and
all interrupt delivery, and the 'info pic' HMP command.

Do a QOM loop on the chip children and look for PHB3 devices instead.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211213132830.108372-7-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 72 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c97fe77e88e6..e75fc999ee11 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -638,16 +638,25 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error =
**errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
=20
+static int pnv_chip_power8_pic_print_info_child(Object *child, void *opa=
que)
+{
+    Monitor *mon =3D opaque;
+    PnvPHB3 *phb3 =3D (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PH=
B3);
+
+    if (phb3) {
+        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
+        ics_pic_print_info(&phb3->lsis, mon);
+    }
+    return 0;
+}
+
 static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv8Chip *chip8 =3D PNV8_CHIP(chip);
-    int i;
=20
     ics_pic_print_info(&chip8->psi.ics, mon);
-    for (i =3D 0; i < chip->num_phbs; i++) {
-        pnv_phb3_msi_pic_print_info(&chip8->phbs[i].msis, mon);
-        ics_pic_print_info(&chip8->phbs[i].lsis, mon);
-    }
+    object_child_foreach(OBJECT(chip),
+                         pnv_chip_power8_pic_print_info_child, mon);
 }
=20
 static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
@@ -1789,10 +1798,32 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint=
32_t pir)
     return NULL;
 }
=20
+typedef struct ForeachPhb3Args {
+    int irq;
+    ICSState *ics;
+} ForeachPhb3Args;
+
+static int pnv_ics_get_child(Object *child, void *opaque)
+{
+    ForeachPhb3Args *args =3D opaque;
+    PnvPHB3 *phb3 =3D (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PH=
B3);
+
+    if (phb3) {
+        if (ics_valid_irq(&phb3->lsis, args->irq)) {
+            args->ics =3D &phb3->lsis;
+        }
+        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
+            args->ics =3D ICS(&phb3->msis);
+        }
+    }
+    return args->ics ? 1 : 0;
+}
+
 static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
 {
     PnvMachineState *pnv =3D PNV_MACHINE(xi);
-    int i, j;
+    ForeachPhb3Args args =3D { irq, NULL };
+    int i;
=20
     for (i =3D 0; i < pnv->num_chips; i++) {
         PnvChip *chip =3D pnv->chips[i];
@@ -1801,32 +1832,37 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int =
irq)
         if (ics_valid_irq(&chip8->psi.ics, irq)) {
             return &chip8->psi.ics;
         }
-        for (j =3D 0; j < chip->num_phbs; j++) {
-            if (ics_valid_irq(&chip8->phbs[j].lsis, irq)) {
-                return &chip8->phbs[j].lsis;
-            }
-            if (ics_valid_irq(ICS(&chip8->phbs[j].msis), irq)) {
-                return ICS(&chip8->phbs[j].msis);
-            }
+
+        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
+        if (args.ics) {
+            return args.ics;
         }
     }
     return NULL;
 }
=20
+static int pnv_ics_resend_child(Object *child, void *opaque)
+{
+    PnvPHB3 *phb3 =3D (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PH=
B3);
+
+    if (phb3) {
+        ics_resend(&phb3->lsis);
+        ics_resend(ICS(&phb3->msis));
+    }
+    return 0;
+}
+
 static void pnv_ics_resend(XICSFabric *xi)
 {
     PnvMachineState *pnv =3D PNV_MACHINE(xi);
-    int i, j;
+    int i;
=20
     for (i =3D 0; i < pnv->num_chips; i++) {
         PnvChip *chip =3D pnv->chips[i];
         Pnv8Chip *chip8 =3D PNV8_CHIP(pnv->chips[i]);
=20
         ics_resend(&chip8->psi.ics);
-        for (j =3D 0; j < chip->num_phbs; j++) {
-            ics_resend(&chip8->phbs[j].lsis);
-            ics_resend(ICS(&chip8->phbs[j].msis));
-        }
+        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
     }
 }
=20
--=20
2.31.1


