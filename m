Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3C670CF3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:14:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6s-0003VB-KC; Tue, 17 Jan 2023 18:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6o-0003Tm-QS
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:14 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6m-0001Ku-TO
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:14 -0500
Received: by mail-pf1-x436.google.com with SMTP id 127so7530904pfe.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUH+ewHziBKrtmW4VyUC93341OIUixsRJcLJjLl2vwk=;
 b=Knvq8R4fMbYia8ogBJtlZe/ZndjcrHEdhHX+QDDGvcnXcgels47996Jgfoq0agRisI
 A93Iuz+SpQYN1O/HiPJUcg836yafr3q/+dCRATTnOY0sRThfEPi1RtU+Awpw84uYW6Jn
 wIRVh7AP2iyMu5+ai2E/UGBimOEA2w+5ZShd9vonT4m8IEinTYUl+1B7woJvSzI2BSMz
 ap+ZdspOxRIVEKzMJ7Zr+DAnii7K+rfsTb2vRwyJqf3N+lZnGbmq+8FPPybWe4aCM9I4
 kqbTAtGLeSDDwOkEsngCuTVCL85qk1Gqxyn55ybx8Gml/PStINt++oxojBy9BtW2NnSs
 Lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nUH+ewHziBKrtmW4VyUC93341OIUixsRJcLJjLl2vwk=;
 b=fG2t0Nxthw4ueJKApIngyjtMKDq89LrOOicTmINLT6UYBDbzt6F7c4zEmy8/vT6Auj
 2YK0Zcv6MfRih8uqkowRSNRte1FVXBAOK1O4IQVDL7aYhj1l6ED/7NHxqQwLhPAU3m0W
 gRTGSrnFtH8gdryKMwiFzQA7k928ZeSMQdoggN0rxTewdNryFAQ7ilJ8pCnqgzihnR4E
 oMKyXugMJ7CDKc44iZs6tHyaYOeqMmZTKQu7+DGhJL/V87vPae4fCOnkPxuwV3whhX7r
 vSiohQS9+ok7hQnIln2SrhFxlRCdIF3ZqZSkuVbo6K1ifqOOSW0lyBm1CrU2+MsBBf/D
 /3dg==
X-Gm-Message-State: AFqh2kpvJgtwx5P3pkROusrm1PE/AOHXR+FHLcNYstDyGYis2oslODA8
 X0Ar46rxWlKoW1FVuh4txuZY3yO6sxrwqWPz
X-Google-Smtp-Source: AMrXdXufs/3LEh/m82VUZoNKTP/xPSM5rffpE6NJvQ7BhBsL8uYs9/tzXNyojTFIb/esownQsBa7CQ==
X-Received: by 2002:a05:6a00:d55:b0:589:69ec:c6bc with SMTP id
 n21-20020a056a000d5500b0058969ecc6bcmr4127615pfv.21.1673997071535; 
 Tue, 17 Jan 2023 15:11:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/22] tcg: Add gen_tb to TCGContext
Date: Tue, 17 Jan 2023 13:10:39 -1000
Message-Id: <20230117231051.354444-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index a4fdce5b72..9e925c10f3 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -350,7 +350,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
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
index ff674c5122..4ac7086afe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -311,7 +311,7 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
      * We will check for overflow at the end of the opcode loop in
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
-    s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
 static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
@@ -321,7 +321,7 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
     tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
-    s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_target_arg[which] = tcg_current_code_size(s);
 }
 
 static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
@@ -330,7 +330,7 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
      * Return the read-execute version of the pointer, for the benefit
      * of any pc-relative addressing mode.
      */
-    return (uintptr_t)tcg_splitwx_to_rx(&s->tb_jmp_target_addr[which]);
+    return (uintptr_t)tcg_splitwx_to_rx(s->gen_tb->jmp_target_arg + which);
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
@@ -4668,14 +4668,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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


