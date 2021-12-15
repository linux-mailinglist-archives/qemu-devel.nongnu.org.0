Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D9476109
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:49:14 +0100 (CET)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZKz-0000rb-BC
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiv-0005of-HH; Wed, 15 Dec 2021 12:05:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXik-0004wt-WC; Wed, 15 Dec 2021 12:05:42 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGkoAd033849; 
 Wed, 15 Dec 2021 17:05:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjdw35ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGlIEQ038560;
 Wed, 15 Dec 2021 17:05:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjdw35j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3Km5024955;
 Wed, 15 Dec 2021 17:05:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH57ZE37159372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:05:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A88EAE063;
 Wed, 15 Dec 2021 17:05:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A072AE053;
 Wed, 15 Dec 2021 17:05:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:07 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 65E53220295;
 Wed, 15 Dec 2021 18:05:06 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 102/102] ppc/pnv: Use QOM hierarchy to scan PEC PHB4 devices
Date: Wed, 15 Dec 2021 18:03:57 +0100
Message-Id: <20211215170357.321643-90-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LSfmyZd_QoVKL0_tE136m8t8Q9ME8v_M
X-Proofpoint-ORIG-GUID: BJ5aUcx93yndsenAjv0NcLtd7kRgh5OJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 mlxscore=0 priorityscore=1501 mlxlogscore=789 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150098
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

When -nodefaults is supported for PHB4 devices, the pecs array under
the chip will be empty. This will break the 'info pic' HMP command.

Do a QOM loop on the chip children and look for PEC PHB4 devices
instead.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211213132830.108372-15-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c0b47a7d8909..29ee0d0f08b4 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -659,20 +659,26 @@ static void pnv_chip_power8_pic_print_info(PnvChip =
*chip, Monitor *mon)
                          pnv_chip_power8_pic_print_info_child, mon);
 }
=20
+static int pnv_chip_power9_pic_print_info_child(Object *child, void *opa=
que)
+{
+    Monitor *mon =3D opaque;
+    PnvPHB4 *phb4 =3D (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PH=
B4);
+
+    if (phb4) {
+        pnv_phb4_pic_print_info(phb4, mon);
+    }
+    return 0;
+}
+
 static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
-    int i, j;
=20
     pnv_xive_pic_print_info(&chip9->xive, mon);
     pnv_psi_pic_print_info(&chip9->psi, mon);
=20
-    for (i =3D 0; i < chip->num_pecs; i++) {
-        PnvPhb4PecState *pec =3D &chip9->pecs[i];
-        for (j =3D 0; j < pec->num_stacks; j++) {
-            pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
-        }
-    }
+    object_child_foreach_recursive(OBJECT(chip),
+                         pnv_chip_power9_pic_print_info_child, mon);
 }
=20
 static uint64_t pnv_chip_power8_xscom_core_base(PnvChip *chip,
--=20
2.31.1


