Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C22DD3A2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:03:03 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuo3-0004Fz-0D
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue6-0003eZ-4q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:46 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:33209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue0-0004yl-PT
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:45 -0500
Received: by mail-ot1-x330.google.com with SMTP id b24so10013714otj.0
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T6zl2uASh6CoYxMghgzJy0NJ+a9C4k9ZiM/l/5q4INQ=;
 b=se/fnTbuLkaUXpDfymgz1dYtTY5eNLpYKZ4aW3+Y+ItR1PK0XCiQQeKtfdkVaywcCF
 fuITDGg+GZRY2tdS36L0axuYDzbOjcxj5lyFrQE8EGbHZG03DA3gRbZpa7Tk4mhyLt46
 f6hXT86Ss7VyTsyE3JEiDUljDl0FDix5v65HEydq2daPN0Fbtt5UXwSulGv6ttEXthG9
 82odBtsbY6omOA7tDNmJwWguZmp3M7u5FQiYHdwLRZlWIzs5305bt4E4eKvzUIaXFAEt
 heH4dfgCz0wzBBCzsVug/YJZRsoJWtAhUK2ZtAUmjlshEJip+55HvMOYN2L2UQOZCZqc
 SCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T6zl2uASh6CoYxMghgzJy0NJ+a9C4k9ZiM/l/5q4INQ=;
 b=HYFJIvMbtsmj7I92St21Rgn+p/TBjF+aWe9Zpk4eeDjQPH32SLSdBG6A49kOtgiNCl
 isB5CcaZAVgkagwMXWwrnRiOYdl8vooXtoqRTWClXOAzVDEYEwiC6nu0PDbrFl1KtN7o
 OV9C5L3Qwav9Axn8Se/IfQIGNiv44/W+hem4ezc3TdvPpaddWN9JLVKecZIRX1wmTDMG
 jcw/SdJtSfPKHuovlVk0BBUeMla9o38ylc+e13jwmbV4IPxXF8GXQLJGsIwKCpdlGqvn
 Y0ke1m99NXhqZoJIG4U87a/QGsDM0hCjAlayfMWVbWAfO37Rog504K2DXkXTeY9/SJZK
 /ocw==
X-Gm-Message-State: AOAM530GE39XXJf9DsLLegFtRXl82g3ra+wCoLdhORn+tmTF2sID4glm
 DOoWNvqwH8Xp5RqRopz8p5UvKZLnqA6Kt6Ta
X-Google-Smtp-Source: ABdhPJwwhldKW7o93tCdp7yRu51OBi4ifgACys0vG85A4RFQNbPp+T6Qc2Vz2dEmKlP6R2vwCEnFAg==
X-Received: by 2002:a05:6830:916:: with SMTP id
 v22mr30201162ott.257.1608216757770; 
 Thu, 17 Dec 2020 06:52:37 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/23] tcg: Remove movi and dupi opcodes
Date: Thu, 17 Dec 2020 08:52:10 -0600
Message-Id: <20201217145215.534637-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
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
index 314455b386..2e5860a057 100644
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
@@ -216,7 +214,6 @@ DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
 #define IMPLVEC  TCG_OPF_VECTOR | IMPL(TCG_TARGET_MAYBE_vec)
 
 DEF(mov_vec, 1, 1, 0, TCG_OPF_VECTOR | TCG_OPF_NOT_PRESENT)
-DEF(dupi_vec, 1, 0, 1, TCG_OPF_VECTOR | TCG_OPF_NOT_PRESENT)
 
 DEF(dup_vec, 1, 1, 0, IMPLVEC)
 DEF(dup2_vec, 1, 2, 0, IMPLVEC | IMPL(TCG_TARGET_REG_BITS == 32))
diff --git a/tcg/optimize.c b/tcg/optimize.c
index af07c6f628..1a94e9a41b 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1099,10 +1099,6 @@ void tcg_optimize(TCGContext *s)
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
index 231d1950ed..8def2f99e6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1511,7 +1511,6 @@ bool tcg_op_supported(TCGOpcode op)
         return TCG_TARGET_HAS_goto_ptr;
 
     case INDEX_op_mov_i32:
-    case INDEX_op_movi_i32:
     case INDEX_op_setcond_i32:
     case INDEX_op_brcond_i32:
     case INDEX_op_ld8u_i32:
@@ -1605,7 +1604,6 @@ bool tcg_op_supported(TCGOpcode op)
         return TCG_TARGET_REG_BITS == 32;
 
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i64:
     case INDEX_op_setcond_i64:
     case INDEX_op_brcond_i64:
     case INDEX_op_ld8u_i64:
@@ -1711,7 +1709,6 @@ bool tcg_op_supported(TCGOpcode op)
 
     case INDEX_op_mov_vec:
     case INDEX_op_dup_vec:
-    case INDEX_op_dupi_vec:
     case INDEX_op_dupm_vec:
     case INDEX_op_ld_vec:
     case INDEX_op_st_vec:
@@ -3616,7 +3613,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
 }
 
 /*
- * Specialized code generation for INDEX_op_movi_*.
+ * Specialized code generation for INDEX_op_mov_* with a constant.
  */
 static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
                                   tcg_target_ulong val, TCGLifeData arg_life,
@@ -3639,14 +3636,6 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
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
@@ -4422,11 +4411,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
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
index 56056be74b..a6c2d54c4d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2252,8 +2252,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
@@ -2461,7 +2459,6 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 62c37a954b..30d30874c7 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2065,7 +2065,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6b7cbaa47a..819ee25cff 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2692,8 +2692,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
@@ -2979,7 +2977,6 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 41be574e89..39e7bc3f8d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2152,8 +2152,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 2428faeabd..163a5bb32c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2973,8 +2973,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
     case INDEX_op_mov_i32:   /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32:  /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
@@ -3322,7 +3320,6 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         return;
 
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
-    case INDEX_op_dupi_vec: /* Always emitted via tcg_out_movi.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d536f3ccc1..aaef1c5eed 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1602,8 +1602,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         g_assert_not_reached();
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index c5e096449b..824a07aa7a 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -2306,8 +2306,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
-    case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
-    case INDEX_op_movi_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     default:
         tcg_abort();
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 6775bd30fc..79e1a96aac 100644
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
index c8c8386a72..25ed868505 100644
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


