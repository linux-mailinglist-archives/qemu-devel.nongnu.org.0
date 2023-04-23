Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A16EBE83
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:21:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpa-0004Jp-Re; Sun, 23 Apr 2023 06:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWpF-0004D3-50
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp5-0003F6-3H
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so3086792f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245197; x=1684837197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XpZ7VfOoy2blgY0K8dFrCHaK+wPBgYeA1vgn0N1dn8=;
 b=BIsnFwfZo4BMvPJt2dZxmom0ybxrapUahKeX+2OaK7MTRi2h77T2Qp0Kav/vfIRPXO
 nH1SY619aS+gsdaue4tl/AGvHoyFoy4BqNV/xlL/SsNdCaPjGttRZpgznJHrQxlJxyV1
 qrVXRza7+VBqxMl9mbWcnrgxb2lGUF1vqT+CjL4Y7XFz3LhCZlPcFMEcVT3Shn0kmlcV
 o1YoGxPUKXMr4l58HmCsN2/ZKpAZlO8FnQUaWMgZkuxTqJwYRbev+kQT6YEEU3hzwmjL
 1CBYJPDtct5VKZdsWisT3XaJMvWESIJLhQ3axBaV+a+w+zD/9Byx/6eXlVpI0bg17oTs
 i1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245197; x=1684837197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XpZ7VfOoy2blgY0K8dFrCHaK+wPBgYeA1vgn0N1dn8=;
 b=ksOd5GMg+xO4ODdiJNCFNpxMlCEeS2zFsB0lzw3Q2hZk9qNKMOTZaOchcU8EN0ml/w
 EA4kYYhjbR4JaxfRGWhfTQzEsg/LmS+CEC1r+JgjGRf7tjfhskJ7pTbujqF+Y4VaM5T9
 dGpHSIRefMTMjOt2q8u8yPbyixhJKzlOKnuvfw4ok2hWENYNFTYXxCjQKDfqQCu8vkhd
 NqWMZzDBmXwtQ6ICJYWndH5/5VMb198ou+5gc8hCtLot2/hAQkoXUgFuM4krwDZtqcyb
 wokTuKECPM8MLfHS423Csda5h9ytMuTfeVfabPJjuInghqaIBWh6SnREA5KNedGO4qVE
 +E8A==
X-Gm-Message-State: AAQBX9fZCIfnpgWnxF3V8ESJ3vOMRcvDv12ZYE03lYQ2iSV4hjbzVbaF
 cwF6ZYY2RwyhrVYJo6Az7TAxPfdiJugukix3mnAW6w==
X-Google-Smtp-Source: AKy350ZWxoZlumbN7GXNDCXwN01K3Couve7ttAu7FZFeaX32o1SHjGGE+G8sWiXB2cfCJ/lxppLJuQ==
X-Received: by 2002:a5d:6a09:0:b0:2fa:385b:f104 with SMTP id
 m9-20020a5d6a09000000b002fa385bf104mr7392791wru.22.1682245197578; 
 Sun, 23 Apr 2023 03:19:57 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/15] tcg: Split out tcg_out_extu_i32_i64
Date: Sun, 23 Apr 2023 11:19:45 +0100
Message-Id: <20230423101950.817899-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We will need a backend interface for type extension with zero.
Use it in tcg_reg_alloc_op in the meantime.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     | 10 ++++++----
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  7 ++++++-
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        |  9 ++++++---
 tcg/ppc/tcg-target.c.inc         | 10 ++++++----
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       | 10 ++++++----
 tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
 tcg/tci/tcg-target.c.inc         |  7 ++++++-
 11 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index b0498170ea..17bd6d4581 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -112,6 +112,7 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4533,6 +4534,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext_i32_i64:
         tcg_out_exts_i32_i64(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_extu_i32_i64:
+        tcg_out_extu_i32_i64(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 58596eaa4b..ca8b25865b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1462,6 +1462,11 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_movr(s, TCG_TYPE_I32, rd, rn);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_ext32u(s, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2265,10 +2270,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
-
     case INDEX_op_deposit_i64:
     case INDEX_op_deposit_i32:
         tcg_out_dep(s, ext, a0, REG0(2), args[3], args[4]);
@@ -2335,6 +2336,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2ca25a3d81..2135616e12 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1008,6 +1008,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index fd4c4e20c8..40d661072b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1304,6 +1304,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32s(s, dest, src);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32u(s, dest, src);
+}
+
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
 {
     tcg_out_opc(s, OPC_BSWAP + P_REXW + LOWREGMASK(reg), 0, reg, 0);
@@ -2758,7 +2763,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0);
         break;
-    case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -2841,6 +2845,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 989632e08a..6ecde0804f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -461,6 +461,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_ext32s(s, ret, arg);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32u(s, ret, arg);
+}
+
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
                            TCGReg a0, TCGReg a1, TCGReg a2,
                            bool c2, bool is_32bit)
@@ -1251,10 +1256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
-
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -1620,6 +1621,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index df36bec5c0..3e455fdb1f 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -585,6 +585,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2302,9 +2307,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
 
     case INDEX_op_sar_i32:
         i1 = OPC_SRAV, i2 = OPC_SRA;
@@ -2452,6 +2454,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e24f897765..bd298c55fd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -812,6 +812,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_ext32s(s, dst, src);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out_ext32u(s, dst, src);
+}
+
 static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
@@ -2986,10 +2991,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, args[0], args[1]);
-        break;
-
     case INDEX_op_setcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
                         const_args[2]);
@@ -3136,6 +3137,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 7bd3b421ad..064a334d82 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -607,6 +607,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_ext32s(s, ret, arg);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32u(s, ret, arg);
+}
+
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
                          TCGReg addr, intptr_t offset)
 {
@@ -1602,10 +1607,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
-
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
@@ -1644,6 +1645,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 60deaa9a95..e17d000991 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1127,6 +1127,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32s(s, dest, src);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32u(s, dest, src);
+}
+
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -2529,10 +2534,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, args[0], args[1]);
-        break;
-
     case INDEX_op_add2_i64:
         if (const_args[4]) {
             if ((int64_t)args[4] >= 0) {
@@ -2630,6 +2631,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 56ffc6ed91..c57a8c8304 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -532,6 +532,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1682,9 +1687,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         c = ARITH_UDIVX;
         goto gen_arith;
-    case INDEX_op_extu_i32_i64:
-        tcg_out_ext32u(s, a0, a1);
-        break;
     case INDEX_op_extrl_i64_i32:
         tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
         break;
@@ -1741,6 +1743,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 7886f21bf5..48c9dbd0b4 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -634,6 +634,11 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32s(s, rd, rs);
 }
 
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -792,7 +797,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(extu_i32)
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
     case INDEX_op_bswap32_i32: /* Optional (TCG_TARGET_HAS_bswap32_i32). */
     case INDEX_op_bswap64_i64: /* Optional (TCG_TARGET_HAS_bswap64_i64). */
@@ -876,6 +880,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_extu_i32_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


