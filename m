Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA536EBE84
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:21:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpY-0004Gf-EV; Sun, 23 Apr 2023 06:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWpF-0004D5-7P
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp6-0003FB-Dl
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso1948241f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245198; x=1684837198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rNxjRhfj55qa5dZBWedg2r3s08E3wFc4/p5KaQRnxA=;
 b=fYuOYvBmgtjTXArr/E3VTcsb5iM/fFRnjKSkkz2cejxr4HuGKwpfGvxICNdTfHVclC
 kCDc1D55JFp6w/lpMqnjZascLw++6V1j6p1cca//WDHCOBIxZk36vIGybFn/bMUAAK6B
 mD2yhbmdodWDpNEv4Ptun+vwCfD9FFQRWicWgXeEXsDEmhS6Sduw/V4i3OuPD27oJDnZ
 8AiWVMa8/Vlx+h8S9EAtIScWA5AZisgXfWKnlitrk1KDB/EPeEdo/Ukpq+FPuEyk0tEc
 XC52VXpzqrpzls1Z+i0ah+Z+cLXVqps/M4zN5E3JBRQtKNsi+P9E/vb1Gf+tswUsKVVa
 55yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245198; x=1684837198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rNxjRhfj55qa5dZBWedg2r3s08E3wFc4/p5KaQRnxA=;
 b=OvDtC5YbTQMRcOE4rPMfBQmeke9YufVssG75VfBE0CAq3bncer3iwY3UV4RbZkZQY7
 CN16j7jSeUJMUPNsbymZ5PCoeFVvYk57ITUSByy9PZgnNWgYStRCsFt6xg8HI6BxfrQK
 TNK6SmFNe09VV/+ZO9JV6rGA0qnbuY8aq2dcfD77DOSPq29NBU17S/W3MVKCYVTtjMmq
 k7lYqommL7hTSsVxg5gR/mQZKxAfYDf4qJS2PNxZg0qe32BjY9xN6m0xKaT3nF9lPXgV
 AW7LZaFjI9Xs8tjn6x1hNTjOqljLTzCXrGffP3/sGA6Qdm0xD2jyWkWLeAAdAY4UKreG
 8VIA==
X-Gm-Message-State: AAQBX9c5P2x3Dc6pTcGafJAAjBpUeZ0j+DJ+Z9Jdy5dtqurJfEIoXIXA
 nxrTo1a+/m0SHrNdHc1eKayTHnSboEROHbD9wSjGgA==
X-Google-Smtp-Source: AKy350ZSCZnzrLWm0Tw4NM/QpwFKQDcE3z9p1MQDb9uJOt8a5Sopjj6TfGghDk5ifPExnKNegLAVVQ==
X-Received: by 2002:adf:d4ce:0:b0:2fa:3af5:bd36 with SMTP id
 w14-20020adfd4ce000000b002fa3af5bd36mr7583115wrk.24.1682245198104; 
 Sun, 23 Apr 2023 03:19:58 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/15] tcg: Split out tcg_out_extrl_i64_i32
Date: Sun, 23 Apr 2023 11:19:46 +0100
Message-Id: <20230423101950.817899-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

We will need a backend interface for type truncation.  For those backends
that did not enable TCG_TARGET_HAS_extrl_i64_i32, use tcg_out_mov.
Use it in tcg_reg_alloc_op in the meantime.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     |  6 ++++++
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  9 ++++++---
 tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
 tcg/mips/tcg-target.c.inc        |  9 ++++++---
 tcg/ppc/tcg-target.c.inc         |  7 +++++++
 tcg/riscv/tcg-target.c.inc       | 10 ++++++----
 tcg/s390x/tcg-target.c.inc       |  6 ++++++
 tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
 tcg/tci/tcg-target.c.inc         |  7 +++++++
 11 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 17bd6d4581..0188152c37 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -113,6 +113,7 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4537,6 +4538,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_extu_i32_i64:
         tcg_out_extu_i32_i64(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_extrl_i64_i32:
+        tcg_out_extrl_i64_i32(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ca8b25865b..bd1fab193e 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1467,6 +1467,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_ext32u(s, rd, rn);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2337,6 +2342,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2135616e12..1820655ee3 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1013,6 +1013,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 40d661072b..f39ef9dd01 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1309,6 +1309,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32u(s, dest, src);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_ext32u(s, dest, src);
+}
+
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
 {
     tcg_out_opc(s, OPC_BSWAP + P_REXW + LOWREGMASK(reg), 0, reg, 0);
@@ -2763,9 +2768,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0);
         break;
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32u(s, a0, a1);
-        break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_shifti(s, SHIFT_SHR + P_REXW, a0, 32);
         break;
@@ -2846,6 +2848,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 6ecde0804f..c8b87a2fd2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -466,6 +466,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_ext32u(s, ret, arg);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
                            TCGReg a0, TCGReg a1, TCGReg a2,
                            bool c2, bool is_32bit)
@@ -1256,10 +1261,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32s(s, a0, a1);
-        break;
-
     case INDEX_op_extrh_i64_i32:
         tcg_out_opc_srai_d(s, a0, a1, 32);
         break;
@@ -1622,6 +1623,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 3e455fdb1f..b0f9fbc44c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -590,6 +590,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32u(s, rd, rs);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2304,9 +2309,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32s(s, a0, a1);
-        break;
 
     case INDEX_op_sar_i32:
         i1 = OPC_SRAV, i2 = OPC_SRA;
@@ -2455,6 +2457,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index bd298c55fd..4c4178b700 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -817,6 +817,12 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out_ext32u(s, dst, src);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rn);
+}
+
 static inline void tcg_out_shli32(TCGContext *s, TCGReg dst, TCGReg src, int c)
 {
     tcg_out_rlw(s, RLWINM, dst, src, c, 0, 31 - c);
@@ -3138,6 +3144,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 064a334d82..860bf90881 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -612,6 +612,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_ext32u(s, ret, arg);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_ext32s(s, ret, arg);
+}
+
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
                          TCGReg addr, intptr_t offset)
 {
@@ -1607,10 +1612,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_ext32s(s, a0, a1);
-        break;
-
     case INDEX_op_extrh_i64_i32:
         tcg_out_opc_imm(s, OPC_SRAI, a0, a1, 32);
         break;
@@ -1646,6 +1647,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e17d000991..360229cdd3 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1132,6 +1132,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_ext32u(s, dest, src);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
+{
+    tcg_out_mov(s, TCG_TYPE_I32, dest, src);
+}
+
 static void tgen_andi_risbg(TCGContext *s, TCGReg out, TCGReg in, uint64_t val)
 {
     int msb, lsb;
@@ -2632,6 +2637,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index c57a8c8304..18ddd6bb9f 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -537,6 +537,11 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32u(s, rd, rs);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1687,9 +1692,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         c = ARITH_UDIVX;
         goto gen_arith;
-    case INDEX_op_extrl_i64_i32:
-        tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
-        break;
     case INDEX_op_extrh_i64_i32:
         tcg_out_arithi(s, a0, a1, 32, SHIFT_SRLX);
         break;
@@ -1744,6 +1746,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 48c9dbd0b4..68531e35ec 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -639,6 +639,12 @@ static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_ext32u(s, rd, rs);
 }
 
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_out_mov(s, TCG_TYPE_I32, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -881,6 +887,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32u_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extu_i32_i64:
+    case INDEX_op_extrl_i64_i32:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


