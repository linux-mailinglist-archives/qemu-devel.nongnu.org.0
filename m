Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA52DBD61
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:16:40 +0100 (CET)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSvH-0000RC-FE
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSq0-000519-TX; Wed, 16 Dec 2020 04:11:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45378
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSpr-0007J9-UK; Wed, 16 Dec 2020 04:11:12 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG92FUu069408; Wed, 16 Dec 2020 04:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=jJ94XpvYxTeTpvrDI/SHSRje2SCi79KqVQGCQF520DI=;
 b=EbOh0dROSXzvgE0IPGXstw5W6/YDI8t9mci6kJxSw50PmJGTFuFwC8V55fb7qmplYxn6
 nlmkMEpFjpOH71kTzgJQ899qiLH1KgUnUKLCF/DmhGOuzzpMtU60coXzLBcoYRGGQPp0
 qKGPTkXmRUqZjwHB7cnqPq9FjPlLv0Rr6BuZZ0BZya5bb+BBhi/ZeoIHibbWJDlCb7KV
 SN5LRcldPMYgThGAlIdmP4cWG/apN6FrApN1f06VYjmRw7zBT0z2HEneHrDDGWB0UkVE
 22SiP3rMJ1w4PNj0nZa7Olw1JNiKuF3IlMeM9lcicCKbV0iMzS9Ot/4E30YMZR23v//S EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fdveamr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:10:50 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG94P9u079717;
 Wed, 16 Dec 2020 04:10:50 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fdveamqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:10:50 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG96qjH019004;
 Wed, 16 Dec 2020 09:10:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 35d5260904-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:10:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9Am2A19464538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:10:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 788D97805C;
 Wed, 16 Dec 2020 09:10:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2B967805E;
 Wed, 16 Dec 2020 09:10:41 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:10:41 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] target/ppc: Add support for prefixed load/store
 instructions
Date: Wed, 16 Dec 2020 06:07:59 -0300
Message-Id: <20201216090804.58640-3-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216090804.58640-1-gromero@linux.ibm.com>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=989 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160055
Received-SPF: pass client-ip=148.163.158.5; envelope-from=gromero@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, gromero@linux.ibm.com,
 gustavo.romero@protonmail.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 mroth@lamentation.net, clg@kaod.org, david@gibson.dropbear.id.au,
 alex.bennee@linaro.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Roth <mdroth@linux.vnet.ibm.com>

This commit adds support for the following prefixed load and store
instructions for GPRs:

  plbz, plh{a,z}, plw{a,z}, pld, plq
  pstb, psth, pstw, pstd, pstq
  paddi

Signed-off-by: Michael Roth <mroth@lamentation.net>
[ gromero: - fix for gen_addr_imm34_index()
           - fix build when target != TARGET_PPC64
           - removed redundant PREFIX_R bit helper
           - changes in commit log ]
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 target/ppc/internal.h  |   6 +
 target/ppc/translate.c | 264 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 270 insertions(+)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index d03d691a44..f67bd30730 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -159,6 +159,12 @@ EXTRACT_HELPER(PREFIX_TYPE, 24, 2);
 EXTRACT_HELPER(PREFIX_ST1, 23, 1);
 /* 4-bit sub-type */
 EXTRACT_HELPER(PREFIX_ST4, 20, 4);
+/* 18 bits signed immediate value */
+EXTRACT_SHELPER(SIMM18, 0, 18);
+/* 18 bits unsigned immediate value */
+EXTRACT_HELPER(UIMM18, 0, 18);
+/* R bit controls if CIA should be added when computing the EA */
+EXTRACT_HELPER(R, 20, 1);
 
 #ifndef CONFIG_USER_ONLY
 EXTRACT_HELPER(SR, 16, 4);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index eab6561094..0bca3a02e4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -2495,6 +2495,37 @@ static inline void gen_addr_add(DisasContext *ctx, TCGv ret, TCGv arg1,
     }
 }
 
