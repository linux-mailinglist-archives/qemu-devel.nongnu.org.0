Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9D4A8F9F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:12:40 +0100 (CET)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjPC-0004JY-WC
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:12:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiQz-0000PG-0Y; Thu, 03 Feb 2022 15:10:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiQu-0005iK-76; Thu, 03 Feb 2022 15:10:24 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213Hc4WW017455; 
 Thu, 3 Feb 2022 20:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rCeng81JZsHjQ32x9w4YuFTaAX1+iTPMOfXlolWM4ZA=;
 b=mTYZPxNKkNCoUIFuxHIxrq0h6PtqsjtLFivsyIex7ZTm6yUOMmb2zSUNSkkbbnv98OWH
 cBkuZ39kno5twxJKKUKC5CPl3wswO/47/6y8kEcry0n82R/lRuCudnehQnFyPAvCWpDY
 ufaUj+mwSkYIjCqV2uvg9Nll+tviSAkUWh/5Q0Dk8b3nykWRa3TBBNI7hMkMgDvXrHwI
 lXZVUEZxBrlbrCQ+AkcjnVM2TzeYd73UlE9BGS9OpMCxFEEboUajW82XFJPiOXcNZTCb
 24AYxlVbMP3FjQXHCR4aWcKvCncvLuveSzRoatCsFDIiFFcXuPgYm5+O2L+7EAWmNViw fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e03fnf2a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:08 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213JkNxa022173;
 Thu, 3 Feb 2022 20:10:08 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e03fnf29m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:08 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213K8Wqe001834;
 Thu, 3 Feb 2022 20:10:07 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3dy0sy6fbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213KA6cK24773038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 20:10:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FFAABE054;
 Thu,  3 Feb 2022 20:10:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2300BE065;
 Thu,  3 Feb 2022 20:10:04 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 20:10:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] target/ppc: Merge exception model IDs for 6xx CPUs
Date: Thu,  3 Feb 2022 17:09:47 -0300
Message-Id: <20220203200957.1434641-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203200957.1434641-1-farosas@linux.ibm.com>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PduSVlTVi7qbQDlRaWygJrk9lXCGQT2v
X-Proofpoint-ORIG-GUID: D4thIr0_HsKfH1LY0CdesXFtoj11VenV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=940 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030120
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

We don't need three separate exception model IDs for the 603, 604 and
G2.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu-qom.h     |  8 ++------
 target/ppc/cpu_init.c    | 18 +++++++++---------
 target/ppc/excp_helper.c |  5 ++---
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5d591ff6c5..3880fb3337 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -88,12 +88,8 @@ enum powerpc_excp_t {
     POWERPC_EXCP_STD,
     /* PowerPC 40x exception model      */
     POWERPC_EXCP_40x,
-    /* PowerPC 603 exception model      */
-    POWERPC_EXCP_603,
-    /* PowerPC G2 exception model       */
-    POWERPC_EXCP_G2,
-    /* PowerPC 604 exception model      */
-    POWERPC_EXCP_604,
+    /* PowerPC 603/604/G2 exception model */
+    POWERPC_EXCP_6xx,
     /* PowerPC 7x0 exception model      */
     POWERPC_EXCP_7x0,
     /* PowerPC 7x5 exception model      */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a5e1f5a3b2..95c5831ba6 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2782,7 +2782,7 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_REAL;
-    pcc->excp_model = POWERPC_EXCP_603;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_RCPU;
     pcc->bfd_mach = bfd_mach_ppc_505;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -2825,7 +2825,7 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_MPC8xx;
-    pcc->excp_model = POWERPC_EXCP_603;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_RCPU;
     pcc->bfd_mach = bfd_mach_ppc_860;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -2906,7 +2906,7 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
                     (1ull << MSR_DR) |
                     (1ull << MSR_RI);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_G2;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_ec603e;
     pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -2988,7 +2988,7 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_G2;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_ec603e;
     pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3243,7 +3243,7 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_603;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_603;
     pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3772,7 +3772,7 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_603;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_603;
     pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3811,7 +3811,7 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_603;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_ec603e;
     pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3872,7 +3872,7 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_604;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -3953,7 +3953,7 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_604;
+    pcc->excp_model = POWERPC_EXCP_6xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ae6871a3c0..935f547f25 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1357,7 +1357,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
             srr0 = SPR_BOOKE_CSRR0;
             srr1 = SPR_BOOKE_CSRR1;
             break;
-        case POWERPC_EXCP_G2:
+        case POWERPC_EXCP_6xx:
             break;
         default:
             goto excp_invalid;
@@ -1645,8 +1645,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
         switch (excp_model) {
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_G2:
+        case POWERPC_EXCP_6xx:
             /* Swap temporary saved registers with GPRs */
             if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
                 new_msr |= (target_ulong)1 << MSR_TGPR;
-- 
2.34.1


