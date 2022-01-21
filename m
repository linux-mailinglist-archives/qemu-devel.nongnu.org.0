Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF2049622E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:36:32 +0100 (CET)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAvxn-00040b-Um
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:36:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nAvll-00054t-L5; Fri, 21 Jan 2022 10:24:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nAvlj-0007zg-GB; Fri, 21 Jan 2022 10:24:05 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LEoMHK018787; 
 Fri, 21 Jan 2022 15:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=z6HVkA612KP3A8Ibk6gvY9f3go74yrFrhyMxs4oE0uw=;
 b=CxJYPfJTICNXlTqqyJs3toeOG5VFSX5b1YYyQkmuxa8gS1Mkg761wV9bhFTwOzUXIirA
 VRHOBpqoj6itcybSdAJ71WAkw+A/W2ZkJ1GKeaOP3UPbbj6eHwhVwceXrgMYVArfxkUZ
 X6DS5OJlf9L5a7D8m345FO98HMz7M606BTkXGS/WTxqsZ6J4gdLJSmjxF9XENrjQCVSa
 1j+D1jZ6syb0r8s7Az7F+Kh2VENBvIKvAr6YBOI0wBipZutxwTkirGfJY5nMsBEOj4UG
 gLbx0OiXonN7MJEQZIJWg+gPsRIV70gjd/K63Wix/H4vOe7GfXbGlhoQA6N7bVPEF9wO lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqxtg8x7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 15:23:56 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LEoKen016325;
 Fri, 21 Jan 2022 15:23:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dqxtg8x6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 15:23:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LFIGDa021417;
 Fri, 21 Jan 2022 15:23:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3dqjdpnygt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 15:23:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LFNpXd41419144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 15:23:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46D89A4062;
 Fri, 21 Jan 2022 15:23:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E460A4060;
 Fri, 21 Jan 2022 15:23:51 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.16.103])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 15:23:50 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] ppc/pnv: Fail DMA access if page permissions are not correct
Date: Fri, 21 Jan 2022 16:23:50 +0100
Message-Id: <20220121152350.381685-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oodHOdwiNmGH-_pEMZpl06OqFwRygLUY
X-Proofpoint-ORIG-GUID: GS-u9pA2fkRw0n-n36-Q_2wysHusEOlM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_06,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: aik@ozlabs.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If an iommu page has wrong permissions, an error message is displayed,
but the access is allowed, which is odd. This patch fixes it.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb3.c | 11 ++++++-----
 hw/pci-host/pnv_phb4.c | 11 ++++++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 7fb35dc031..a757f1a58e 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -816,18 +816,19 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
         }
 
         /* We exit the loop with TCE being the final TCE */
-        tce_mask = ~((1ull << tce_shift) - 1);
-        tlb->iova = addr & tce_mask;
-        tlb->translated_addr = tce & tce_mask;
-        tlb->addr_mask = ~tce_mask;
-        tlb->perm = tce & 3;
         if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
             phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
             phb3_error(phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
                        is_write ? 'W' : 'R', tve);
             phb3_error(phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
                        tta, lev, tts, tps);
+            return;
         }
+        tce_mask = ~((1ull << tce_shift) - 1);
+        tlb->iova = addr & tce_mask;
+        tlb->translated_addr = tce & tce_mask;
+        tlb->addr_mask = ~tce_mask;
+        tlb->perm = tce & 3;
     }
 }
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a78add75b0..ee56377c02 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1291,18 +1291,19 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
         }
 
         /* We exit the loop with TCE being the final TCE */
-        tce_mask = ~((1ull << tce_shift) - 1);
-        tlb->iova = addr & tce_mask;
-        tlb->translated_addr = tce & tce_mask;
-        tlb->addr_mask = ~tce_mask;
-        tlb->perm = tce & 3;
         if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
             phb_error(ds->phb, "TCE access fault at 0x%"PRIx64, taddr);
             phb_error(ds->phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
                        is_write ? 'W' : 'R', tve);
             phb_error(ds->phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
                        tta, lev, tts, tps);
+            return;
         }
+        tce_mask = ~((1ull << tce_shift) - 1);
+        tlb->iova = addr & tce_mask;
+        tlb->translated_addr = tce & tce_mask;
+        tlb->addr_mask = ~tce_mask;
+        tlb->perm = tce & 3;
     }
 }
 
-- 
2.34.1


