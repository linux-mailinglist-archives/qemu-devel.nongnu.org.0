Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042836A8704
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlw3-0007c8-At; Thu, 02 Mar 2023 11:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvz-0007Cy-Ld; Thu, 02 Mar 2023 11:37:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvx-0000hT-KB; Thu, 02 Mar 2023 11:37:35 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322GUbtj006993; Thu, 2 Mar 2023 16:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VKif39YbzKsYxZkK6ufmcAbnXHwi9WvJw+hl+9M37tc=;
 b=gmJh7ugSt/u7dvIFLR6n3rQyMa4Xv28SPAzjNN3RpbUx+dZDTmEgD2AC5SUVgmxAOzNf
 mxoYWD6x4/Yuv/RCS+BI6UU+hLqXN78umLhYQgMADh9GgGWwkTHEnUxxAQ9s1+kRTbOG
 ShU6sZSUNLjlVTMma/w7VMbbGmXd8wkIsiAFvBGAWl0BOTc+mgj9mOrgfNXjgLOipk4L
 FkeGAFkL8y5QOnKoAC86/dFD/Nvk18IIx8qp/lRpmpTbV2cm+y7iJewLFDdJbZe7pXwL
 b15aZz0uyBQJ/FE9eSbABc48yxaT2gCrD6zU6SzSynj3iK63fNa8PA3UbgIGSpucENkB ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2y7d0kna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:23 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322GUbNL007078;
 Thu, 2 Mar 2023 16:37:23 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2y7d0km7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:22 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3227OPXf008599;
 Thu, 2 Mar 2023 16:37:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nybe2mf9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322GbIaX63308252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 16:37:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E473520040;
 Thu,  2 Mar 2023 16:37:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C8F02004B;
 Thu,  2 Mar 2023 16:37:17 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.65.81])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 16:37:17 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 4/4] pnv_phb4_pec: Simplify/align code to parent user-created
 PHBs
Date: Thu,  2 Mar 2023 17:37:15 +0100
Message-Id: <20230302163715.129635-5-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302163715.129635-1-fbarrat@linux.ibm.com>
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _xMhN4JlzHarmRNhQXYMX6uHNeyI1vFf
X-Proofpoint-ORIG-GUID: D2VFGRWguWHoiBPNyYbF309A9BJ1v0rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020144
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

When instantiating a user-created PHB on P9/P10, we don't really have
a reason any more to go through an indirection in pnv_chip_add_phb()
in pnv.c, we can go straight to the right function in
pnv_phb4_pec.c. That way, default PHBs and user-created PHBs are all
handled in the same file.  This patch also renames pnv_phb4_get_pec()
to pnv_pec_add_phb() to better reflect that it "hooks" a PHB to a PEC.

For P8, the PHBs are parented to the chip directly, so it makes sense
to keep calling pnv_chip_add_phb() in pnv.c, to also be consistent
with where default PHBs are handled. The only change here is that,
since that function is now only used for P8, we can refine the return
type.

So overall, the PnvPHB front-end now has a pnv_phb_user_get_parent()
function which handles the parenting of the user-created PHBs by
calling the right function in the right file based on the processor
version. It's also easily extensible if we ever need to support a
different parent object.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb.c          | 11 ++++++++++-
 hw/pci-host/pnv_phb4_pec.c     |  3 ++-
 hw/ppc/pnv.c                   | 29 ++++++++---------------------
 include/hw/pci-host/pnv_phb4.h |  2 +-
 include/hw/ppc/pnv.h           |  2 +-
 5 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c62b08538a..82332d7a05 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -62,6 +62,15 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
     return true;
 }
 
+static Object *pnv_phb_user_get_parent(PnvChip *chip, PnvPHB *phb, Error **errp)
+{
+    if (phb->version == 3) {
+        return OBJECT(pnv_chip_add_phb(chip, phb));
+    } else {
+        return OBJECT(pnv_pec_add_phb(chip, phb, errp));
+    }
+}
+
 /*
  * User created devices won't have the initial setup that default
  * devices have. This setup consists of assigning a parent device
@@ -79,7 +88,7 @@ static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
         return false;
     }
 
-    parent = pnv_chip_add_phb(chip, phb, errp);
+    parent = pnv_phb_user_get_parent(chip, phb, errp);
     if (!parent) {
         return false;
     }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 6e2e5ae186..3b2850f7a3 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,7 +112,7 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
+PnvPhb4PecState *pnv_pec_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
 {
     PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
@@ -141,6 +141,7 @@ PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp)
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
                 pec->phbs[j] = phb;
+                phb->pec = pec;
                 return pec;
             }
         }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 46010b30ad..11cb48af2f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -285,31 +285,18 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
 }
 
 /*
- * Adds a PnvPHB to the chip. Returns the parent obj of the
- * PHB which varies with each version (phb version 3 is parented
- * by the chip, version 4 and 5 are parented by the PEC
- * device).
- *
- * TODO: for version 3 we're still parenting the PHB with the
- * chip. We should parent with a (so far not implemented)
- * PHB3 PEC device.
+ * Adds a PnvPHB to the chip on P8.
+ * Implemented here, like for defaults PHBs
  */
-Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
+PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb)
 {
-    if (phb->version == 3) {
-        Pnv8Chip *chip8 = PNV8_CHIP(chip);
-
-        phb->chip = chip;
-
-        chip8->phbs[chip8->num_phbs] = phb;
-        chip8->num_phbs++;
-
-        return OBJECT(chip);
-    }
+    Pnv8Chip *chip8 = PNV8_CHIP(chip);
 
-    phb->pec = pnv_phb4_get_pec(chip, phb, errp);
+    phb->chip = chip;
 
-    return OBJECT(phb->pec);
+    chip8->phbs[chip8->num_phbs] = phb;
+    chip8->num_phbs++;
+    return chip;
 }
 
 static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 5c5edb2941..2d026db9a3 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -157,7 +157,7 @@ struct PnvPHB4 {
 
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
-PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb, Error **errp);
+PnvPhb4PecState *pnv_pec_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
 void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 96fb850419..409f3bf763 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -100,7 +100,7 @@ struct PnvMachineState {
 };
 
 PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id);
-Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp);
+PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb);
 
 #define PNV_FDT_ADDR          0x01000000
 #define PNV_TIMEBASE_FREQ     512000000ULL
-- 
2.39.2


