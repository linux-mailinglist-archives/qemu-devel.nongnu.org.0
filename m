Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD958AFF5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 20:38:14 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK2D7-0005iU-Ej
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 14:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK26G-0001rL-P7; Fri, 05 Aug 2022 14:31:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46190
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK269-0000Ir-Pb; Fri, 05 Aug 2022 14:31:08 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275HoIs9006510;
 Fri, 5 Aug 2022 18:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6IimpppYGHxcM35bA+ZMSvfGTOn9+lV7szanabv+6oQ=;
 b=T3lIfRQlr1QuITPuAw9gE2yxowRgoCuWK0fqPaxPjbUQhvPc8t5LjAMRM8AVChMY4SD3
 l5JVLd2q/NNRTod3Ljf1VS3OkxzGRhDi2kpbpLvyN3jlqi1EUx20IxSUwMeY/7SVe5l8
 cP7hOowkq1z6Y9QjymKshaeWDovl3+Yb27XOH2sXFVB178/VmC7OAWHGQoKIvBqG9Jxh
 rF4gZR/S83gPr1sdMApq8bAhaMlEu0c4ApZylXVE1VhGLISRFieFfgUZ3f0WiD1taLq+
 gYkBDX7dzijX7bqeW0sZCFdDA97tnx39b51yAYImmqWbUu92Cf6QOFtaQU1daMptF/pn Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7y616nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:30:42 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275I6W41015051;
 Fri, 5 Aug 2022 18:30:42 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7y616m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:30:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275I7XR7006412;
 Fri, 5 Aug 2022 18:30:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3hmv98wrrr-49
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:30:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 275G9ZxK15335752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 16:09:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED2E4A405C;
 Fri,  5 Aug 2022 16:09:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D325A4054;
 Fri,  5 Aug 2022 16:09:18 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.89.138])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 16:09:18 +0000 (GMT)
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
Subject: [PATCH v2 3/4] target/i386: Make translator stop before the end of a
 page
Date: Fri,  5 Aug 2022 18:09:13 +0200
Message-Id: <20220805160914.1106091-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220805160914.1106091-1-iii@linux.ibm.com>
References: <20220805160914.1106091-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CTtqWn5o_qa_idoq4PouG0LgFmV0nrvb
X-Proofpoint-GUID: gen_A-ngqawF-IyBHD7kVgf1S2cQXIHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_09,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

We may find out that we crossed page boundary after some ops were
emitted and cc_op was updated. In theory it might be possible to
rearrange the code to disassemble first, but this is too error-prone.
Simply snapshot and restore the disassembly state instead.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/i386/tcg/translate.c | 42 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..ea749b0a04 100644
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
@@ -4545,6 +4551,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     }
 }
 
+/* Disassembly state that may affect the next instruction. */
+typedef struct {
+    TCGOp *last_op;
+    bool cc_op_dirty;
+    CCOp cc_op;
+} DisasSnapshot;
+
+/* Save disassembly state. */
+static void disas_save(DisasSnapshot *snapshot, const DisasContext *s)
+{
+    snapshot->last_op = tcg_last_op();
+    snapshot->cc_op_dirty = s->cc_op_dirty;
+    snapshot->cc_op = s->cc_op;
+}
+
+/* Restore disassembly state. */
+static void disas_restore(const DisasSnapshot *snapshot, DisasContext *s)
+{
+    tcg_remove_ops_after(snapshot->last_op);
+    s->cc_op_dirty = snapshot->cc_op_dirty;
+    s->cc_op = snapshot->cc_op;
+}
+
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
@@ -4556,6 +4585,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     target_ulong pc_start = s->base.pc_next;
+    DisasSnapshot snapshot;
 
     s->pc_start = s->pc = pc_start;
     s->override = -1;
@@ -4568,9 +4598,19 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->rip_offset = 0; /* for relative ip address */
     s->vex_l = 0;
     s->vex_v = 0;
-    if (sigsetjmp(s->jmpbuf, 0) != 0) {
+    disas_save(&snapshot, s);
+    switch (sigsetjmp(s->jmpbuf, 0)) {
+    case 0:
+        break;
+    case 1:
         gen_exception_gpf(s);
         return s->pc;
+    case 2:
+        disas_restore(&snapshot, s);
+        s->base.is_jmp = DISAS_TOO_MANY;
+        return pc_start;
+    default:
+        g_assert_not_reached();
     }
 
     prefixes = 0;
-- 
2.35.3


