Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BF6B2E5E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWg-0004In-G8; Thu, 09 Mar 2023 15:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWd-00044t-Ae
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:07 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWY-0000iD-6e
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:07 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so3015448pjz.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6z9bmVArUHK6Ytfubm3CHGUcvAf5Rf0ajXZJsx0nx0=;
 b=FK39+Mzwalui4bQBtOKi++ChJ9/9qVP5edxKl1WGRZhp0pR/yVRyd62AEVmsYy8Nnh
 SPqLCDk6YuIj9+3+08V434OBz+rRoFlYUWBGY2QzTqZDFKxlSTgSB7n6cS5UhuSOEfzw
 6Br+cWQfos3cFfbP/J7XXaFetkFAIm+i2gUxBNsQ2V+7PH5wbezmHrytE29kaKZ0/GR2
 PFqP9cz33K+tklvK92FTF/ZLdXMYB2o3tgtVg6kRyvj5/RHB2vEDVNplVVZ32QUzr8qm
 GuH8VkLrZ4n+uM8fQ9kobe8soh+vCzPJw5jLuRaCOXOTCQIlzkvny8kuWS6SYamcwFPE
 JqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6z9bmVArUHK6Ytfubm3CHGUcvAf5Rf0ajXZJsx0nx0=;
 b=aHUEXR/H5tLczsGVHfd4k7BDscPpOukAbT5BFEZaA19svxYMQehP9a/DagLeg/f0cE
 AgEjfbnr78r+oiuoBzpNLwZ068DGRGMTwqqYvzwBhjK/VxaTbIwWPm7rN0/FWj240hdF
 hBxtxFaDose4KKYa80tajMRpDG8iza8hfOsV9uxohbq37GkVWsUfTs46KFalTOeQTKe5
 pjRjS9rCvkK6uodj1/SD81AEL20UA1P+ghovxE4BDzxPxra64ZHyUa2o7XUbSaupni7c
 v83sQ13udMUErtF7Fd60xmMdeHhDgv99Xp4LagKZbMs3HSco7t/j/3HXpXXf9xDpkEAl
 dnew==
X-Gm-Message-State: AO0yUKUFve4HuSOPsde4HgMi0NIvPrkF1VM4zyqEHqAxyfjkzhd/ieXj
 1S1qWu9xrmDyvbAVJ9FxcqRh69r0wXlxTs5RMsM=
X-Google-Smtp-Source: AK7set/EcTAlBrBg+8FBcMri6Y1C3YdnATGlKQ+qpatdrdpAQ5VmJrQH7Tx+O4CTx5IYUWYaia1Nug==
X-Received: by 2002:a17:90a:4146:b0:233:f393:f6cd with SMTP id
 m6-20020a17090a414600b00233f393f6cdmr23760452pjg.5.1678392360449; 
 Thu, 09 Mar 2023 12:06:00 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 09/91] target/mips: Drop tcg_temp_free from translate.c
Date: Thu,  9 Mar 2023 12:04:28 -0800
Message-Id: <20230309200550.3878088-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 537 +-----------------------------------
 1 file changed, 14 insertions(+), 523 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 24993bc97d..0fa9634d39 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1274,11 +1274,8 @@ static inline void gen_load_srsgpr(int from, int to)
         tcg_gen_add_ptr(addr, cpu_env, addr);
 
         tcg_gen_ld_tl(t0, addr, sizeof(target_ulong) * from);
-        tcg_temp_free_ptr(addr);
-        tcg_temp_free_i32(t2);
     }
     gen_store_gpr(t0, to);
-    tcg_temp_free(t0);
 }
 
 static inline void gen_store_srsgpr(int from, int to)
@@ -1297,9 +1294,6 @@ static inline void gen_store_srsgpr(int from, int to)
         tcg_gen_add_ptr(addr, cpu_env, addr);
 
         tcg_gen_st_tl(t0, addr, sizeof(target_ulong) * to);
-        tcg_temp_free_ptr(addr);
-        tcg_temp_free_i32(t2);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1396,7 +1390,6 @@ void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
     t64 = tcg_temp_new_i64();
     tcg_gen_extu_i32_i64(t64, t);
     tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 0, 32);
-    tcg_temp_free_i64(t64);
 }
 
 static void gen_load_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
@@ -1414,7 +1407,6 @@ static void gen_store_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
         TCGv_i64 t64 = tcg_temp_new_i64();
         tcg_gen_extu_i32_i64(t64, t);
         tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 32, 32);
-        tcg_temp_free_i64(t64);
     } else {
         gen_store_fpr32(ctx, t, reg | 1);
     }
@@ -1439,7 +1431,6 @@ void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
         t0 = tcg_temp_new_i64();
         tcg_gen_shri_i64(t0, t, 32);
         tcg_gen_deposit_i64(fpu_f64[reg | 1], fpu_f64[reg | 1], t0, 0, 32);
-        tcg_temp_free_i64(t0);
     }
 }
 
@@ -1852,8 +1843,6 @@ static inline void gen_cmp ## type ## _ ## fmt(DisasContext *ctx, int n,      \
     default:                                                                  \
         abort();                                                              \
     }                                                                         \
-    tcg_temp_free_i##bits(fp0);                                               \
-    tcg_temp_free_i##bits(fp1);                                               \
 }
 
 FOP_CONDS(, 0, d, FMT_D, 64)
@@ -1946,8 +1935,6 @@ static inline void gen_r6_cmp_ ## fmt(DisasContext *ctx, int n,         \
         abort();                                                        \
     }                                                                   \
     STORE;                                                              \
-    tcg_temp_free_i ## bits(fp0);                                       \
-    tcg_temp_free_i ## bits(fp1);                                       \
 }
 
 FOP_CONDNS(d, FMT_D, 64, gen_store_fpr64(ctx, fp0, fd))
@@ -1967,7 +1954,6 @@ static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
     tcg_gen_qemu_##fname(ret, arg1, ctx->mem_idx);                         \
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPUMIPSState, lladdr));            \
     tcg_gen_st_tl(ret, cpu_env, offsetof(CPUMIPSState, llval));            \
-    tcg_temp_free(t0);                                                     \
 }
 #else
 #define OP_LD_ATOMIC(insn, fname)                                          \
@@ -2065,9 +2051,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_andc_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         gen_store_gpr(t0, rt);
         break;
     case OPC_LDR:
@@ -2090,15 +2074,12 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_and_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         gen_store_gpr(t0, rt);
         break;
     case OPC_LDPC:
         t1 = tcg_const_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUQ);
         gen_store_gpr(t0, rt);
         break;
@@ -2106,7 +2087,6 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
     case OPC_LWPC:
         t1 = tcg_const_tl(pc_relative_pc(ctx));
         gen_op_addr_add(ctx, t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TESL);
         gen_store_gpr(t0, rt);
         break;
@@ -2170,9 +2150,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_andc_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_ext32s_tl(t0, t0);
         gen_store_gpr(t0, rt);
         break;
@@ -2199,9 +2177,7 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         tcg_gen_shl_tl(t2, t2, t1);
         gen_load_gpr(t1, rt);
         tcg_gen_and_tl(t1, t1, t2);
-        tcg_temp_free(t2);
         tcg_gen_or_tl(t0, t0, t1);
-        tcg_temp_free(t1);
         tcg_gen_ext32s_tl(t0, t0);
         gen_store_gpr(t0, rt);
         break;
@@ -2214,7 +2190,6 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
         gen_store_gpr(t0, rt);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 /* Store */
