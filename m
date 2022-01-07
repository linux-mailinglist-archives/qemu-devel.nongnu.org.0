Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF0487EEC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:30:02 +0100 (CET)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xkH-0004vM-0D
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:30:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgl-0002MT-6I; Fri, 07 Jan 2022 17:26:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgj-0006es-Hp; Fri, 07 Jan 2022 17:26:22 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207Ji7wK016304; 
 Fri, 7 Jan 2022 22:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=fI25Khy7H97+DHJujlPllRydOMtbRW7sPXXfkCsz+6s=;
 b=d32rie51grxasYkxJ7ltmlW/1vhcjko5p8oRmS3HGByAvf4k7Kl9LDq0cXN/rqvLtT63
 68cFNbW1iSkH5iIjrSBSrX0MUQ6rGcSC3vI6TQJ482iUDs+UOO6EOXi5hDjMylRrm5Q4
 4mp20n6caKAHqns84MuSFeFgRQFjJyVorr2ovs4Iv9//b6jh6bnO1LVLU4mrbM2e9T+X
 ELOs5M4HRb26bLSYfDaK6YToOlNQm0AUIwUO3HXIJBD6He3AdCOCg6wGxLVyxl8/8Uu0
 JzZM+SWTvVOQsARTrAXjMBVeL0GGc7bxYOcr+N65rTOJaIdjESUq7qrAZWt1khmGe5pv pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wjjxr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:15 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207M9Kiv017413;
 Fri, 7 Jan 2022 22:26:15 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wjjxqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:15 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MKD3C005271;
 Fri, 7 Jan 2022 22:26:14 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3de4xfxmu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQDXo31982066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67CC0BE058;
 Fri,  7 Jan 2022 22:26:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A65ADBE05B;
 Fri,  7 Jan 2022 22:26:11 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] target/ppc: powerpc_excp: Keep 60x/7x5 soft MMU logs
 active
Date: Fri,  7 Jan 2022 19:25:55 -0300
Message-Id: <20220107222601.4101511-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107222601.4101511-1-farosas@linux.ibm.com>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MblAAYQ6ij7N-GVOftpusea5KWQPROef
X-Proofpoint-ORIG-GUID: NFlLVbm0mmLf7mjU6qCW2588XvhHzSII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070130
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the compile time definition and make the logging be controlled
by the `-d mmu` option in the cmdline.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 2c5d5470de..a12ed14c30 100644
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
@@ -137,12 +135,11 @@ static void dump_hcall(CPUPPCState *env)
 
 static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
 {
-#if defined(DEBUG_SOFTWARE_TLB)
     const char *es;
     target_ulong *miss, *cmp;
     int en;
 
-    if (!qemu_log_enabled()) {
+    if (!qemu_loglevel_mask(CPU_LOG_MMU)) {
         return;
     }
 
@@ -166,7 +163,6 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
              TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
              env->spr[SPR_HASH1], env->spr[SPR_HASH2],
              env->error_code);
-#endif
 }
 
 
-- 
2.33.1


