Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FAC6A3A84
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW8U-0004wR-GL; Mon, 27 Feb 2023 00:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6W-0006Wu-Iv
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:16 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6T-0000f9-H8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:16 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5061695pjz.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
 b=nXGrSXZdtgdkXbfg5IY8ejfww8Opdy9Sxtp6hEbDbgHvoKEbl6L3mGK8Fkue4MgGKE
 in/NDYC4khaMTRYAAtnIH1czqFRKOv8s7QkV5veqlUvpGgwJSfdFE+F8KN5lVfMfB3RL
 biIrSPvl/E6mC+hgWKi2l/GrUFxXFKkgwb8fOUlj8x3s+yRrrBfD6NFh9fVSwa+QV8cI
 67pfMRPFnAOjDDVHtWPy5NsBvS138r5Cy17Ar+WO2wpy7gtG1j/ZC9k242QgtoGWYtAD
 NqnRTKupPle0aIOUDZgdiAcOs4glMABVVs9Z1gox98/ZUx3NhfAnEK6pNFceKzlcSqdG
 ab2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN2ZbLLJMcqwLwLE2rtqtIVte+chcJDZw5IRv13Gn6s=;
 b=oaIyp7BOxrkpWRkEe9INsaEBESETMJZcSuibedlBRPq9oWJUgVt83GRWnitK+I7T4/
 VEvre01RCvettD5nhXHNtu6nUfMZP2bwdra4XjiCm2Hf3zAkKZ8QwLUcBNMikTQZzplx
 ny2qdN6eOahWFPC3b2Wi0yFVQlZ0yB4QYmmRqG/uSupweXf06JnBRwMAOtAA1bYxtma5
 z94bX6RBcYl7OWuxGopZ1QykZIDDZ88gem3kdYPiH/wrFHo97ic/n3mIpyXmTiPFQjlJ
 j6QAgdo4ni9UwB/9rg2uZJgvzgqJw7iG64TwU4rJ6ZangsE3sawndvBMZFYJj6ksMKZm
 S1uA==
X-Gm-Message-State: AO0yUKWVGfHNuxtMpEbWpn9TfthiZUukTbirACRM+cT8z7tSvHniSnau
 1zXQB5fZ4VUu+NMjiReFcSZOHgSlfEscpTuHuL0=
X-Google-Smtp-Source: AK7set9caEI2QJ9ZB1+AyT4slTZJzGuRFGLcS7mYdV8qT7qMt6tnMEPfdFJKbhfKFj6+ZMEE6jM47A==
X-Received: by 2002:a17:90b:1b4e:b0:22c:5360:684e with SMTP id
 nv14-20020a17090b1b4e00b0022c5360684emr26256014pjb.29.1677475872618; 
 Sun, 26 Feb 2023 21:31:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 65/76] target/sparc: Drop get_temp_tl
Date: Sun, 26 Feb 2023 19:24:54 -1000
Message-Id: <20230227052505.352889-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 53 ++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 3b0044aa66..2b4af692f6 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -85,9 +85,7 @@ typedef struct DisasContext {
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
     TCGv_i32 t32[3];
-    TCGv ttl[5];
     int n_t32;
-    int n_ttl;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -139,14 +137,6 @@ static inline TCGv_i32 get_temp_i32(DisasContext *dc)
     return t;
 }
 
-static inline TCGv get_temp_tl(DisasContext *dc)
-{
-    TCGv t;
-    assert(dc->n_ttl < ARRAY_SIZE(dc->ttl));
-    dc->ttl[dc->n_ttl++] = t = tcg_temp_new();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -301,7 +291,7 @@ static inline TCGv gen_load_gpr(DisasContext *dc, int reg)
         assert(reg < 32);
         return cpu_regs[reg];
     } else {
-        TCGv t = get_temp_tl(dc);
+        TCGv t = tcg_temp_new();
         tcg_gen_movi_tl(t, 0);
         return t;
     }
@@ -321,7 +311,7 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
         assert(reg < 32);
         return cpu_regs[reg];
     } else {
-        return get_temp_tl(dc);
+        return tcg_temp_new();
     }
 }
 
