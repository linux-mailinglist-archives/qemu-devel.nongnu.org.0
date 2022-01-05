Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B135485A2B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:43:46 +0100 (CET)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5D8L-0005WK-9K
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5d-0002hQ-Me; Wed, 05 Jan 2022 15:40:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5c-0000ls-06; Wed, 05 Jan 2022 15:40:57 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205KLa3G016030; 
 Wed, 5 Jan 2022 20:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=j3OOvMa+nH1erjPdj44UALePHndYAyeUm+7a5NH0sdQ=;
 b=FYbx2L06gi/Prcpb3sNiJWEiwYhBLPG53r8r0Syu4e+toeNidw3NGgk1GJPdMRXZt4VI
 xgZuSv+U7Thduv9ptkIC9/Ny7BSQZ97QIEXzkoygmblYvHm48WgXteRb+TvcQTwmxqtp
 HluuPheclRCJggh+HBwmH/iH59VQaXQ2kXzn5My0uruiRFZjK1rkOJwBvPGMbDgakMVO
 WAo6lCrg0XOeutCABFD4F2v5MSX3aFz3THqg+eLfAV+SVrbyY7ZvtX9NKZudqFQKL9MD
 He0W6kc36CUvKO+toG+oinjivIjBTCQHkZNS8Q+ffXr7kjT817G/W6egG8Ox98LU4yWG aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp4tnmpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:42 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KZH3Z006467;
 Wed, 5 Jan 2022 20:40:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp4tnmpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KVcpF018763;
 Wed, 5 Jan 2022 20:40:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3daekb5v6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205Ked1513763044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB2C7805E;
 Wed,  5 Jan 2022 20:40:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 045FD78063;
 Wed,  5 Jan 2022 20:40:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/ppc: powerpc_excp: Extract software TLB logging
 into a function
Date: Wed,  5 Jan 2022 17:40:23 -0300
Message-Id: <20220105204029.4058500-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NMexwFW_Q_DxznJYc_kNcvBSkv0sCwdv
X-Proofpoint-GUID: NNTHIZZ_2goHF2BuDEmV7YMfgDy4ofL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 mlxlogscore=956 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050133
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


