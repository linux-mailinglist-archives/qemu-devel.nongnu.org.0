Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA74A90FB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 00:06:20 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFlBD-0005XF-TL
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 18:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkoz-00014n-A8; Thu, 03 Feb 2022 17:43:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkox-0004VU-5A; Thu, 03 Feb 2022 17:43:20 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213MaE93024798; 
 Thu, 3 Feb 2022 22:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2Y3Y1SxhW+W1GHTQhfWEsxvDWXwo6rOkDdfLuJpglNY=;
 b=GfqSvjysI8eparweVfoevXMDbkFpjFq/K1OXrrDJtovDR6uNgGyYdqTWYmORL2naHgA0
 qqh+O9Etk7C1QKtYyfb1lsbG0vsLGjsy+Q9U3vPtOIiM6lKhRR1HbGMBJf6e7wPCY653
 mmb8dsoKFY3LrCxS1siGSIURlD8g7E0bmw2vgwXvLEpxeKlkkr2NZY+EYh7ptlsfrPga
 LI+WofnOEeKVaUSqtFAfAcb+7SSCRSobZvW37DBRjsjau/5Nzj8qkKbvznCLch4YsAtn
 ImjjgpUgOd3z98SZnUVznhXvnufbY9Cns9ia1NmukXz9NmHpDMyh19XjUflRj6smALFU Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qyxr3ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:12 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213Ma8rX024675;
 Thu, 3 Feb 2022 22:43:12 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qyxr3eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:12 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213MgWiX025691;
 Thu, 3 Feb 2022 22:43:11 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3e0r0jg2gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213MhAjj34079026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 22:43:10 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BCBEBE04F;
 Thu,  3 Feb 2022 22:43:10 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD6D3BE053;
 Thu,  3 Feb 2022 22:43:08 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 22:43:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] target/ppc: 7xx: Software TLB cleanup
Date: Thu,  3 Feb 2022 19:42:45 -0300
Message-Id: <20220203224246.1446652-10-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203224246.1446652-1-farosas@linux.ibm.com>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zxucZb911ttsgG8c9CG10vUcJDOnclGz
X-Proofpoint-GUID: xBWhI4_fdhGoPGDMbH_s-SF-3HSCk1zQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=477 spamscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030132
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

This code applies only to the 7xx CPUs, so we can remove the switch
statement.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f29f2ecefb..3872f3b7ad 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -745,7 +745,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-    int excp_model = env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1;
 
@@ -882,26 +881,13 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
-        switch (excp_model) {
-        case POWERPC_EXCP_6xx:
-            /* Swap temporary saved registers with GPRs */
-            if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-                new_msr |= (target_ulong)1 << MSR_TGPR;
-                hreg_swap_gpr_tgpr(env);
-            }
-            /* fall through */
-        case POWERPC_EXCP_7xx:
-            ppc_excp_debug_sw_tlb(env, excp);
+        ppc_excp_debug_sw_tlb(env, excp);
+
+        msr |= env->crf[0] << 28;
+        msr |= env->error_code; /* key, D/I, S/L bits */
+        /* Set way using a LRU mechanism */
+        msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
 
-            msr |= env->crf[0] << 28;
-            msr |= env->error_code; /* key, D/I, S/L bits */
-            /* Set way using a LRU mechanism */
-            msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
-            break;
-        default:
-            cpu_abort(cs, "Invalid TLB miss exception\n");
-            break;
-        }
         break;
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
     case POWERPC_EXCP_SMI:       /* System management interrupt              */
-- 
2.34.1


