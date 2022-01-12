Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C848C42F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:48:03 +0100 (CET)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7d2o-0002As-Au
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEz-0006YW-Kh; Wed, 12 Jan 2022 06:56:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEw-0007Xj-F6; Wed, 12 Jan 2022 06:56:33 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBKECU013932; 
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhv9qvdjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBkx1s018215;
 Wed, 12 Jan 2022 11:56:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3df289ap2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuJ1H36438372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34E77AE05A;
 Wed, 12 Jan 2022 11:56:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04906AE078;
 Wed, 12 Jan 2022 11:56:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4F38922016C;
 Wed, 12 Jan 2022 12:56:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 24/34] ppc/pnv: Move num_phbs under Pnv8Chip
Date: Wed, 12 Jan 2022 12:55:41 +0100
Message-Id: <20220112115551.987666-25-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PUgyTkUzfeMBQUlIXIeg8kVUlphbjhsc
X-Proofpoint-ORIG-GUID: PUgyTkUzfeMBQUlIXIeg8kVUlphbjhsc
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not used elsewhere so that's where it belongs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220105212338.49899-10-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h | 4 ++--
 hw/ppc/pnv.c         | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index f4219da7c516..0e9e16544f30 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -52,7 +52,6 @@ struct PnvChip {
     uint64_t     cores_mask;
     PnvCore      **cores;
=20
-    uint32_t     num_phbs;
     uint32_t     num_pecs;
=20
     MemoryRegion xscom_mmio;
@@ -82,6 +81,7 @@ struct Pnv8Chip {
=20
 #define PNV8_CHIP_PHB3_MAX 4
     PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    uint32_t     num_phbs;
=20
     XICSFabric    *xics;
 };
@@ -136,8 +136,8 @@ struct PnvChipClass {
     /*< public >*/
     uint64_t     chip_cfam_id;
     uint64_t     cores_mask;
-    uint32_t     num_phbs;
     uint32_t     num_pecs;
+    uint32_t     num_phbs;
=20
     DeviceRealize parent_realize;
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 8dc63823573e..fe7e67e73a3c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1099,7 +1099,6 @@ static void pnv_chip_power10_intc_print_info(PnvChi=
p *chip, PowerPCCPU *cpu,
=20
 static void pnv_chip_power8_instance_init(Object *obj)
 {
-    PnvChip *chip =3D PNV_CHIP(obj);
     Pnv8Chip *chip8 =3D PNV8_CHIP(obj);
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(obj);
     int i;
@@ -1118,10 +1117,10 @@ static void pnv_chip_power8_instance_init(Object =
*obj)
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER=
);
=20
     if (defaults_enabled()) {
-        chip->num_phbs =3D pcc->num_phbs;
+        chip8->num_phbs =3D pcc->num_phbs;
     }
=20
-    for (i =3D 0; i < chip->num_phbs; i++) {
+    for (i =3D 0; i < chip8->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV=
_PHB3);
     }
=20
@@ -1247,7 +1246,7 @@ static void pnv_chip_power8_realize(DeviceState *de=
v, Error **errp)
                                 &chip8->homer.regs);
=20
     /* PHB3 controllers */
-    for (i =3D 0; i < chip->num_phbs; i++) {
+    for (i =3D 0; i < chip8->num_phbs; i++) {
         PnvPHB3 *phb =3D &chip8->phbs[i];
=20
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
--=20
2.31.1


