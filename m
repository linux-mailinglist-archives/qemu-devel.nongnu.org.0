Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5C670CDE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv70-0003ds-HU; Tue, 17 Jan 2023 18:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6w-0003Zw-NX
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:22 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6u-0001Ku-D4
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:22 -0500
Received: by mail-pf1-x436.google.com with SMTP id 127so7531125pfe.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AcRp7PMVbcTFBfIbiyb65GkPmFtO+lhwY+iT1mmLpo4=;
 b=PrHyeLwsKjc+rEtEA3mKpPTZZHTzID58BlqgOXTKiAkDI5LBqhBUydddvltqw9ToiB
 8wE7KlhFIOKwqGHCqb1B88jAX7ieqg+5Ur1mRcRMa7D6fjfyH2GsZnBURrTa3SoQMz9I
 VlqB50qd5RPhQ89R1WGu0oF4qvcdvLVw3kyZcMj7w6XaDhVyJh+X/OWUWqQ6JXZdyxiU
 d5Qes1e6j8lZflnqGTjP9qO9QWmz/lbKTsKQI+HL8/ks4/dyeuBekki6eggimAkI6Z3S
 BTU3bbBgxmRf23Dc8FqGht+3Btcv8U13a7kP71qgDS/smaGKEtU6sjaS4yFxxWcknKip
 ykrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AcRp7PMVbcTFBfIbiyb65GkPmFtO+lhwY+iT1mmLpo4=;
 b=efiAQsfd1ECU6KV6jfHELOpvZWSgS8HZ3z8cmvAcaxq0HRkh4s2CtGJoXz1m6lLLeG
 ab0aTyt3hTkGf+pCUHEH/Ym/7bSS7KwbnjtAwZxkDLUrqiFJdf/c9Uf4KzNcIjj2GKTa
 yj1VuZ6omDBIDTShbmfbkK/TAtFXPJ0DZoiVqkLbyTdCV/xVFadwt5f53nbRfXoaOrey
 On2blja10DAqAt+kV76042Cki5WzpDG6VIFGZ95iLlolJABRD4t/ZfySJ49Sp5sdS6nb
 a62pwUe9LJhDHfzbnMKrz10yTGTbfV5Uv8lVxyNVNk3MpObhfzIqwCNOTqVOQrIBoSmF
 tygQ==
X-Gm-Message-State: AFqh2kreEuM/Yl3vyQy5T/aAudtaU+CwpwnTrph1abPgqU8gHAtsYLgF
 IcphUzbEYDZt5mtMR7MjNeUiMpOlF0BD3YMj
X-Google-Smtp-Source: AMrXdXsAq7ZGKG3DYVHBiBUbcOxFtsIaVcR6ofQzDrbHHemZqPevAm+Lkwin0umBt4v6GJJyH7pOMw==
X-Received: by 2002:a62:de44:0:b0:58d:a565:e2ea with SMTP id
 h65-20020a62de44000000b0058da565e2eamr5746390pfg.14.1673997079325; 
 Tue, 17 Jan 2023 15:11:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 15/22] tcg: Remove TCG_TARGET_HAS_direct_jump
Date: Tue, 17 Jan 2023 13:10:44 -1000
Message-Id: <20230117231051.354444-16-richard.henderson@linaro.org>
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

We now have the option to generate direct or indirect
goto_tb depending on the dynamic displacement, thus
the define is no longer necessary or completely accurate.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
 accel/tcg/cpu-exec.c         | 23 +++++++++++------------
 tcg/tcg.c                    |  1 -
 tcg/arm/tcg-target.c.inc     |  1 -
 tcg/mips/tcg-target.c.inc    |  1 -
 tcg/riscv/tcg-target.c.inc   |  1 -
 tcg/s390x/tcg-target.c.inc   |  3 +++
 tcg/tci/tcg-target.c.inc     |  1 -
 17 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index a585d035d9..6067446b03 100644
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
index d347a5dc53..91b8954804 100644
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
index d3705da2ed..5797a55ea0 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -141,7 +141,6 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_direct_jump      1
 
 #if TCG_TARGET_REG_BITS == 64
 /* Keep target addresses zero-extended in a register.  */
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 5782c6887c..1c3e48d662 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -128,7 +128,6 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          1
 #define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_brcond2          0
 #define TCG_TARGET_HAS_setcond2         0
 #define TCG_TARGET_HAS_qemu_st8_i32     0
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 82b40100cf..7bc8e15293 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -134,7 +134,6 @@ extern bool use_mips32r2_instructions;
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
index c9af6d592f..1337bc1f1e 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -121,7 +121,6 @@ typedef enum {
 #define TCG_TARGET_HAS_clz_i32          0
 #define TCG_TARGET_HAS_ctz_i32          0
 #define TCG_TARGET_HAS_ctpop_i32        0
-#define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 9f5d1cf1c7..e597e47e60 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -105,7 +105,6 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_direct_jump    1
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index b78a545581..1d6a5c8b07 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -111,7 +111,6 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_direct_jump      1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 359d62c2f3..1414ab4d5b 100644
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
index 37c5f91074..04cd1f3092 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -572,19 +572,18 @@ void cpu_exec_step_atomic(CPUState *cpu)
 
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
+    /*
+     * Get the rx view of the structure, from which we find the
+     * executable code address, and tb_target_set_jmp_target can
+     * produce a pc-relative displacement to jmp_target_addr[n].
+     */
+    const TranslationBlock *c_tb = tcg_splitwx_to_rx(tb);
+    uintptr_t offset = tb->jmp_insn_offset[n];
+    uintptr_t jmp_rx = (uintptr_t)tb->tc.ptr + offset;
+    uintptr_t jmp_rw = jmp_rx - tcg_splitwx_diff;
+
     tb->jmp_target_addr[n] = addr;
-    if (TCG_TARGET_HAS_direct_jump) {
-        /*
-         * Get the rx view of the structure, from which we find the
-         * executable code address, and tb_target_set_jmp_target can
-         * produce a pc-relative displacement to jmp_target_addr[n].
-         */
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
index af2af99583..d502327be2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -320,7 +320,6 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
      * We will check for overflow at the end of the opcode loop in
      * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
      */
-    tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
     s->gen_tb->jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b21dd561fa..e1e1c2620d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1945,7 +1945,6 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     intptr_t ptr, dif, dil;
     TCGReg base = TCG_REG_PC;
 
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     ptr = get_jmp_target_addr(s, which);
     dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
     dil = sextract32(dif, 0, 12);
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 0b5e100cb1..6e000d8e69 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1969,7 +1969,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
     /* indirect jump method */
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
                get_jmp_target_addr(s, which));
     tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index e6a3915859..136fe54d4b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1302,7 +1302,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     /* indirect jump method */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
                get_jmp_target_addr(s, which));
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 2d049a4cc7..218318feb2 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1973,6 +1973,9 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
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
index 54779d86d9..bc452007c6 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -597,7 +597,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
     /* indirect jump method. */
     tcg_out_op_p(s, INDEX_op_goto_tb, (void *)get_jmp_target_addr(s, which));
     set_jmp_reset_offset(s, which);
-- 
2.34.1


