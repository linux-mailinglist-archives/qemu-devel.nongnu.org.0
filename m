Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768486A86E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:39:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvz-00070M-7w; Thu, 02 Mar 2023 11:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvx-0006t1-El; Thu, 02 Mar 2023 11:37:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvv-0000h7-Ji; Thu, 02 Mar 2023 11:37:33 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322GVKed001031; Thu, 2 Mar 2023 16:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5vXVQpn2ZNQBDx6+PBciSEsq3nlJCTyGz5H/F5fwG8g=;
 b=aI349W3DD5PyOReHNWMKwBPOEu3fI+eZQfAfVLGuS7YOQwJxXiGnEm109G6uYCceslp9
 TG54rJyzJUW8+rUnLDZZfwlyv6uuo6mdJ+GKkc8VbuHfaGvHh9xwSJM/KbG0EseySpdK
 dErYQln4hdOLbB496CvY1hrPz0032C5qIuf1UBLt8055z6RyQHPJuyexi1Ym0OODd+Hn
 aqgbUX6a+Hy7bzAShJf4uKnXtJddQF2b1M+XEklRbMyPEtihHDTvGpcwmKKD4qHTNLn6
 XUQpKCrOinAuIHd8188NG1ntH7LGRoqrYV+LXPD0V7UoGT2eJAb9/+jRChLoK8nynDmq CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2y6rrn2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:22 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322GWL8j010978;
 Thu, 2 Mar 2023 16:37:21 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2y6rrn0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:21 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322GU8iG022378;
 Thu, 2 Mar 2023 16:37:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nybdbmfq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322GbGS31704664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 16:37:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 800D52004B;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26D1920040;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.65.81])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/4] pnv_phb4_pec: Keep track of instantiated PHBs
Date: Thu,  2 Mar 2023 17:37:12 +0100
Message-Id: <20230302163715.129635-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302163715.129635-1-fbarrat@linux.ibm.com>
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cZJ0VhviZOZgw4VrOQofEqJIy2PiB5kW
X-Proofpoint-ORIG-GUID: EbSj8lwpoZiMcWw1Tf3YT5Z4th5jXV-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=675 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add an array on the PEC object to keep track of the PHBs which are
instantiated. The array can be sparsely populated when using
user-created PHBs. It will be useful for the next patch to only export
instantiated PHBs in the device tree.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 12 +++++++-----
 hw/ppc/pnv.c                   |  1 +
 include/hw/pci-host/pnv_phb4.h |  2 ++
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 43267a428f..97c06bb0a0 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,9 +112,9 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
-                                        int stack_no,
-                                        Error **errp)
+static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
+                                           int stack_no,
+                                           Error **errp)
 {
     PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
@@ -128,8 +128,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                             &error_fatal);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
-        return;
+        return NULL;
     }
+    return phb;
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
@@ -148,8 +149,9 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
     /* Create PHBs if running with defaults */
     if (defaults_enabled()) {
+        g_assert(pec->num_phbs <= MAX_PHBS_PER_PEC);
         for (i = 0; i < pec->num_phbs; i++) {
-            pnv_pec_default_phb_realize(pec, i, errp);
+            pec->phbs[i] = pnv_pec_default_phb_realize(pec, i, errp);
         }
     }
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 44b1fbbc93..24bf8461d6 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -314,6 +314,7 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                pec->phbs[j] = phb->phb_base;
                 return pec;
             }
         }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 28d61b96c7..0b72ef1471 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -185,6 +185,8 @@ struct PnvPhb4PecState {
 
     /* PHBs */
     uint32_t num_phbs;
+#define MAX_PHBS_PER_PEC        3
+    PnvPHB *phbs[MAX_PHBS_PER_PEC];
 
     PnvChip *chip;
 };
-- 
2.39.2


