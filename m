Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D084B8DF6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:27:48 +0100 (CET)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKN9e-00047H-KZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6o-00018u-6R; Wed, 16 Feb 2022 11:24:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52000
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6l-0001BN-78; Wed, 16 Feb 2022 11:24:48 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGB4ER022944; 
 Wed, 16 Feb 2022 16:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JYXPvLkbD58THd9Lc14M1tPI/Ultqy0Dc2lBgJ+I5dM=;
 b=U7yO9OXGHG9l6Td3vz9mx1bTMNJbHK9nE6tBFRLg7k7c3yrncxTznQ8DozeX/sNiYZlj
 PSOBGG/dSde9o+kYvOwiAA4pklI5Ilc9FIcisgr52uRLtgvc+uDoo+xxrKMm6RJSdulG
 ePEU6vaaGOFHR7Mw3yj8xnOPvFXbqAWqrZEd9PZTSQnUI8E11THZ+AuHwpc93025MxS+
 F3qhx2vg4fYYyxGTZkGJ3RFE2oIfC2/isoFzRxSuqzoyalfgRYnYuYVLrcTX9LUoEbzp
 JiujEm72XhOHRU1HA1ihaXETqc8lf9mwcrT42+yPAOKLdSiKu6bk6F4BB3PkBapysPFg Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e914vnsce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:41 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGFKMj003279;
 Wed, 16 Feb 2022 16:24:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e914vnsc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCCt8028979;
 Wed, 16 Feb 2022 16:24:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3e64hbksr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOdMK34996572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D591E78068;
 Wed, 16 Feb 2022 16:24:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5192678066;
 Wed, 16 Feb 2022 16:24:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/27] target/ppc: cpu_init: Group registration of generic
 SPRs
Date: Wed, 16 Feb 2022 13:24:02 -0300
Message-Id: <20220216162426.1885923-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wOVt6ECMcfHSJDcKLCfw1ErdjjLQKDuq
X-Proofpoint-GUID: E-GwGMcsRcFhlVFJHRx_xNbY_AWFL97B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The top level init_proc calls register_generic_sprs but also registers
some other SPRs outside of that function. Let's group everything into
a single place.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 58 ++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7488001385..5dc097f2fc 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -150,8 +150,11 @@ static void _spr_register(CPUPPCState *env, int num, const char *name,
                      oea_read, oea_write, 0, ival)
 
 /* Generic PowerPC SPRs */
-static void register_generic_sprs(CPUPPCState *env)
+static void register_generic_sprs(PowerPCCPU *cpu)
 {
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+
     /* Integer processing */
     spr_register(env, SPR_XER, "XER",
                  &spr_read_xer, &spr_write_xer,
@@ -192,6 +195,32 @@ static void register_generic_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
+
+    spr_register(env, SPR_PVR, "PVR",
+                 /* Linux permits userspace to read PVR */
+#if defined(CONFIG_LINUX_USER)
+                 &spr_read_generic,
+#else
+                 SPR_NOACCESS,
+#endif
+                 SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 pcc->pvr);
+
+    /* Register SVR if it's defined to anything else than POWERPC_SVR_NONE */
+    if (pcc->svr != POWERPC_SVR_NONE) {
+        if (pcc->svr & POWERPC_SVR_E500) {
+            spr_register(env, SPR_E500_SVR, "SVR",
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, SPR_NOACCESS,
+                         pcc->svr & ~POWERPC_SVR_E500);
+        } else {
+            spr_register(env, SPR_SVR, "SVR",
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, SPR_NOACCESS,
+                         pcc->svr);
+        }
+    }
 }
 
 /* SPR common to all non-embedded PowerPC, including 601 */
@@ -7241,31 +7270,8 @@ static void init_ppc_proc(PowerPCCPU *cpu)
     env->tlb_type = TLB_NONE;
 #endif
     /* Register SPR common to all PowerPC implementations */
-    register_generic_sprs(env);
-    spr_register(env, SPR_PVR, "PVR",
-                 /* Linux permits userspace to read PVR */
-#if defined(CONFIG_LINUX_USER)
-                 &spr_read_generic,
-#else
-                 SPR_NOACCESS,
-#endif
-                 SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 pcc->pvr);
-    /* Register SVR if it's defined to anything else than POWERPC_SVR_NONE */
-    if (pcc->svr != POWERPC_SVR_NONE) {
-        if (pcc->svr & POWERPC_SVR_E500) {
-            spr_register(env, SPR_E500_SVR, "SVR",
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, SPR_NOACCESS,
-                         pcc->svr & ~POWERPC_SVR_E500);
-        } else {
-            spr_register(env, SPR_SVR, "SVR",
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, SPR_NOACCESS,
-                         pcc->svr);
-        }
-    }
+    register_generic_sprs(cpu);
+
     /* PowerPC implementation specific initialisations (SPRs, timers, ...) */
     (*pcc->init_proc)(env);
 
-- 
2.34.1


