Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2346B2E51
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:13:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa9-00040v-7s; Thu, 09 Mar 2023 15:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa5-0003pt-54
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:41 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa2-0001XT-QE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:40 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so6591481pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFOMfdBHwO8+3TIsMQhwfupBj8JhEcXrgA/9mXMht9E=;
 b=zuX6+93ogO3gvtqsC08IHNSI0QaaU7/F1U0lA3bMd7e3BZj86uMv6MOMqf0gyS9IMm
 mu4/Lt4uWXRNdutUTx2UYbdjfiItaVnNiTCipUMjGhsWata3y0EaubTwrVcbjX9YYsih
 EDaKOM3W+VqacTuXnRE5v8zmL1D2VJg0kksuiq8Kc312ZxmeiPP5aKFXVBVgu2FTkEIf
 YwFE5Z2nDeitvhMqx7IgijjK91BYe0PqpdMlxT0ZERG4iS+ycGtw2zre3LnKgef7bskw
 MmlYz2Lzi/S6+Au5Za4TC5B0fytYenTRw79iTqdukV49cZgjFWjDTYQ5mRjqXfLdOQuu
 XX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFOMfdBHwO8+3TIsMQhwfupBj8JhEcXrgA/9mXMht9E=;
 b=19a2kTIXhL4ITodwg/OPdloYhK8Ds2RAOj14qqytTphtuNdOJYJor4JaXjAAjC9QcV
 nEkh/0pzIqbaUl7IDJUQW+LSXf5aG63El//f3GUPtdevWqRkvFSvA3JxarsQS9FbJRFw
 uSNckW7h0Enyc3TTHwIuq9JgTZvaxrkiqUOKi628xdhR6mTjBrPuZaNxnvAiZkmTNvkw
 up8MdGlTanfwQQQM22FkGTnIhTiDVmWPfZexrYqhYSGTGgVdXaj/8xFTwbDjwibBZTp9
 ZIoWRYJw1E5w1jQ976ijZcxGUTkXqp3kBSfxXStG03EUX7v94I8xVSZZZanBlsKgEE0F
 k6gQ==
X-Gm-Message-State: AO0yUKXW5siGv3vLKP/5YHXLE8rEdL/voWXDYonw7rFvlCFnvoB6dByt
 3LiiPiYb9htweX40U0HME8bbyAXA2iP5NYZNzb0=
X-Google-Smtp-Source: AK7set/n/Dvnq+27Di4he043+n2w58+1WiSNJWwSgI/N5piRh68UQFzZkF8O6e5tgYteA3c/7jxWxA==
X-Received: by 2002:a17:902:7285:b0:19e:7bcf:b32 with SMTP id
 d5-20020a170902728500b0019e7bcf0b32mr2951219pll.24.1678392577617; 
 Thu, 09 Mar 2023 12:09:37 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 51/91] target/mips: Avoid tcg_const_* throughout
Date: Thu,  9 Mar 2023 12:05:10 -0800
Message-Id: <20230309200550.3878088-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c           |  4 +-
 target/mips/tcg/translate.c               | 56 +++++++++++------------
 target/mips/tcg/tx79_translate.c          |  4 +-
 target/mips/tcg/micromips_translate.c.inc |  4 +-
 target/mips/tcg/nanomips_translate.c.inc  | 16 ++++---
 5 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index 8703b0cef4..bdd20709c0 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -1072,7 +1072,7 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do half-word-wise max/min with one operand 0 */
         TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
+        TCGv_i32 t1 = tcg_constant_i32(0);
 
         /* the left half-word first */
         tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
@@ -1163,7 +1163,7 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do byte-wise max/min with one operand 0 */
         TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
+        TCGv_i32 t1 = tcg_constant_i32(0);
         int32_t i;
 
         /* the leftmost byte (byte 3) first */
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bbc2212660..1fb4ef7127 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2099,14 +2099,14 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         gen_store_gpr(t1, rt);
         break;
     case OPC_LDPC:
-        t1 = tcg_const_tl(pc_relative_pc(ctx));
+        t1 = tcg_constant_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
         gen_store_gpr(t0, rt);
         break;
 #endif
     case OPC_LWPC:
-        t1 = tcg_const_tl(pc_relative_pc(ctx));
+        t1 = tcg_constant_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESL);
         gen_store_gpr(t0, rt);
