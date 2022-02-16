Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E274B8E76
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:48:23 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNTa-0007uI-RS
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7D-00021a-B0; Wed, 16 Feb 2022 11:25:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7B-0001RT-B6; Wed, 16 Feb 2022 11:25:14 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGGXaX017689; 
 Wed, 16 Feb 2022 16:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fqoegPIGtFOBsRHl67hlByPamWvMqyAg9rBH2tqMAb0=;
 b=WsIG4GqF7iGQXCl/MUXBk3y8ayENtMfU+G/F09c52zFwLBRVZRwKFASZ6syfaLZK42Ac
 oMndTOaCVkpb1lOYgQVZ7dSDnyNgOKZxVoqBoYQ10bCg0TkI2Y43MATiRl2bg5H8/NWK
 4IIZTJVrygnL1F6Pp//ZLkb67I5j84Awbf4G7cds5E81kRtUjwXah6FfWKPBaU8gQFWQ
 RVg1/ot+f3UYHZfl13Dk3EkWqzF75ZC/9dFVqsSDvXEzLOhj6wyn1mQ1SbQ/dceMHqw7
 AiTW1VS7tPEasf/oV8e5nUpdndBLNXcqR25WoQLJ4YFAldyq/Ei1AqJeyvECjg1DrJS3 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94n7r5yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:01 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGIP0A022273;
 Wed, 16 Feb 2022 16:25:01 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94n7r5yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:01 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjO8007839;
 Wed, 16 Feb 2022 16:25:00 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3e64hc7yvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOxJH33554796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC4C478077;
 Wed, 16 Feb 2022 16:24:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7746E7806B;
 Wed, 16 Feb 2022 16:24:57 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/27] target/ppc: cpu_init: Deduplicate 745/755 SPR
 registration
Date: Wed, 16 Feb 2022 13:24:12 -0300
Message-Id: <20220216162426.1885923-14-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cAS0m1NY79lCPMnySImdghh4MfwQesJk
X-Proofpoint-GUID: R_lsRsiDBdbxNsnXTL8z4vlkUKcwXAot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=911
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202160095
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

The 745 and 755 can share the HID registration, so move it all into
register_755_sprs, which applies for both CPUs.

Also rename that function to register_745_sprs, since the 745 is the
earliest of the two. This will help with separating 755-specific
registers in a subsequent patch.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 50 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c54f10cb48..131c2da4c2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -466,7 +466,7 @@ static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways
 #endif
 }
 
-static void register_755_sprs(CPUPPCState *env)
+static void register_745_sprs(CPUPPCState *env)
 {
     /* SGPRs */
     spr_register(env, SPR_SPRG4, "SPRG4",
@@ -485,6 +485,22 @@ static void register_755_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
+
+    /* Hardware implementation registers */
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_HID2, "HID2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
 }
 
 /* SPR common to all 7xx PowerPC implementations */
@@ -4519,24 +4535,10 @@ static void init_proc_745(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_755_sprs(env);
+    register_745_sprs(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* Hardware implementation registers */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
 
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
@@ -4592,7 +4594,7 @@ static void init_proc_755(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_755_sprs(env);
+    register_745_sprs(env);
     /* L2 cache control */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4605,21 +4607,7 @@ static void init_proc_755(CPUPPCState *env)
                  0x00000000);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* Hardware implementation registers */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
 
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-- 
2.34.1


