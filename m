Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44958CC9F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:21:33 +0200 (CEST)
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6RY-0005EN-Ao
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oL6HB-0003tQ-9S; Mon, 08 Aug 2022 13:10:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oL6H9-00036k-DB; Mon, 08 Aug 2022 13:10:49 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278GrmV0018381;
 Mon, 8 Aug 2022 17:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rrw+mp9TzS2pJn58f64ODmg0k/jxtExk7TaSxjITx1M=;
 b=o2BhAm6drHxjZ1t52fy9MxWv8pq1wVu1BnNtRIGHCW6AzQNxTCeCOIFYNDOWnAMLe0zx
 L3L0tAI1Vz6ajBLRzIeuR4yLEIdwlJYVvn9z1mWgYUGbzD2d+tn21wgEpwsUbhiVsVqM
 uZOfWez9sfS60k1mIaJ0U59BpAh8PishbFB47PuzexxRt53WUEBuZGnTP7433ZEWcggq
 Q2ixYywLGQwmW5hPHsbLa6WLHaQklb+ovUAU8p5MmBzYDTzJy9nsP+1RMvgjc0inOV+/
 cGXeqBC3eaI0b8WfxNgfVfOctnTMeRy4As5Snrb2cm9adml4SDSRatZdg91YICk8xjen Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6dpgj3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:33 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 278GsLS5024160;
 Mon, 8 Aug 2022 17:10:32 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu6dpgj1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:32 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278GoS9V014217;
 Mon, 8 Aug 2022 17:10:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3hsfx8suad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Aug 2022 17:10:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 278HAQps5767536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Aug 2022 17:10:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2ABA404D;
 Mon,  8 Aug 2022 17:10:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9D2DA4040;
 Mon,  8 Aug 2022 17:10:25 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Aug 2022 17:10:25 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 3/4] target/i386: Make translator stop before the end of a
 page
Date: Mon,  8 Aug 2022 19:10:21 +0200
Message-Id: <20220808171022.49439-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808171022.49439-1-iii@linux.ibm.com>
References: <20220808171022.49439-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OxjS7kEghouYutZNFsnMHVlquJnzOq2V
X-Proofpoint-GUID: PLDfh15eonEqly0R4-iDJjBJFrSiOHzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_11,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now translator stops right *after* the end of a page, which
breaks reporting of fault locations when the last instruction of a
multi-insn translation block crosses a page boundary.

An implementation, like the one arm and s390x have, would require an
i386 length disassembler, which is burdensome to maintain. Another
alternative would be to single-step at the end of a guest page, but
this may come with a performance impact.

Fix by snapshotting disassembly state and restoring it after we figure
out we crossed a page boundary. This includes rolling back cc_op
updates and emitted ops. Even though i386 is the only architecture that
does rollback, split it into common and architecture-dependent parts to
improve readability.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translator.c      |  8 ++++++++
 include/exec/translator.h   |  3 +++
 target/i386/tcg/translate.c | 21 ++++++++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fe7af9b943..2c4dd09df8 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -56,6 +56,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 {
     uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
+    TCGOp *last_op;
 
     /* Initialize DisasContext */
     db->tb = tb;
@@ -82,6 +83,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 
     while (true) {
         db->num_insns++;
+        last_op = tcg_last_op();
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
@@ -103,6 +105,12 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
             ops->translate_insn(db, cpu);
         }
 
+        if (db->is_jmp == DISAS_TOO_MANY_UNDO) {
+            db->num_insns--;
+            tcg_remove_ops_after(last_op);
+            db->is_jmp = DISAS_TOO_MANY;
+        }
+
         /* Stop translation if translate_insn so indicated.  */
         if (db->is_jmp != DISAS_NEXT) {
             break;
diff --git a/include/exec/translator.h b/include/exec/translator.h
index d27f8c33b6..e1533aee87 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -31,6 +31,8 @@
  * DisasJumpType:
  * @DISAS_NEXT: Next instruction in program order.
  * @DISAS_TOO_MANY: Too many instructions translated.
+ * @DISAS_TOO_MANY_UNDO: Too many instructions translated. Everything that was
+ *                       done for the current instruction must be undone.
  * @DISAS_NORETURN: Following code is dead.
  * @DISAS_TARGET_*: Start of target-specific conditions.
  *
@@ -39,6 +41,7 @@
 typedef enum DisasJumpType {
     DISAS_NEXT,
     DISAS_TOO_MANY,
+    DISAS_TOO_MANY_UNDO,
     DISAS_NORETURN,
     DISAS_TARGET_0,
     DISAS_TARGET_1,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..14d4ed1412 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2008,6 +2008,12 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
 {
     uint64_t pc = s->pc;
 
+    /* This is a subsequent insn that crosses a page boundary.  */
+    if (s->base.num_insns > 1 &&
+        !is_same_page(&s->base, s->pc + num_bytes - 1)) {
+        siglongjmp(s->jmpbuf, 2);
+    }
+
     s->pc += num_bytes;
     if (unlikely(s->pc - s->pc_start > X86_MAX_INSN_LENGTH)) {
         /* If the instruction's 16th byte is on a different page than the 1st, a
@@ -4556,6 +4562,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     target_ulong pc_start = s->base.pc_next;
+    bool orig_cc_op_dirty = s->cc_op_dirty;
+    CCOp orig_cc_op = s->cc_op;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
@@ -4568,9 +4576,20 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->rip_offset = 0; /* for relative ip address */
     s->vex_l = 0;
     s->vex_v = 0;
-    if (sigsetjmp(s->jmpbuf, 0) != 0) {
+    switch (sigsetjmp(s->jmpbuf, 0)) {
+    case 0:
+        break;
+    case 1:
         gen_exception_gpf(s);
         return s->pc;
+    case 2:
+        /* Restore state that may affect the next instruction. */
+        s->cc_op_dirty = orig_cc_op_dirty;
+        s->cc_op = orig_cc_op;
+        s->base.is_jmp = DISAS_TOO_MANY_UNDO;
+        return pc_start;
+    default:
+        g_assert_not_reached();
     }
 
     prefixes = 0;
-- 
2.37.1


