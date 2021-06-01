Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD53397BDF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:49:13 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loCG8-0004Pn-3D
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCE9-0001pS-NV; Tue, 01 Jun 2021 17:47:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCE7-0004NV-LY; Tue, 01 Jun 2021 17:47:09 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151LYN8J030530; Tue, 1 Jun 2021 17:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Gr5y5WAcVJ3ba6eDGooURqSwmsFn14XiQYvczcDFKd0=;
 b=JI/1aJqQn9ZI1UviCl/5nWPxm6QMn6HjVp0NmtZybmNM1XUFE+EV0CHjSSuiZX5HIUJD
 A5Pmj/S1CzGpKfy801qULlox5ldA1rYNay9eIotFbz+QSAq4V0TKuVPv429mPB5a4Zkf
 f2rhrZwKc178Jdh/zyFTL77qpQvvLYrxrFcv41+SzW2Ly73T9Q8HdISXXo5mqTnn/BHY
 3E3rsDZPqGvallysOQoqRAiQa3xWUt0s9F0C1wyQApP5zftss7PsWkNFioU0t8Xhd2r8
 OJkppMNBJFTZWER7Lz4V/hppqaAqmHufysO/hozsr5gr7zpUqRVM3Dn5SObYhzH1yyrt vw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wv6whabb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 17:47:01 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151LgYCJ017203;
 Tue, 1 Jun 2021 21:47:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 38ud89hdch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 21:47:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151LkxGh20644348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 21:46:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82B8E7805C;
 Tue,  1 Jun 2021 21:46:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30CD778060;
 Tue,  1 Jun 2021 21:46:58 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.142.192])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 21:46:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/5] target/ppc: powerpc_excp: Consolidade TLB miss code
Date: Tue,  1 Jun 2021 18:46:47 -0300
Message-Id: <20210601214649.785647-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601214649.785647-1-farosas@linux.ibm.com>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tD3wsGtvV__48-87US8orgynNuvFqebC
X-Proofpoint-ORIG-GUID: tD3wsGtvV__48-87US8orgynNuvFqebC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_10:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=878 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106010143
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only difference in the code for Instruction fetch, Data load and
Data store TLB miss errors is that when called from an unsupported
processor (i.e. not one of 602, 603, 603e, G2, 7x5 or 74xx), they
abort with a message specific to the operation type (insn fetch, data
load/store).

If a processor does not support those interrupts we should not be
registering them in init_excp_<proc> to begin with, so that error
message would never be used.

I'm leaving the message in for completeness, but making it generic and
consolidating the three interrupts into the same case statement body.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 9e3aae1c96..fd147e2a37 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -689,52 +689,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                   "is not implemented yet !\n");
         break;
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_603E:
-        case POWERPC_EXCP_G2:
-            goto tlb_miss_tgpr;
-        case POWERPC_EXCP_7x5:
-            goto tlb_miss;
-        case POWERPC_EXCP_74xx:
-            goto tlb_miss_74xx;
-        default:
-            cpu_abort(cs, "Invalid instruction TLB miss exception\n");
-            break;
-        }
-        break;
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_603E:
-        case POWERPC_EXCP_G2:
-            goto tlb_miss_tgpr;
-        case POWERPC_EXCP_7x5:
-            goto tlb_miss;
-        case POWERPC_EXCP_74xx:
-            goto tlb_miss_74xx;
-        default:
-            cpu_abort(cs, "Invalid data load TLB miss exception\n");
-            break;
-        }
-        break;
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
         switch (excp_model) {
         case POWERPC_EXCP_602:
         case POWERPC_EXCP_603:
         case POWERPC_EXCP_603E:
         case POWERPC_EXCP_G2:
-        tlb_miss_tgpr:
             /* Swap temporary saved registers with GPRs */
             if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
                 new_msr |= (target_ulong)1 << MSR_TGPR;
                 hreg_swap_gpr_tgpr(env);
             }
-            goto tlb_miss;
+            /* fall through */
         case POWERPC_EXCP_7x5:
-        tlb_miss:
 #if defined(DEBUG_SOFTWARE_TLB)
             if (qemu_log_enabled()) {
                 const char *es;
@@ -769,7 +737,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
             break;
         case POWERPC_EXCP_74xx:
-        tlb_miss_74xx:
 #if defined(DEBUG_SOFTWARE_TLB)
             if (qemu_log_enabled()) {
                 const char *es;
@@ -799,7 +766,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             msr |= env->error_code; /* key bit */
             break;
         default:
-            cpu_abort(cs, "Invalid data store TLB miss exception\n");
+            cpu_abort(cs, "Invalid TLB miss exception\n");
             break;
         }
         break;
-- 
2.29.2


