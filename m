Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4735C4838BD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:13:12 +0100 (CET)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VZn-0005Pm-Ce
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:13:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUu-0004PU-3X; Mon, 03 Jan 2022 17:08:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUr-0001zs-To; Mon, 03 Jan 2022 17:08:07 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203LIxvd001138; 
 Mon, 3 Jan 2022 22:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0RFjQ1zfC1zZDigFvBLe+kQFqH4XM5aMdcGpcjS1+G8=;
 b=WMnmdZoqC94WigrWvrU+YHw6AsgmLdyp+vIIZ4ZFuRHm1YWyfZqe2cv9mzKeIP0he8Kz
 74Ws5JS1tilO0m2DIlgmT1OzO9rNJ+yZVYoEKAzh5U8V9HTrlEynL7wt3/vhIr3/lRPU
 1nLHGARSmJIoY+oIb0kNsgsow6623WbdRunrB0d2neGC6Kv3++9/eZoO3EC57u32aY0C
 qGczrGNb1nQWM0oD1F8KY/dehyY8gs1wNqHF4PKa5L3P9huG712dGBsitjzFKnoIRagj
 iGOeYRmLQnBFTMbrlhWL4Jc9xOPrXaS/FdgPl9pkNU2B5fYGOEwZBfsXEG3BfB/gYrpb yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc8xyrg7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:57 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M6wF5011129;
 Mon, 3 Jan 2022 22:07:57 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc8xyrg7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LwJdk016867;
 Mon, 3 Jan 2022 22:07:56 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3daeka09e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M7txP30081352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:07:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FA4778063;
 Mon,  3 Jan 2022 22:07:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 040337805C;
 Mon,  3 Jan 2022 22:07:54 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:07:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] target/ppc: powerpc_excp: Extract software TLB logging
 into a function
Date: Mon,  3 Jan 2022 19:07:38 -0300
Message-Id: <20220103220746.3916246-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5goKbqxY-u2wKScu7lrC1wPgH7wT5SYZ
X-Proofpoint-ORIG-GUID: iD4_RWiMj6S3q9laBIiK9jqrbRjPOLP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=910 priorityscore=1501 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 63 +++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c7e55800af..002a42261b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -63,6 +63,41 @@ static inline void dump_hcall(CPUPPCState *env)
                   env->nip);
 }
 
+static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
+{
+#if defined(DEBUG_SOFTWARE_TLB)
+    const char *es;
+    target_ulong *miss, *cmp;
+    int en;
+
+    if (!qemu_log_enabled()) {
+        return;
+    }
+
+    if (excp == POWERPC_EXCP_IFTLB) {
+        es = "I";
+        en = 'I';
+        miss = &env->spr[SPR_IMISS];
+        cmp = &env->spr[SPR_ICMP];
+    } else {
+        if (excp == POWERPC_EXCP_DLTLB) {
+            es = "DL";
+        } else {
+            es = "DS";
+        }
+        en = 'D';
+        miss = &env->spr[SPR_DMISS];
+        cmp = &env->spr[SPR_DCMP];
+    }
+    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
+             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
+             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
+             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
+             env->error_code);
+#endif
+}
+
+
 static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
                                 target_ulong *msr)
 {
@@ -704,34 +739,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
             }
             /* fall through */
         case POWERPC_EXCP_7x5:
-#if defined(DEBUG_SOFTWARE_TLB)
-            if (qemu_log_enabled()) {
-                const char *es;
-                target_ulong *miss, *cmp;
-                int en;
+            ppc_excp_debug_sw_tlb(env, excp);
 
-                if (excp == POWERPC_EXCP_IFTLB) {
-                    es = "I";
-                    en = 'I';
-                    miss = &env->spr[SPR_IMISS];
-                    cmp = &env->spr[SPR_ICMP];
-                } else {
-                    if (excp == POWERPC_EXCP_DLTLB) {
-                        es = "DL";
-                    } else {
-                        es = "DS";
-                    }
-                    en = 'D';
-                    miss = &env->spr[SPR_DMISS];
-                    cmp = &env->spr[SPR_DCMP];
-                }
-                qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
-                         TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
-                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
-                         env->spr[SPR_HASH1], env->spr[SPR_HASH2],
-                         env->error_code);
-            }
-#endif
             msr |= env->crf[0] << 28;
             msr |= env->error_code; /* key, D/I, S/L bits */
             /* Set way using a LRU mechanism */
-- 
2.33.1


