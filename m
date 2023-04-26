Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD46EFE20
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 01:59:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prp1z-000359-51; Wed, 26 Apr 2023 19:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prp1r-00030T-Ep; Wed, 26 Apr 2023 19:58:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prp1p-0005G8-FN; Wed, 26 Apr 2023 19:58:31 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QNcDdv028423; Wed, 26 Apr 2023 23:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tk2ZwUrCwzAwZiKr29kiMxgB77ddR4C/cSaxXkI2Q1w=;
 b=gZQN3/8kGu90RYYllhQ0zUbDUF0eknxC454veYaA3tmzCT/SzDb8OLvnYBmqfFgzBLTf
 HztK+4qbe/tmCDcMPNTRbj5/9vtKnNRQdIak6YFZMjOfPC2degEwbFtCyQQlVZu4Y14U
 jYft2kNGp6KYixej1/bGFMvFZJVC5jMtg/R43Arx+lNg8wSE/JUofjmjJtSaQkGLBXgb
 nu3D4HWbVv+noyxVwMmKzpSSjkMDkKXKudGb7adIgQExqHX2SmuKCvndoDkvIqnnXbRW
 ms8gyMSFGOddnvYw5pCYORSMRivneENbBLu45s9zw/qGqpjBG+pk/1J5CxgDoLIz+KTW Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7c7ntqay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:27 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33QNnRL1032637;
 Wed, 26 Apr 2023 23:58:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q7c7ntqaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33QMc48p013088;
 Wed, 26 Apr 2023 23:58:24 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug2m58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 23:58:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33QNwLLD23724618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 23:58:21 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1595520043;
 Wed, 26 Apr 2023 23:58:21 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 968EB20040;
 Wed, 26 Apr 2023 23:58:20 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.69.68])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 26 Apr 2023 23:58:20 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 1/2] target/s390x: Fix EXECUTE of relative branches
Date: Thu, 27 Apr 2023 01:58:12 +0200
Message-Id: <20230426235813.198183-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426235813.198183-1-iii@linux.ibm.com>
References: <20230426235813.198183-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BJzN-xOIXMxD07-8ejqPL5YaIAmviCdI
X-Proofpoint-GUID: Hr4ugYhPK7JMdkbicfvxIXwpyTTGsXP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260203
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix a problem similar to the one fixed by commit 703d03a4aaf3
("target/s390x: Fix EXECUTE of relative long instructions"), but now
for relative branches.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 81 ++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 23 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 46b874e94da..2a681428af1 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1534,18 +1534,51 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
     }
 }
 
