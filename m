Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F854B8E6F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:47:41 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNSu-0006vh-NM
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7g-00037E-3F; Wed, 16 Feb 2022 11:25:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7X-0001Yx-6o; Wed, 16 Feb 2022 11:25:43 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GG7mju027724; 
 Wed, 16 Feb 2022 16:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8BKeLn2r7BDiHF4ixqLbDTg+p7nU/jDOzOGjeLZ2kz8=;
 b=Y8d2SuGdFElOyeCQkqOH+KH9dE7scA1OsooBlrmiOR94Yl3t0u67GmouxTSR+CWVY2jb
 IgwM7e519ezJxdgAnJha3di4n/UiHtRMGxKFjPHQlF6bTT810U9Qq2qLGSCzta+nHI0D
 1jOWsjUYIHxppq1vX2gE19BuVbFJwCcxnVWmLw/eKRxODf4rNTYrksTN2MAIhMH+NwT+
 wHYZXuKd3Y25++1Pht2iYatQZZmRqisPz8CeLUf/2YJxP3XSXXmTjvdeyOaImF7z+/Tu
 2rAJAsqzXnIDtJzMz43lbruZxKzQxhw0WsS7YGhpt/qz9twxyBFq7NEY5Tf3DHkQmu9X 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e920vmj9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:26 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GG8NLe030268;
 Wed, 16 Feb 2022 16:25:25 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e920vmj8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:25 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGDUKk002806;
 Wed, 16 Feb 2022 16:25:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3e877g2cua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPN4718678018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:24 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD34178060;
 Wed, 16 Feb 2022 16:25:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BDC77805C;
 Wed, 16 Feb 2022 16:25:22 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:22 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/27] target/ppc: cpu_init: Move check_pow and QOM macros
 to a header
Date: Wed, 16 Feb 2022 13:24:25 -0300
Message-Id: <20220216162426.1885923-27-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3Ee6AFcHrpxMUB3pS7pzWdPXiUSaEG-N
X-Proofpoint-ORIG-GUID: 5gPEhQyjnyQw0cY37uoriWzbT0dM6YM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
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

These will need to be accessed from other files once we move the CPUs
code to separate files.

The check_pow_hid0 and check_pow_hid0_74xx are too specific to be
moved to a header so I'll deal with them later when splitting this
code between the multiple CPU families.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h      | 39 +++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c | 37 -------------------------------------
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6a06a7f533..1d33e8afea 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2733,4 +2733,43 @@ void dump_mmu(CPUPPCState *env);
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
 void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
 uint32_t ppc_get_vscr(CPUPPCState *env);
+
+/*****************************************************************************/
+/* Power management enable checks                                            */
+static inline int check_pow_none(CPUPPCState *env)
+{
+    return 0;
+}
+
+static inline int check_pow_nocheck(CPUPPCState *env)
+{
+    return 1;
+}
+
+/*****************************************************************************/
+/* PowerPC implementations definitions                                       */
+
+#define POWERPC_FAMILY(_name)                                               \
+    static void                                                             \
+    glue(glue(ppc_, _name), _cpu_family_class_init)(ObjectClass *, void *); \
+                                                                            \
+    static const TypeInfo                                                   \
+    glue(glue(ppc_, _name), _cpu_family_type_info) = {                      \
+        .name = stringify(_name) "-family-" TYPE_POWERPC_CPU,               \
+        .parent = TYPE_POWERPC_CPU,                                         \
+        .abstract = true,                                                   \
+        .class_init = glue(glue(ppc_, _name), _cpu_family_class_init),      \
+    };                                                                      \
+                                                                            \
+    static void glue(glue(ppc_, _name), _cpu_family_register_types)(void)   \
+    {                                                                       \
+        type_register_static(                                               \
+            &glue(glue(ppc_, _name), _cpu_family_type_info));               \
+    }                                                                       \
+                                                                            \
+    type_init(glue(glue(ppc_, _name), _cpu_family_register_types))          \
+                                                                            \
+    static void glue(glue(ppc_, _name), _cpu_family_class_init)
+
+
 #endif /* PPC_CPU_H */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 4c6b462cad..5bbbcceb55 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2484,18 +2484,6 @@ static void init_excp_POWER10(CPUPPCState *env)
 
 #endif
 
-/*****************************************************************************/
-/* Power management enable checks                                            */
-static int check_pow_none(CPUPPCState *env)
-{
-    return 0;
-}
-
-static int check_pow_nocheck(CPUPPCState *env)
-{
-    return 1;
-}
-
 static int check_pow_hid0(CPUPPCState *env)
 {
     if (env->spr[SPR_HID0] & 0x00E00000) {
@@ -2514,31 +2502,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
     return 0;
 }
 
-/*****************************************************************************/
-/* PowerPC implementations definitions                                       */
-
-#define POWERPC_FAMILY(_name)                                               \
-    static void                                                             \
-    glue(glue(ppc_, _name), _cpu_family_class_init)(ObjectClass *, void *); \
-                                                                            \
-    static const TypeInfo                                                   \
-    glue(glue(ppc_, _name), _cpu_family_type_info) = {                      \
-        .name = stringify(_name) "-family-" TYPE_POWERPC_CPU,               \
-        .parent = TYPE_POWERPC_CPU,                                         \
-        .abstract = true,                                                   \
-        .class_init = glue(glue(ppc_, _name), _cpu_family_class_init),      \
-    };                                                                      \
-                                                                            \
-    static void glue(glue(ppc_, _name), _cpu_family_register_types)(void)   \
-    {                                                                       \
-        type_register_static(                                               \
-            &glue(glue(ppc_, _name), _cpu_family_type_info));               \
-    }                                                                       \
-                                                                            \
-    type_init(glue(glue(ppc_, _name), _cpu_family_register_types))          \
-                                                                            \
-    static void glue(glue(ppc_, _name), _cpu_family_class_init)
-
 static void init_proc_405(CPUPPCState *env)
 {
     register_40x_sprs(env);
-- 
2.34.1


