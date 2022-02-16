Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE54B8E11
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:33:06 +0100 (CET)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNEn-0002R6-DH
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6r-0001F2-Qq; Wed, 16 Feb 2022 11:24:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18682
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6q-0001C6-6C; Wed, 16 Feb 2022 11:24:53 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGGJrP024322; 
 Wed, 16 Feb 2022 16:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g/ukzFavbavqVTnICsfxg4uz+8PEv9Xus7mcqTS9PaA=;
 b=gHopcxsOVKOPIbofJMmMinqy358QatRUwz5L3bHocU8mef9drKMbwc/1AaXv5/3Pa9C1
 Tsr6HgX0lVG+l9gSk4dSNnb/W97PhdEfcsVJOQVsboKol86lqzi4Q2rsuYjhe4qa0ZqH
 c8eEtI+KJ1l0dZIvaPDWEIlSSGB5Cfi0Rjv1GvMF9+v+Or6o8Tfrvj8IfOEH/4GfZmkn
 +1sLmWR6Z85OWdlfUTB66iW51o9VT801S+MnuDfZSNRrhjN6NmFh5UUIKDTjSEJf4qmV
 Qr+s9bcAuiAKFzI5jv5E5qBf2S+fSXvhwzKegbIp8ii6bzYlpOYMdi2XbUvGo/tzncad Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e94n485a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:46 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGGmSn025044;
 Wed, 16 Feb 2022 16:24:46 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e94n4859r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:46 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjuJ020966;
 Wed, 16 Feb 2022 16:24:45 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3e91f6e96c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOhVw14942656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAFBA78072;
 Wed, 16 Feb 2022 16:24:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3734678068;
 Wed, 16 Feb 2022 16:24:42 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/27] target/ppc: cpu_init: Avoid nested SPR register
 functions
Date: Wed, 16 Feb 2022 13:24:04 -0300
Message-Id: <20220216162426.1885923-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -R2JQmF9jLhzCTUYD4l6ANSxreKnP2-5
X-Proofpoint-GUID: wYl8yHyWT78Wv9xtqukEeWrI5q0-1Kx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=790 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
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


