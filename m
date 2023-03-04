Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D486AABCC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTS-0006Pk-KK; Sat, 04 Mar 2023 13:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTQ-0006O3-1Y
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:12 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTM-0003Lv-Cr
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:11 -0500
Received: by mail-pf1-x441.google.com with SMTP id ay18so3444735pfb.2
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zTSOeqfVJ3dn3N9BVal71fZxZTkyCy1y0t1rzzbDvwQ=;
 b=ftPu+wGTtemj7WpXwwoGdpiMlIyUxWFC20QHKMhOt29RES2gzEO9Ah1NZ1hQ4wGYTO
 cL9aUsNgprQUsnF7CN/8nMat6XSlfLSJxskn7ppvvqDZi2/LuZ2N1lBSvRYR2Q8WHQnH
 UfszucYPYSY+rxY68QbBgSbNgNSOv0iJ+RULo8TNfQFKZDgIEHfo4YZsFeMOfF0lxNt+
 Pt+o9LlokstCPybz8rEAeYI0SjOyQ9SjBDwWGZCPpk4llUXKqjxIPjBVZCyq1dC7EyF/
 HCF/ot+cTQTF34fJ5/LQfF4A5vkRtbF/U/rQija2CGpwpwzXyKK1ohs/dJw5iV2EI7Yv
 07VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTSOeqfVJ3dn3N9BVal71fZxZTkyCy1y0t1rzzbDvwQ=;
 b=waDckD5X2pX/yhvyNU2zcD9TLf1+G3KzUYtdlW57pDpaB/DWcvP4mLVjS+bIPEYXCJ
 nFpuxjuCfQ9glOIEDOhjMbvF+b8+trOK42FRfsoYltEIXlZtMmk/ys/Q9wOdla7PRR3o
 zbHEYUJGvgVERXCggJ8FQuY/6Gsspk5+zgJmPCJ16GFLjoMp7p3ZJiyMFRUqIIt5yvG+
 dnR/6Tiv6/MhLlVbkwHuOIELecpP64szIjB1x+uWSiIyvg6ycDjeDKvlyT7v401ViaGo
 RTeh9In6YuN0To6scVyY9rIgJDn64fhrB63IC3O6o6d1r0uKvJ398zqE9FIAhceYwqIg
 oRJA==
X-Gm-Message-State: AO0yUKW6TLX1urxnqo75i562ckMTNFRriCwK+TPuynvjOQeEDP10OK5A
 e0imONme+Re+7/XqvEmDkmgeuL3TG3NcU47/ObwCpEnO
X-Google-Smtp-Source: AK7set/tsJG4ymCeqD1nwJH2VY9o4Ryc8v6NKXfd4oUEpqNKx4J4HwyLuqrUhWIO3Ifu5qnSLX1XHA==
X-Received: by 2002:a62:cf81:0:b0:5dc:4b6:b18d with SMTP id
 b123-20020a62cf81000000b005dc04b6b18dmr4923963pfg.26.1677953947513; 
 Sat, 04 Mar 2023 10:19:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 06/20] target/mips: Drop tcg_temp_free from
 nanomips_translate.c.inc
Date: Sat,  4 Mar 2023 10:18:46 -0800
Message-Id: <20230304181900.1097116-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 target/mips/tcg/nanomips_translate.c.inc | 127 ++---------------------
 1 file changed, 10 insertions(+), 117 deletions(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index faf6d679bd..b3df7fec40 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1005,13 +1005,9 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
         tcg_gen_extr_i64_tl(tmp1, tmp2, tval);
     }
     gen_store_gpr(tmp1, reg1);
-    tcg_temp_free(tmp1);
     gen_store_gpr(tmp2, reg2);
-    tcg_temp_free(tmp2);
     tcg_gen_st_i64(tval, cpu_env, offsetof(CPUMIPSState, llval_wp));
-    tcg_temp_free_i64(tval);
     tcg_gen_st_tl(taddr, cpu_env, offsetof(CPUMIPSState, lladdr));
