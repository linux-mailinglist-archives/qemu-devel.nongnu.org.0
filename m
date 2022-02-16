Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3464B8E18
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:35:55 +0100 (CET)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNHT-0000NS-TZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6x-0001Ya-Km; Wed, 16 Feb 2022 11:25:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6v-0001Cv-VW; Wed, 16 Feb 2022 11:24:59 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGGZus017760; 
 Wed, 16 Feb 2022 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=B2HcFqBuk4QvKo1LpVl1VobNgIwo4EEQ6vhxjgqtMgQ=;
 b=BNtbc6M5sCfcGvjiaYlsOqHZ3uSgBqcNx+v52uxmD43ayMQbk/CnNinup+q/XE0bmNre
 nLXW8Nk6Rh9fgr8rat/+ULpJBQ/TYLSRdH36wBsxaoRa8Ie35C5a4hupk9DP4k7ZCYAd
 QjjK2C6889D3fdoS8U9IDeWeTchbbICjnRvMybFgePTIZFouCgNJh95hyLFkk+Onvd8/
 fzfAkByIbJvJ5qhmOEFysA917aWbpEIDk4pERdHBBgl9+rpxT91/TCev6UpnA1PCPKeF
 TFgtThfw4vGKQMN+d6QCKqSFzpltMHyGYVSa8Kk34aLqKWk8/d3KJgkgn/7385KyLqt4 JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94n7r5vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:52 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGGnYa018791;
 Wed, 16 Feb 2022 16:24:51 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94n7r5v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:51 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjVR007838;
 Wed, 16 Feb 2022 16:24:50 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3e64hc7yrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:50 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOnth37355836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:49 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A53378076;
 Wed, 16 Feb 2022 16:24:49 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10EBE78070;
 Wed, 16 Feb 2022 16:24:48 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:47 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/27] target/ppc: cpu_init: Decouple G2 SPR registration
 from 755
Date: Wed, 16 Feb 2022 13:24:07 -0300
Message-Id: <20220216162426.1885923-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bGSypxulCp7_lyqFXfc2PYZajw3767TC
X-Proofpoint-GUID: Bzq9nRxrrA0RL2o7_oGi4Gcn4V5Tpr2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
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

We're considering these two to be in different CPU families (6xx and
7xx), so keep their SPR registration separate.

The code was copied into register_G2_sprs and the common function was
renamed to apply only to the 755.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 29f25e093f..6a367f2bbc 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -466,8 +466,7 @@ static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways
 #endif
 }
 
-/* SPR common to MPC755 and G2 */
-static void register_G2_755_sprs(CPUPPCState *env)
+static void register_755_sprs(CPUPPCState *env)
 {
     /* SGPRs */
     spr_register(env, SPR_SPRG4, "SPRG4",
@@ -783,6 +782,23 @@ static void register_G2_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
 
+    /* SGPRs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
 }
 
 static void register_74xx_sprs(CPUPPCState *env)
@@ -2852,7 +2868,6 @@ static void init_proc_G2(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_G2_755_sprs(env);
     register_G2_sprs(env);
 
     /* Memory management */
@@ -4474,7 +4489,7 @@ static void init_proc_745(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_G2_755_sprs(env);
+    register_755_sprs(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4547,7 +4562,7 @@ static void init_proc_755(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_G2_755_sprs(env);
+    register_755_sprs(env);
     /* L2 cache control */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
-- 
2.34.1