@@ -2733,7 +2733,7 @@ static void gen_cond_move(DisasContext *ctx, uint32_t opc,
 
     t0 = tcg_temp_new();
     gen_load_gpr(t0, rt);
-    t1 = tcg_const_tl(0);
+    t1 = tcg_constant_tl(0);
     t2 = tcg_temp_new();
     gen_load_gpr(t2, rs);
     switch (opc) {
@@ -3084,8 +3084,8 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         break;
     case R6_OPC_DIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3095,8 +3095,8 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         break;
     case R6_OPC_MODU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3175,16 +3175,16 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         break;
     case R6_OPC_DDIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
         }
         break;
     case R6_OPC_DMODU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
         }
@@ -3248,8 +3248,8 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
         break;
     case MMI_OPC_DIVU1:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3304,8 +3304,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_ext32u_tl(t0, t0);
             tcg_gen_ext32u_tl(t1, t1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
@@ -3355,8 +3355,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DDIVU:
         {
-            TCGv t2 = tcg_const_tl(0);
-            TCGv t3 = tcg_const_tl(1);
+            TCGv t2 = tcg_constant_tl(0);
+            TCGv t3 = tcg_constant_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_LO[acc], t0, t1);
             tcg_gen_remu_i64(cpu_HI[acc], t0, t1);
@@ -4916,7 +4916,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     case OPC_WSBH:
         {
             TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_const_tl(0x00FF00FF);
+            TCGv t2 = tcg_constant_tl(0x00FF00FF);
 
             tcg_gen_shri_tl(t1, t0, 8);
             tcg_gen_and_tl(t1, t1, t2);
@@ -4936,7 +4936,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     case OPC_DSBH:
         {
             TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_const_tl(0x00FF00FF00FF00FFULL);
+            TCGv t2 = tcg_constant_tl(0x00FF00FF00FF00FFULL);
 
             tcg_gen_shri_tl(t1, t0, 8);
             tcg_gen_and_tl(t1, t1, t2);
@@ -4948,7 +4948,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
     case OPC_DSHD:
         {
             TCGv t1 = tcg_temp_new();
-            TCGv t2 = tcg_const_tl(0x0000FFFF0000FFFFULL);
+            TCGv t2 = tcg_constant_tl(0x0000FFFF0000FFFFULL);
 
             tcg_gen_shri_tl(t1, t0, 16);
             tcg_gen_and_tl(t1, t1, t2);
@@ -8459,7 +8459,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
             case 5:
             case 6:
             case 7:
-                gen_helper_mftc0_configx(t0, cpu_env, tcg_const_tl(sel));
+                gen_helper_mftc0_configx(t0, cpu_env, tcg_constant_tl(sel));
                 break;
             default:
                 goto die;
@@ -9485,7 +9485,7 @@ static inline void gen_movcf_ps(DisasContext *ctx, int fs, int fd,
 static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
                       int fs)
 {
-    TCGv_i32 t1 = tcg_const_i32(0);
+    TCGv_i32 t1 = tcg_constant_i32(0);
     TCGv_i32 fp0 = tcg_temp_new_i32();
     TCGv_i32 fp1 = tcg_temp_new_i32();
     TCGv_i32 fp2 = tcg_temp_new_i32();
@@ -9518,7 +9518,7 @@ static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
 static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
                       int fs)
 {
-    TCGv_i64 t1 = tcg_const_i64(0);
+    TCGv_i64 t1 = tcg_constant_i64(0);
     TCGv_i64 fp0 = tcg_temp_new_i64();
     TCGv_i64 fp1 = tcg_temp_new_i64();
     TCGv_i64 fp2 = tcg_temp_new_i64();
@@ -11516,7 +11516,7 @@ void gen_addiupc(DisasContext *ctx, int rx, int imm,
 static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
                                 int16_t offset)
 {
-    TCGv_i32 t0 = tcg_const_i32(op);
+    TCGv_i32 t0 = tcg_constant_i32(op);
     TCGv t1 = tcg_temp_new();
     gen_base_offset_addr(ctx, t1, base, offset);
     gen_helper_cache(cpu_env, t1, t0);
@@ -11860,7 +11860,7 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         case OPC_PRECR_SRA_PH_W:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 sa_t = tcg_const_i32(v2);
+                TCGv_i32 sa_t = tcg_constant_i32(v2);
                 gen_helper_precr_sra_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                           cpu_gpr[ret]);
                 break;
@@ -11868,7 +11868,7 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         case OPC_PRECR_SRA_R_PH_W:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 sa_t = tcg_const_i32(v2);
+                TCGv_i32 sa_t = tcg_constant_i32(v2);
                 gen_helper_precr_sra_r_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                             cpu_gpr[ret]);
                 break;
@@ -12057,14 +12057,14 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         case OPC_PRECR_SRA_QH_PW:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 ret_t = tcg_const_i32(ret);
+                TCGv_i32 ret_t = tcg_constant_i32(ret);
                 gen_helper_precr_sra_qh_pw(v2_t, v1_t, v2_t, ret_t);
                 break;
             }
         case OPC_PRECR_SRA_R_QH_PW:
             check_dsp_r2(ctx);
             {
-                TCGv_i32 sa_v = tcg_const_i32(ret);
+                TCGv_i32 sa_v = tcg_constant_i32(ret);
                 gen_helper_precr_sra_r_qh_pw(v2_t, v1_t, v2_t, sa_v);
                 break;
             }
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index d46bc73972..3a45a1bfea 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -243,8 +243,8 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_r *a,
         return true;
     }
 
-    c0 = tcg_const_tl(0);
-    c1 = tcg_const_tl(0xffffffff);
+    c0 = tcg_constant_tl(0);
+    c1 = tcg_constant_tl(0xffffffff);
     ax = tcg_temp_new_i64();
     bx = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 23f80d4315..e8b193aeda 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -704,8 +704,8 @@ static void gen_ldst_multiple(DisasContext *ctx, uint32_t opc, int reglist,
 
     gen_base_offset_addr(ctx, t0, base, offset);
 
-    t1 = tcg_const_tl(reglist);
-    t2 = tcg_const_i32(ctx->mem_idx);
+    t1 = tcg_constant_tl(reglist);
+    t2 = tcg_constant_i32(ctx->mem_idx);
 
     save_cpu_state(ctx, 1);
     switch (opc) {
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index b3df7fec40..9398e28000 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3359,7 +3359,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         case 0:
             /* PRECR_SRA_PH_W */
             {
-                TCGv_i32 sa_t = tcg_const_i32(rd);
+                TCGv_i32 sa_t = tcg_constant_i32(rd);
                 gen_helper_precr_sra_ph_w(v1_t, sa_t, v1_t,
                                           cpu_gpr[rt]);
                 gen_store_gpr(v1_t, rt);
@@ -3368,7 +3368,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         case 1:
             /* PRECR_SRA_R_PH_W */
             {
-                TCGv_i32 sa_t = tcg_const_i32(rd);
+                TCGv_i32 sa_t = tcg_constant_i32(rd);
                 gen_helper_precr_sra_r_ph_w(v1_t, sa_t, v1_t,
                                             cpu_gpr[rt]);
                 gen_store_gpr(v1_t, rt);
@@ -3864,10 +3864,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             check_nms(ctx);
             if (rt != 0) {
                 TCGv t0 = tcg_temp_new();
-                TCGv_i32 shift = tcg_const_i32(extract32(ctx->opcode, 0, 5));
-                TCGv_i32 shiftx = tcg_const_i32(extract32(ctx->opcode, 7, 4)
-                                                << 1);
-                TCGv_i32 stripe = tcg_const_i32(extract32(ctx->opcode, 6, 1));
+                TCGv_i32 shift =
+                    tcg_constant_i32(extract32(ctx->opcode, 0, 5));
+                TCGv_i32 shiftx =
+                    tcg_constant_i32(extract32(ctx->opcode, 7, 4) << 1);
+                TCGv_i32 stripe =
+                    tcg_constant_i32(extract32(ctx->opcode, 6, 1));
 
                 gen_load_gpr(t0, rs);
                 gen_helper_rotx(cpu_gpr[rt], t0, shift, shiftx, stripe);
@@ -4500,7 +4502,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
 
     /* make sure instructions are on a halfword boundary */
     if (ctx->base.pc_next & 0x1) {
-        TCGv tmp = tcg_const_tl(ctx->base.pc_next);
+        TCGv tmp = tcg_constant_tl(ctx->base.pc_next);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPUMIPSState, CP0_BadVAddr));
         generate_exception_end(ctx, EXCP_AdEL);
         return 2;
-- 
2.34.1


