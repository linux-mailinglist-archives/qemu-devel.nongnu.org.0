Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7616519F8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 05:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7UAs-0000eG-6z; Mon, 19 Dec 2022 23:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p7UAh-0000cm-Lg; Mon, 19 Dec 2022 23:24:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p7UAf-0002hh-7o; Mon, 19 Dec 2022 23:24:07 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BK4E5qQ014096; Tue, 20 Dec 2022 04:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=POKYxpHIHQUKpBc19d1Q5JCvO7MWTJtN7VX3VgKeYQk=;
 b=gg3+rLMekUUn2YnuiqI8DPdw20qUKH9rJZBFUie/LZLjy16e83j1CRKbJIFrpUlxeIwg
 Zu3BRo0trJ2Ps8JSEBNtS5D5CHuhaKTg2/7ZGaNHB//aEQuCf/Vy0TFhYgYcnupbYERI
 KJ5tz1gzD9zgidqhUZgz68NhvqXM7jQ75LAXul8xwRPzUkIhpZdCsLUvaTEQ0KHlWEYt
 HdiPItJwCIkY3/QQxXhdJ/to6YJB8ff+7qpCGGKGixwwSYCCZt2jLrZK3I4L5YzTb+pG
 gqK8migfgK8qnWnqPDgFKatV9fHMyCnI3xBEo8DHFT5O96NCt9La3VEgQbQ+l3pzPjSM xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk5u985vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:49 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BK4K7s6000632;
 Tue, 20 Dec 2022 04:23:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk5u985v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJLeuKq016895;
 Tue, 20 Dec 2022 04:23:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mh6yw2fdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BK4Nivj37487098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Dec 2022 04:23:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D262B20040;
 Tue, 20 Dec 2022 04:23:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DABF420049;
 Tue, 20 Dec 2022 04:23:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 20 Dec 2022 04:23:43 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 39026604A8;
 Tue, 20 Dec 2022 15:23:42 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PATCH v3 2/2] target/ppc: Check DEXCR on hash{st, chk} instructions
Date: Tue, 20 Dec 2022 04:23:30 +0000
Message-Id: <20221220042330.2387944-3-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220042330.2387944-1-nicholas@linux.ibm.com>
References: <20221220042330.2387944-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NqXthWtgYzq68D_DPSBhyVlihVkS25en
X-Proofpoint-GUID: OuQPai6l6mK-or5UsxN32kDczfKg1Lf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=869 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200034
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=nicholas@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adds checks to the hashst and hashchk instructions to only execute if
enabled by the relevant aspect in the DEXCR and HDEXCR.

This behaviour is guarded behind TARGET_PPC64 since Power10 is
currently the only implementation which has the DEXCR.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 94adcb766b..add4d54ae7 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2902,29 +2902,57 @@ static uint64_t hash_digest(uint64_t ra, uint64_t rb, uint64_t key)
     return stage1_h ^ stage1_l;
 }
 
+static void do_hash(CPUPPCState *env, target_ulong ea, target_ulong ra,
+                    target_ulong rb, uint64_t key, bool store)
+{
+    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;
+
+    if (store) {
+        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());
+    } else {
+        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());
+        if (loaded_hash != calculated_hash) {
+            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                POWERPC_EXCP_TRAP, GETPC());
+        }
+    }
+}
+
 #include "qemu/guest-random.h"
 
-#define HELPER_HASH(op, key, store)                                           \
+#ifdef TARGET_PPC64
+#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
 void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
                  target_ulong rb)                                             \
 {                                                                             \
-    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;         \
-                                                                              \
-    if (store) {                                                              \
-        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());                   \
-    } else {                                                                  \
-        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());                      \
-        if (loaded_hash != calculated_hash) {                                 \
-            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,                 \
-                POWERPC_EXCP_TRAP, GETPC());                                  \
-        }                                                                     \
+    if (env->msr & R_MSR_PR_MASK) {                                           \
+        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PRO_##dexcr_aspect##_MASK ||      \
+            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
+            return;                                                           \
+    } else if (!(env->msr & R_MSR_HV_MASK)) {                                 \
+        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PNH_##dexcr_aspect##_MASK ||      \
+            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
+            return;                                                           \
+    } else if (!(env->msr & R_MSR_S_MASK)) {                                  \
+        if (!(env->spr[SPR_HDEXCR] & R_HDEXCR_HNU_##dexcr_aspect##_MASK))     \
+            return;                                                           \
     }                                                                         \
+                                                                              \
+    do_hash(env, ea, ra, rb, key, store);                                     \
+}
+#else
+#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
+void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
+                 target_ulong rb)                                             \
+{                                                                             \
+    do_hash(env, ea, ra, rb, key, store);                                     \
 }
+#endif /* TARGET_PPC64 */
 
-HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
-HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
-HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
-HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
+HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true, NPHIE)
+HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false, NPHIE)
+HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true, PHIE)
+HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false, PHIE)
 #endif /* CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.34.1


