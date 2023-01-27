Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B870D67E531
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNr0-0005vc-FG; Fri, 27 Jan 2023 07:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqt-0005sb-Q9; Fri, 27 Jan 2023 07:29:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pLNqs-0003eN-4o; Fri, 27 Jan 2023 07:29:07 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RBpQ7s025599; Fri, 27 Jan 2023 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uO2uE8hR2jVrPTr7glQw7RKKikrCP3XRWSwBfnCqIOM=;
 b=OmYtS8xOywv3+PCHtQoFEhOnWjuS9bKzntXVM7Y2sKmmgu/CzCfWNa0qKOmCfEpSx0xH
 eml/lEW4+Q1UvRvU70QqRIxmv+W1QXnbfPC2MSgBNgqEuq9ZAD7JYRWzqTAdqxzqtc1y
 j47srlC+rtzs81EwCpBIZyBfDoh2H46R/oFlW5phnHEEDK4xTBZ82Ag2fEAODtGyhk4F
 zD4ivthATb06ow/1WSFbqMNqOhwIX1LmpOLVMW1X83jQQPFQQMYs4ESiIXEBXBCN3xFF
 xfT8lcS0O7qu0dXE2wI2QF5xYXaKaI6TRUSGWpNJI3QZ/SAyQ91PzkqEV0aaGG9h8b3z 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nce3xrvbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30RBqrSC000663;
 Fri, 27 Jan 2023 12:28:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nce3xrvb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:55 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30QLrHSw012106;
 Fri, 27 Jan 2023 12:28:53 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n87p6qgh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 12:28:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30RCSpIi21299490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Jan 2023 12:28:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AF8720040;
 Fri, 27 Jan 2023 12:28:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAB8D20043;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.86.232])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 27 Jan 2023 12:28:50 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 4/4] ppc/pnv/pci: Fix PHB xscom registers memory region name
Date: Fri, 27 Jan 2023 13:28:48 +0100
Message-Id: <20230127122848.550083-5-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127122848.550083-1-fbarrat@linux.ibm.com>
References: <20230127122848.550083-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MyrTzPP-3YxBPe_Bu0uZLM9ZXeBudw2_
X-Proofpoint-ORIG-GUID: 3qPfNlswTZD0wSmWrY0-Qr-ExRT2RwoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_06,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=855 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270113
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

The name is for the region mapping the PHB xscom registers. It was
apparently a bad cut-and-paste from the per-stack pci xscom area just
above, so we had two regions with the same name.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ccbde841fc..542f9e2932 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1497,7 +1497,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-phb-%d",
              pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
                           &pnv_phb4_xscom_ops, phb, name, 0x40);
-- 
2.39.1


