Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF504D4DB7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:57:31 +0100 (CET)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLAQ-00087X-8N
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4P-0002LZ-BW; Thu, 10 Mar 2022 10:51:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4N-0006te-OH; Thu, 10 Mar 2022 10:51:17 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AEnk2q024418; 
 Thu, 10 Mar 2022 15:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zG5vxGJftZbPK+mCpTuCZR8TWo694bhKIOdJFzD0yFo=;
 b=Fb0aTmuvYDECHmZiUrcjXyteTf8cDTZRB3PwtJIUNN2uCsEtiGkbVx2h+lIm8CWL3vRx
 PG8qd/tfBku069B3cLoeP9Cln3/1NvgCbgkS1BCSH6exB3Dj76CD+SjlUERJA8FrVJhX
 xPpNyUItZ8hvdy1nTKkbJoi/JzTudsfFH/uVvw1DUEK0v8Gzu6mk0cjwpxGAqOlrELSr
 oR1LwIHJ66jcBDQDxSKEh/r/9fBsUeMj79y09wG3evnWi94FGqJk6/sF2UvUUzzw6HaY
 9fVy0m3LN1lYgYByAHroLmUlfk+LfHoBUeO4WIo7Je0c2TeoK0n8b5/tzddtmX78I9qg mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3epwxfc8sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:07 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AFFXLP025586;
 Thu, 10 Mar 2022 15:51:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3epwxfc8s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:06 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AFdOlC004309;
 Thu, 10 Mar 2022 15:51:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4j554b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AFp2K59175498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:51:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEAB35204E;
 Thu, 10 Mar 2022 15:51:02 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 83DB352051;
 Thu, 10 Mar 2022 15:51:02 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 3/3] ppc/pnv: Fix PEC lookup function for POWER10
Date: Thu, 10 Mar 2022 16:51:01 +0100
Message-Id: <20220310155101.294568-4-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310155101.294568-1-fbarrat@linux.ibm.com>
References: <20220310155101.294568-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bIaJu2K69-OAV3JZ7ENI8-w1pGg8fxs3
X-Proofpoint-ORIG-GUID: yo6qOnecQFZWZei5U0lB1ujiShUqPkRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_06,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=856 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PEC array used when looking for the PEC hosting a PHB is stored in
the chip structure. The array is at a different offset in Pnv9Chip and
Pnv10Chip. The lookup function was therefore not working properly on
POWER10.
This patch fixes it by introducing a class method to get the correct
PEC pointer based on the chip object and PEC index.

Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4.c |  5 ++---
 hw/ppc/pnv.c           | 14 ++++++++++++++
 include/hw/ppc/pnv.h   |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index d1a911f988..4732633833 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1548,7 +1548,6 @@ static void pnv_phb4_instance_init(Object *obj)
 static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
                                          Error **errp)
 {
-    Pnv9Chip *chip9 = PNV9_CHIP(chip);
     int chip_id = phb->chip_id;
     int index = phb->phb_id;
     int i, j;
@@ -1556,9 +1555,9 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
     for (i = 0; i < chip->num_pecs; i++) {
         /*
          * For each PEC, check the amount of phbs it supports
-         * and see if the given phb4 index matches an index.
+         * and see if the given phb index matches an index.
          */
-        PnvPhb4PecState *pec = &chip9->pecs[i];
+        PnvPhb4PecState *pec = PNV_CHIP_GET_CLASS(chip)->get_pec(chip, i);
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index df58403a3a..3a676cd570 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1561,6 +1561,12 @@ static uint32_t pnv_chip_power9_xscom_pcba(PnvChip *chip, uint64_t addr)
     return addr >> 3;
 }
 
+static PnvPhb4PecState *pnv_chip_power9_get_pec(PnvChip *chip, uint32_t index)
+{
+    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    return &chip9->pecs[index];
+}
+
 static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1580,6 +1586,7 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
     k->xscom_pcba = pnv_chip_power9_xscom_pcba;
     dc->desc = "PowerNV Chip POWER9";
     k->num_pecs = PNV9_CHIP_MAX_PEC;
+    k->get_pec = pnv_chip_power9_get_pec;
 
     device_class_set_parent_realize(dc, pnv_chip_power9_realize,
                                     &k->parent_realize);
@@ -1769,6 +1776,12 @@ static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr)
     return addr >> 3;
 }
 
+static PnvPhb4PecState *pnv_chip_power10_get_pec(PnvChip *chip, uint32_t index)
+{
+    Pnv10Chip *chip10 = PNV10_CHIP(chip);
+    return &chip10->pecs[index];
+}
+
 static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1788,6 +1801,7 @@ static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
     k->xscom_pcba = pnv_chip_power10_xscom_pcba;
     dc->desc = "PowerNV Chip POWER10";
     k->num_pecs = PNV10_CHIP_MAX_PEC;
+    k->get_pec = pnv_chip_power10_get_pec;
 
     device_class_set_parent_realize(dc, pnv_chip_power10_realize,
                                     &k->parent_realize);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 1e34ddd502..282f76ba08 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -163,6 +163,7 @@ struct PnvChipClass {
     void (*pic_print_info)(PnvChip *chip, Monitor *mon);
     uint64_t (*xscom_core_base)(PnvChip *chip, uint32_t core_id);
     uint32_t (*xscom_pcba)(PnvChip *chip, uint64_t addr);
+    PnvPhb4PecState *(*get_pec)(PnvChip *chip, uint32_t index);
 };
 
 #define PNV_CHIP_TYPE_SUFFIX "-" TYPE_PNV_CHIP
-- 
2.35.1


