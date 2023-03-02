Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401D6A86D6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:38:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlw1-0007Hp-4K; Thu, 02 Mar 2023 11:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvy-00077A-Sk; Thu, 02 Mar 2023 11:37:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvw-0000hH-9C; Thu, 02 Mar 2023 11:37:34 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322GVRpV017417; Thu, 2 Mar 2023 16:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D3DJzkr2hqjPLsNV8hTHumtnbD9BcU6eKp+m/ihlnMQ=;
 b=X7dlQfKrwP/WWvg1sfVZnpO33xgu5JaVVvxhSvIxHxkbqZFuxO3IxnivrfeMD05o4Wv+
 g+Ay6uzfGGDlHZzSDlq8htni37Ump713B3XVIl7sg6y+PKG6/G4zirUlK+4BH1J1tQif
 cFE9Eo4Y1jopdrkGSgclunU/EkB+n1gXZqLzAV1dQSbVTpfHXqZPB5B0wGg35fDDQKuZ
 vAvBB5c5GxN4cvaJeqJpkwsHr5T/SXYoQ6Gnt9V+5dLD+6o5GW+mo8KAY5udgLw4uqr3
 MncS3c3SFT1caPL00xBC2lQ2RINeJbkwhJwAs/L5LqktZNIzHqRNN5tFMnvH+wgNvQfM 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2wdwvk65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:22 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322GVitv019754;
 Thu, 2 Mar 2023 16:37:22 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2wdwvk4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:22 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3222LNpX028691;
 Thu, 2 Mar 2023 16:37:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nybab4gem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322GbHZ150266582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 16:37:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 723232004F;
 Thu,  2 Mar 2023 16:37:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 192EF20040;
 Thu,  2 Mar 2023 16:37:17 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.65.81])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 16:37:17 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 3/4] pnv_phb4_pec: Move pnv_phb4_get_pec() to rightful file
Date: Thu,  2 Mar 2023 17:37:14 +0100
Message-Id: <20230302163715.129635-4-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302163715.129635-1-fbarrat@linux.ibm.com>
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i9RTDb8f3QKlV6vnzg0SFjJQ8BYWpHs7
X-Proofpoint-GUID: 3H-b2RfkNkyTBViNtOfu5b_g-e6EmnT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020144
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The function pnv_phb4_get_pec() exposes some internals of the PEC and
PHB logic, yet it was in the higher level hw/ppc/pnv.c file for
historical reasons: P8 implements the PHBs from pnv.c directly, but on
P9/P10, it's done through the CEC model, which has its own file. So
move pnv_phb4_get_pec() to hw/pci-host/pnv_phb4_pec.c, where it fits
naturally.

While at it, replace the PnvPHB4 parameter by the PnvPHB front-end,
since it has all the information needed and simplify it a bit.

No functional changes.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 40 +++++++++++++++++++++++++++++++
 hw/ppc/pnv.c                   | 44 +---------------------------------
 include/hw/pci-host/pnv_phb4.h |  1 +
 3 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 6c9b386069..6e2e5ae186 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,6 +112,46 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
+PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
+{
+    PnvPhb4PecState *pecs = NULL;
+    int chip_id = phb->chip_id;
+    int index = phb->phb_id;
+    int i, j;
+
+    if (phb->version == 4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb->version == 5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        g_assert_not_reached();
+    }
+
+    for (i = 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
+         */
+        PnvPhb4PecState *pec = &pecs[i];
+
+        for (j = 0; j < pec->num_phbs; j++) {
+            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                pec->phbs[j] = phb;
+                return pec;
+            }
+        }
+    }
+    error_setg(errp,
+               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
+               chip_id, index);
+
+    return NULL;
+}
+
 static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                            int stack_no,
                                            Error **errp)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 24bf8461d6..46010b30ad 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -284,48 +284,6 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
     g_free(reg);
 }
 
-static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
-                                         Error **errp)
-{
-    PnvPHB *phb_base = phb->phb_base;
-    PnvPhb4PecState *pecs = NULL;
-    int chip_id = phb->chip_id;
-    int index = phb->phb_id;
-    int i, j;
-
-    if (phb_base->version == 4) {
-        Pnv9Chip *chip9 = PNV9_CHIP(chip);
-
-        pecs = chip9->pecs;
-    } else if (phb_base->version == 5) {
-        Pnv10Chip *chip10 = PNV10_CHIP(chip);
-
-        pecs = chip10->pecs;
-    } else {
-        g_assert_not_reached();
-    }
-
-    for (i = 0; i < chip->num_pecs; i++) {
-        /*
-         * For each PEC, check the amount of phbs it supports
-         * and see if the given phb4 index matches an index.
-         */
-        PnvPhb4PecState *pec = &pecs[i];
-
-        for (j = 0; j < pec->num_phbs; j++) {
-            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-                pec->phbs[j] = phb->phb_base;
-                return pec;
-            }
-        }
-    }
-    error_setg(errp,
-               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
-               chip_id, index);
-
-    return NULL;
-}
-
 /*
  * Adds a PnvPHB to the chip. Returns the parent obj of the
  * PHB which varies with each version (phb version 3 is parented
@@ -349,7 +307,7 @@ Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
         return OBJECT(chip);
     }
 
-    phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), errp);
+    phb->pec = pnv_phb4_get_pec(chip, phb, errp);
 
     return OBJECT(phb->pec);
 }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 0b72ef1471..5c5edb2941 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -157,6 +157,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
+PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp);
 void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
-- 
2.39.2


