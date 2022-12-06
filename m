Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A35643C35
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:23:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POp-0003SH-PB; Mon, 05 Dec 2022 23:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POn-0003RX-7j
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:41 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POl-00071n-3J
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:41 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1447c7aa004so7929005fac.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwJxbSoVGL5mD629YidrzGLXu4Bi0Swxh1yfXQO3WsY=;
 b=m0uMhHU7rOC09ZSPqCEH3Me8k5etZjogDlRoCSzHlaG3B9okHIxt4weSBTSNbd71Gq
 TPKqpsvxH9+UzpOdOn/qZ5NA0IvikFyFFpvlDi1pj+MqxE9eymumBxMNVBfyIctlV4VD
 2SzKzTttWoTxKLVsl97NIlkHTfxmoXNHvhMubCpDsOU9NP6WO2sS4hZHTph3hefo2Hg/
 SVqOzLqwC7ldAgwjcw8u0kBegcaBnu+xru8b/BxcpEYmGc+PcXxflDQS4OH9WLN9QdK6
 QgyxaDR3RGwaoApNjvHH0yCp1eNC8NIOrisXZCwtDeoCWQMlilzgyGkz/77FnttazGmb
 FFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwJxbSoVGL5mD629YidrzGLXu4Bi0Swxh1yfXQO3WsY=;
 b=JG9fiC6VaEF0iTU79I2o/ki65vD1aZQSCTvZy6nnyRtH9Ej2FBOloRnwfcCLQCMck3
 4Ogw0JRorJW8QX+7QBMAQtoswLsEEzCZdcAy96Hqv5FyXXI0VlMNWZjCydB3ieySQVY9
 gyixEdZ1XGs2gA7vF+qZ/fBBeM2H1LjDobBZr4ohpdk1BMSZ02qksww15/iybY44go5O
 qSSX4Yg3TommWKwwoR7t/cuVJxIsk4MQA9dbbVmmdhEVIOlbAmhPOMqvBtuIyuPXCId0
 Bc85jFWnpQgkgeICxfhuU3W7Be2PQ51DqMYmVHQ5mnLKqRQWVwepzaxSfyNvvo3jlOVz
 3AOg==
X-Gm-Message-State: ANoB5pkg+oZyScZoTSk724j02r4vINpHwbC9DCAAcaEL3OyPiqCF5Fo9
 gu/qJ2XtFMViOZ1g6n3TnVttkmbdCQPsf3ei1h4=
X-Google-Smtp-Source: AA0mqf6wYdfF+QtePU1MZah6+EStznjZ5UiE/kY/LEogTNYG4aNzp8M3N6nxFMivaccR7jjCFKyXJw==
X-Received: by 2002:a05:6870:d3ca:b0:144:922e:337d with SMTP id
 l10-20020a056870d3ca00b00144922e337dmr4632985oag.25.1670300257464; 
 Mon, 05 Dec 2022 20:17:37 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 15/22] tcg: Remove TCG_TARGET_HAS_direct_jump
Date: Mon,  5 Dec 2022 22:17:08 -0600
Message-Id: <20221206041715.314209-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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

We now have the option to generate direct or indirect
goto_tb depending on the dynamic displacement, thus
the define is no longer necessary or completely accurate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  1 -
 tcg/arm/tcg-target.h         |  1 -
 tcg/i386/tcg-target.h        |  1 -
 tcg/loongarch64/tcg-target.h |  1 -
 tcg/mips/tcg-target.h        |  1 -
 tcg/ppc/tcg-target.h         |  1 -
 tcg/riscv/tcg-target.h       |  1 -
 tcg/s390x/tcg-target.h       |  1 -
 tcg/sparc64/tcg-target.h     |  1 -
 tcg/tci/tcg-target.h         |  1 -
 accel/tcg/cpu-exec.c         | 13 ++++++-------
 tcg/tcg.c                    |  1 -
 tcg/arm/tcg-target.c.inc     |  1 -
 tcg/mips/tcg-target.c.inc    |  1 -
 tcg/riscv/tcg-target.c.inc   |  1 -
 tcg/s390x/tcg-target.c.inc   |  5 ++++-
 tcg/tci/tcg-target.c.inc     |  1 -
 17 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index dc16fd0da6..c8202e4bc5 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -123,7 +123,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
