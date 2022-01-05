Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434FA485A32
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:46:02 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DAX-0002R2-3X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:46:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5f-0002in-Ra; Wed, 05 Jan 2022 15:40:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5e-00010r-2O; Wed, 05 Jan 2022 15:40:59 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205IZkRC004481; 
 Wed, 5 Jan 2022 20:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=QBlKXURnfafwIUTvfw7jvtZZXBtpSOXu2X6k7IphWOw=;
 b=DxQluR/tKniGP4yTy+A2HkOdmdeBaA2iARVeoIIpNJY5OV67zHr6fgyLHBFGr9KY2Bgh
 Xvp/Im9/+eP7riV5qEXzBPdcAqiAYvqPYuIq/tnXJRfwD3scvWbuaaJ+lIPq3bUaSfRZ
 GFL4SXHeiCRRBnpX3XaOeY43t5HqtLLtMXUFUaJZycTw1wwZhpAE9Cg/GwsaFczOvCJt
 ZwibwIyV+CsuZoMtmsCkcln9mDNENQX4JjDDiwhKdIotMh2WjJqIRlANnQPz4rzhNtc6
 Soh9tFJHwnDR/pMz9nVk28HszukZK44QRZdH/QSs+JZRyOuCzzrXjpyubjgZWYIVdLTB Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqcqpcvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:46 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KA36N006513;
 Wed, 5 Jan 2022 20:40:45 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcqcqpcv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:45 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KVp0J023623;
 Wed, 5 Jan 2022 20:40:44 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3daekbpq39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205Kef278979102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB8CB78064;
 Wed,  5 Jan 2022 20:40:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 101BA7805F;
 Wed,  5 Jan 2022 20:40:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] target/ppc: powerpc_excp: Keep 60x soft MMU logs active
Date: Wed,  5 Jan 2022 17:40:24 -0300
Message-Id: <20220105204029.4058500-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wZNSIDFTmleLkkSrMXv2p607fZlIVcEM
X-Proofpoint-ORIG-GUID: -qM6MD6QqPt9H4DlMJDE4SXMoDO7zrye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Remove the compile time definition and make the logging be controlled
by the `-d mmu` option in the cmdline.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2c5d5470de..ce86b2ae37 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -30,8 +30,6 @@
 #include "exec/cpu_ldst.h"
 #endif
 
-/* #define DEBUG_SOFTWARE_TLB */
-
 /*****************************************************************************/
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
@@ -137,7 +135,6 @@ static void dump_hcall(CPUPPCState *env)
 
 static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
-#if defined(DEBUG_SOFTWARE_TLB)
     const char *es;
     target_ulong *miss, *cmp;
     int en;
@@ -161,12 +158,12 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
         miss = &env->spr[SPR_DMISS];
         cmp = &env->spr[SPR_DCMP];
     }
-    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
-             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
-             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
-             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
-             env->error_code);
-#endif
+
+    qemu_log_mask(CPU_LOG_MMU, "6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
+                  TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
+                  TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
+                  env->spr[SPR_HASH1], env->spr[SPR_HASH2],
+                  env->error_code);
 }
 
 
-- 
2.33.1


