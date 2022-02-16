Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6874B8E1C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:36:52 +0100 (CET)
Received: from localhost ([::1]:40550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNIR-0000xq-KO
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7N-0002cq-Qw; Wed, 16 Feb 2022 11:25:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7M-0001Y9-2d; Wed, 16 Feb 2022 11:25:25 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GG7nL0027872; 
 Wed, 16 Feb 2022 16:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UnjXkzujAUAxnz0SlHUCkn3XPH3YbUgjV9oE5ZZhQ3g=;
 b=bE3zdt2pidAkkyMx7Rb0kLSrLYc+8nbBRMuHyEe2CRDQDyii6XHWRkKcVHFxAxoxh2+B
 a+XudsevFJhBxUGiveAtSFBmOiz2WaVPqt+HzuuHpnI5nDtALUIZNTvUyF48tF5feHLV
 yXXX07Pk2mfolCJ+SrXHg3sDE3II8it4sq8icx/PFZqIczufq40gqIUzeAAh0ihOYl8p
 NK7jdyQj9kzAp495uq/bkramLg0Oserz1kQLdDemL0J9x0m5zSdfC9bmOw772NrISQf6
 30gk4xeRCON8O6u7thawbVoAGg24uEUfIkZzBzKY5RyUss3+8dBnKLR0JzJgLBl7oOAi DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e920vmj6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:18 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GG7wKL028630;
 Wed, 16 Feb 2022 16:25:18 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e920vmj61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:18 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCBON028846;
 Wed, 16 Feb 2022 16:25:17 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3e64hbkt3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPGwb12124434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:16 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8457878072;
 Wed, 16 Feb 2022 16:25:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17FBB78092;
 Wed, 16 Feb 2022 16:25:15 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/27] target/ppc: cpu_init: Remove register_usprg3_sprs
Date: Wed, 16 Feb 2022 13:24:21 -0300
Message-Id: <20220216162426.1885923-23-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xY2X2aH7109qx0NGocnacL4V5YReMfef
X-Proofpoint-ORIG-GUID: QZjao4iJPBFjJCENusgOQ5xU3qQbuPe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=926 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

This function registers just one SPR and has only two callers, so open
code it.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f464ad64fd..adb23019ef 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1072,14 +1072,6 @@ static void register_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void register_usprg3_sprs(CPUPPCState *env)
-{
-    spr_register(env, SPR_USPRG3, "USPRG3",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-}
-
 static void register_usprgh_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG4, "USPRG4",
@@ -3310,7 +3302,12 @@ static void init_proc_e500(CPUPPCState *env, int version)
         break;
     }
     register_BookE_sprs(env, ivor_mask);
-    register_usprg3_sprs(env);
+
+    spr_register(env, SPR_USPRG3, "USPRG3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
     /* Processor identification */
     spr_register(env, SPR_BOOKE_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -6200,7 +6197,6 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
 static void init_proc_book3s_common(CPUPPCState *env)
 {
     register_non_embedded_sprs(env);
-    register_usprg3_sprs(env);
     register_book3s_altivec_sprs(env);
     register_book3s_pmu_sup_sprs(env);
     register_book3s_pmu_user_sprs(env);
@@ -6210,6 +6206,11 @@ static void init_proc_book3s_common(CPUPPCState *env)
      * value is the one used by 74xx processors.
      */
     vscr_init(env, 0x00010000);
+
+    spr_register(env, SPR_USPRG3, "USPRG3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
 }
 
 static void init_proc_970(CPUPPCState *env)
-- 
2.34.1


