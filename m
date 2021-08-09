Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4B3E46E6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:48:56 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5eB-0003tM-JH
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bT-0000FS-1D; Mon, 09 Aug 2021 09:46:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bQ-0000u8-Nh; Mon, 09 Aug 2021 09:46:06 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DYR0v168869; Mon, 9 Aug 2021 09:45:57 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aaa1qxdw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:45:57 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179Cw74o015971;
 Mon, 9 Aug 2021 13:45:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3a9ht8km7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:45:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179Djq1256164738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:45:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E43F11C05B;
 Mon,  9 Aug 2021 13:45:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3054011C04A;
 Mon,  9 Aug 2021 13:45:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:45:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6980C220032;
 Mon,  9 Aug 2021 15:45:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 04/26] ppc/pnv: Use a simple incrementing index for the chip-id
Date: Mon,  9 Aug 2021 15:45:25 +0200
Message-Id: <20210809134547.689560-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6l1jN5XKQCDxl9UabuzZpGO3xRm5cKkr
X-Proofpoint-ORIG-GUID: 6l1jN5XKQCDxl9UabuzZpGO3xRm5cKkr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=988 mlxscore=0 clxscore=1034 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When the QEMU PowerNV machine was introduced, multi chip support
modeled a two socket system with dual chip modules as found on some P8
Tuleta systems (8286-42A). But this is hardly used and not relevant
for QEMU. Use a simple index instead.

With this change, we can now increase the max socket number to 16 as
found on high end systems.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h | 33 +++++++--------------------------
 hw/ppc/pnv.c         | 11 ++++++-----
 2 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 3fec7c87d82d..aa08d79d24de 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -174,25 +174,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
=20
-/*
- * This generates a HW chip id depending on an index, as found on a
- * two socket system with dual chip modules :
- *
- *    0x0, 0x1, 0x10, 0x11
- *
- * 4 chips should be the maximum
- *
- * TODO: use a machine property to define the chip ids
- */
-#define PNV_CHIP_HWID(i) ((((i) & 0x3e) << 3) | ((i) & 0x1))
-
-/*
- * Converts back a HW chip id to an index. This is useful to calculate
- * the MMIO addresses of some controllers which depend on the chip id.
- */
-#define PNV_CHIP_INDEX(chip)                                    \
-    (((chip)->chip_id >> 2) * 2 + ((chip)->chip_id & 0x3))
-
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
=20
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
@@ -256,11 +237,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
 #define PNV_OCC_COMMON_AREA_BASE    0x7fff800000ull
 #define PNV_OCC_SENSOR_BASE(chip)   (PNV_OCC_COMMON_AREA_BASE + \
-    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
+    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
=20
 #define PNV_HOMER_SIZE              0x0000000000400000ull
 #define PNV_HOMER_BASE(chip)                                            =
\
-    (0x7ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV_HOMER_SIZE=
)
+    (0x7ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV_HOMER_SIZE)
=20
=20
 /*
@@ -279,16 +260,16 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
  */
 #define PNV_ICP_SIZE         0x0000000000100000ull
 #define PNV_ICP_BASE(chip)                                              =
\
-    (0x0003ffff80000000ull + (uint64_t) PNV_CHIP_INDEX(chip) * PNV_ICP_S=
IZE)
+    (0x0003ffff80000000ull + (uint64_t) (chip)->chip_id * PNV_ICP_SIZE)
=20
=20
 #define PNV_PSIHB_SIZE       0x0000000000100000ull
 #define PNV_PSIHB_BASE(chip) \
-    (0x0003fffe80000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * PNV_PSIHB_=
SIZE)
+    (0x0003fffe80000000ull + (uint64_t)(chip)->chip_id * PNV_PSIHB_SIZE)
=20
 #define PNV_PSIHB_FSP_SIZE   0x0000000100000000ull
 #define PNV_PSIHB_FSP_BASE(chip) \
-    (0x0003ffe000000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * \
+    (0x0003ffe000000000ull + (uint64_t)(chip)->chip_id * \
      PNV_PSIHB_FSP_SIZE)
=20
 /*
@@ -324,11 +305,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV9_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
 #define PNV9_OCC_COMMON_AREA_BASE    0x203fff800000ull
 #define PNV9_OCC_SENSOR_BASE(chip)   (PNV9_OCC_COMMON_AREA_BASE +       =
\
-    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
+    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
=20
 #define PNV9_HOMER_SIZE              0x0000000000400000ull
 #define PNV9_HOMER_BASE(chip)                                           =
\
-    (0x203ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV9_HOMER_S=
IZE)
+    (0x203ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV9_HOMER_SIZE)
=20
 /*
  * POWER10 MMIO base addresses - 16TB stride per chip
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index b122251d1a5d..025f01c55744 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -809,9 +809,10 @@ static void pnv_init(MachineState *machine)
      * TODO: should we decide on how many chips we can create based
      * on #cores and Venice vs. Murano vs. Naples chip type etc...,
      */
-    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 4) {
+    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 16) {
         error_report("invalid number of chips: '%d'", pnv->num_chips);
-        error_printf("Try '-smp sockets=3DN'. Valid values are : 1, 2 or=
 4.\n");
+        error_printf(
+            "Try '-smp sockets=3DN'. Valid values are : 1, 2, 4, 8 and 1=
6.\n");
         exit(1);
     }
=20
@@ -819,6 +820,7 @@ static void pnv_init(MachineState *machine)
     for (i =3D 0; i < pnv->num_chips; i++) {
         char chip_name[32];
         Object *chip =3D OBJECT(qdev_new(chip_typename));
+        int chip_id =3D i;
=20
         pnv->chips[i] =3D PNV_CHIP(chip);
=20
@@ -831,10 +833,9 @@ static void pnv_init(MachineState *machine)
                                     &error_fatal);
         }
=20
-        snprintf(chip_name, sizeof(chip_name), "chip[%d]", PNV_CHIP_HWID=
(i));
+        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
-        object_property_set_int(chip, "chip-id", PNV_CHIP_HWID(i),
-                                &error_fatal);
+        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
         object_property_set_int(chip, "nr-cores", machine->smp.cores,
                                 &error_fatal);
         object_property_set_int(chip, "nr-threads", machine->smp.threads=
,
--=20
2.31.1


