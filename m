Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49FF487F02
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:37:29 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xrU-0007se-Pv
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgx-0002c4-P6; Fri, 07 Jan 2022 17:26:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgr-0006hE-PG; Fri, 07 Jan 2022 17:26:35 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207L6btV022077; 
 Fri, 7 Jan 2022 22:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=09hAzdCo+FfdeN55GKIYF8J6Bfb5ZJP4uCvpWJNe6rU=;
 b=tOAsCkIUdC7hIslPg2u4Q1DNpn4yWXHW5C+SCrGA9WvBGpFR9UjaTiy//oBK9+ejRjB9
 yfQfzsbP/yclghf9EsUGVDVWI76NB2Yxau6UIAJboIfEnOBNg0yjMWb3PUou0BqceiBP
 75SFeVG3VccriKCTIp2aM0kCpucUcIyftdNhJZEC3slNkt+fWEU4Xpmw9V8dqD4B3l8V
 erKgT/xmemMs8Cnpi0LPDMl5Vjldcpcy8yGoKrmaUMgyWNaXlP38CZflgY9LFIejBukg
 bwshkzmBP3s6VZPeELRjNDwH9pDPEjcWvlq6DNhI7qBJmwVlMt1UDLwmqKSO9HGQ5PrG fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wgaq4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:14 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207MQDvL001507;
 Fri, 7 Jan 2022 22:26:13 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wgaq4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:13 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MGvZf018963;
 Fri, 7 Jan 2022 22:26:12 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3de5ccg5nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQBbx35914170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 433E9BE04F;
 Fri,  7 Jan 2022 22:26:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B6CCBE051;
 Fri,  7 Jan 2022 22:26:09 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:09 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] target/ppc: powerpc_excp: Extract software TLB logging
 into a function
Date: Fri,  7 Jan 2022 19:25:54 -0300
Message-Id: <20220107222601.4101511-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107222601.4101511-1-farosas@linux.ibm.com>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8PnsmSliWtQQeT7BO2TNmTeeMoV43DEX
X-Proofpoint-ORIG-GUID: nVGK0uQl7hw-k6eJxe0CD4vldsQOoQPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=981
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070130
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 63 +++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a779dc936a..2c5d5470de 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -135,6 +135,41 @@ static void dump_hcall(CPUPPCState *env)
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
@@ -777,34 +812,8 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
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