@@ -2273,8 +2248,6 @@ static void gen_st(DisasContext *ctx, uint32_t opc, int rt,
         gen_helper_0e2i(swr, t1, t0, mem_idx);
         break;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -2291,7 +2264,6 @@ static void gen_st_cond(DisasContext *ctx, int rt, int base, int offset,
     /* compare the address against that of the preceding LL */
     gen_base_offset_addr(ctx, addr, base, offset);
     tcg_gen_brcond_tl(TCG_COND_EQ, addr, cpu_lladdr, l1);
-    tcg_temp_free(addr);
     tcg_gen_movi_tl(t0, 0);
     gen_store_gpr(t0, rt);
     tcg_gen_br(done);
@@ -2304,10 +2276,8 @@ static void gen_st_cond(DisasContext *ctx, int rt, int base, int offset,
                               eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo);
     tcg_gen_setcond_tl(TCG_COND_EQ, t0, t0, cpu_llval);
     gen_store_gpr(t0, rt);
-    tcg_temp_free(val);
 
     gen_set_label(done);
-    tcg_temp_free(t0);
 }
 
 /* Load and store */
@@ -2325,7 +2295,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
                                 ctx->default_tcg_memop_mask);
             gen_store_fpr32(ctx, fp0, ft);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SWC1:
@@ -2334,7 +2303,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             gen_load_fpr32(ctx, fp0, ft);
             tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
                                 ctx->default_tcg_memop_mask);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_LDC1:
@@ -2343,7 +2311,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ |
                                 ctx->default_tcg_memop_mask);
             gen_store_fpr64(ctx, fp0, ft);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SDC1:
@@ -2352,7 +2319,6 @@ static void gen_flt_ldst(DisasContext *ctx, uint32_t opc, int ft,
             gen_load_fpr64(ctx, fp0, ft);
             tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ |
                                 ctx->default_tcg_memop_mask);
-            tcg_temp_free_i64(fp0);
         }
         break;
     default:
@@ -2381,7 +2347,6 @@ static void gen_cop1_ldst(DisasContext *ctx, uint32_t op, int rt,
     } else {
         generate_exception_err(ctx, EXCP_CpU, 1);
     }
-    tcg_temp_free(t0);
 }
 
 /* Arithmetic with immediate operand */
@@ -2412,15 +2377,12 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
             tcg_gen_xori_tl(t1, t1, ~uimm);
             tcg_gen_xori_tl(t2, t0, uimm);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             tcg_gen_ext32s_tl(t0, t0);
             gen_store_gpr(t0, rt);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_ADDIU:
@@ -2445,14 +2407,11 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
             tcg_gen_xori_tl(t1, t1, ~uimm);
             tcg_gen_xori_tl(t2, t0, uimm);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rt);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_DADDIU:
@@ -2535,7 +2494,6 @@ static void gen_slt_imm(DisasContext *ctx, uint32_t opc,
         tcg_gen_setcondi_tl(TCG_COND_LTU, cpu_gpr[rt], t0, uimm);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 /* Shifts with immediate operand */
@@ -2575,7 +2533,6 @@ static void gen_shift_imm(DisasContext *ctx, uint32_t opc,
             tcg_gen_trunc_tl_i32(t1, t0);
             tcg_gen_rotri_i32(t1, t1, uimm);
             tcg_gen_ext_i32_tl(cpu_gpr[rt], t1);
-            tcg_temp_free_i32(t1);
         } else {
             tcg_gen_ext32s_tl(cpu_gpr[rt], t0);
         }
@@ -2611,7 +2568,6 @@ static void gen_shift_imm(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 /* Arithmetic */
@@ -2642,14 +2598,11 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t1, t1, t2);
             tcg_gen_xor_tl(t2, t0, t2);
             tcg_gen_andc_tl(t1, t2, t1);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_ADDU:
@@ -2678,9 +2631,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t2, t1, t2);
             tcg_gen_xor_tl(t1, t0, t1);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /*
              * operands of different sign, first operand and the result
              * of different sign
@@ -2688,7 +2639,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_SUBU:
@@ -2718,14 +2668,11 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t1, t1, t2);
             tcg_gen_xor_tl(t2, t0, t2);
             tcg_gen_andc_tl(t1, t2, t1);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /* operands of same sign, result different sign */
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_DADDU:
@@ -2752,9 +2699,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_xor_tl(t2, t1, t2);
             tcg_gen_xor_tl(t1, t0, t1);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
-            tcg_temp_free(t1);
             /*
              * Operands of different sign, first operand and result different
              * sign.
@@ -2762,7 +2707,6 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(l1);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     case OPC_DSUBU:
@@ -2818,9 +2762,6 @@ static void gen_cond_move(DisasContext *ctx, uint32_t opc,
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr[rd], t0, t1, t2, t1);
         break;
     }
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
 }
 
 /* Logic */
