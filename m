Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172626AB3EC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:49:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyC-0003ZY-95; Sun, 05 Mar 2023 19:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxH-00013h-5M
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:55 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxA-0007HV-Dv
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:50 -0500
Received: by mail-pg1-x535.google.com with SMTP id s18so4566293pgq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=un406pi+JP5RblyTpMUco5L+cuycv4FFhGUkz0hgWME=;
 b=LiBcQXRy66wYOhHhODfZVM+Q7wpTngGB6Tt1BC6wF0xRrU1rZ/P3oak+wjqc5WaP/J
 0QsZQncJSa+picMUjuLK7BDM5HF44yh69TnizD1ktetPYkFfI5DuO+ZMJfUYNhCH4ZxZ
 fRXfImcysafsF6rtLp96dJQbXQbMlev0YR8TM2p30NO8D5scBxPrZL1t7Dm+c6l4TTvm
 Gh3pMTWKqHJD4ro4Qz4q9xaALGOFKss84Qk4+j0HBuuCi3SPCcnKJxLF9t3shKPpy1Z3
 FSvBxtUDIL9ji4Sn7V5JEYHcYdZFSVELHyH59wQ4N1ssZ3RPehBjqiDrxeOIgNTo7XQd
 01lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=un406pi+JP5RblyTpMUco5L+cuycv4FFhGUkz0hgWME=;
 b=adDKkNse1oNAvD2h/a7rNBETKNjhAMt8psb1QiOvniQ4j2wTGQrR7djxCS213XZ/l2
 LgOxXKj+BxT/cLnUEpy4HqPCdsr2FNE+6JKmNRqZjvJnw1EIEa6ybF1giTcX3ItPIct1
 5+W8is8wJ6bMdOjxRHqtM3CiBPs/yWZBKdfKX4niM/sdBXFHOkFklb5xUrwR8ThykjdG
 PEvcsnULnvIQqVaMgVNFbewKM81TPawOrXrT6IGQOJWKSx/LIi8qJXO+5I4t3avMsrGi
 BFZGmLy3vjhxPKPzmilYCG44gydr+N5jLirMfpqgolU00Se6SgJfQgZojG4p0871q7jY
 b6iQ==
X-Gm-Message-State: AO0yUKWNQaDmCSiECKTBoGzZRrhgxWIxdDBpsZ0v10zVlEZPV0CVUM7j
 JPTfejPaZqs4xO2o4DmUYSyPzIL1tX63Dy6EjFZNyg==
X-Google-Smtp-Source: AK7set8bi5IYiOfudXffHkjqmLWjOpbxqBgJq7MHmPjP1W7cV33Q4L3c6vmAIqOvi8UZoyYBCTjO0w==
X-Received: by 2002:aa7:9508:0:b0:5e0:3038:2300 with SMTP id
 b8-20020aa79508000000b005e030382300mr9245991pfp.20.1678063425444; 
 Sun, 05 Mar 2023 16:43:45 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 55/84] target/sparc: Drop get_temp_tl
Date: Sun,  5 Mar 2023 16:39:25 -0800
Message-Id: <20230306003954.1866998-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


