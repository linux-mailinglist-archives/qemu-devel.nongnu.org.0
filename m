Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E464838B6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:10:36 +0100 (CET)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VXH-00085W-Sd
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUs-0004Oz-TM; Mon, 03 Jan 2022 17:08:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUr-000203-F6; Mon, 03 Jan 2022 17:08:06 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203IglvQ014166; 
 Mon, 3 Jan 2022 22:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d0i4iHCbfjHJuY2IYBEZuqypDMLJX/k6b2ZGwI1O+EY=;
 b=mGdMlcsG2yydduPW1itKbStC+lgQrHmyy83yxWEG3rMRVyCLVkFVIELj+ELx6hJ5Wgga
 aUbc4fwAFWVrq2UBjof3sQl2kSx8pVShmW+6qBBPVSSpt0X9LeJUUIzT+FYdi59EYtKe
 s9jwVhzDNqIOaC2SAYBGyQjZlp+50xK8WjW5ccHuEMvFJFyscvkA9SogbzkW2zhlpK1b
 KjAsx5ulMsCzmLuvIyCfcPZtHCZj/Udl1kRBs6nsLD8Xz/ejNrUWA/HJKnrG9vo9HxVp
 /iXmP/Y+gFuAQPusI3JAJJVy4bpgdk7OC6/txNzeWTKqhekJpf/hp4SdKv/aM2jSBWeR /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc6nrje31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:59 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203LwlUY012066;
 Mon, 3 Jan 2022 22:07:59 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc6nrje2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:59 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203M4GdG013735;
 Mon, 3 Jan 2022 22:07:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3daeka08ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:07:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M7vdA38076688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:07:57 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2B327805E;
 Mon,  3 Jan 2022 22:07:57 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 151AB7805C;
 Mon,  3 Jan 2022 22:07:56 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:07:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] target/ppc: powerpc_excp: Keep 60x soft MMU logs active
Date: Mon,  3 Jan 2022 19:07:39 -0300
Message-Id: <20220103220746.3916246-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z8VYnnEnQDQLCLe1Rxe05WE9zVz55M7D
X-Proofpoint-ORIG-GUID: r0h8xyirWnjSLPB4SRy2Edao8ftb5EEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_08,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030147
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

Remove the compile time definition and make the logging be controlled
by the `-d mmu` option in the cmdline.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 002a42261b..4769abfb0c 100644
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
@@ -65,7 +63,6 @@ static inline void dump_hcall(CPUPPCState *env)
 
 static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
-#if defined(DEBUG_SOFTWARE_TLB)
     const char *es;
     target_ulong *miss, *cmp;
     int en;
@@ -89,12 +86,12 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
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


