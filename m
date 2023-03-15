Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCA6BA4FD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 03:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcGVB-0003j6-12; Tue, 14 Mar 2023 22:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV8-0003iZ-Up; Tue, 14 Mar 2023 22:04:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV7-0000xP-Du; Tue, 14 Mar 2023 22:04:26 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32F1h4Z6024567; Wed, 15 Mar 2023 02:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cQcNibD4LrMIFZ6q9UfOwZ4hlp1TC82n6hN27D+836I=;
 b=Z19hiuPjKQblB/ES8qd8xrRxcmm8ekDnS1Y7psS1QS8eAW7m7GA1igaM5pfc1mwQWNDi
 u2pBbbT+go8a1mN2e2YSDGL2wnnQNdVNeKOJXHfiwMgAG4lt2P0qEzwOtO6zL/zsztjg
 ZyrmZLKdl7tTcj6OSptqBYK93eyoK1A0F3lGzhUTgzZVdtBv75OTGkQoKxrfDNjNVl+1
 dQYbThZAdyLAWgTOGiorHXtN9fQ3ibJvaRSH1MWYcQMvIVeelw9WSBVkgvZgxdfDQoa0
 X0fqGJOQvAR+HjKIWs0YOO/EvR/9GnilOZQf3RhDQg2lS4GelwKErDHy5EqYZOLhaEqj ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb4km8d50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:23 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32F1jZls032343;
 Wed, 15 Mar 2023 02:04:22 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb4km8d42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:22 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN6j1O002564;
 Wed, 15 Mar 2023 02:04:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pb29rr3yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:20 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32F24GHi3080526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 02:04:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD84620043;
 Wed, 15 Mar 2023 02:04:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35D5520040;
 Wed, 15 Mar 2023 02:04:16 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 02:04:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v2 2/3] target/s390x: Implement Early Exception Recognition
Date: Wed, 15 Mar 2023 03:04:07 +0100
Message-Id: <20230315020408.384766-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315020408.384766-1-iii@linux.ibm.com>
References: <20230315020408.384766-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dMx7EbZPfZ6esU8pRdH1Z5Yoz2D5RhKp
X-Proofpoint-GUID: b-6jIuHzy0nyUex6pPlwk0gn-qk2Vc-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_16,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150017
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Generate a specification exception if a reserved bit is set in the PSW
mask or if the PSW address is out of bounds dictated by the addressing
mode.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/cpu.c             | 26 ++++++++++++++++++++++++++
 target/s390x/cpu.h             |  1 +
 target/s390x/tcg/excp_helper.c |  3 ++-
 target/s390x/tcg/translate.c   | 16 ++++++++++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index b10a8541ff8..40fdeaa9056 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -41,6 +41,26 @@
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
 
+#ifndef CONFIG_USER_ONLY
+static bool is_early_exception_psw(uint64_t mask, uint64_t addr)
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
+    if (is_early_exception_psw(mask, addr)) {
+        env->int_pgm_ilen = 0;
+        trigger_pgm_exception(env, PGM_SPECIFICATION);
+        return;
+    }
+
     if ((old_mask ^ mask) & PSW_MASK_PER) {
         s390_cpu_recompute_watchpoints(env_cpu(env));
     }
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b2..16f63547513 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -292,6 +292,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 #define PSW_MASK_32             0x0000000080000000ULL
 #define PSW_MASK_SHORT_ADDR     0x000000007fffffffULL
 #define PSW_MASK_SHORT_CTRL     0xffffffff80000000ULL
+#define PSW_MASK_RESERVED       0xb80800fe7fffffffULL
 
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
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2e1e7e046a6..7832cf02a68 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4068,9 +4068,23 @@ static DisasJumpType op_sske(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static void gen_check_psw_mask(DisasContext *s)
+{
+    TCGv_i64 reserved = tcg_temp_new_i64();
+    TCGLabel *ok = gen_new_label();
+
+    tcg_gen_andi_i64(reserved, psw_mask, PSW_MASK_RESERVED);
+    tcg_gen_brcondi_i64(TCG_COND_EQ, reserved, 0, ok);
+    gen_program_exception(s, PGM_SPECIFICATION);
+    gen_set_label(ok);
+}
+
 static DisasJumpType op_ssm(DisasContext *s, DisasOps *o)
 {
     tcg_gen_deposit_i64(psw_mask, psw_mask, o->in2, 56, 8);
+
+    gen_check_psw_mask(s);
+
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
@@ -4331,6 +4345,8 @@ static DisasJumpType op_stnosm(DisasContext *s, DisasOps *o)
         tcg_gen_ori_i64(psw_mask, psw_mask, i2 << 56);
     }
 
+    gen_check_psw_mask(s);
+
     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
     s->exit_to_mainloop = true;
     return DISAS_TOO_MANY;
-- 
2.39.2