@@ -2899,8 +2840,6 @@ static void gen_slt(DisasContext *ctx, uint32_t opc,
         tcg_gen_setcond_tl(TCG_COND_LTU, cpu_gpr[rd], t0, t1);
         break;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* Shifts */
@@ -2947,8 +2886,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
             tcg_gen_andi_i32(t2, t2, 0x1f);
             tcg_gen_rotr_i32(t2, t3, t2);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
 #if defined(TARGET_MIPS64)
@@ -2970,8 +2907,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* Arithmetic on HI/LO registers */
@@ -3044,7 +2979,6 @@ static inline void gen_r6_ld(target_long addr, int reg, int memidx,
     TCGv t0 = tcg_const_tl(addr);
     tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);
     gen_store_gpr(t0, reg);
-    tcg_temp_free(t0);
 }
 
 static inline void gen_pcrel(DisasContext *ctx, int opc, target_ulong pc,
@@ -3141,8 +3075,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_MOD:
@@ -3160,8 +3092,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DIVU:
@@ -3173,8 +3103,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_MODU:
@@ -3186,8 +3114,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_remu_tl(cpu_gpr[rd], t0, t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_MUL:
@@ -3198,8 +3124,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_mul_i32(t2, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case R6_OPC_MUH:
@@ -3210,8 +3134,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_muls2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case R6_OPC_MULU:
@@ -3222,8 +3144,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_mul_i32(t2, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t2);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case R6_OPC_MUHU:
@@ -3234,8 +3154,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_trunc_tl_i32(t3, t1);
             tcg_gen_mulu2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_gpr[rd], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
 #if defined(TARGET_MIPS64)
@@ -3251,8 +3169,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movi_tl(t3, 0);
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_div_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMOD:
@@ -3267,8 +3183,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             tcg_gen_movi_tl(t3, 0);
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_rem_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DDIVU:
@@ -3277,8 +3191,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             TCGv t3 = tcg_const_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMODU:
@@ -3287,8 +3199,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
             TCGv t3 = tcg_const_tl(1);
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_remu_i64(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMUL:
@@ -3298,7 +3208,6 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         {
             TCGv t2 = tcg_temp_new();
             tcg_gen_muls2_i64(t2, cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
         }
         break;
     case R6_OPC_DMULU:
@@ -3308,18 +3217,14 @@ static void gen_r6_muldiv(DisasContext *ctx, int opc, int rd, int rs, int rt)
         {
             TCGv t2 = tcg_temp_new();
             tcg_gen_mulu2_i64(t2, cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
         }
         break;
 #endif
     default:
         MIPS_INVAL("r6 mul/div");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 #if defined(TARGET_MIPS64)
@@ -3351,8 +3256,6 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
             tcg_gen_rem_tl(cpu_HI[1], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
             tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case MMI_OPC_DIVU1:
@@ -3366,18 +3269,13 @@ static void gen_div1_tx79(DisasContext *ctx, uint32_t opc, int rs, int rt)
             tcg_gen_remu_tl(cpu_HI[1], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[1], cpu_LO[1]);
             tcg_gen_ext32s_tl(cpu_HI[1], cpu_HI[1]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     default:
         MIPS_INVAL("div1 TX79");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 #endif
 
@@ -3414,8 +3312,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_rem_tl(cpu_HI[acc], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[acc], cpu_LO[acc]);
             tcg_gen_ext32s_tl(cpu_HI[acc], cpu_HI[acc]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_DIVU:
@@ -3429,8 +3325,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_remu_tl(cpu_HI[acc], t0, t1);
             tcg_gen_ext32s_tl(cpu_LO[acc], cpu_LO[acc]);
             tcg_gen_ext32s_tl(cpu_HI[acc], cpu_HI[acc]);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_MULT:
@@ -3442,8 +3336,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_muls2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case OPC_MULTU:
@@ -3455,8 +3347,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mulu2_i32(t2, t3, t2, t3);
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
 #if defined(TARGET_MIPS64)
@@ -3473,8 +3363,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
             tcg_gen_div_tl(cpu_LO[acc], t0, t1);
             tcg_gen_rem_tl(cpu_HI[acc], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_DDIVU:
@@ -3484,8 +3372,6 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
             tcg_gen_divu_i64(cpu_LO[acc], t0, t1);
             tcg_gen_remu_i64(cpu_HI[acc], t0, t1);
-            tcg_temp_free(t3);
-            tcg_temp_free(t2);
         }
         break;
     case OPC_DMULT:
@@ -3505,10 +3391,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     case OPC_MADDU:
@@ -3523,10 +3407,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     case OPC_MSUB:
@@ -3539,10 +3421,8 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_sub_i64(t2, t3, t2);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     case OPC_MSUBU:
@@ -3557,20 +3437,15 @@ static void gen_muldiv(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_sub_i64(t2, t3, t2);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
-            tcg_temp_free_i64(t2);
         }
         break;
     default:
         MIPS_INVAL("mul/div");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /*
@@ -3625,8 +3500,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             }
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case MMI_OPC_MULTU1:
@@ -3644,8 +3517,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             }
             tcg_gen_ext_i32_tl(cpu_LO[acc], t2);
             tcg_gen_ext_i32_tl(cpu_HI[acc], t3);
-            tcg_temp_free_i32(t2);
-            tcg_temp_free_i32(t3);
         }
         break;
     case MMI_OPC_MADD1:
@@ -3661,13 +3532,11 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
             if (rd) {
                 gen_move_low32(cpu_gpr[rd], t2);
             }
-            tcg_temp_free_i64(t2);
         }
         break;
     case MMI_OPC_MADDU1:
@@ -3685,24 +3554,18 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
             tcg_gen_mul_i64(t2, t2, t3);
             tcg_gen_concat_tl_i64(t3, cpu_LO[acc], cpu_HI[acc]);
             tcg_gen_add_i64(t2, t2, t3);
-            tcg_temp_free_i64(t3);
             gen_move_low32(cpu_LO[acc], t2);
             gen_move_high32(cpu_HI[acc], t2);
             if (rd) {
                 gen_move_low32(cpu_gpr[rd], t2);
             }
-            tcg_temp_free_i64(t2);
         }
         break;
     default:
         MIPS_INVAL("mul/madd TXx9");
         gen_reserved_instruction(ctx);
-        goto out;
+        break;
     }
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_cl(DisasContext *ctx, uint32_t opc,
@@ -3924,9 +3787,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /* Loongson multimedia instructions */
@@ -4221,7 +4081,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
             tcg_gen_xor_i64(t1, t1, t2);
             tcg_gen_xor_i64(t2, t2, t0);
             tcg_gen_andc_i64(t1, t2, t1);
-            tcg_temp_free_i64(t2);
             tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(lab);
@@ -4242,7 +4101,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
             tcg_gen_xor_i64(t1, t1, t2);
             tcg_gen_xor_i64(t2, t2, t0);
             tcg_gen_and_i64(t1, t1, t2);
-            tcg_temp_free_i64(t2);
             tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
             generate_exception(ctx, EXCP_OVERFLOW);
             gen_set_label(lab);
@@ -4284,12 +4142,8 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
             tcg_gen_extrl_i64_i32(t32, t64);
             tcg_gen_deposit_i32(fpu_fcr31, fpu_fcr31, t32,
                                 get_fp_bit(cc), 1);
-
-            tcg_temp_free_i32(t32);
-            tcg_temp_free_i64(t64);
         }
-        goto no_rd;
-        break;
+        return;
     default:
         MIPS_INVAL("loongson_cp2");
         gen_reserved_instruction(ctx);
@@ -4297,10 +4151,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
     }
 
     gen_store_fpr64(ctx, t0, rd);
-
-no_rd:
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_loongson_lswc2(DisasContext *ctx, int rt,
@@ -4328,7 +4178,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                            ctx->default_tcg_memop_mask);
         gen_store_gpr(t1, rt);
         gen_store_gpr(t0, lsq_rt1);
-        tcg_temp_free(t1);
         break;
     case OPC_GSLQC1:
         check_cp1_enabled(ctx);
@@ -4341,7 +4190,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                            ctx->default_tcg_memop_mask);
         gen_store_fpr64(ctx, t1, rt);
         gen_store_fpr64(ctx, t0, lsq_rt1);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSQ:
         t1 = tcg_temp_new();
@@ -4353,7 +4201,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         gen_load_gpr(t1, lsq_rt1);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSQC1:
         check_cp1_enabled(ctx);
@@ -4366,7 +4213,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         gen_load_fpr64(ctx, t1, lsq_rt1);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #endif
     case OPC_GSSHFL:
@@ -4390,16 +4236,13 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             tcg_gen_andc_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
 #if defined(TARGET_MIPS64)
             tcg_gen_extrl_i64_i32(fp0, t0);
 #else
             tcg_gen_ext32s_tl(fp0, t0);
 #endif
             gen_store_fpr32(ctx, fp0, rt);
-            tcg_temp_free_i32(fp0);
             break;
         case OPC_GSLWRC1:
             check_cp1_enabled(ctx);
@@ -4421,16 +4264,13 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
 #if defined(TARGET_MIPS64)
             tcg_gen_extrl_i64_i32(fp0, t0);
 #else
             tcg_gen_ext32s_tl(fp0, t0);
 #endif
             gen_store_fpr32(ctx, fp0, rt);
-            tcg_temp_free_i32(fp0);
             break;
 #if defined(TARGET_MIPS64)
         case OPC_GSLDLC1:
@@ -4450,9 +4290,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
             tcg_gen_andc_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
             gen_store_fpr64(ctx, t0, rt);
             break;
         case OPC_GSLDRC1:
@@ -4473,9 +4311,7 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             tcg_gen_shl_tl(t2, t2, t1);
             gen_load_fpr64(ctx, t1, rt);
             tcg_gen_and_tl(t1, t1, t2);
-            tcg_temp_free(t2);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t1);
             gen_store_fpr64(ctx, t0, rt);
             break;
 #endif
@@ -4495,8 +4331,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             gen_helper_0e2i(swl, t1, t0, ctx->mem_idx);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free(t1);
             break;
         case OPC_GSSWRC1:
             check_cp1_enabled(ctx);
@@ -4506,8 +4340,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_load_fpr32(ctx, fp0, rt);
             tcg_gen_ext_i32_tl(t1, fp0);
             gen_helper_0e2i(swr, t1, t0, ctx->mem_idx);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free(t1);
             break;
 #if defined(TARGET_MIPS64)
         case OPC_GSSDLC1:
@@ -4516,7 +4348,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             gen_load_fpr64(ctx, t1, rt);
             gen_helper_0e2i(sdl, t1, t0, ctx->mem_idx);
-            tcg_temp_free(t1);
             break;
         case OPC_GSSDRC1:
             check_cp1_enabled(ctx);
@@ -4524,7 +4355,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             gen_base_offset_addr(ctx, t0, rs, shf_offset);
             gen_load_fpr64(ctx, t1, rt);
             gen_helper_0e2i(sdr, t1, t0, ctx->mem_idx);
-            tcg_temp_free(t1);
             break;
 #endif
         default:
@@ -4538,7 +4368,6 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         gen_reserved_instruction(ctx);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 /* Loongson EXT LDC2/SDC2 */
@@ -4633,7 +4462,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
                             ctx->default_tcg_memop_mask);
         gen_store_fpr32(ctx, fp0, rt);
-        tcg_temp_free_i32(fp0);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSLDXC1:
@@ -4650,21 +4478,18 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         t1 = tcg_temp_new();
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_SB);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSHX:
         t1 = tcg_temp_new();
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUW |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
     case OPC_GSSWX:
         t1 = tcg_temp_new();
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSSDX:
@@ -4672,7 +4497,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         gen_load_gpr(t1, rt);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
                            ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #endif
     case OPC_GSSWXC1:
@@ -4680,7 +4504,6 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         gen_load_fpr32(ctx, fp0, rt);
         tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
                             ctx->default_tcg_memop_mask);
-        tcg_temp_free_i32(fp0);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_GSSDXC1:
@@ -4688,14 +4511,11 @@ static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
         gen_load_fpr64(ctx, t1, rt);
         tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEUQ |
                             ctx->default_tcg_memop_mask);
-        tcg_temp_free(t1);
         break;
 #endif
     default:
         break;
     }