-    tcg_temp_free(taddr);
 }
 
 static void gen_scwp(DisasContext *ctx, uint32_t base, int16_t offset,
@@ -1084,9 +1080,6 @@ static void gen_save(DisasContext *ctx, uint8_t rt, uint8_t count,
 
     /* adjust stack pointer */
     gen_adjust_sp(ctx, -u);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(va);
 }
 
 static void gen_restore(DisasContext *ctx, uint8_t rt, uint8_t count,
@@ -1110,9 +1103,6 @@ static void gen_restore(DisasContext *ctx, uint8_t rt, uint8_t count,
 
     /* adjust stack pointer */
     gen_adjust_sp(ctx, u);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(va);
 }
 
 static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
@@ -1232,8 +1222,6 @@ static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
     if (insn_bytes == 2) {
         ctx->hflags |= MIPS_HFLAG_B16;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_pool16c_nanomips_insn(DisasContext *ctx)
@@ -1358,7 +1346,6 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             }
-            tcg_temp_free(t0);
 #endif
         } else {
             gen_slt(ctx, OPC_SLTU, rd, rs, rt);
@@ -1381,10 +1368,6 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             /* operands of same sign, result different sign */
             tcg_gen_setcondi_tl(TCG_COND_LT, t0, t1, 0);
             gen_store_gpr(t0, rd);
-
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
-            tcg_temp_free(t2);
         }
         break;
     case NM_MUL:
@@ -1427,7 +1410,6 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
 
             gen_load_gpr(t0, rt);
             gen_mtc0(ctx, t0, rs, extract32(ctx->opcode, 11, 3));
-            tcg_temp_free(t0);
         }
         break;
     case NM_D_E_MT_VPE:
@@ -1467,8 +1449,6 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                 }
                 break;
             }
-
-            tcg_temp_free(t0);
         }
         break;
     case NM_FORK:
@@ -1480,8 +1460,6 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rt);
             gen_load_gpr(t1, rs);
             gen_helper_fork(t0, t1);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
         }
         break;
     case NM_MFTR:
@@ -1508,7 +1486,6 @@ static void gen_pool32a0_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rs);
             gen_helper_yield(t0, cpu_env, t0);
             gen_store_gpr(t0, rt);
-            tcg_temp_free(t0);
         }
         break;
 #endif
@@ -1557,11 +1534,6 @@ static void gen_pool32axf_1_5_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_reserved_instruction(ctx);
         break;
     }
-
-    tcg_temp_free_i32(t0);
-
-    tcg_temp_free(v0_t);
-    tcg_temp_free(v1_t);
 }
 
 
@@ -1682,10 +1654,6 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_reserved_instruction(ctx);
         break;
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(v0_t);
 }
 
 static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
@@ -1802,8 +1770,6 @@ static void gen_pool32axf_2_multiply(DisasContext *ctx, uint32_t opc,
         gen_reserved_instruction(ctx);
         break;
     }
-
-    tcg_temp_free_i32(t0);
 }
 
 static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
@@ -1855,10 +1821,8 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 tcg_gen_mul_i64(t2, t2, t3);
                 tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
                 tcg_gen_add_i64(t2, t2, t3);
-                tcg_temp_free_i64(t3);
                 gen_move_low32(cpu_LO[acc], t2);
                 gen_move_high32(cpu_HI[acc], t2);
-                tcg_temp_free_i64(t2);
             }
             break;
         case NM_MULT:
@@ -1878,8 +1842,6 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 tcg_gen_muls2_i32(t2, t3, t2, t3);
                 tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
                 tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-                tcg_temp_free_i32(t2);
-                tcg_temp_free_i32(t3);
             }
             break;
         case NM_EXTRV_W:
@@ -1915,10 +1877,8 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 tcg_gen_mul_i64(t2, t2, t3);
                 tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
                 tcg_gen_add_i64(t2, t2, t3);
-                tcg_temp_free_i64(t3);
                 gen_move_low32(cpu_LO[acc], t2);
                 gen_move_high32(cpu_HI[acc], t2);
-                tcg_temp_free_i64(t2);
             }
             break;
         case NM_MULTU:
@@ -1938,8 +1898,6 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 tcg_gen_mulu2_i32(t2, t3, t2, t3);
                 tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
                 tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-                tcg_temp_free_i32(t2);
-                tcg_temp_free_i32(t3);
             }
             break;
         case NM_EXTRV_R_W:
@@ -1982,10 +1940,8 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 tcg_gen_mul_i64(t2, t2, t3);
                 tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
                 tcg_gen_sub_i64(t2, t3, t2);
-                tcg_temp_free_i64(t3);
                 gen_move_low32(cpu_LO[acc], t2);
                 gen_move_high32(cpu_HI[acc], t2);
-                tcg_temp_free_i64(t2);
             }
             break;
         case NM_EXTRV_RS_W:
@@ -2027,10 +1983,8 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 tcg_gen_mul_i64(t2, t2, t3);
                 tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
                 tcg_gen_sub_i64(t2, t3, t2);
