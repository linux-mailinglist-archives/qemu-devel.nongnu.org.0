Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F54B7965
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:46:32 +0100 (CET)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5eZ-00068E-B7
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:46:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aQ-0003AS-B0; Tue, 15 Feb 2022 16:42:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16974
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aN-0002Tb-IG; Tue, 15 Feb 2022 16:42:14 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FLCCPb027969; 
 Tue, 15 Feb 2022 21:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GVilKZS6zFAJLNRDN60orfVQtkL25KsHpFglKJlvhTE=;
 b=gnTPXF7pJSjIlrOS89tQH7qIxLQ9I0dD6e0SlM7kxfZGWJs42L017SYqPa8+dTjq5+YT
 Waa+JJ/yqnJQCjrNICNO709V7+fjzOZN+5dbSnzqxUJzK93jo9QsjSktS2qKd7iqm6Id
 JGoatWiKy1PujOSIS7jTt7lYl0IVsdhC7Rgj5evnTZhFOHEhz800p5cRcT1+oy2nNnvl
 VJZKlQd5stsi2qWG7j/uQjCuVR4d8MyDXQIylCguCpLbs0Wl04ESeflGE7wJEPy7hlyk
 4yFEwcQKWyS3JWBA3D4E6NBKU4Q3QlH5Iz8aqcvaoEZo4Cozl0jan5cS5MyQsivx4do6 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8kvtrmjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:05 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLJiHu017821;
 Tue, 15 Feb 2022 21:42:05 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8kvtrmjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLMdWs027213;
 Tue, 15 Feb 2022 21:42:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3e64hcattw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:04 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLg37o34144714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E59EBE056;
 Tue, 15 Feb 2022 21:42:03 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9662BE054;
 Tue, 15 Feb 2022 21:42:01 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/27] target/ppc: cpu_init: Group registration of generic SPRs
Date: Tue, 15 Feb 2022 18:41:24 -0300
Message-Id: <20220215214148.1848266-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GDIxOVbiIU0oAhqth28ZVWLSNcRjibOu
X-Proofpoint-ORIG-GUID: vfZEy-jInZq_67EVUuIbwghqbwEwh_CO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150122
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