+/* returns true if exception was generated */
+static inline int gen_addr_imm34_index(DisasContext *ctx, TCGv EA)
+{
+    uint64_t offset;
+
+    /* ISA says that if R=1 then RA must be 0, otherwise the form is invalid */
+    if (R(ctx->prefix) == 1) {
+        if (unlikely(rA(ctx->opcode) != 0)) {
+            gen_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
+            return true;
+        }
+        /*
+         * To find out the address of a prefixed instruction
+         * it's necessary to rewind 8 bytes because they are
+         * twice the size of non-prefixed instructions.
+         */
+        tcg_gen_movi_tl(EA, ctx->base.pc_next - 8);
+    } else {
+        gen_addr_register(ctx, EA);
+    }
+
+    offset = (uint64_t)UIMM18(ctx->prefix) << 16;
+    offset |= UIMM(ctx->opcode);
+    /* sign-extend 34 bit offset to 64-bits... */
+    if (extract64(offset, 33, 1) == 1) {
+        offset |= -1UL << 34;
+    }
+    tcg_gen_addi_tl(EA, EA, offset);
+    return false;
+}
+
 static inline void gen_align_no_le(DisasContext *ctx)
 {
     gen_exception_err(ctx, POWERPC_EXCP_ALIGN,
@@ -2714,6 +2745,35 @@ static void gen_ld(DisasContext *ctx)
     tcg_temp_free(EA);
 }
 
+static void gen_pld(DisasContext *ctx)
+{
+    TCGv EA;
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld64_i64(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+/* paddi */
+static void gen_paddi(DisasContext *ctx)
+{
+    TCGv EA;
+
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld64_i64(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+
+out:
+    tcg_temp_free(EA);
+}
+
 /* lq */
 static void gen_lq(DisasContext *ctx)
 {
@@ -2776,6 +2836,195 @@ static void gen_lq(DisasContext *ctx)
     }
     tcg_temp_free(EA);
 }
+
+static void gen_plq(DisasContext *ctx)
+{
+    int ra, rd;
+    TCGv EA, rd0, rd1;
+
+    ra = rA(ctx->opcode);
+    rd = rD(ctx->opcode);
+    if (unlikely((rd & 1) || rd == ra)) {
+        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
+        return;
+    }
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+
+    rd0 = cpu_gpr[rd];
+    rd1 = cpu_gpr[rd + 1];
+
+    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
+        /* Restart with exclusive lock.  */
+        gen_helper_exit_atomic(cpu_env);
+        ctx->base.is_jmp = DISAS_NORETURN;
+    } else {
+        tcg_gen_qemu_ld_i64(rd0, EA, ctx->mem_idx,
+                            ctx->le_mode ? MO_LEQ : MO_BEQ);
+        gen_addr_add(ctx, EA, EA, 8);
+        tcg_gen_qemu_ld_i64(rd1, EA, ctx->mem_idx,
+                            ctx->le_mode ? MO_LEQ : MO_BEQ);
+    }
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_plbz(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld8u(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_plhz(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld16u(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_plha(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld16s(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_plwz(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld32u(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_plwa(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_ld32s(ctx, cpu_gpr[rD(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_pstb(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_st8(ctx, cpu_gpr[rS(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_psth(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_st16(ctx, cpu_gpr[rS(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_pstw(DisasContext *ctx)
+{
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_st32(ctx, cpu_gpr[rS(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_pstd(DisasContext *ctx) {
+    TCGv EA;
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+    gen_qemu_st64_i64(ctx, cpu_gpr[rS(ctx->opcode)], EA);
+out:
+    tcg_temp_free(EA);
+}
+
+static void gen_pstq(DisasContext *ctx) {
+    int ra, rs;
+    TCGv EA, rs0, rs1;
+
+    ra = rA(ctx->opcode);
+    rs = rD(ctx->opcode);
+    if (unlikely((rs & 1) || rs == ra)) {
+        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
+        return;
+    }
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    EA = tcg_temp_new();
+    if (gen_addr_imm34_index(ctx, EA)) {
+        goto out;
+    }
+
+    rs0 = cpu_gpr[rs];
+    rs1 = cpu_gpr[rs + 1];
+
+    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
+        /* Restart with exclusive lock.  */
+        gen_helper_exit_atomic(cpu_env);
+        ctx->base.is_jmp = DISAS_NORETURN;
+    } else {
+        tcg_gen_qemu_st_i64(rs0, EA, ctx->mem_idx,
+                            ctx->le_mode ? MO_LEQ : MO_BEQ);
+        gen_addr_add(ctx, EA, EA, 8);
+        tcg_gen_qemu_st_i64(rs1, EA, ctx->mem_idx,
+                            ctx->le_mode ? MO_LEQ : MO_BEQ);
+    }
+out:
+    tcg_temp_free(EA);
+}
+
+
 #endif
 
 /***                              Integer store                            ***/
@@ -7067,6 +7316,9 @@ GEN_HANDLER_E(cmpb, 0x1F, 0x1C, 0x0F, 0x00000001, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
 GEN_HANDLER(addi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
+#if defined(TARGET_PPC64)
+GEN_HANDLER_E_PREFIXED_M(paddi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+#endif
 GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(addis, 0x0F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
@@ -7128,6 +7380,18 @@ GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0x1B, 0x00000000,
 GEN_HANDLER(ld, 0x3A, 0xFF, 0xFF, 0x00000000, PPC_64B),
 GEN_HANDLER(lq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64BX),
 GEN_HANDLER(std, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_64B),
+GEN_HANDLER_E_PREFIXED_M(plbz, 0x22, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED_M(plhz, 0x28, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED_M(plha, 0x2a, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED_M(plwz, 0x20, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED(plwa, 0x29, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED(pld, 0x39, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED(plq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED_M(pstb, 0x26, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED_M(psth, 0x2c, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED_M(pstw, 0x24, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED(pstd, 0x3d, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED(pstq, 0x3c, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310),
 #endif
 /* handles lfdp, lxsd, lxssp */
 GEN_HANDLER_E(dform39, 0x39, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA205),
-- 
2.17.1