-
-    tcg_temp_free(t0);
 }
 
 /* Traps */
@@ -4805,8 +4625,6 @@ static void gen_trap(DisasContext *ctx, uint32_t opc,
         generate_exception(ctx, EXCP_TRAP);
         gen_set_label(l1);
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
@@ -5080,8 +4898,6 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc,
     if (insn_bytes == 2) {
         ctx->hflags |= MIPS_HFLAG_B16;
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -5150,13 +4966,9 @@ static void gen_bitops(DisasContext *ctx, uint32_t opc, int rt,
 fail:
         MIPS_INVAL("bitops");
         gen_reserved_instruction(ctx);
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
         return;
     }
     gen_store_gpr(t0, rt);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
@@ -5181,8 +4993,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
             tcg_gen_and_tl(t0, t0, t2);
             tcg_gen_shli_tl(t0, t0, 8);
             tcg_gen_or_tl(t0, t0, t1);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
             tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
         }
         break;
@@ -5203,8 +5013,6 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
             tcg_gen_and_tl(t0, t0, t2);
             tcg_gen_shli_tl(t0, t0, 8);
             tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
         }
         break;
     case OPC_DSHD:
@@ -5220,18 +5028,14 @@ static void gen_bshfl(DisasContext *ctx, uint32_t op2, int rt, int rd)
             tcg_gen_shri_tl(t1, t0, 32);
             tcg_gen_shli_tl(t0, t0, 32);
             tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
-            tcg_temp_free(t2);
-            tcg_temp_free(t1);
         }
         break;
 #endif
     default:
         MIPS_INVAL("bsfhl");
         gen_reserved_instruction(ctx);
-        tcg_temp_free(t0);
         return;
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
@@ -5270,7 +5074,6 @@ static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
                 tcg_gen_concat_tl_i64(t2, t1, t0);
                 tcg_gen_shri_i64(t2, t2, 32 - bits);
                 gen_move_low32(cpu_gpr[rd], t2);
-                tcg_temp_free_i64(t2);
             }
             break;
 #if defined(TARGET_MIPS64)
@@ -5281,10 +5084,7 @@ static void gen_align_bits(DisasContext *ctx, int wordsz, int rd, int rs,
             break;
 #endif
         }
-        tcg_temp_free(t1);
     }
-
-    tcg_temp_free(t0);
 }
 
 void gen_align(DisasContext *ctx, int wordsz, int rd, int rs, int rt, int bp)
@@ -5311,7 +5111,6 @@ static void gen_bitswap(DisasContext *ctx, int opc, int rd, int rt)
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -5329,8 +5128,6 @@ static inline void gen_mthc0_entrylo(TCGv arg, target_ulong off)
     tcg_gen_concat32_i64(t1, t1, t0);
 #endif
     tcg_gen_st_i64(t1, cpu_env, off);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mthc0_store64(TCGv arg, target_ulong off)
@@ -5342,8 +5139,6 @@ static inline void gen_mthc0_store64(TCGv arg, target_ulong off)
     tcg_gen_ld_i64(t1, cpu_env, off);
     tcg_gen_concat32_i64(t1, t1, t0);
     tcg_gen_st_i64(t1, cpu_env, off);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mfhc0_entrylo(TCGv arg, target_ulong off)
@@ -5357,7 +5152,6 @@ static inline void gen_mfhc0_entrylo(TCGv arg, target_ulong off)
     tcg_gen_shri_i64(t0, t0, 32);
 #endif
     gen_move_low32(arg, t0);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mfhc0_load64(TCGv arg, target_ulong off, int shift)
@@ -5367,7 +5161,6 @@ static inline void gen_mfhc0_load64(TCGv arg, target_ulong off, int shift)
     tcg_gen_ld_i64(t0, cpu_env, off);
     tcg_gen_shri_i64(t0, t0, 32 + shift);
     gen_move_low32(arg, t0);
-    tcg_temp_free_i64(t0);
 }
 
 static inline void gen_mfc0_load32(TCGv arg, target_ulong off)
@@ -5376,7 +5169,6 @@ static inline void gen_mfc0_load32(TCGv arg, target_ulong off)
 
     tcg_gen_ld_i32(t0, cpu_env, off);
     tcg_gen_ext_i32_tl(arg, t0);
-    tcg_temp_free_i32(t0);
 }
 
 static inline void gen_mfc0_load64(TCGv arg, target_ulong off)
@@ -5391,7 +5183,6 @@ static inline void gen_mtc0_store32(TCGv arg, target_ulong off)
 
     tcg_gen_trunc_tl_i32(t0, arg);
     tcg_gen_st_i32(t0, cpu_env, off);
-    tcg_temp_free_i32(t0);
 }
 
 #define CP0_CHECK(c)                            \
@@ -5713,7 +5504,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 }
 #endif
                 gen_move_low32(arg, tmp);
-                tcg_temp_free_i64(tmp);
             }
             register_name = "EntryLo0";
             break;
@@ -5771,7 +5561,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 }
 #endif
                 gen_move_low32(arg, tmp);
-                tcg_temp_free_i64(tmp);
             }
             register_name = "EntryLo1";
             break;
@@ -6300,7 +6089,6 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
                 TCGv_i64 tmp = tcg_temp_new_i64();
                 tcg_gen_ld_i64(tmp, cpu_env, offsetof(CPUMIPSState, CP0_TagLo));
                 gen_move_low32(arg, tmp);
