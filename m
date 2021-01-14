Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A102F5737
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:27:53 +0100 (CET)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsMa-00076k-Vh
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCe-0003j7-Cw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:36 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCZ-0003Vw-VE
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id j13so2363662pjz.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PUT18bxTLpzRRRoEviVs6pgnmvprIFhDnDdP6GN/+R0=;
 b=CJ29DlFXaa8qsmnRxBgGnHRhSXs5y9ewPy876/3DmOP8gZnO0VjzmNIOCybP7ZqCDk
 MOBoKtv+N1NcGvgs6Bg4oA9HQOl5TyiQe3ipfhlG4UI/RqZ4xaUFIX3EF4gwaWF/WEz0
 pWscH8bFTfLqiOES8a9qg11PxIrVCWBd3UKO+o6Ff83Cuetm4/3A12Hfp9zpZBJQTCOM
 Sdlh+8lmFfj2uNfNoHG3Vb5Z0/rEnJwfz7YuNeihyfJTMB2nCo0hk4dFC46Rr5OUCYcT
 sL1FEVPS5g+ZR6/RlhLtQ4SWu3xlbW9iBoILcnTyhUKD2P6HnsoVhlLb4ODQiVOZJEWl
 fWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PUT18bxTLpzRRRoEviVs6pgnmvprIFhDnDdP6GN/+R0=;
 b=JnQML6b2+or5kgYiDNdORhB/mOSDPdhUo3IckCgOOnkWk7kcSWzhiI2AsZEehUmjhV
 eU5jb7btz0s2afIx7AKJ4JfT/gtqCKRH7nZUyGRVF66ZUxLFpONnus1pDy0p5nWIrpYQ
 xBIbmHecs9k6GeNVTHveSfDFzyNEOXd3DViZInsCKcy1aY+1o+ME67Hlh7KwxNGWAXkW
 kFmaOfIWnBcWFoSOGKdtVzPjmIsajG7O/t+A+GLuHuJKZC5LhhB1Ow4HdORlevoWyCM/
 6pgG3+T9DCQs4pi0YnlE+t4vlCHeoBNpizqIxvZFXB9sAV+lDncNKKW9+L5sfCpoL756
 96dw==
X-Gm-Message-State: AOAM530iharnFl8DeCq0f4uI6KSomYgAsabrQzaR9JDhIxvGSjHTkIlS
 Rz5O1TGczsSVOCc7VWumVmQB9PNiDva+bA==
X-Google-Smtp-Source: ABdhPJztkkFjxe95iCg3nSQ1qTh3oaZBZ9Eqb7mzKkwM4KHmigPoqapjPAIstPcZspZYfyhjW1HVaw==
X-Received: by 2002:a17:902:b213:b029:db:3a3e:d8ad with SMTP id
 t19-20020a170902b213b02900db3a3ed8admr5439403plr.73.1610590648612; 
 Wed, 13 Jan 2021 18:17:28 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] tcg: Remove movi and dupi opcodes
Date: Wed, 13 Jan 2021 16:16:48 -1000
Message-Id: <20210114021654.647242-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are now completely covered by mov from a
TYPE_CONST temporary.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-opc.h        |  3 ---
 tcg/optimize.c               |  4 ----
 tcg/tcg-op-vec.c             |  1 -
 tcg/tcg.c                    | 18 +-----------------
 tcg/aarch64/tcg-target.c.inc |  3 ---
 tcg/arm/tcg-target.c.inc     |  1 -
 tcg/i386/tcg-target.c.inc    |  3 ---
 tcg/mips/tcg-target.c.inc    |  2 --
 tcg/ppc/tcg-target.c.inc     |  3 ---
 tcg/riscv/tcg-target.c.inc   |  2 --
 tcg/s390/tcg-target.c.inc    |  2 --
 tcg/sparc/tcg-target.c.inc   |  2 --
 tcg/tci/tcg-target.c.inc     |  2 --
 13 files changed, 1 insertion(+), 45 deletions(-)

diff --git a/include/tcg/tcg-opc.h b/include/tcg/tcg-opc.h
index 43711634f6..900984c005 100644
--- a/include/tcg/tcg-opc.h
+++ b/include/tcg/tcg-opc.h
@@ -45,7 +45,6 @@ DEF(br, 0, 0, 1, TCG_OPF_BB_END)
 DEF(mb, 0, 0, 1, 0)
 
 DEF(mov_i32, 1, 1, 0, TCG_OPF_NOT_PRESENT)
-DEF(movi_i32, 1, 0, 1, TCG_OPF_NOT_PRESENT)
 DEF(setcond_i32, 1, 2, 1, 0)
 DEF(movcond_i32, 1, 4, 1, IMPL(TCG_TARGET_HAS_movcond_i32))
 /* load/store */
