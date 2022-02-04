Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2484A9DF0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:03 +0100 (CET)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2dq-0007q1-CQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:45:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UW-0000jS-3i; Fri, 04 Feb 2022 12:35:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UR-00015m-Df; Fri, 04 Feb 2022 12:35:22 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214EbtLu006597; 
 Fri, 4 Feb 2022 17:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=teUxZttQ6Pn5MHFuQ8zx0OYgfhzhgVmTuXoHtPyENXg=;
 b=IM+UuOVzPvNpHrbL+DcY9LzhjLALMhb6cU4SVlOB0sU+9xY4KUm0f6RR+bk1dyjQgdcD
 oCm35cy5ofaL6VMrgZTS5/upqTIeD2GdU0hcPHvWXcv5zk87D8TJG6JdRQrF1onGaXyN
 1znDpggeU/t0hSW42wDG4IM4DcM/xOIYBFUTy1uA8I1+1JJQ9ymMCevVYaFahz6ewysy
 i/yCWPVLRbm1XIRrnSv2vtjHtGXD6RAIlWaeHgyTkkekj9Fa1wewfj+AC176IsoqLuBq
 yt65ZLxCXJ9yP1VWG6r+ATO7doH72g8dM2+t2Hai8LBMemtGEz8nxhRZguz2wL3VCWzj Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0tfy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:45 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214GbhTq005144;
 Fri, 4 Feb 2022 17:34:45 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0tfxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:45 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214HRNHa000732;
 Fri, 4 Feb 2022 17:34:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3e0r0xqawb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214HYhUp34144622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 17:34:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D4C7AE06B;
 Fri,  4 Feb 2022 17:34:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2CBEAE075;
 Fri,  4 Feb 2022 17:34:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 17:34:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] target/ppc: Merge 7x5 and 7x0 exception model IDs
Date: Fri,  4 Feb 2022 14:34:21 -0300
Message-Id: <20220204173430.1457358-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204173430.1457358-1-farosas@linux.ibm.com>
References: <20220204173430.1457358-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _UJTwDPM6SQqX1Yt38pznDbFjV5AsIgn
X-Proofpoint-ORIG-GUID: 61jA9MGcIt3Q3L90OwDv603jr63KGO1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we've split the exception code by exception model, the exception
model IDs are becoming less useful. These two can be merged.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu-qom.h     |  6 ++----
 target/ppc/cpu_init.c    | 16 ++++++++--------
 target/ppc/excp_helper.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 3880fb3337..98facee9fa 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -90,10 +90,8 @@ enum powerpc_excp_t {
     POWERPC_EXCP_40x,
     /* PowerPC 603/604/G2 exception model */
     POWERPC_EXCP_6xx,
-    /* PowerPC 7x0 exception model      */
-    POWERPC_EXCP_7x0,
-    /* PowerPC 7x5 exception model      */
-    POWERPC_EXCP_7x5,
+    /* PowerPC 7xx exception model      */
+    POWERPC_EXCP_7xx,
     /* PowerPC 74xx exception model     */
     POWERPC_EXCP_74xx,
     /* BookE exception model            */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 95c5831ba6..d97f718354 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4021,7 +4021,7 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_7x0;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4098,7 +4098,7 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_7x0;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4298,7 +4298,7 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_7x0;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4378,7 +4378,7 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_7x0;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4463,7 +4463,7 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_7x0;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4548,7 +4548,7 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_7x0;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4624,7 +4624,7 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_7x5;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -4711,7 +4711,7 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_7x5;
+    pcc->excp_model = POWERPC_EXCP_7xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7bdda6f165..b6a5c36fd2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1844,7 +1844,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
                 hreg_swap_gpr_tgpr(env);
             }
             /* fall through */
-        case POWERPC_EXCP_7x5:
+        case POWERPC_EXCP_7xx:
             ppc_excp_debug_sw_tlb(env, excp);
 
             msr |= env->crf[0] << 28;
-- 
2.34.1


