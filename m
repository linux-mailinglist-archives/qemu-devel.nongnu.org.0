Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2494641EE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 00:04:13 +0100 (CET)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msCAW-0003hc-Jy
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 18:04:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8V-000113-G9; Tue, 30 Nov 2021 18:02:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1msC8T-0000LD-Ke; Tue, 30 Nov 2021 18:02:07 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMGLTS002940; 
 Tue, 30 Nov 2021 23:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zZ1Omsagk/MhrTGSor8W/vlCWOaxC4PFV0VeqJHXp5E=;
 b=D3ZTLGFR7lQTmm53NITLfMxflcynlBKeHGTI6EKqo3rsje4UsZXAjGlK3eArJi+X5XFb
 VfY8SsN5HYFWDZhGyq9rMZ/RjYBjgdXWTh+LDj7qmhHOdEWflvzY0m2lTc7atj2yhRGl
 MuaOUT4vwUm/BGN6iAea2DhyuCsOfeEpjl3Y4E1pJaFifinVVlNk4CSDTqFXAxAM9/Ae
 y8eIgPkLO6pUoQa+s77fGsjJkjF55Yu+mmFvUop/siQ50hPdCFOCnk9RQoLITR7rZMWM
 VlJZeixbxdA800rd6QKQELH9iCRqPQHAIszBMWcgkJknIW7NhIkbqtBD7mWLkxK5OZI0 vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnvkurxg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AUMutBi030379;
 Tue, 30 Nov 2021 23:01:40 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cnvkurxfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:40 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AUMlHIZ007411;
 Tue, 30 Nov 2021 23:01:40 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3cnne1mmfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 23:01:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AUN1cQg8847986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 23:01:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58C73BE054;
 Tue, 30 Nov 2021 23:01:38 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E659DBE051;
 Tue, 30 Nov 2021 23:01:35 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.34.87])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 23:01:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/4] target/ppc: Disable unused facilities in the e600
 CPU
Date: Tue, 30 Nov 2021 20:01:21 -0300
Message-Id: <20211130230123.781844-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230123.781844-1-farosas@linux.ibm.com>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qUXHR8aEJu2W5bYEqlRtMWQww-V-DSai
X-Proofpoint-GUID: CuhwCYJI9-iB6dZ1XEqJ9SSbwHFj9T7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=730
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The e600 CPU is a successor of the 7448 and like all the 7450s CPUs,
it has an optional software TLB feature.

We have determined that there is no OS software support for the 7450
software TLB available these days. See the previous commit for more
information.

This patch disables the SPRs and instructions related to software TLB
from the e600 CPU.

No functional change intended. These facilities should be used by the
OS in interrupt handlers for interrupts that QEMU never generates.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 509df35d09..962acf295f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2537,9 +2537,6 @@ static void init_excp_7450(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
     env->excp_vectors[POWERPC_EXCP_PERFM]    = 0x00000F00;
     env->excp_vectors[POWERPC_EXCP_VPU]      = 0x00000F20;
-    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
     env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
     env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
     env->excp_vectors[POWERPC_EXCP_VPUA]     = 0x00001600;
@@ -6643,7 +6640,6 @@ static void init_proc_e600(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size = 32;
     env->icache_line_size = 32;
@@ -6667,7 +6663,7 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->insns_flags2 = PPC_NONE;
-- 
2.33.1


