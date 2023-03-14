Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AA6B90E2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2Oz-0001NM-Ec; Tue, 14 Mar 2023 07:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc2Oy-0001N8-6G; Tue, 14 Mar 2023 07:01:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pc2Ow-0004Sp-8I; Tue, 14 Mar 2023 07:01:07 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E9g4oi016916; Tue, 14 Mar 2023 11:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d42nUeWZSlSMpicJkV4sCWWStUxXxGbFNI+NE7Xy8IM=;
 b=DEqoer4/1xDOiBa/yYOytrshD6TlqROlabYgHRjJPAoyzqNAsyJi0mAJIswIgZFwRNcK
 /K6wlvwENDeHc7dbIpWbfk927fFErfnC4SAs8vtWiifCbchss4jgiGfNjJ97XxgcEh3w
 TfLQPkb4JTaKK5bFYcwgJlhKrSWRbPCu/QbI/KtoW9XXI8cVBrE3oEbuu+/tRLofowfT
 22YS7EZDv2jz+AoKL4DsyFNCygTI15DBirlFaEz24Y8SU8dYAQ5ZVh2m+DjSVX95Ns5j
 lHyNyoGLr6YHVnR3P+SsAIurJbkji1Zg+k5mXKwQiAiM+zzFnXsSap8JCRDUgAs+ZUIc mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paph21y72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 11:01:01 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32E9h53w021067;
 Tue, 14 Mar 2023 11:01:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paph21xy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 11:01:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32E6feok028628;
 Tue, 14 Mar 2023 11:00:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96mp8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 11:00:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32EB0ZMA18416344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 11:00:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34BC420040;
 Tue, 14 Mar 2023 11:00:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1B842004B;
 Tue, 14 Mar 2023 11:00:34 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 11:00:34 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 1/2] target/s390x: Implement Early Exception Recognition
Date: Tue, 14 Mar 2023 12:00:21 +0100
Message-Id: <20230314110022.184717-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314110022.184717-1-iii@linux.ibm.com>
References: <20230314110022.184717-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YyyQmgesrY7E6iVXn4HbM6CkOW17YGHa
X-Proofpoint-GUID: hKNVQxSoRIe3OoQZCKBept4hLBKupeQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Generate specification exception if a reserved bit is set in the PSW
mask or if the PSW address is out of bounds dictated by the addresing
mode.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/cpu.c             | 26 ++++++++++++++++++++++++++
 target/s390x/cpu.h             |  1 +
 target/s390x/tcg/excp_helper.c |  3 ++-
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index b10a8541ff8..8e6e46aa3d8 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -41,6 +41,26 @@
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
 
+#ifndef CONFIG_USER_ONLY
+static bool is_early_exception_recognized(uint64_t mask, uint64_t addr)
+{
+    if (mask & PSW_MASK_RESERVED) {
+        return true;
+    }
+
+    switch (mask & (PSW_MASK_32 | PSW_MASK_64)) {
+    case 0:
+        return addr & ~0xffffffULL;
+    case PSW_MASK_32:
+        return addr & ~0x7fffffffULL;
+    case PSW_MASK_32 | PSW_MASK_64:
+        return false;
+    default: /* PSW_MASK_64 */
+        return true;
+    }
+}
+#endif
+
 void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
 {
 #ifndef CONFIG_USER_ONLY
@@ -57,6 +77,12 @@ void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
     env->cc_op = (mask >> 44) & 3;
 
 #ifndef CONFIG_USER_ONLY
+    if (is_early_exception_recognized(mask, addr)) {
+        env->int_pgm_ilen = 0;
+        trigger_pgm_exception(env, PGM_SPECIFICATION);
+        return;
+    }
+
     if ((old_mask ^ mask) & PSW_MASK_PER) {
         s390_cpu_recompute_watchpoints(env_cpu(env));
     }
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b2..b4de6945936 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -292,6 +292,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 #define PSW_MASK_32             0x0000000080000000ULL
 #define PSW_MASK_SHORT_ADDR     0x000000007fffffffULL
 #define PSW_MASK_SHORT_CTRL     0xffffffff80000000ULL
+#define PSW_MASK_RESERVED       0xb800007e7fffffffULL
 
 #undef PSW_ASC_PRIMARY
 #undef PSW_ASC_ACCREG
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index bc767f04438..a7829b1e494 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -212,7 +212,8 @@ static void do_program_interrupt(CPUS390XState *env)
     LowCore *lowcore;
     int ilen = env->int_pgm_ilen;
 
-    assert(ilen == 2 || ilen == 4 || ilen == 6);
+    assert((env->int_pgm_code == PGM_SPECIFICATION && ilen == 0) ||
+           ilen == 2 || ilen == 4 || ilen == 6);
 
     switch (env->int_pgm_code) {
     case PGM_PER:
-- 
2.39.2