-                tcg_temp_free_i64(t3);
                 gen_move_low32(cpu_LO[acc], t2);
                 gen_move_high32(cpu_HI[acc], t2);
-                tcg_temp_free_i64(t2);
             }
             break;
         case NM_EXTRV_S_H:
@@ -2045,12 +1999,6 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_reserved_instruction(ctx);
         break;
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
-    tcg_temp_free(v0_t);
-    tcg_temp_free(v1_t);
 }
 
 static void gen_pool32axf_4_nanomips_insn(DisasContext *ctx, uint32_t opc,
@@ -2162,7 +2110,6 @@ static void gen_pool32axf_4_nanomips_insn(DisasContext *ctx, uint32_t opc,
             gen_load_gpr(tv0, rt);
             gen_helper_insv(v0_t, cpu_env, v0_t, tv0);
             gen_store_gpr(v0_t, ret);
-            tcg_temp_free(tv0);
         }
         break;
     case NM_RADDU_W_QB:
@@ -2188,9 +2135,6 @@ static void gen_pool32axf_4_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_reserved_instruction(ctx);
         break;
     }
-
-    tcg_temp_free(v0_t);
-    tcg_temp_free(t0);
 }
 
 static void gen_pool32axf_7_nanomips_insn(DisasContext *ctx, uint32_t opc,
@@ -2243,8 +2187,6 @@ static void gen_pool32axf_7_nanomips_insn(DisasContext *ctx, uint32_t opc,
         gen_reserved_instruction(ctx);
         break;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(rs_t);
 }
 
 
@@ -2304,7 +2246,6 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                 gen_store_gpr(t0, rt);
             /* Stop translation as we may have switched the execution mode */
                 ctx->base.is_jmp = DISAS_STOP;
-                tcg_temp_free(t0);
             }
             break;
         case NM_EI:
@@ -2317,7 +2258,6 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
                 gen_store_gpr(t0, rt);
             /* Stop translation as we may have switched the execution mode */
                 ctx->base.is_jmp = DISAS_STOP;
-                tcg_temp_free(t0);
             }
             break;
         case NM_RDPGPR:
@@ -2374,7 +2314,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
             /* Unconditional branch */
         } else if (rt == 0 && imm != 0) {
             /* Treat as NOP */
-            goto out;
+            return;
         } else {
             cond = TCG_COND_EQ;
         }
@@ -2384,12 +2324,12 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
         check_nms(ctx);
         if (imm >= 32 && !(ctx->hflags & MIPS_HFLAG_64)) {
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         } else if (rt == 0 && opc == NM_BBEQZC) {
             /* Unconditional branch */
         } else if (rt == 0 && opc == NM_BBNEZC) {
             /* Treat as NOP */
-            goto out;
+            return;
         } else {
             tcg_gen_shri_tl(t0, t0, imm);
             tcg_gen_andi_tl(t0, t0, 1);
@@ -2404,7 +2344,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
     case NM_BNEIC:
         if (rt == 0 && imm == 0) {
             /* Treat as NOP */
-            goto out;
+            return;
         } else if (rt == 0 && imm != 0) {
             /* Unconditional branch */
         } else {
@@ -2434,7 +2374,7 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
     default:
         MIPS_INVAL("Immediate Value Compact branch");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     /* branch completion */
@@ -2455,10 +2395,6 @@ static void gen_compute_imm_branch(DisasContext *ctx, uint32_t opc,
 
         gen_goto_tb(ctx, 0, ctx->base.pc_next + 4);
     }
-
-out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* P.BALRSC type nanoMIPS R6 branches: BALRSC and BRSC */
@@ -2488,9 +2424,6 @@ static void gen_compute_nanomips_pbalrsc_branch(DisasContext *ctx, int rs,
     /* unconditional branch to register */
     tcg_gen_mov_tl(cpu_PC, btarget);
     tcg_gen_lookup_and_goto_ptr();
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* nanoMIPS Branches */
@@ -2540,14 +2473,12 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
             gen_load_gpr(tbase, rt);
             tcg_gen_movi_tl(toffset, offset);
             gen_op_addr_add(ctx, btarget, tbase, toffset);
-            tcg_temp_free(tbase);
-            tcg_temp_free(toffset);
         }
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     if (bcond_compute == 0) {
@@ -2559,7 +2490,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
         default:
             MIPS_INVAL("Compact branch/jump");
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
     } else {
         /* Conditional compact branch */
@@ -2620,7 +2551,7 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
         default:
             MIPS_INVAL("Compact conditional branch/jump");
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
 
         /* branch completion */
@@ -2633,10 +2564,6 @@ static void gen_compute_compact_branch_nm(DisasContext *ctx, uint32_t opc,
 
         gen_goto_tb(ctx, 0, ctx->base.pc_next + 4);
     }
-
-out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -2664,15 +2591,12 @@ static void gen_compute_branch_cp1_nm(DisasContext *ctx, uint32_t op,
     default:
         MIPS_INVAL("cp1 cond branch");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     tcg_gen_trunc_i64_tl(bcond, t0);
 
     ctx->btarget = btarget;
-
-out:
-    tcg_temp_free_i64(t0);
 }
 
 
@@ -2709,7 +2633,7 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
             break;
         default:
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
     }
     gen_op_addr_add(ctx, t0, t0, t1);
@@ -2799,10 +2723,6 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         gen_reserved_instruction(ctx);
         break;
     }
-
-out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_pool32f_nanomips_insn(DisasContext *ctx)
@@ -3443,7 +3363,6 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
                 gen_helper_precr_sra_ph_w(v1_t, sa_t, v1_t,
                                           cpu_gpr[rt]);
                 gen_store_gpr(v1_t, rt);
-                tcg_temp_free_i32(sa_t);
             }
             break;
         case 1:
