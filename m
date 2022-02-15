Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70B4B7A43
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:12:24 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK63b-0006vR-QZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5bC-0004fC-Rp; Tue, 15 Feb 2022 16:43:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52706
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5bB-0002el-4g; Tue, 15 Feb 2022 16:43:02 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FLH9CB018530; 
 Tue, 15 Feb 2022 21:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AGQt267R++oya9rZlmC6uwlRFfSaYl/J/jAdRmL32iY=;
 b=OKNlN/ow/NKyVDaGKKEm6HnRxjoGEdDMFjIz/AeTqIrPOr+lMtHRnYcnh7K/qAYMGW6w
 vlUSDYn5IVeDTePIPb9pSzYBOCcdvBAAckyx1d2r4ID4iQ03hxMxXs4B1pyYSV8yc3fJ
 ILAY0IxzAZ6WXtX2aQjQ0jEVDO7CLIfmybcd3iz2UYCia00LnRSdGA1UPWI8bQ3yiaIG
 Xud4VgPO11bxRCOZi4PLdzxN7NH8zMmsBJeQZ776G8AKeIOL5LlY9nEr8v6lvdLLzQ1Z
 H4K9YuUjy/ekmOEkwQjOpMohBCkPH4TRuJCqZe1oNbCVjUUMGjeWCoAJd5GYkUo/wD3H lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8ky4ghrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLbnkB003919;
 Tue, 15 Feb 2022 21:42:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8ky4ghr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLgZ3P002746;
 Tue, 15 Feb 2022 21:42:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3e64hb2sbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:48 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLglrd16449840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:47 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69127BE058;
 Tue, 15 Feb 2022 21:42:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E36D0BE054;
 Tue, 15 Feb 2022 21:42:45 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/27] target/ppc: cpu_init: Move check_pow and QOM macros to
 a header
Date: Tue, 15 Feb 2022 18:41:47 -0300
Message-Id: <20220215214148.1848266-27-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LAUUOtrxNsPVbU5k6psTeSuHOldEr32F
X-Proofpoint-GUID: DnC4cH7o0YP7f89meShmLqMDzDbXYDRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

These will need to be accessed from other files once we move the CPUs
code to separate files.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h      | 57 +++++++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c | 55 -----------------------------------------
 2 files changed, 57 insertions(+), 55 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6a06a7f533..ba0739c43b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2733,4 +2733,61 @@ void dump_mmu(CPUPPCState *env);
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
+static inline int check_pow_hid0(CPUPPCState *env)
+{
+    if (env->spr[SPR_HID0] & 0x00E00000) {
+        return 1;
+    }
+
+    return 0;
+}
+
+static inline int check_pow_hid0_74xx(CPUPPCState *env)
+{
+    if (env->spr[SPR_HID0] & 0x00600000) {
+        return 1;
+    }
+
+    return 0;
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
index 3327ea15fd..34306e2360 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2484,61 +2484,6 @@ static void init_excp_POWER10(CPUPPCState *env)
 
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
-static int check_pow_hid0(CPUPPCState *env)
-{
-    if (env->spr[SPR_HID0] & 0x00E00000) {
-        return 1;
-    }
-
-    return 0;
-}
-
-static int check_pow_hid0_74xx(CPUPPCState *env)
-{
-    if (env->spr[SPR_HID0] & 0x00600000) {
-        return 1;
-    }
-
-    return 0;
-}
-
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