-                tcg_temp_free_i64(tmp);
             }
             register_name = "TagLo";
             break;
@@ -8821,13 +8609,11 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
 
                 gen_load_fpr32(ctx, fp0, rt);
                 tcg_gen_ext_i32_tl(t0, fp0);
-                tcg_temp_free_i32(fp0);
             } else {
                 TCGv_i32 fp0 = tcg_temp_new_i32();
 
                 gen_load_fpr32h(ctx, fp0, rt);
                 tcg_gen_ext_i32_tl(t0, fp0);
-                tcg_temp_free_i32(fp0);
             }
             break;
         case 3:
@@ -8844,11 +8630,9 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
     }
     trace_mips_translate_tr("mftr", rt, u, sel, h);
     gen_store_gpr(t0, rd);
-    tcg_temp_free(t0);
     return;
 
 die:
-    tcg_temp_free(t0);
     LOG_DISAS("mftr (reg %d u %d sel %d h %d)\n", rt, u, sel, h);
     gen_reserved_instruction(ctx);
 }
@@ -9025,13 +8809,11 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
 
                 tcg_gen_trunc_tl_i32(fp0, t0);
                 gen_store_fpr32(ctx, fp0, rd);
-                tcg_temp_free_i32(fp0);
             } else {
                 TCGv_i32 fp0 = tcg_temp_new_i32();
 
                 tcg_gen_trunc_tl_i32(fp0, t0);
                 gen_store_fpr32h(ctx, fp0, rd);
-                tcg_temp_free_i32(fp0);
             }
             break;
         case 3:
@@ -9049,11 +8831,9 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
         }
     }
     trace_mips_translate_tr("mttr", rd, u, sel, h);
-    tcg_temp_free(t0);
     return;
 
 die:
-    tcg_temp_free(t0);
     LOG_DISAS("mttr (reg %d u %d sel %d h %d)\n", rd, u, sel, h);
     gen_reserved_instruction(ctx);
 }
@@ -9079,7 +8859,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
 
             gen_load_gpr(t0, rt);
             gen_mtc0(ctx, t0, rd, ctx->opcode & 0x7);
-            tcg_temp_free(t0);
         }
         opn = "mtc0";
         break;
@@ -9100,7 +8879,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
 
             gen_load_gpr(t0, rt);
             gen_dmtc0(ctx, t0, rd, ctx->opcode & 0x7);
-            tcg_temp_free(t0);
         }
         opn = "dmtc0";
         break;
@@ -9120,7 +8898,6 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
             TCGv t0 = tcg_temp_new();
             gen_load_gpr(t0, rt);
             gen_mthc0(ctx, t0, rd, ctx->opcode & 0x7);
-            tcg_temp_free(t0);
         }
         opn = "mthc0";
         break;
@@ -9254,7 +9031,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
 
     if ((ctx->insn_flags & ISA_MIPS_R6) && (ctx->hflags & MIPS_HFLAG_BMASK)) {
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     if (cc != 0) {
@@ -9294,7 +9071,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_shri_i32(t0, fpu_fcr31, get_fp_bit(cc));
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 1));
             tcg_gen_nand_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9305,7 +9081,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_shri_i32(t0, fpu_fcr31, get_fp_bit(cc));
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 1));
             tcg_gen_or_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9320,7 +9095,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_and_i32(t0, t0, t1);
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 3));
             tcg_gen_nand_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9335,7 +9109,6 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
             tcg_gen_or_i32(t0, t0, t1);
             tcg_gen_shri_i32(t1, fpu_fcr31, get_fp_bit(cc + 3));
             tcg_gen_or_i32(t0, t0, t1);
-            tcg_temp_free_i32(t1);
             tcg_gen_andi_i32(t0, t0, 1);
             tcg_gen_extu_i32_tl(bcond, t0);
         }
@@ -9345,12 +9118,10 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
     default:
         MIPS_INVAL("cp1 cond branch");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
     ctx->btarget = btarget;
     ctx->hflags |= MIPS_HFLAG_BDS32;
- out:
-    tcg_temp_free_i32(t0);
 }
 
 /* R6 CP1 Branches */
@@ -9367,7 +9138,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
                   "\n", ctx->base.pc_next);
 #endif
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     gen_load_fpr64(ctx, t0, ft);
@@ -9387,7 +9158,7 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
     default:
         MIPS_INVAL("cp1 cond branch");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     tcg_gen_trunc_i64_tl(bcond, t0);
@@ -9402,9 +9173,6 @@ static void gen_compute_branch1_r6(DisasContext *ctx, uint32_t op,
         ctx->hflags |= MIPS_HFLAG_BDS32;
         break;
     }
-
-out:
-    tcg_temp_free_i64(t0);
 }
 
 /* Coprocessor 1 (FPU) */
@@ -9632,7 +9400,6 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             gen_load_fpr32(ctx, fp0, fs);
             tcg_gen_ext_i32_tl(t0, fp0);
-            tcg_temp_free_i32(fp0);
         }
         gen_store_gpr(t0, rt);
         break;
@@ -9643,7 +9410,6 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             tcg_gen_trunc_tl_i32(fp0, t0);
             gen_store_fpr32(ctx, fp0, fs);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CFC1:
@@ -9673,7 +9439,6 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             gen_load_fpr32h(ctx, fp0, fs);
             tcg_gen_ext_i32_tl(t0, fp0);
-            tcg_temp_free_i32(fp0);
         }
         gen_store_gpr(t0, rt);
         break;
@@ -9684,17 +9449,13 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
 
             tcg_gen_trunc_tl_i32(fp0, t0);
             gen_store_fpr32h(ctx, fp0, fs);
-            tcg_temp_free_i32(fp0);
         }
         break;
     default:
         MIPS_INVAL("cp1 move");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
-
- out:
-    tcg_temp_free(t0);
 }
 
 static void gen_movci(DisasContext *ctx, int rd, int rs, int cc, int tf)
@@ -9718,7 +9479,6 @@ static void gen_movci(DisasContext *ctx, int rd, int rs, int cc, int tf)
     t0 = tcg_temp_new_i32();
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
-    tcg_temp_free_i32(t0);
     gen_load_gpr(cpu_gpr[rd], rs);
     gen_set_label(l1);
 }
@@ -9741,7 +9501,6 @@ static inline void gen_movcf_s(DisasContext *ctx, int fs, int fd, int cc,
     gen_load_fpr32(ctx, t0, fs);
     gen_store_fpr32(ctx, t0, fd);
     gen_set_label(l1);
-    tcg_temp_free_i32(t0);
 }
 
 static inline void gen_movcf_d(DisasContext *ctx, int fs, int fd, int cc,
@@ -9760,11 +9519,9 @@ static inline void gen_movcf_d(DisasContext *ctx, int fs, int fd, int cc,
 
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
-    tcg_temp_free_i32(t0);
     fp0 = tcg_temp_new_i64();
     gen_load_fpr64(ctx, fp0, fs);
     gen_store_fpr64(ctx, fp0, fd);
-    tcg_temp_free_i64(fp0);
     gen_set_label(l1);
 }
 
@@ -9792,7 +9549,6 @@ static inline void gen_movcf_ps(DisasContext *ctx, int fs, int fd,
     tcg_gen_brcondi_i32(cond, t0, 0, l2);
     gen_load_fpr32h(ctx, t0, fs);
     gen_store_fpr32h(ctx, t0, fd);
-    tcg_temp_free_i32(t0);
     gen_set_label(l2);
 }
 
@@ -9827,10 +9583,6 @@ static void gen_sel_s(DisasContext *ctx, enum fopcode op1, int fd, int ft,
     }
 
     gen_store_fpr32(ctx, fp0, fd);
-    tcg_temp_free_i32(fp2);
-    tcg_temp_free_i32(fp1);
-    tcg_temp_free_i32(fp0);
-    tcg_temp_free_i32(t1);
 }
 
 static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