@@ -2897,7 +2887,7 @@ static TCGv get_src2(DisasContext *dc, unsigned int insn)
 {
     if (IS_IMM) { /* immediate */
         target_long simm = GET_FIELDs(insn, 19, 31);
-        TCGv t = get_temp_tl(dc);
+        TCGv t = tcg_temp_new();
         tcg_gen_movi_tl(t, simm);
         return t;
     } else {      /* register */
@@ -3253,7 +3243,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     case 2:                     /* FPU & Logical Operations */
         {
             unsigned int xop = GET_FIELD(insn, 7, 12);
-            TCGv cpu_dst = get_temp_tl(dc);
+            TCGv cpu_dst = tcg_temp_new();
             TCGv cpu_tmp0;
 
             if (xop == 0x3a) {  /* generate trap */
@@ -3513,7 +3503,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 if (!supervisor(dc)) {
                     goto priv_insn;
                 }
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
 #ifdef TARGET_SPARC64
                 rs1 = GET_FIELD(insn, 13, 17);
                 switch (rs1) {
@@ -4031,7 +4021,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                     } else {
@@ -4053,7 +4043,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                         tcg_gen_shr_i64(cpu_dst, cpu_src1, cpu_tmp0);
@@ -4077,7 +4067,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 } else {                /* register */
                     rs2 = GET_FIELD(insn, 27, 31);
                     cpu_src2 = gen_load_gpr(dc, rs2);
-                    cpu_tmp0 = get_temp_tl(dc);
+                    cpu_tmp0 = tcg_temp_new();
                     if (insn & (1 << 12)) {
                         tcg_gen_andi_i64(cpu_tmp0, cpu_src2, 0x3f);
                         tcg_gen_sar_i64(cpu_dst, cpu_src1, cpu_tmp0);
@@ -4263,7 +4253,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_shli_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_shl_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4274,7 +4264,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_shri_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_shr_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4285,7 +4275,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             simm = GET_FIELDs(insn, 20, 31);
                             tcg_gen_sari_tl(cpu_dst, cpu_src1, simm & 0x1f);
                         } else { /* register */
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_andi_tl(cpu_tmp0, cpu_src2, 0x1f);
                             tcg_gen_sar_tl(cpu_dst, cpu_src1, cpu_tmp0);
                         }
@@ -4294,7 +4284,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #endif
                     case 0x30:
                         {
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             switch(rd) {
                             case 0: /* wry */
                                 tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
@@ -4479,7 +4469,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                                 goto illegal_insn;
                             }
 #else
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
                             gen_helper_wrpsr(cpu_env, cpu_tmp0);
                             tcg_gen_movi_i32(cpu_cc_op, CC_OP_FLAGS);
@@ -4495,7 +4485,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         {
                             if (!supervisor(dc))
                                 goto priv_insn;
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
 #ifdef TARGET_SPARC64
                             switch (rd) {
@@ -4653,7 +4643,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                             CHECK_IU_FEATURE(dc, HYPV);
                             if (!hypervisor(dc))
                                 goto priv_insn;
-                            cpu_tmp0 = get_temp_tl(dc);
+                            cpu_tmp0 = tcg_temp_new();
                             tcg_gen_xor_tl(cpu_tmp0, cpu_src1, cpu_src2);
                             switch (rd) {
                             case 0: // hpstate
@@ -5227,7 +5217,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
             } else if (xop == 0x39) { /* V9 return */
                 save_state(dc);
                 cpu_src1 = get_src1(dc, insn);
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
                 if (IS_IMM) {   /* immediate */
                     simm = GET_FIELDs(insn, 19, 31);
                     tcg_gen_addi_tl(cpu_tmp0, cpu_src1, simm);
@@ -5249,7 +5239,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #endif
             } else {
                 cpu_src1 = get_src1(dc, insn);
-                cpu_tmp0 = get_temp_tl(dc);
+                cpu_tmp0 = tcg_temp_new();
                 if (IS_IMM) {   /* immediate */
                     simm = GET_FIELDs(insn, 19, 31);
                     tcg_gen_addi_tl(cpu_tmp0, cpu_src1, simm);
@@ -5344,7 +5334,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
             unsigned int xop = GET_FIELD(insn, 7, 12);
             /* ??? gen_address_mask prevents us from using a source
                register directly.  Always generate a temporary.  */
-            TCGv cpu_addr = get_temp_tl(dc);
+            TCGv cpu_addr = tcg_temp_new();
 
             tcg_gen_mov_tl(cpu_addr, get_src1(dc, insn));
             if (xop == 0x3c || xop == 0x3e) {
@@ -5780,13 +5770,6 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         }
         dc->n_t32 = 0;
     }
-    if (dc->n_ttl != 0) {
-        int i;
-        for (i = dc->n_ttl - 1; i >= 0; --i) {
-            tcg_temp_free(dc->ttl[i]);
-        }
-        dc->n_ttl = 0;
-    }
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


