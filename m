Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409204B8E27
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:37:54 +0100 (CET)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNJR-0002iR-Ba
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN74-0001fv-AP; Wed, 16 Feb 2022 11:25:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN71-0001DY-HS; Wed, 16 Feb 2022 11:25:05 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GFkS2b021786; 
 Wed, 16 Feb 2022 16:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Si49DlUmtgl6oYBaU0WTwgYVzzgMOlJnRFtRNpi0obM=;
 b=A6kf8ElIpQ0yxx+tE5TuPX0VbSoiYiBNSAWbAjdkCEY8zeODA2IDyE+3vkcC6JvolEHy
 cDyPWd4N0oro+RlDrKrQcF669R7YVYhlrWiNqN5uHSGR1moxSp8uuEBsZOfndg3wphZW
 rXHpzjKdWJGDSD0qMKTujYgNgyN1SpwsatauzLTcKpsfqV53z5oCDGh3Sa46nLxFY44R
 WyuS779/qL79l8Zk2GdranIx9kC6gvE5RtQGjjZAI76EITjBEh4f8lYEdmge6hNLU2+b
 DdpuCHCYamVhoGf1Ez7j40r3yeIVtRB9VBJXOlnDXKltEg7Wnu/t/TxjwQXWaCIzjvav 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9473s1f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:57 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GFknaZ027649;
 Wed, 16 Feb 2022 16:24:56 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9473s1er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:56 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjqt020849;
 Wed, 16 Feb 2022 16:24:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3e91f6e98y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOrmU18219504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 487DD78070;
 Wed, 16 Feb 2022 16:24:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4A1C78060;
 Wed, 16 Feb 2022 16:24:51 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/27] target/ppc: cpu_init: Deduplicate 440 SPR
 registration
Date: Wed, 16 Feb 2022 13:24:09 -0300
Message-Id: <20220216162426.1885923-11-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZY_j7hBRCFs0k3p7JErzOmfCO5ZlL0Vt
X-Proofpoint-ORIG-GUID: SXpxiO6bSrk7-IxmUT9t_y2dh_nFUPxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160095
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

Move some of the 440 registers that are being repeated in the 440*
CPUs to register_440_sprs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 100 +++++++++++-------------------------------
 1 file changed, 26 insertions(+), 74 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 79cd14d49c..711834a4c1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1396,6 +1396,32 @@ static void register_440_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
+
+    /* Processor identification */
+    spr_register(env, SPR_BOOKE_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
 }
 
 /* SPR shared between PowerPC 40x implementations */
@@ -2517,31 +2543,6 @@ static void init_proc_440EP(CPUPPCState *env)
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
 
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -2657,31 +2658,7 @@ static void init_proc_440GP(CPUPPCState *env)
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
 
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
     /* Memory management */
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = 64;
@@ -2738,31 +2715,6 @@ static void init_proc_440x5(CPUPPCState *env)
     register_BookE_sprs(env, 0x000000000000FFFFULL);
     register_440_sprs(env);
     register_usprgh_sprs(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
 
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
-- 
2.34.1