@@ -9864,10 +9616,6 @@ static void gen_sel_d(DisasContext *ctx, enum fopcode op1, int fd, int ft,
     }
 
     gen_store_fpr64(ctx, fp0, fd);
-    tcg_temp_free_i64(fp2);
-    tcg_temp_free_i64(fp1);
-    tcg_temp_free_i64(fp0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_farith(DisasContext *ctx, enum fopcode op1,
@@ -9883,9 +9631,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_add_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SUB_S:
@@ -9896,9 +9642,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_sub_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MUL_S:
@@ -9909,9 +9653,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_mul_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_DIV_S:
@@ -9922,9 +9664,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_div_s(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SQRT_S:
@@ -9934,7 +9674,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_sqrt_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_ABS_S:
@@ -9948,7 +9687,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_abs_s(fp0, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MOV_S:
@@ -9957,7 +9695,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr32(ctx, fp0, fs);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_NEG_S:
@@ -9971,7 +9708,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_chs_s(fp0, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_ROUND_L_S:
@@ -9986,9 +9722,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_round_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_TRUNC_L_S:
@@ -10003,9 +9737,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_trunc_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CEIL_L_S:
@@ -10020,9 +9752,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_ceil_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_FLOOR_L_S:
@@ -10037,9 +9767,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_floor_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_ROUND_W_S:
@@ -10053,7 +9781,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_round_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_TRUNC_W_S:
@@ -10067,7 +9794,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_trunc_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CEIL_W_S:
@@ -10081,7 +9807,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_ceil_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_FLOOR_W_S:
@@ -10095,7 +9820,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_floor_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SEL_S:
@@ -10126,7 +9850,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, fs);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
             gen_set_label(l1);
         }
         break;
@@ -10141,7 +9864,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 fp0 = tcg_temp_new_i32();
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
                 gen_set_label(l1);
             }
         }
@@ -10153,7 +9875,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_recip_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_RSQRT_S:
@@ -10163,7 +9884,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_rsqrt_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MADDF_S:
@@ -10177,9 +9897,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp2, fd);
             gen_helper_float_maddf_s(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MSUBF_S:
@@ -10193,9 +9910,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp2, fd);
             gen_helper_float_msubf_s(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_RINT_S:
@@ -10205,7 +9919,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_rint_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CLASS_S:
@@ -10215,7 +9928,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_class_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_MIN_S: /* OPC_RECIP2_S */
@@ -10228,9 +9940,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_min_s(fp2, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RECIP2_S */
             check_cp1_64bitmode(ctx);
@@ -10241,9 +9950,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_load_fpr32(ctx, fp1, ft);
                 gen_helper_float_recip2_s(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i32(fp1);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10257,9 +9964,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_mina_s(fp2, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RECIP1_S */
             check_cp1_64bitmode(ctx);
@@ -10269,7 +9973,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_helper_float_recip1_s(fp0, cpu_env, fp0);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10282,8 +9985,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_max_s(fp1, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp1, fd);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RSQRT1_S */
             check_cp1_64bitmode(ctx);
@@ -10293,7 +9994,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_helper_float_rsqrt1_s(fp0, cpu_env, fp0);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10306,8 +10006,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_helper_float_maxa_s(fp1, cpu_env, fp0, fp1);
             gen_store_fpr32(ctx, fp1, fd);
-            tcg_temp_free_i32(fp1);
-            tcg_temp_free_i32(fp0);
         } else {
             /* OPC_RSQRT2_S */
             check_cp1_64bitmode(ctx);
@@ -10318,9 +10016,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr32(ctx, fp0, fs);
                 gen_load_fpr32(ctx, fp1, ft);
                 gen_helper_float_rsqrt2_s(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i32(fp1);
                 gen_store_fpr32(ctx, fp0, fd);
-                tcg_temp_free_i32(fp0);
             }
         }
         break;
@@ -10332,9 +10028,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr32(ctx, fp32, fs);
             gen_helper_float_cvtd_s(fp64, cpu_env, fp32);
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CVT_W_S:
@@ -10348,7 +10042,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_cvt_w_s(fp0, cpu_env, fp0);
             }
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CVT_L_S:
@@ -10363,9 +10056,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_cvt_l_s(fp64, cpu_env, fp32);
             }
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CVT_PS_S:
@@ -10378,10 +10069,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp32_0, fs);
             gen_load_fpr32(ctx, fp32_1, ft);
             tcg_gen_concat_i32_i64(fp64, fp32_1, fp32_0);
-            tcg_temp_free_i32(fp32_1);
-            tcg_temp_free_i32(fp32_0);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CMP_F_S:
@@ -10416,9 +10104,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_add_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SUB_D:
@@ -10430,9 +10116,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_sub_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MUL_D:
@@ -10444,9 +10128,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_mul_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_DIV_D:
@@ -10458,9 +10140,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_div_d(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SQRT_D:
@@ -10471,7 +10151,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_sqrt_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ABS_D:
@@ -10486,7 +10165,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_abs_d(fp0, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MOV_D:
@@ -10496,7 +10174,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_NEG_D:
@@ -10511,7 +10188,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_chs_d(fp0, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ROUND_L_D:
@@ -10526,7 +10202,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_round_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_TRUNC_L_D:
@@ -10541,7 +10216,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_trunc_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CEIL_L_D:
@@ -10556,7 +10230,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_ceil_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_FLOOR_L_D:
@@ -10571,7 +10244,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_floor_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ROUND_W_D:
@@ -10586,9 +10258,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_round_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_TRUNC_W_D:
@@ -10603,9 +10273,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_trunc_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CEIL_W_D:
@@ -10620,9 +10288,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_ceil_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_FLOOR_W_D:
@@ -10637,9 +10303,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_floor_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_SEL_D:
@@ -10670,7 +10334,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
             gen_set_label(l1);
         }
         break;
@@ -10685,7 +10348,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 fp0 = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
                 gen_set_label(l1);
             }
         }
@@ -10698,7 +10360,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_recip_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RSQRT_D:
@@ -10709,7 +10370,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_rsqrt_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MADDF_D:
@@ -10723,9 +10383,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp2, fd);
             gen_helper_float_maddf_d(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MSUBF_D:
@@ -10739,9 +10396,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp2, fd);
             gen_helper_float_msubf_d(fp2, cpu_env, fp0, fp1, fp2);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RINT_D:
@@ -10751,7 +10405,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_rint_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CLASS_D:
@@ -10761,7 +10414,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_class_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MIN_D: /* OPC_RECIP2_D */
@@ -10773,8 +10425,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_min_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RECIP2_D */
             check_cp1_64bitmode(ctx);