+/*
+ * Disassemble the target of a branch. The results are returned in a form
+ * suitable for passing into help_branch():
+ *
+ * - bool IS_IMM reflects whether the target is fixed or computed. Non-EXECUTEd
+ *   branches, whose DisasContext *S contains the relative immediate field RI,
+ *   are considered fixed. All the other branches are considered computed.
+ * - int IMM is the value of RI.
+ * - TCGv_i64 CDEST is the address of the computed target.
+ */
+#define disas_jdest(s, ri, is_imm, imm, cdest) do {                            \
+    if (have_field(s, ri)) {                                                   \
+        if (unlikely(s->ex_value)) {                                           \
+            cdest = tcg_temp_new_i64();                                        \
+            tcg_gen_ld_i64(cdest, cpu_env, offsetof(CPUS390XState, ex_target));\
+            tcg_gen_addi_i64(cdest, cdest, (int64_t)get_field(s, ri) * 2);     \
+            is_imm = false;                                                    \
+        } else {                                                               \
+            is_imm = true;                                                     \
+        }                                                                      \
+    } else {                                                                   \
+        is_imm = false;                                                        \
+    }                                                                          \
+    imm = is_imm ? get_field(s, ri) : 0;                                       \
+} while (false)
+
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
+    DisasCompare c;
+    bool is_imm;
+    int imm;
+
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+
+    disas_jdest(s, i2, is_imm, imm, o->in2);
+    disas_jcc(s, &c, 0xf);
+    return help_branch(s, &c, is_imm, imm, o->in2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
 {
     int m1 = get_field(s, m1);
-    bool is_imm = have_field(s, i2);
-    int imm = is_imm ? get_field(s, i2) : 0;
     DisasCompare c;
+    bool is_imm;
+    int imm;
 
     /* BCR with R2 = 0 causes no branching */
     if (have_field(s, r2) && get_field(s, r2) == 0) {
@@ -1562,6 +1595,7 @@ static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
         return DISAS_NEXT;
     }
 
+    disas_jdest(s, i2, is_imm, imm, o->in2);
     disas_jcc(s, &c, m1);
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
@@ -1569,10 +1603,10 @@ static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
 static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
-    bool is_imm = have_field(s, i2);
-    int imm = is_imm ? get_field(s, i2) : 0;
     DisasCompare c;
+    bool is_imm;
     TCGv_i64 t;
+    int imm;
 
     c.cond = TCG_COND_NE;
     c.is_64 = false;
@@ -1584,6 +1618,7 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
     c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
 
+    disas_jdest(s, i2, is_imm, imm, o->in2);
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
 
@@ -1611,9 +1646,9 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
 static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
-    bool is_imm = have_field(s, i2);
-    int imm = is_imm ? get_field(s, i2) : 0;
     DisasCompare c;
+    bool is_imm;
+    int imm;
 
     c.cond = TCG_COND_NE;
     c.is_64 = true;
@@ -1622,6 +1657,7 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
     c.u.s64.a = regs[r1];
     c.u.s64.b = tcg_constant_i64(0);
 
+    disas_jdest(s, i2, is_imm, imm, o->in2);
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
 
@@ -1629,10 +1665,10 @@ static DisasJumpType op_bx32(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
     int r3 = get_field(s, r3);
-    bool is_imm = have_field(s, i2);
-    int imm = is_imm ? get_field(s, i2) : 0;
     DisasCompare c;
+    bool is_imm;
     TCGv_i64 t;
+    int imm;
 
     c.cond = (s->insn->data ? TCG_COND_LE : TCG_COND_GT);
     c.is_64 = false;
@@ -1645,6 +1681,7 @@ static DisasJumpType op_bx32(DisasContext *s, DisasOps *o)
     tcg_gen_extrl_i64_i32(c.u.s32.b, regs[r3 | 1]);
     store_reg32_i64(r1, t);
 
+    disas_jdest(s, i2, is_imm, imm, o->in2);
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
 
@@ -1652,9 +1689,9 @@ static DisasJumpType op_bx64(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
     int r3 = get_field(s, r3);
-    bool is_imm = have_field(s, i2);
-    int imm = is_imm ? get_field(s, i2) : 0;
     DisasCompare c;
+    bool is_imm;
+    int imm;
 
     c.cond = (s->insn->data ? TCG_COND_LE : TCG_COND_GT);
     c.is_64 = true;
@@ -1668,6 +1705,7 @@ static DisasJumpType op_bx64(DisasContext *s, DisasOps *o)
     tcg_gen_add_i64(regs[r1], regs[r1], regs[r3]);
     c.u.s64.a = regs[r1];
 
+    disas_jdest(s, i2, is_imm, imm, o->in2);
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
 
@@ -1685,10 +1723,9 @@ static DisasJumpType op_cj(DisasContext *s, DisasOps *o)
     c.u.s64.a = o->in1;
     c.u.s64.b = o->in2;
 
-    is_imm = have_field(s, i4);
-    if (is_imm) {
-        imm = get_field(s, i4);
-    } else {
+    o->out = NULL;
+    disas_jdest(s, i4, is_imm, imm, o->out);
+    if (!is_imm && !o->out) {
         imm = 0;
         o->out = get_address(s, 0, get_field(s, b4),
                              get_field(s, d4));
@@ -5774,15 +5811,13 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 
 static TCGv gen_ri2(DisasContext *s)
 {
-    int64_t delta = (int64_t)get_field(s, i2) * 2;
-    TCGv ri2;
+    TCGv ri2 = NULL;
+    bool is_imm;
+    int imm;
 
-    if (unlikely(s->ex_value)) {
-        ri2 = tcg_temp_new_i64();
-        tcg_gen_ld_i64(ri2, cpu_env, offsetof(CPUS390XState, ex_target));
-        tcg_gen_addi_i64(ri2, ri2, delta);
-    } else {
-        ri2 = tcg_constant_i64(s->base.pc_next + delta);
+    disas_jdest(s, i2, is_imm, imm, ri2);
+    if (is_imm) {
+        ri2 = tcg_constant_i64(s->base.pc_next + imm * 2);
     }
 
     return ri2;
-- 
2.40.0