-#define TCG_TARGET_HAS_direct_jump      1
 
 #define TCG_TARGET_HAS_v64              1
 #define TCG_TARGET_HAS_v128             1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 13ad721438..879eecd93d 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -121,7 +121,6 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
 #define TCG_TARGET_HAS_rem_i32          0
-#define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_v64              use_neon_instructions
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 4b4ceacfa5..b1ffd47493 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -139,7 +139,6 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_direct_jump      1
 
 #if TCG_TARGET_REG_BITS == 64
 /* Keep target addresses zero-extended in a register.  */
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 87f40d935c..086c90bda3 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -127,7 +127,6 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          1
 #define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_brcond2          0
 #define TCG_TARGET_HAS_setcond2         0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 31236d8e81..cc0a6f301a 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -132,7 +132,6 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
 #define TCG_TARGET_HAS_bswap32_i32      1
-#define TCG_TARGET_HAS_direct_jump      0
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_add2_i32         0
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 5ffb41fb57..f253184915 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -108,7 +108,6 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        1
 #define TCG_TARGET_HAS_mulsh_i32        1
-#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index ff2f861e82..56f7bc3346 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -116,7 +116,6 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          0
 #define TCG_TARGET_HAS_ctz_i32          0
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 274cb3cc5d..2c7c14055b 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -103,7 +103,6 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index ca7e4da6d3..21d3c59bd7 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -110,7 +110,6 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 4b4b26a89f..c9d2fe5b94 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -82,7 +82,6 @@
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #if TCG_TARGET_REG_BITS == 64
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ac5b581e52..0892c6534a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -572,14 +572,13 @@ void cpu_exec_step_atomic(CPUState *cpu)
 
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
+    const TranslationBlock *c_tb = tcg_splitwx_to_rx(tb);
+    uintptr_t offset = tb->jmp_insn_offset[n];
+    uintptr_t jmp_rx = (uintptr_t)tb->tc.ptr + offset;
+    uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
+
     tb->jmp_target_addr[n] = addr;
-    if (TCG_TARGET_HAS_direct_jump) {
-        const TranslationBlock *c_tb = tcg_splitwx_to_rx(tb);
-        uintptr_t offset = tb->jmp_insn_offset[n];
-        uintptr_t jmp_rx = (uintptr_t)tb->tc.ptr + offset;
-        uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
-        tb_target_set_jmp_target(c_tb, n, jmp_rx, jmp_rw);
-    }
+    tb_target_set_jmp_target(c_tb, n, jmp_rx, jmp_rw);
 }
 
 static inline void tb_add_jump(TranslationBlock *tb, int n,
diff --git a/tcg/tcg.c b/tcg/tcg.c
index c103dd0037..b09500ffb1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -327,7 +327,6 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * We will check for overflow at the end of the opcode loop in
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
-    tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
     s->gen_tb->jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f5103dcc6d..a44d1d969f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1939,7 +1939,6 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     intptr_t ptr, dif, dil;
     TCGReg base = TCG_REG_PC;
 
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     ptr = get_jmp_target_addr(s, which);
     dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
     dil = sextract32(dif, 0, 12);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index dfb31a17bb..d52b6a902b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1968,7 +1968,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
     /* indirect jump method */
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
                get_jmp_target_addr(s, which));
     tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 06308c5243..37baae9cda 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1277,7 +1277,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     /* indirect jump method */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
                get_jmp_target_addr(s, which));
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 82435ecadb..cf96ccb053 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2083,7 +2083,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    if (TCG_TARGET_HAS_direct_jump) {
+    if (HAVE_FACILITY(GEN_INST_EXT)) {
         /*
          * Branch displacement must be aligned for atomic patching;
          * see if we need to add extra nop before branch
@@ -2119,6 +2119,9 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
                               uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
+    if (!HAVE_FACILITY(GEN_INST_EXT)) {
+        return;
+    }
     /* patch the branch destination */
     uintptr_t addr = tb->jmp_target_addr[n];
     intptr_t disp = addr - (jmp_rx - 2);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 31094067b7..434fcc74dc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -600,7 +600,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     /* indirect jump method. */
     tcg_out_op_p(s, INDEX_op_goto_tb, (void *)get_jmp_target_addr(s, which));
     set_jmp_reset_offset(s, which);
-- 
2.34.1


