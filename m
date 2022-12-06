Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B99E643C29
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POj-0003Ov-Ei; Mon, 05 Dec 2022 23:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POg-0003NQ-JS
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:34 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POe-0006vs-Rz
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:34 -0500
Received: by mail-oi1-x229.google.com with SMTP id e205so15552993oif.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0wFR031lCo2wcrWO+fbqeHXYKNVaKCwEXleN4UiegU=;
 b=AuvA95lARaqKua7iS7YTh//xTIKeMJYzNEuQZ0Nw4tIByU7IA0TzhGmUTMTpK8iQB7
 0EntsABga0/F/n+22r0+wkkhCm3sepwhjBl7XcCQ/bE8T/J7yfWGOKAtA5EN9nXCBfNT
 GDyb6+PRiw4iBgM0nnweUnb3jCSERZ0BYt8GucrrirRtwgT2XPvJ08XhPLqx07j26H+c
 xE+0ikjAA1dZdN+/1ENQCL64Q3xBCWa+Thr7ndzuxdUVUShB9M+byzd8GNz3LoBn6mTP
 mWeTPcZgjMq0Os8I+kdUWVkNtzx3OeykaVEW8laYrPqZRbBVdBNsVr6GmcURWaFMHRm2
 N7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0wFR031lCo2wcrWO+fbqeHXYKNVaKCwEXleN4UiegU=;
 b=NL7yGusofYVTu4J+/l7jEWB2t6nHeYv1pRkduOtYrtb4eblFYJK6o84zi4bxpGQqw1
 9blpwtw5PPMskxaw2BOuudWEQNugslphvQYdGH4kuUvADeBJQM2DshHP7HliwyopsMRf
 YVEoB9l9JPZKmXPKIMJVsYmyb8lkljH0QmnOv1VV8ieDmIOsgpXpoWcXY5d0V7SJ8JPL
 5KYV9FFIORqukoS51s+z55il5ts3voPIaPhX7wSNdaLsVBCIF+kwvHTD7QdZVnpW0ipp
 zkfyg5wYM7lIUZMQDPluWURjpT5svoIbIEx8cizu0z0Wr7SfDWmwn9XkP29LqU/jqQWj
 maQw==
X-Gm-Message-State: ANoB5plB13MPHyWob7n5+sI+AbzbGp875cBKASSrsuGMPIlxE8WTTNvm
 dZNecxeYyetA//1UGGKTdIZEEyyZYpS4hmKJsFU=
X-Google-Smtp-Source: AA0mqf7nr42AmiSDZIdaLQ5MsbkhOwCTDiTQzI0l1ThYyXceTnLvCiDEk4Zc2uk53GOs1bqMgxKpEw==
X-Received: by 2002:aca:3c82:0:b0:35c:29f8:e83a with SMTP id
 j124-20020aca3c82000000b0035c29f8e83amr4215111oia.25.1670300251648; 
 Mon, 05 Dec 2022 20:17:31 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 10/22] tcg: Add gen_tb to TCGContext
Date: Mon,  5 Dec 2022 22:17:03 -0600
Message-Id: <20221206041715.314209-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
index d84bae6e3f..993aafa1a2 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -544,20 +544,15 @@ struct TCGContext {
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
index 9cf88da6cb..94238a1926 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -827,7 +827,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
     tb_set_page_addr0(tb, phys_pc);
     tb_set_page_addr1(tb, -1);
-    tcg_ctx->tb_cflags = cflags;
+    tcg_ctx->gen_tb = tb;
  tb_overflow:
 
 #ifdef CONFIG_PROFILER
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 019fab00cc..585f33ffaf 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -94,7 +94,7 @@ void tcg_gen_op6(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
 
 void tcg_gen_mb(TCGBar mb_type)
 {
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {
         tcg_gen_op1(INDEX_op_mb, mb_type);
     }
 }
@@ -2763,7 +2763,7 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
 void tcg_gen_goto_tb(unsigned idx)
 {
     /* We tested CF_NO_GOTO_TB in translator_use_goto_tb. */
-    tcg_debug_assert(!(tcg_ctx->tb_cflags & CF_NO_GOTO_TB));
+    tcg_debug_assert(!(tcg_ctx->gen_tb->cflags & CF_NO_GOTO_TB));
     /* We only support two chained exits.  */
     tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
 #ifdef CONFIG_DEBUG_TCG
@@ -2779,7 +2779,7 @@ void tcg_gen_lookup_and_goto_ptr(void)
 {
     TCGv_ptr ptr;
 
-    if (tcg_ctx->tb_cflags & CF_NO_GOTO_PTR) {
+    if (tcg_ctx->gen_tb->cflags & CF_NO_GOTO_PTR) {
         tcg_gen_exit_tb(NULL, 0);
         return;
     }
@@ -3146,7 +3146,7 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
 {
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
-    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
         TCGv_i32 t1 = tcg_temp_new_i32();
         TCGv_i32 t2 = tcg_temp_new_i32();
 
@@ -3184,7 +3184,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
 {
     memop = tcg_canonicalize_memop(memop, 1, 0);
 
-    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
+    if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
         TCGv_i64 t1 = tcg_temp_new_i64();
         TCGv_i64 t2 = tcg_temp_new_i64();
 
@@ -3345,7 +3345,7 @@ static void * const table_##NAME[(MO_SIZE | MO_BSWAP) + 1] = {          \
 void tcg_gen_atomic_##NAME##_i32                                        \
     (TCGv_i32 ret, TCGv addr, TCGv_i32 val, TCGArg idx, MemOp memop)    \
 {                                                                       \
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {                             \
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
         do_atomic_op_i32(ret, addr, val, idx, memop, table_##NAME);     \
     } else {                                                            \
         do_nonatomic_op_i32(ret, addr, val, idx, memop, NEW,            \
@@ -3355,7 +3355,7 @@ void tcg_gen_atomic_##NAME##_i32                                        \
 void tcg_gen_atomic_##NAME##_i64                                        \
     (TCGv_i64 ret, TCGv addr, TCGv_i64 val, TCGArg idx, MemOp memop)    \
 {                                                                       \
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {                             \
+    if (tcg_ctx->gen_tb->cflags & CF_PARALLEL) {                        \
         do_atomic_op_i64(ret, addr, val, idx, memop, table_##NAME);     \
     } else {                                                            \
         do_nonatomic_op_i64(ret, addr, val, idx, memop, NEW,            \
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 37957208c7..c7ad46ff45 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -318,7 +318,7 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
      * We will check for overflow at the end of the opcode loop in
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
-    s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
 static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
@@ -328,7 +328,7 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
     tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
-    s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
+    s->gen_tb->jmp_target_arg[which] = tcg_current_code_size(s);
 }
 
 static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
@@ -337,7 +337,7 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
      * Return the read-execute version of the pointer, for the benefit
      * of any pc-relative addressing mode.
      */
-    return (uintptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + which);
+    return (uintptr_t)tcg_splitwx_to_rx(s->gen_tb->jmp_target_arg + which);
 }
 
 /* Signal overflow, starting over with fewer guest insns. */
@@ -4252,14 +4252,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
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


