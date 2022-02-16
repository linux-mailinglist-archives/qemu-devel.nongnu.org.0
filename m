Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA884B8E5E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:42:36 +0100 (CET)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNNz-0000aH-JJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:42:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN77-0001jT-JC; Wed, 16 Feb 2022 11:25:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN71-0001DO-Fp; Wed, 16 Feb 2022 11:25:07 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGGYai017747; 
 Wed, 16 Feb 2022 16:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EFphiYaJLg9Y/iCgRpHdeVlhbFVQRZ67nJvDIuS2XLk=;
 b=ih48y2UDoLX1CZguoMRSNUgIHLNiTTnluslkhIl0Vm0AHQCK2Ho0Fm8mJr6fJgLazCbY
 ijX6B9lwbimMop6w92sn2+cWrXskO+VI3CXu9UWgWMKGcxgGt2oBsLdMsb8VDyyf+6KZ
 zQHbZjJRsSSoUKlrTCHsc1M9DbRBt5qi9n2MUC/+TQNJayz/dI1HPVQd7n7RmMykKQVn
 FhhhfeqUmwgFvT1agUsac+PBEyRL2rZOsuIabEl+SHfzLxqONQqOmQzSSIq/W3j3wwIK
 Hyat2lOau7U6G3gpI1Tdg4bD1EFZxp8nj7Ki4ggNouKnNqEW4jXa0LuvJNPB+3ETJhlg Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94n7r5u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGKca2031953;
 Wed, 16 Feb 2022 16:24:48 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94n7r5tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:48 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGDS9M002658;
 Wed, 16 Feb 2022 16:24:46 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3e877g2cet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOjdX26608026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:45 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEDAE78070;
 Wed, 16 Feb 2022 16:24:45 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A06978090;
 Wed, 16 Feb 2022 16:24:44 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/27] target/ppc: cpu_init: Move 405 SPRs into
 register_405_sprs
Date: Wed, 16 Feb 2022 13:24:05 -0300
Message-Id: <20220216162426.1885923-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GvlpTLhtqPpcmSh6RJPwtS_ZSIuytQhy
X-Proofpoint-GUID: Be2nUcAe3WxYVM0PYJ9MYC7NtFRqLO5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=880
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 1eef006a04..330b765ba9 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1425,6 +1425,18 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  spr_read_generic, &spr_write_generic,
                  0x00000000);
+
+    /* Bus access control */
+    /* not emulated, as QEMU never does speculative access */
+    spr_register(env, SPR_40x_SGR, "SGR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0xFFFFFFFF);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_DCWR, "DCWR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
 }
 
 
@@ -2320,17 +2332,7 @@ static void init_proc_405(CPUPPCState *env)
     register_40x_sprs(env);
     register_405_sprs(env);
     register_usprgh_sprs(env);
-    /* Bus access control */
-    /* not emulated, as QEMU never does speculative access */
-    spr_register(env, SPR_40x_SGR, "SGR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0xFFFFFFFF);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCWR, "DCWR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
+
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
-- 
2.34.1


