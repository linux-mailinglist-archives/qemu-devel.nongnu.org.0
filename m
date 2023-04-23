Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B56EBE8D
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:22:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpQ-0004DB-FP; Sun, 23 Apr 2023 06:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp9-0004CQ-2e
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp3-0003Ec-FW
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:02 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so48272195e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245196; x=1684837196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M2Zl2DAnRJ2qJKKC+roSMIuCXL4XglBydGZ/DyhLco=;
 b=kSTN6TQQZIMSPcGgCl6g29McHHTB8ACZ0uGqD/aAu14wJWjYIuq4WAVRcFWrMrhAdw
 XXioZ9gfNBgF/uFKX9fMfuPvO+LRncGeCuuDk/jmW9FIphyjTo6Tg5ylfK6mMTcDLYGS
 E07IJ/EggZ9dJW4TZP6ZUp4nvTDlNxSUNHygULyz64fhQUKu218OG5lileldqjfaBLsD
 l/FCAt4x2flfNKQDUzh9wK2Ps/l2OVL2UtvAbL46SBrcJgO6TPdECFF5zsVqSmlFazgr
 7w64vSRPFt7nqxjc8FCwiUrUYpB/hzuGWtiaPaRvvwEYl3JJFR4jM9LFs8AUhsWXXchW
 LRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245196; x=1684837196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/M2Zl2DAnRJ2qJKKC+roSMIuCXL4XglBydGZ/DyhLco=;
 b=gi1dCFqFuWblp2OcJRlii8j26v7sio90pYGheaSz/UhFMu1JtRmURhICidudzv34iG
 bAoMG8YH8P5CEsR37/Eu8LeeE3LRoIbRSGyHktrqZSn4SwKieE7H4zEsQ47s6rD7jGvh
 xTRlTH+/MtvD9A2R9SP6lR4DPkxpT+DOnU/33HtDqi3BrsurKi9eCyfoDv7ONFlAaApV
 VaFQQ7oJyaOAYTtsMnQvRBkAK9+obYlX8lRCWzPEUJSYvKyff7VtvS2mki/6TS26ezd/
 VNF4zWSnV0zKTIejjMNZ3wC2xvki1dA/QfZN2E+K2J8TmlTouWMM6ELziAg1jPHvGoXQ
 2s4w==
X-Gm-Message-State: AAQBX9dGrt4U45MJMzoJZLMwHSa1YirANc8/vn5rSnnPUqP2KXt8qA1d
 hrfp6IL25jhaH7bOYeHYVzbtXu0iAiuy142uLH+TUA==
X-Google-Smtp-Source: AKy350ZUFtczHzalU9OshCuh/29BpBeH8ppEgIl1QD5zjy8nj/OyKmfLWlal/j8g5NHztSJNspdnzA==
X-Received: by 2002:a5d:510f:0:b0:2ef:eb45:2317 with SMTP id
 s15-20020a5d510f000000b002efeb452317mr11204770wrt.9.1682245196047; 
 Sun, 23 Apr 2023 03:19:56 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/15] tcg: Split out tcg_out_ext32s
Date: Sun, 23 Apr 2023 11:19:42 +0100
Message-Id: <20230423101950.817899-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

We will need a backend interface for performing 32-bit sign-extend.
Use it in tcg_reg_alloc_op in the meantime.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  5 +++--
 tcg/loongarch64/tcg-target.c.inc |  2 +-
 tcg/mips/tcg-target.c.inc        | 12 +++++++++---
 tcg/ppc/tcg-target.c.inc         |  5 +++--
 tcg/riscv/tcg-target.c.inc       |  2 +-
 tcg/s390x/tcg-target.c.inc       | 10 +++++-----
 tcg/sparc64/tcg-target.c.inc     | 11 ++++++++---
 tcg/tci/tcg-target.c.inc         |  9 ++++++++-
 11 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5b0db747e8..84aa8d639e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -109,6 +109,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4521,6 +4522,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext16u_i64:
         tcg_out_ext16u(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext32s_i64:
+        tcg_out_ext32s(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f55829e9ce..d7964734c3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1429,6 +1429,11 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
     tcg_out_sxt(s, type, MO_16, rd, rn);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2232,7 +2237,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap32_i64:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
-            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
+            tcg_out_ext32s(s, a0, a0);
         }
         break;
     case INDEX_op_bswap32_i32:
@@ -2251,7 +2256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
@@ -2322,6 +2326,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8fa0c6cbc0..401769bdd6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -993,6 +993,11 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_ext16u_cond(s, COND_AL, rd, rn);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 74a0c1885e..f4ac877aba 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1293,8 +1293,9 @@ static inline void tcg_out_ext32u(TCGContext *s, int dest, int src)
     tcg_out_modrm(s, OPC_MOVL_GvEv, dest, src);
 }
 
