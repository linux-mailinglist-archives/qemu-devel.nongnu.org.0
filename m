Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33D489F0F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:19:21 +0100 (CET)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zGK-00045u-5h
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:19:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDG-0000Z2-3o; Mon, 10 Jan 2022 13:16:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDE-0002W4-DV; Mon, 10 Jan 2022 13:16:09 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AHUNNu011754; 
 Mon, 10 Jan 2022 18:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ji8vnEI0hqvGk28DhMGQDJDlWxOkNahi8X5No8kMRpo=;
 b=Zl5yUcPNic5UMsfQqpsn3uXm6cnNM/yVo6kl6+vtghLPzDAM7ve44TwtBnaFTv+HxKYL
 xnxSUvxdr6/Lk7mbi+vK1ZXxdBu0OIOyHAYqUDqdGe/bF4gMxtaRKHf4QYuRoaD0vHRK
 LXF0uMnwB7G5zLTeTpfoYOQHqAprSNzBP1UoJJO67Jg8A/7ym9YQ49oXYiSBY6FFSM1z
 xW3VBIMd1li3LctDkrCgZDHtTT5T2y7vTVJtOF9zBip739kLohY2KEg5+7cage6Cn/IJ
 9Lz/ddszV55SK9StO+3HlJxEdJNR9zLind/7YElaydeVu+XGAKjKPpMRWwfbcw+GPGW/ Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm2xrx89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:58 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AHq5UG008669;
 Mon, 10 Jan 2022 18:15:58 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm2xrx7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:58 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AI84Dd003144;
 Mon, 10 Jan 2022 18:15:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 3df289tkwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:15:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AIFugx25821592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 18:15:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1320B78070;
 Mon, 10 Jan 2022 18:15:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52CF978060;
 Mon, 10 Jan 2022 18:15:54 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.41])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 18:15:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/ppc: 405: Add missing MSR bits to msr_mask
Date: Mon, 10 Jan 2022 15:15:39 -0300
Message-Id: <20220110181546.4131853-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110181546.4131853-1-farosas@linux.ibm.com>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cDz1H79U_1IarXzTnXmwRcO-_v6vfLXo
X-Proofpoint-ORIG-GUID: EBpyA6KYciaOwa-ScSMwWVuAowtO-7QQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some bits described in the user manual are missing from msr_mask. Add
them.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e30e86fe9d..a50ddaeaae 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2535,15 +2535,19 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
                        PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
-    pcc->msr_mask = (1ull << MSR_POW) |
+    pcc->msr_mask = (1ull << MSR_AP) |
+                    (1ull << MSR_POW) |
                     (1ull << MSR_CE) |
                     (1ull << MSR_EE) |
                     (1ull << MSR_PR) |
                     (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
                     (1ull << MSR_DWE) |
                     (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
+
     pcc->mmu_model = POWERPC_MMU_SOFT_4xx;
     pcc->excp_model = POWERPC_EXCP_40x;
     pcc->bus_model = PPC_FLAGS_INPUT_405;
-- 
2.33.1