@@ -3453,7 +3372,6 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
                 gen_helper_precr_sra_r_ph_w(v1_t, sa_t, v1_t,
                                             cpu_gpr[rt]);
                 gen_store_gpr(v1_t, rt);
-                tcg_temp_free_i32(sa_t);
             }
             break;
        }
@@ -3536,8 +3454,6 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
             tcg_gen_movi_tl(tv0, rd >> 3);
             tcg_gen_movi_tl(tv1, imm);
             gen_helper_shilo(tv0, tv1, cpu_env);
-            tcg_temp_free(tv1);
-            tcg_temp_free(tv0);
         }
         break;
     case NM_MULEQ_S_W_PHL:
@@ -3652,10 +3568,6 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         gen_reserved_instruction(ctx);
         break;
     }
-
-    tcg_temp_free(v2_t);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(t0);
 }
 
 static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
@@ -3827,7 +3739,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
 
                     tcg_gen_movi_tl(t0, addr);
                     tcg_gen_qemu_ld_tl(cpu_gpr[rt], t0, ctx->mem_idx, MO_TESL);
-                    tcg_temp_free(t0);
                 }
                 break;
             case NM_SWPC48:
@@ -3844,9 +3755,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_load_gpr(t1, rt);
 
                     tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
-
-                    tcg_temp_free(t0);
-                    tcg_temp_free(t1);
                 }
                 break;
             default:
@@ -3908,8 +3816,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 gen_load_gpr(t0, rs);
                 tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, imm);
                 gen_store_gpr(t0, rt);
-
-                tcg_temp_free(t0);
             }
             break;
         case NM_ADDIUNEG:
@@ -3965,11 +3871,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
 
                 gen_load_gpr(t0, rs);
                 gen_helper_rotx(cpu_gpr[rt], t0, shift, shiftx, stripe);
-                tcg_temp_free(t0);
-
-                tcg_temp_free_i32(shift);
-                tcg_temp_free_i32(shiftx);
-                tcg_temp_free_i32(stripe);
             }
             break;
         case NM_P_INS:
@@ -4239,8 +4140,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                                                MO_UNALN);
                             break;
                         }
-                        tcg_temp_free(t0);
-                        tcg_temp_free(t1);
                     }
                     break;
                 case NM_P_LL:
@@ -4432,8 +4331,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         }
                         counter++;
                     }
-                    tcg_temp_free(va);
-                    tcg_temp_free(t1);
                 }
                 break;
             default:
@@ -4454,7 +4351,6 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rt);
             tcg_gen_mov_tl(cpu_gpr[rd], t0);
             gen_compute_branch_nm(ctx, OPC_BGEZAL, 4, 0, 0, s);
-            tcg_temp_free(t0);
         }
         break;
     case NM_P_BAL:
@@ -4606,7 +4502,6 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
     if (ctx->base.pc_next & 0x1) {
         TCGv tmp = tcg_const_tl(ctx->base.pc_next);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPUMIPSState, CP0_BadVAddr));
-        tcg_temp_free(tmp);
         generate_exception_end(ctx, EXCP_AdEL);
         return 2;
     }
@@ -4941,8 +4836,6 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t1, rt);
             tcg_gen_mov_tl(cpu_gpr[rd], t0);
             tcg_gen_mov_tl(cpu_gpr[re], t1);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
         }
         break;
     default:
-- 
2.34.1