@@ -10785,9 +10435,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_load_fpr64(ctx, fp1, ft);
                 gen_helper_float_recip2_d(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i64(fp1);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10800,8 +10448,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_mina_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RECIP1_D */
             check_cp1_64bitmode(ctx);
@@ -10811,7 +10457,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_helper_float_recip1_d(fp0, cpu_env, fp0);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10824,8 +10469,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_max_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RSQRT1_D */
             check_cp1_64bitmode(ctx);
@@ -10835,7 +10478,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_helper_float_rsqrt1_d(fp0, cpu_env, fp0);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10848,8 +10490,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_maxa_d(fp1, cpu_env, fp0, fp1);
             gen_store_fpr64(ctx, fp1, fd);
-            tcg_temp_free_i64(fp1);
-            tcg_temp_free_i64(fp0);
         } else {
             /* OPC_RSQRT2_D */
             check_cp1_64bitmode(ctx);
@@ -10860,9 +10500,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_load_fpr64(ctx, fp1, ft);
                 gen_helper_float_rsqrt2_d(fp0, cpu_env, fp0, fp1);
-                tcg_temp_free_i64(fp1);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
             }
         }
         break;
@@ -10897,9 +10535,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp64, fs);
             gen_helper_float_cvts_d(fp32, cpu_env, fp64);
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CVT_W_D:
@@ -10914,9 +10550,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             } else {
                 gen_helper_float_cvt_w_d(fp32, cpu_env, fp64);
             }
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CVT_L_D:
@@ -10931,7 +10565,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_S_W:
@@ -10941,7 +10574,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_cvts_w(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CVT_D_W:
@@ -10952,9 +10584,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr32(ctx, fp32, fs);
             gen_helper_float_cvtd_w(fp64, cpu_env, fp32);
-            tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
         }
         break;
     case OPC_CVT_S_L:
@@ -10965,9 +10595,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp64, fs);
             gen_helper_float_cvts_l(fp32, cpu_env, fp64);
-            tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
         }
         break;
     case OPC_CVT_D_L:
@@ -10978,7 +10606,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_cvtd_l(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_PS_PW:
@@ -10989,7 +10616,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_cvtps_pw(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ADD_PS:
@@ -11001,9 +10627,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_add_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SUB_PS:
@@ -11015,9 +10639,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_sub_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MUL_PS:
@@ -11029,9 +10651,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_mul_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_ABS_PS:
@@ -11042,7 +10662,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_abs_ps(fp0, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MOV_PS:
@@ -11052,7 +10671,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
 
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_NEG_PS:
@@ -11063,7 +10681,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_chs_ps(fp0, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MOVCF_PS:
@@ -11082,7 +10699,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
             gen_set_label(l1);
         }
         break;
@@ -11097,7 +10713,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
                 fp0 = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp0, fs);
                 gen_store_fpr64(ctx, fp0, fd);
-                tcg_temp_free_i64(fp0);
                 gen_set_label(l1);
             }
         }
@@ -11111,9 +10726,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, ft);
             gen_load_fpr64(ctx, fp1, fs);
             gen_helper_float_addr_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_MULR_PS:
@@ -11125,9 +10738,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, ft);
             gen_load_fpr64(ctx, fp1, fs);
             gen_helper_float_mulr_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RECIP2_PS:
@@ -11139,9 +10750,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_recip2_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RECIP1_PS:
@@ -11152,7 +10761,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_recip1_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RSQRT1_PS:
@@ -11163,7 +10771,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_rsqrt1_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_RSQRT2_PS:
@@ -11175,9 +10782,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_load_fpr64(ctx, fp1, ft);
             gen_helper_float_rsqrt2_ps(fp0, cpu_env, fp0, fp1);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_S_PU:
@@ -11188,7 +10793,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32h(ctx, fp0, fs);
             gen_helper_float_cvts_pu(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_CVT_PW_PS:
@@ -11199,7 +10803,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr64(ctx, fp0, fs);
             gen_helper_float_cvtpw_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_CVT_S_PL:
@@ -11210,7 +10813,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp0, fs);
             gen_helper_float_cvts_pl(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_PLL_PS:
@@ -11223,8 +10825,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_store_fpr32h(ctx, fp0, fd);
             gen_store_fpr32(ctx, fp1, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_PLU_PS:
@@ -11237,8 +10837,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32h(ctx, fp1, ft);
             gen_store_fpr32(ctx, fp1, fd);
             gen_store_fpr32h(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_PUL_PS:
@@ -11251,8 +10849,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32(ctx, fp1, ft);
             gen_store_fpr32(ctx, fp1, fd);
             gen_store_fpr32h(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_PUU_PS:
@@ -11265,8 +10861,6 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
             gen_load_fpr32h(ctx, fp1, ft);
             gen_store_fpr32(ctx, fp1, fd);
             gen_store_fpr32h(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
         }
         break;
     case OPC_CMP_F_PS:
@@ -11324,7 +10918,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL);
             tcg_gen_trunc_tl_i32(fp0, t0);
             gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_LDXC1:
@@ -11334,7 +10927,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i64 fp0 = tcg_temp_new_i64();
             tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_LUXC1:
@@ -11345,7 +10937,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
 
             tcg_gen_qemu_ld_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
             gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SWXC1:
@@ -11354,7 +10945,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i32 fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, fs);
             tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL);
-            tcg_temp_free_i32(fp0);
         }
         break;
     case OPC_SDXC1:
@@ -11364,7 +10954,6 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i64 fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_temp_free_i64(fp0);
         }
         break;
     case OPC_SUXC1:
@@ -11374,11 +10963,9 @@ static void gen_flt3_ldst(DisasContext *ctx, uint32_t opc,
             TCGv_i64 fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
             tcg_gen_qemu_st_i64(fp0, t0, ctx->mem_idx, MO_TEUQ);
-            tcg_temp_free_i64(fp0);
         }
         break;
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
@@ -11405,7 +10992,6 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             tcg_gen_br(l2);
             gen_set_label(l1);
             tcg_gen_brcondi_tl(TCG_COND_NE, t0, 4, l2);
-            tcg_temp_free(t0);
             if (cpu_is_bigendian(ctx)) {
                 gen_load_fpr32(ctx, fp, fs);
                 gen_load_fpr32h(ctx, fph, ft);
@@ -11418,8 +11004,6 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
                 gen_store_fpr32h(ctx, fp, fd);
             }
             gen_set_label(l2);
-            tcg_temp_free_i32(fp);
-            tcg_temp_free_i32(fph);
         }
         break;
     case OPC_MADD_S:
@@ -11433,10 +11017,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_madd_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_MADD_D:
@@ -11451,10 +11032,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_madd_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_MADD_PS:
@@ -11468,10 +11046,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_madd_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_MSUB_S:
@@ -11485,10 +11060,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_msub_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_MSUB_D:
@@ -11503,10 +11075,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_msub_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_MSUB_PS:
@@ -11520,10 +11089,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_msub_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMADD_S:
@@ -11537,10 +11103,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_nmadd_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_NMADD_D:
@@ -11555,10 +11118,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmadd_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMADD_PS:
@@ -11572,10 +11132,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmadd_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMSUB_S:
@@ -11589,10 +11146,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr32(ctx, fp1, ft);
             gen_load_fpr32(ctx, fp2, fr);
             gen_helper_float_nmsub_s(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i32(fp0);
-            tcg_temp_free_i32(fp1);
             gen_store_fpr32(ctx, fp2, fd);
-            tcg_temp_free_i32(fp2);
         }
         break;
     case OPC_NMSUB_D:
@@ -11607,10 +11161,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmsub_d(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     case OPC_NMSUB_PS:
@@ -11624,10 +11175,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_load_fpr64(ctx, fp1, ft);
             gen_load_fpr64(ctx, fp2, fr);
             gen_helper_float_nmsub_ps(fp2, cpu_env, fp0, fp1, fp2);
-            tcg_temp_free_i64(fp0);
-            tcg_temp_free_i64(fp1);
             gen_store_fpr64(ctx, fp2, fd);
-            tcg_temp_free_i64(fp2);
         }
         break;
     default:
@@ -11716,7 +11264,6 @@ void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
         gen_reserved_instruction(ctx);
         break;
     }
-    tcg_temp_free(t0);
 }
 
 static inline void clear_branch_hflags(DisasContext *ctx)
@@ -11775,11 +11322,9 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
 
                 tcg_gen_andi_tl(t0, btarget, 0x1);
                 tcg_gen_trunc_tl_i32(t1, t0);
-                tcg_temp_free(t0);
                 tcg_gen_andi_i32(hflags, hflags, ~(uint32_t)MIPS_HFLAG_M16);
                 tcg_gen_shli_i32(t1, t1, MIPS_HFLAG_M16_SHIFT);
                 tcg_gen_or_i32(hflags, hflags, t1);
-                tcg_temp_free_i32(t1);
 
                 tcg_gen_andi_tl(cpu_PC, btarget, ~(target_ulong)0x1);
             } else {
@@ -11809,7 +11354,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
                   "\n", ctx->base.pc_next);
 #endif
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     /* Load needed operands and calculate btarget */
@@ -11863,13 +11408,12 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
 
             gen_load_gpr(tbase, rt);
             gen_op_addr_add(ctx, btarget, tbase, toffset);
-            tcg_temp_free(tbase);
         }
         break;
     default:
         MIPS_INVAL("Compact branch/jump");
         gen_reserved_instruction(ctx);
-        goto out;
+        return;
     }
 
     if (bcond_compute == 0) {
@@ -11890,7 +11434,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         default:
             MIPS_INVAL("Compact branch/jump");
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
 
         /* Generating branch here as compact branches don't have delay slot */
@@ -11980,10 +11524,6 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
                     /* OPC_BNVC */
                     tcg_gen_brcondi_tl(tcg_invert_cond(TCG_COND_EQ), t4, 0, fs);
                 }
-                tcg_temp_free(input_overflow);
-                tcg_temp_free(t4);
-                tcg_temp_free(t3);
-                tcg_temp_free(t2);
             } else if (rs < rt && rs == 0) {
                 /* OPC_BEQZALC, OPC_BNEZALC */
                 if (opc == OPC_BEQZALC) {
@@ -12013,7 +11553,7 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         default:
             MIPS_INVAL("Compact conditional branch/jump");
             gen_reserved_instruction(ctx);
-            goto out;
+            return;
         }
 
         /* Generating branch here as compact branches don't have delay slot */
@@ -12022,10 +11562,6 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
 
         ctx->hflags |= MIPS_HFLAG_FBNSLOT;
     }
-
-out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 void gen_addiupc(DisasContext *ctx, int rx, int imm,
@@ -12045,8 +11581,6 @@ void gen_addiupc(DisasContext *ctx, int rx, int imm,
     if (!is_64_bit) {
         tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
     }
-
-    tcg_temp_free(t0);
 }
 
 static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
@@ -12056,8 +11590,6 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     TCGv t1 = tcg_temp_new();
     gen_base_offset_addr(ctx, t1, base, offset);
     gen_helper_cache(cpu_env, t1, t0);
-    tcg_temp_free(t1);
-    tcg_temp_free_i32(t0);
 }
 
 static inline bool is_uhi(DisasContext *ctx, int sdbbp_code)
@@ -12085,9 +11617,6 @@ void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL);
     gen_store_gpr(t1, rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_sync(int stype)
@@ -12191,7 +11720,6 @@ static void gen_mips_lx(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -12405,7 +11933,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
                 TCGv_i32 sa_t = tcg_const_i32(v2);
                 gen_helper_precr_sra_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                           cpu_gpr[ret]);
-                tcg_temp_free_i32(sa_t);
                 break;
             }
         case OPC_PRECR_SRA_R_PH_W:
@@ -12414,7 +11941,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
                 TCGv_i32 sa_t = tcg_const_i32(v2);
                 gen_helper_precr_sra_r_ph_w(cpu_gpr[ret], sa_t, v1_t,
                                             cpu_gpr[ret]);
-                tcg_temp_free_i32(sa_t);
                 break;
             }
         case OPC_PRECRQ_PH_W:
@@ -12603,7 +12129,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
             {
                 TCGv_i32 ret_t = tcg_const_i32(ret);
                 gen_helper_precr_sra_qh_pw(v2_t, v1_t, v2_t, ret_t);
-                tcg_temp_free_i32(ret_t);
                 break;
             }
         case OPC_PRECR_SRA_R_QH_PW:
@@ -12611,7 +12136,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
             {
                 TCGv_i32 sa_v = tcg_const_i32(ret);
                 gen_helper_precr_sra_r_qh_pw(v2_t, v1_t, v2_t, sa_v);
-                tcg_temp_free_i32(sa_v);
                 break;
             }
         case OPC_PRECRQ_OB_QH:
@@ -12638,9 +12162,6 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
@@ -12880,10 +12401,6 @@ static void gen_mipsdsp_shift(DisasContext *ctx, uint32_t opc,
         break;
 #endif
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -13190,10 +12707,6 @@ static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-
-    tcg_temp_free_i32(t0);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_bitinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -13330,8 +12843,6 @@ static void gen_mipsdsp_bitinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-    tcg_temp_free(t0);
-    tcg_temp_free(val_t);
 }
 
 static void gen_mipsdsp_add_cmp_pick(DisasContext *ctx,
@@ -13514,10 +13025,6 @@ static void gen_mipsdsp_add_cmp_pick(DisasContext *ctx,
         break;
 #endif
     }
-
-    tcg_temp_free(t1);
-    tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
@@ -13605,7 +13112,6 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
         break;
 #endif
     }
-    tcg_temp_free(t0);
 }
 
 static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
@@ -13822,10 +13328,6 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
         break;
 #endif
     }
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(v1_t);
 }
 
 /* End MIPSDSP functions. */
@@ -14676,9 +14178,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
                 gen_load_gpr(t1, rs);
 
                 gen_helper_insv(cpu_gpr[rt], cpu_env, t1, t0);
-
-                tcg_temp_free(t0);
-                tcg_temp_free(t1);
                 break;
             }
         default:            /* Invalid */
@@ -14948,9 +14447,6 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t1, rs);
 
             gen_helper_dinsv(cpu_gpr[rt], cpu_env, t1, t0);
-
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
             break;
         }
         default:            /* Invalid */
@@ -15177,8 +14673,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rt);
             gen_load_gpr(t1, rs);
             gen_helper_fork(t0, t1);
-            tcg_temp_free(t0);
-            tcg_temp_free(t1);
         }
         break;
     case OPC_YIELD:
@@ -15189,7 +14683,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             gen_load_gpr(t0, rs);
             gen_helper_yield(t0, cpu_env, t0);
             gen_store_gpr(t0, rd);
-            tcg_temp_free(t0);
         }
         break;
     default:
@@ -15432,7 +14925,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
                     gen_reserved_instruction(ctx);
                     break;
                 }
-                tcg_temp_free(t0);
             }
 #endif /* !CONFIG_USER_ONLY */
             break;
@@ -15880,7 +15372,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
                 TCGv t0 = tcg_temp_new();
                 gen_load_gpr(t0, rs);
                 tcg_gen_addi_tl(cpu_gpr[rt], t0, imm << 16);
-                tcg_temp_free(t0);
             }
 #else
             gen_reserved_instruction(ctx);
-- 
2.34.1


