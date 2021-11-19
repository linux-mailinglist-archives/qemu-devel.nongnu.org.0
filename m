Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D03456FF4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:49:24 +0100 (CET)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4GZ-0004eH-L5
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4CM-0007AH-1r; Fri, 19 Nov 2021 08:45:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4CK-000748-5M; Fri, 19 Nov 2021 08:45:01 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDfRhl003555; 
 Fri, 19 Nov 2021 13:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2FgDclDBFZ0Coo+j3xKpdf9IaUEUknh/O0Fh3T9/3pA=;
 b=CwOqEJ76Ajl2oaOa4SgmvL8P/qvOJiYPIaSLWYnYd1e5artMz5La1H0q9wQOhcBF1IO3
 OkSHycnA9+a9iQX2JQX1Z9nfse0GUaV/lkKEoPJMohdxR6+45Xy2p9cBaT9dGEAu+Wx2
 tlQpIC/02T84aV6/rPAlSfISiDMljXH775LyMaDbtk0Rftx28a7iZ4p327d6uCnA0egQ
 FloXFH0xJbVh6sJnKikr3idxt+4dWXIACPzBfs40yPNWPgMZ7DHftuN5DndgcPylTzQv
 ejjlV8Fv2DV0JmCXZPuhyTrtgk4ReC77m1XSVilHXU8RW5jYCLc0Jbvib3RhjPP7Fjgm Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ced1f81tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:45 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJDfxw1005450;
 Fri, 19 Nov 2021 13:44:45 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ced1f81t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:44 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDcsx1031802;
 Fri, 19 Nov 2021 13:44:43 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3ca50e2cka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJDigBI49152448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 13:44:42 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B4FC605A;
 Fri, 19 Nov 2021 13:44:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB2BC6061;
 Fri, 19 Nov 2021 13:44:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.29.60])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 13:44:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] ppc: Add PVRs for the MPC7450 family
Date: Fri, 19 Nov 2021 10:44:31 -0300
Message-Id: <20211119134431.406753-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211119134431.406753-1-farosas@linux.ibm.com>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ehPwyjPSjMzp81fhaD_ySllQLEldEMtk
X-Proofpoint-ORIG-GUID: JBDHaHMFjO-6qtrlw1FmkpU_1VbxYrz1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=804 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 clg@kaod.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the processors from the 7450 family to pass the initial
PVR verification. Enables 7441, 7445, 7447, 7447a, 7448, 7450, 7451,
7455, 7457 and 7457a.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/ppc/qemu/init.c | 52 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/ppc/qemu/init.c b/arch/ppc/qemu/init.c
index 45cd77e..e40385a 100644
--- a/arch/ppc/qemu/init.c
+++ b/arch/ppc/qemu/init.c
@@ -569,6 +569,58 @@ static const struct cpudef ppc_defs[] = {
         .tlb_size = 0x80,
         .initfn = cpu_g4_init,
     },
+    {
+        .iu_version = 0x80000000,
+        .name = "PowerPC,G4",
+        .icache_size = 0x8000,
+        .dcache_size = 0x8000,
+        .icache_sets = 0x80,
+        .dcache_sets = 0x80,
+        .icache_block_size = 0x20,
+        .dcache_block_size = 0x20,
+        .tlb_sets = 0x40,
+        .tlb_size = 0x80,
+        .initfn = cpu_g4_init,
+    },
+    {
+        .iu_version = 0x80010000,
+        .name = "PowerPC,G4",
+        .icache_size = 0x8000,
+        .dcache_size = 0x8000,
+        .icache_sets = 0x80,
+        .dcache_sets = 0x80,
+        .icache_block_size = 0x20,
+        .dcache_block_size = 0x20,
+        .tlb_sets = 0x40,
+        .tlb_size = 0x80,
+        .initfn = cpu_g4_init,
+    },
+    {
+        .iu_version = 0x80020000,
+        .name = "PowerPC,G4",
+        .icache_size = 0x8000,
+        .dcache_size = 0x8000,
+        .icache_sets = 0x80,
+        .dcache_sets = 0x80,
+        .icache_block_size = 0x20,
+        .dcache_block_size = 0x20,
+        .tlb_sets = 0x40,
+        .tlb_size = 0x80,
+        .initfn = cpu_g4_init,
+    },
+    {
+        .iu_version = 0x80030000,
+        .name = "PowerPC,G4",
+        .icache_size = 0x8000,
+        .dcache_size = 0x8000,
+        .icache_sets = 0x80,
+        .dcache_sets = 0x80,
+        .icache_block_size = 0x20,
+        .dcache_block_size = 0x20,
+        .tlb_sets = 0x40,
+        .tlb_size = 0x80,
+        .initfn = cpu_g4_init,
+    },
     {
         .iu_version = 0x00390000,
         .name = "PowerPC,970",
-- 
2.29.2


