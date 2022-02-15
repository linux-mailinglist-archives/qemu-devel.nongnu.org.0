Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BC4B7969
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:47:38 +0100 (CET)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5fd-00005L-4m
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:47:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aU-0003Jp-4F; Tue, 15 Feb 2022 16:42:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aS-0002UZ-CG; Tue, 15 Feb 2022 16:42:17 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKkUIH015607; 
 Tue, 15 Feb 2022 21:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FPmW8h+ZRu05egFF6syCefIELzdfV9ZjMdmVyy7wH1k=;
 b=fw0sWL+pdx3wU8fZWJ+Dfs6vRzNS0/s6xIYRwdDkTOG13sMdz3TrKuowgXUHxoVUj0xv
 z+TE4ISSOlzHiKtnfeVHd1o7l9rtiIJoRQzrrUwCH+H7pfCgg7Mg856USJm3tRkk38dI
 3+T/45DT4kqDfVYao8kcKZp2hn0O5eB80F+Lpyl9pTDXnbigEiyzddPatZX92vagXN+/
 5bGa3I+NIZzLPbW840MXwsbPimB+sHi1rFkA2Czsz1E8F3RXmXXkqlfVXmwNX7WnNYDO
 HprPO/xwQQ4QpBZ6Ng1LOS6vV7v+/4NoeT+OYtaSrx5lIqy9RjKXHgNlKS9O96wvClEj oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8kgs1kd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:10 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLMPTD002273;
 Tue, 15 Feb 2022 21:42:09 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8kgs1kcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:09 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLMaAN010637;
 Tue, 15 Feb 2022 21:42:08 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3e64hatqrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLg7YK35389892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 505D6BE05B;
 Tue, 15 Feb 2022 21:42:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C18EFBE054;
 Tue, 15 Feb 2022 21:42:05 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/27] target/ppc: cpu_init: Avoid nested SPR register
 functions
Date: Tue, 15 Feb 2022 18:41:26 -0300
Message-Id: <20220215214148.1848266-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kh7UbCaK278zSgHHpiTvAjWJTzpKOGR7
X-Proofpoint-ORIG-GUID: 0fI8US-mR_taV9-JEaQZ06pEZdeQpk_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=736 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150122
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

Make sure that every register_*_sprs function only has calls to
spr_register* to register individual SPRs. Do not allow nesting. This
makes the code easier to follow and a look at init_proc_* should
suffice to know what SPRs a CPU has.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b7e460e12d..1eef006a04 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1128,8 +1128,6 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
         break;
     }
 #endif
-
-    register_usprgh_sprs(env);
 }
 
 /* SPR specific to PowerPC 440 implementation */
@@ -1427,7 +1425,6 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  spr_read_generic, &spr_write_generic,
                  0x00000000);
-    register_usprgh_sprs(env);
 }
 
 
@@ -2322,6 +2319,7 @@ static void init_proc_405(CPUPPCState *env)
 {
     register_40x_sprs(env);
     register_405_sprs(env);
+    register_usprgh_sprs(env);
     /* Bus access control */
     /* not emulated, as QEMU never does speculative access */
     spr_register(env, SPR_40x_SGR, "SGR",
@@ -2951,6 +2949,7 @@ static void init_proc_e200(CPUPPCState *env)
                  0x00000000);
     /* Memory management */
     register_BookE206_sprs(env, 0x0000005D, NULL, 0);
+    register_usprgh_sprs(env);
 
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -3298,6 +3297,7 @@ static void init_proc_e500(CPUPPCState *env, int version)
                   env->spr[SPR_PVR]);
     }
     register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
+    register_usprgh_sprs(env);
 
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
-- 
2.34.1