-static inline void tcg_out_ext32s(TCGContext *s, int dest, int src)
+static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
 {
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_out_modrm(s, OPC_MOVSLQ, dest, src);
 }
 
@@ -2758,7 +2759,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_extrh_i64_i32:
@@ -2837,6 +2837,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 08c2b65b19..037474510c 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1251,7 +1251,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
@@ -1615,6 +1614,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 220060c821..c57ccb6b3d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -574,6 +574,12 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xffff);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_out_opc_sa(s, OPC_SLL, rd, rs, 0);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1313,7 +1319,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     /* delay slot */
     if (TCG_TARGET_REG_BITS == 64 && l->type == TCG_TYPE_I32) {
         /* we always sign-extend 32-bit loads */
-        tcg_out_opc_sa(s, OPC_SLL, v0, TCG_REG_V0, 0);
+        tcg_out_ext32s(s, v0, TCG_REG_V0);
     } else {
         tcg_out_opc_reg(s, OPC_OR, v0, TCG_REG_V0, TCG_REG_ZERO);
     }
@@ -2287,10 +2293,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
-    case INDEX_op_ext32s_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extrl_i64_i32:
-        tcg_out_opc_sa(s, OPC_SLL, a0, a1, 0);
+        tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
@@ -2440,6 +2445,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 28929ed5db..0814894099 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -795,8 +795,9 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, ANDI | SAI(src, dst, 0xffff));
 }
 
-static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
 {
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_out32(s, EXTSW | RA(dst) | RS(src));
 }
 
@@ -2980,7 +2981,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
@@ -3130,6 +3130,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c49decaae9..9381e113aa 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1602,7 +1602,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
@@ -1639,6 +1638,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 0c489c2341..9aff45cbfd 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1112,7 +1112,7 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGHR, dest, src);
 }
 
-static inline void tgen_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
+static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LGFR, dest, src);
 }
@@ -1627,7 +1627,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_SL | MO_BSWAP:
         /* swapped sign-extended int load */
         tcg_out_insn(s, RXY, LRV, data, base, index, disp);
-        tgen_ext32s(s, data, data);
+        tcg_out_ext32s(s, data, data);
         break;
     case MO_SL:
         tcg_out_insn(s, RXY, LGF, data, base, index, disp);
@@ -2259,7 +2259,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = args[2];
         tcg_out_insn(s, RRE, LRVR, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
-            tgen_ext32s(s, a0, a0);
+            tcg_out_ext32s(s, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tgen_ext32u(s, a0, a0);
         }
@@ -2525,8 +2525,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
-        tgen_ext32s(s, args[0], args[1]);
+        tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
@@ -2627,6 +2626,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 98784f6545..fef19493d0 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -517,6 +517,11 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rd, 16, SHIFT_SRL);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_arithi(s, rd, rs, 0, SHIFT_SRA);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1213,7 +1218,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
     if (is_64 && (memop & MO_SSIZE) == MO_SL) {
-        tcg_out_arithi(s, data, TCG_REG_O0, 0, SHIFT_SRA);
+        tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
     }
@@ -1668,8 +1673,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         c = ARITH_UDIVX;
         goto gen_arith;
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
-        tcg_out_arithi(s, a0, a1, 0, SHIFT_SRA);
+        tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
@@ -1728,6 +1732,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 49a83942fa..04e162a623 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -615,6 +615,13 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_debug_assert(TCG_TARGET_HAS_ext32s_i64);
+    tcg_out_op_rr(s, INDEX_op_ext32s_i64, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -773,7 +780,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
@@ -857,6 +863,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


