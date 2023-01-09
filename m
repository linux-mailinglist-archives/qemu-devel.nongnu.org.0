Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC0661C20
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBn-0000nV-JA; Sun, 08 Jan 2023 20:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBl-0000mk-Dg
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:01 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBj-0001W3-LV
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:01 -0500
Received: by mail-pl1-x633.google.com with SMTP id d3so7940473plr.10
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A4OwvWQkwAWr6AsGpUBHBcNHseT39GUsYtHIf8rJKUY=;
 b=kM6Xb5LE5pIzEzMrC+my5EpjN14TgVFt+lVot9tcMhPd6xq89v1KipiiYyGKuPzC78
 ZaTq8TT6YSg6OmTIhcbpWRhp550WLxmjkoZbUPHUX+CXQqEenvXDQzVc4hhvW689qwgK
 gU9yh04I4DFNPzMvFOAM3WGwjOT0FqigGOi0fxQ4tWJKgWPWNeZ+zJUZ+LMrinxliaGz
 Okb6SUG5sxWh1bxwOLQ+pmiSEWh9yqQBseZU/cQd4flh7bwWTnOb1okbZDXXc3/7eeT2
 udhaORjCRoHK6csylZISidVT/BXj8g5jZDob54dM2zRW2sJLz4aNFwWd7So3kInne4cd
 2njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A4OwvWQkwAWr6AsGpUBHBcNHseT39GUsYtHIf8rJKUY=;
 b=4b6C4nwZCf57fCQw9XDFMX9HnsTIt2XIaUO6NqskMfWDVCBflahs2E39X4aJ1vEFfp
 +GHsKut6ZGkBXNsOdM9//j68vgLLSOP/452nqGnnzT0GJKWNSlLS6d4EsNPcAvEUX7hy
 tXERys3FhJoUNOBKxLU4a75QsJ1f7K4Sq5aiKh3AkDp8JrluZslJLyeVgKzj9buOyM1D
 LpY26RMs17T4dQ3N+8YasgopRR/AHM9GgDdt3oBtN9qgzOhYMouaVMDNPBdiEhXkphXs
 85ORrJ17J5yc0OZkI86ujCzrCFB25fMRXmzEw8XAUttwNR0eYEoWCKkj+YbMhMgo5VcU
 6DPg==
X-Gm-Message-State: AFqh2koturdfgACoBRyp0rchzeeEY4B4F0eGsm90DENDbL4Tt061ywX2
 nuLZDFKHhM7gr/m9/Y1P4nDSEECxCsDVen2T
X-Google-Smtp-Source: AMrXdXviazQyNSfAz5Y/zZN/WSrsFNGbNiLizSgK/v9Hcgn3wMnznoZ/esPgH7Nm0M+KiPuKrE+1wA==
X-Received: by 2002:a17:902:ce04:b0:189:b4d0:aee with SMTP id
 k4-20020a170902ce0400b00189b4d00aeemr82128700plg.67.1673228578833; 
 Sun, 08 Jan 2023 17:42:58 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/22] tcg: Add gen_tb to TCGContext