@@ -111,7 +110,6 @@ DEF(ctz_i32, 1, 2, 0, IMPL(TCG_TARGET_HAS_ctz_i32))
 DEF(ctpop_i32, 1, 1, 0, IMPL(TCG_TARGET_HAS_ctpop_i32))
 
 DEF(mov_i64, 1, 1, 0, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
-DEF(movi_i64, 1, 0, 1, TCG_OPF_64BIT | TCG_OPF_NOT_PRESENT)
 DEF(setcond_i64, 1, 2, 1, IMPL64)
 DEF(movcond_i64, 1, 4, 1, IMPL64 | IMPL(TCG_TARGET_HAS_movcond_i64))
 /* load/store */
@@ -221,7 +219,6 @@ DEF(qemu_st8_i32, 0, TLADDR_ARGS + 1, 1,
 #define IMPLVEC  TCG_OPF_VECTOR | IMPL(TCG_TARGET_MAYBE_vec)
 
 DEF(mov_vec, 1, 1, 0, TCG_OPF_VECTOR | TCG_OPF_NOT_PRESENT)
-DEF(dupi_vec, 1, 0, 1, TCG_OPF_VECTOR | TCG_OPF_NOT_PRESENT)
 
 DEF(dup_vec, 1, 1, 0, IMPLVEC)
 DEF(dup2_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_REG_BITS == 32))
diff --git a/tcg/optimize.c b/tcg/optimize.c
index dbb03ef96b..37c902283e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1103,10 +1103,6 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(mov):
             tcg_opt_gen_mov(s, op, op->args[0], op->args[1]);
             break;
-        CASE_OP_32_64(movi):
-        case INDEX_op_dupi_vec:
-            tcg_opt_gen_movi(s, &temps_used, op, op->args[0], op->args[1]);
-            break;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 9fbed1366c..ce0d2f6e0e 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -83,7 +83,6 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
         case INDEX_op_xor_vec:
         case INDEX_op_mov_vec:
         case INDEX_op_dup_vec:
-        case INDEX_op_dupi_vec:
         case INDEX_op_dup2_vec:
         case INDEX_op_ld_vec:
         case INDEX_op_st_vec:
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1cadfe070c..5b0e42be91 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1564,7 +1564,6 @@ bool tcg_op_supported(TCGOpcode op)
         return TCG_TARGET_HAS_goto_ptr;
 
     case INDEX_op_mov_i32:
-    case INDEX_op_movi_i32:
     case INDEX_op_setcond_i32:
     case INDEX_op_brcond_i32:
     case INDEX_op_ld8u_i32:
@@ -1658,7 +1657,6 @@ bool tcg_op_supported(TCGOpcode op)
         return TCG_TARGET_REG_BITS == 32;
 
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i64:
     case INDEX_op_setcond_i64:
     case INDEX_op_brcond_i64:
     case INDEX_op_ld8u_i64:
@@ -1764,7 +1762,6 @@ bool tcg_op_supported(TCGOpcode op)
 
     case INDEX_op_mov_vec:
     case INDEX_op_dup_vec:
-    case INDEX_op_dupi_vec:
     case INDEX_op_dupm_vec:
     case INDEX_op_ld_vec:
     case INDEX_op_st_vec:
@@ -3670,7 +3667,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
 }
 
 /*
- * Specialized code generation for INDEX_op_movi_*.
+ * Specialized code generation for INDEX_op_mov_* with a constant.
  */
 static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
                                   tcg_target_ulong val, TCGLifeData arg_life,
@@ -3693,14 +3690,6 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
     }
 }
 
-static void tcg_reg_alloc_movi(TCGContext *s, const TCGOp *op)
-{
-    TCGTemp *ots = arg_temp(op->args[0]);
-    tcg_target_ulong val = op->args[1];
-
-    tcg_reg_alloc_do_movi(s, ots, val, op->life, op->output_pref[0]);
-}
-
 /*
  * Specialized code generation for INDEX_op_mov_*.
  */
@@ -4481,11 +4470,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         case INDEX_op_mov_vec:
             tcg_reg_alloc_mov(s, op);
             break;
-        case INDEX_op_movi_i32:
-        case INDEX_op_movi_i64:
-        case INDEX_op_dupi_vec:
-            tcg_reg_alloc_movi(s, op);
-            break;
         case INDEX_op_dup_vec:
             tcg_reg_alloc_dup(s, op);
             break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index be6d3ea2a8..e370b7e61c 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2257,8 +2257,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
@@ -2466,7 +2464,6 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0fd1126454..c2b26b3c45 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2068,7 +2068,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 9f81e11773..1706b7c776 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2666,8 +2666,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
@@ -2953,7 +2951,6 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index add157f6c3..7293169ab2 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2141,8 +2141,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d00ec20203..1fbb1b6db0 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2977,8 +2977,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_mov_i32:   /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32:  /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
@@ -3326,7 +3324,6 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         return;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c60b91ba58..71c0badc02 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1563,8 +1563,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index d7ef079055..8517e55232 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -2295,8 +2295,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 922ae96481..28b5b6559a 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1586,8 +1586,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e9e5f94c04..15981265db 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -814,8 +814,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
-- 
2.25.1