Date: Sun,  8 Jan 2023 17:42:36 -0800
Message-Id: <20230109014248.2894281-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This can replace four other variables that are references
into the TranslationBlock structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 11 +++--------
 accel/tcg/translate-all.c |  2 +-
 tcg/tcg-op.c              | 14 +++++++-------
 tcg/tcg.c                 | 14 +++-----------
 4 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b949d75fdd..c2d5430b5a 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -552,20 +552,15 @@ struct TCGContext {
     int nb_indirects;
     int nb_ops;
 
-    /* goto_tb support */
-    tcg_insn_unit *code_buf;
-    uint16_t *tb_jmp_reset_offset; /* tb->jmp_reset_offset */
-    uintptr_t *tb_jmp_insn_offset; /* tb->jmp_target_arg if direct_jump */
-    uintptr_t *tb_jmp_target_addr; /* tb->jmp_target_arg if !direct_jump */
-
     TCGRegSet reserved_regs;
-    uint32_t tb_cflags; /* cflags of the current TB */
     intptr_t current_frame_offset;
     intptr_t frame_start;
     intptr_t frame_end;
     TCGTemp *frame_temp;
 
-    tcg_insn_unit *code_ptr;
+    TranslationBlock *gen_tb;     /* tb for which code is being generated */
+    tcg_insn_unit *code_buf;      /* pointer for start of tb */
+    tcg_insn_unit *code_ptr;      /* pointer for running end of tb */
 
 #ifdef CONFIG_PROFILER
     TCGProfile prof;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 99c81e9691..e6a70d795e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -349,7 +349,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tb_set_page_addr0(tb, phys_pc);
     tb_set_page_addr1(tb, -1);
-    tcg_ctx->tb_cflags = cflags;
+    tcg_ctx->gen_tb = tb;
  tb_overflow:
 
 #ifdef CONFIG_PROFILER
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index cd1cd4e736..9fa9f1b0fd 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -86,7 +86,7 @@ void tcg_gen_op6(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
 
 void tcg_gen_mb(TCGBar mb_type)
 {
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {
         tcg_gen_op1(INDEX_op_mb, mb_type);
     }
 }
@@ -2782,7 +2782,7 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
 void tcg_gen_goto_tb(unsigned idx)
 {
     /* We tested CF_NO_GOTO_TB in translator_use_goto_tb. */
-    tcg_debug_assert(!(tcg_ctx->tb_cflags & CF_NO_GOTO_TB));
+    tcg_debug_assert(!(tcg_ctx->gen_tb->cflags & CF_NO_GOTO_TB));
     /* We only support two chained exits.  */
     tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
 #ifdef CONFIG_DEBUG_TCG
@@ -2798,7 +2798,7 @@ void tcg_gen_lookup_and_goto_ptr(void)
 {
     TCGv_ptr ptr;
 
-    if (tcg_ctx->tb_cflags & CF_NO_GOTO_PTR) {
+    if (tcg_ctx->gen_tb->cflags & CF_NO_GOTO_PTR) {
         tcg_gen_exit_tb(NULL, 0);
         return;
     }
@@ -3165,7 +3165,7 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
 {
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
-    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
         TCGv_i32 t1 = tcg_temp_new_i32();
         TCGv_i32 t2 = tcg_temp_new_i32();
 
@@ -3203,7 +3203,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
 {
     memop = tcg_canonicalize_memop(memop, 1, 0);
 
-    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
         TCGv_i64 t1 = tcg_temp_new_i64();
         TCGv_i64 t2 = tcg_temp_new_i64();
 
@@ -3364,7 +3364,7 @@ static void * const table_##NAME[(MO_SIZE | MO_BSWAP) + 1] = {          \
 void tcg_gen_atomic_##NAME##_i32                                        \
     (TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, MemOp memop)    \
 {                                                                       \
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {                             \
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
         do_atomic_op_i32(ret, addr, val, idx, memop, table_##NAME);     \
     } else {                                                            \
         do_nonatomic_op_i32(ret, addr, val, idx, memop, NEW,            \
@@ -3374,7 +3374,7 @@ void tcg_gen_atomic_##NAME##_i32                                        \
 void tcg_gen_atomic_##NAME##_i64                                        \
     (TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, MemOp memop)    \
 {                                                                       \
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {                             \
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
         do_atomic_op_i64(ret, addr, val, idx, memop, table_##NAME);     \
     } else {                                                            \
         do_nonatomic_op_i64(ret, addr, val, idx, memop, NEW,            \
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8c35a40eb3..c1f77f4392 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -310,7 +310,7 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
      * We will check for overflow at the end of the opcode loop in
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
-    s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
 static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
@@ -320,7 +320,7 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
     tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
-    s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_target_arg[which] = tcg_current_code_size(s);
 }
 
 static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
@@ -329,7 +329,7 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
      * Return the read-execute version of the pointer, for the benefit
      * of any pc-relative addressing mode.
      */
-    return (uintptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + which);
+    return (uintptr_t)tcg_splitwx_to_rx(s->gen_tb->jmp_target_arg + which);
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
@@ -4666,14 +4666,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     /* Initialize goto_tb jump offsets. */
     tb->jmp_reset_offset[0] = TB_JMP_OFFSET_INVALID;
     tb->jmp_reset_offset[1] = TB_JMP_OFFSET_INVALID;
-    tcg_ctx->tb_jmp_reset_offset = tb->jmp_reset_offset;
-    if (TCG_TARGET_HAS_direct_jump) {
-        tcg_ctx->tb_jmp_insn_offset = tb->jmp_target_arg;
-        tcg_ctx->tb_jmp_target_addr = NULL;
-    } else {
-        tcg_ctx->tb_jmp_insn_offset = NULL;
-        tcg_ctx->tb_jmp_target_addr = tb->jmp_target_arg;
-    }
 
     tcg_reg_alloc_start(s);
 
-- 
2.34.1


