Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BD6DCECC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:11:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2S1-0004RZ-Tw; Mon, 10 Apr 2023 21:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rv-0004HN-9F
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rr-0000Xh-Ny
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id ke16so6195608plb.6
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rVqjEgsDNG/kfSgxRIMNWBxdCw0tAltwAGbkDoWHlIg=;
 b=fXRyJDGnfbm+gabfN9Nhcyku3e7EeKgy1zItvpaB2eW1ccrF/eX4dHa6joTWUF5RqI
 QHCwEx8hMOAznTOx9NE+Yn+6eXjqXSPOOSAdCAVaCd8xPNDJfEryS8ORZRHWSv1l8Prj
 mmnn1UDw9jcum/OU4qgDhXtUoL2P6/ACLWUafzcfRv8gFjyQpSlMQcgbNo91+Ze0la6g
 kNaQZKKAwiiR9GVh/+Vup6cVMJXEX0kN+HLkyhtx4WMTz93pe378rut7k689qgeZgcK3
 A8S94YCGxwmD/FTG/LSaWP7ZYlPisEgvBnRu9K/CnaZOZ5kCci6XCGTJKshwsA2Hb040
 8tHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rVqjEgsDNG/kfSgxRIMNWBxdCw0tAltwAGbkDoWHlIg=;
 b=Ba72IZBGf0Dy4qU9ohzmKodoxSozhNqjJd0583GeKcK3rPdx0MAwV391HjSPrB8lDj
 +nxIKlZiycezeQzFsisZ0+kxc0FyGIa1kOnwFFNRLt0BLrUDRA5RM/mTVGOP0ISwVcW8
 pVJBpHK0AP8Zi25Igz+aHgYChIEg1fPxE2+EF0vQbnkYkAVTff+etzjYArOWPrL0jIm5
 P7FaWyvSNsOFSeSa5UGcJ2iZUAYG6rJXE/RaxdP9ju6UlS7HhR538T9N3Bu5libyn5ca
 RpCQP22OBLNjROvqL1T8UX+tkOwuWpi/0+a+lYKqc1XpObhNNQOffRvixPhts8SZpGvP
 +UJA==
X-Gm-Message-State: AAQBX9d2UqQsqkxYkiphk2QfJWTr6xK3XWqmOcdp59IkvJnWdXf/B4Vo
 M85XUqfgo+L9OLKrgClUpb8J7IE1Ra4XFb/EcaKObA==
X-Google-Smtp-Source: AKy350aU12jbRVoC3KVrvOczz1QzPBeGU2jmMJ1GUmQ0FSixJ4dG9EHQ9c8nZiMRaKSKB7Db+2WkLg==
X-Received: by 2002:a05:6a20:6528:b0:d8:d18d:60ae with SMTP id
 n40-20020a056a20652800b000d8d18d60aemr10736103pzg.7.1681175124469; 
 Mon, 10 Apr 2023 18:05:24 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 04/54] tcg: Split out tcg_out_ext8u
Date: Mon, 10 Apr 2023 18:04:22 -0700
Message-Id: <20230411010512.5375-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We will need a backend interface for performing 8-bit zero-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  5 +++++
 tcg/aarch64/tcg-target.c.inc     | 11 +++++++----
 tcg/arm/tcg-target.c.inc         | 12 +++++++++---
 tcg/i386/tcg-target.c.inc        |  7 +++----
 tcg/loongarch64/tcg-target.c.inc |  7 ++-----
 tcg/mips/tcg-target.c.inc        |  9 ++++++++-
 tcg/ppc/tcg-target.c.inc         |  7 +++++++
 tcg/riscv/tcg-target.c.inc       |  7 ++-----
 tcg/s390x/tcg-target.c.inc       | 14 +++++---------
 tcg/sparc64/tcg-target.c.inc     |  9 ++++++++-
 tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
 11 files changed, 69 insertions(+), 33 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 76ba3e28cd..b02ffc5679 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -106,6 +106,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
+static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4504,6 +4505,10 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext8s_i64:
         tcg_out_ext8s(s, TCG_TYPE_I64, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
+        tcg_out_ext8u(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4f4f814293..cca91363ce 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1432,6 +1432,11 @@ static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
     tcg_out_ubfm(s, 0, rd, rn, 0, bits);
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_uxt(s, MO_8, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2243,10 +2248,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
         break;
-    case INDEX_op_ext8u_i64:
-    case INDEX_op_ext8u_i32:
-        tcg_out_uxt(s, MO_8, a0, a1);
-        break;
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
         tcg_out_uxt(s, MO_16, a0, a1);
@@ -2313,6 +2314,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 04a860897f..b99f08a54b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -964,8 +964,13 @@ static void tcg_out_ext8s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
     tcg_out32(s, 0x06af0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_dat_imm(s, COND_AL, ARITH_AND, rd, rn, 0xff);
+}
+
 static void __attribute__((unused))
-tcg_out_ext8u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
+tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
 {
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
@@ -1365,8 +1370,8 @@ static TCGReg NAME(TCGContext *s, TCGReg argreg, ARGTYPE arg)              \
 
 DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
     (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u,
-    (tcg_out_ext8u(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
+DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
+    (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
 DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u,
     (tcg_out_ext16u(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
 DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
@@ -2299,6 +2304,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8u_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 14e8bdf56b..462a2348c6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1259,7 +1259,7 @@ static inline void tcg_out_rolw_8(TCGContext *s, int reg)
     tcg_out_shifti(s, SHIFT_ROL + P_DATA16, reg, 8);
 }
 
-static inline void tcg_out_ext8u(TCGContext *s, int dest, int src)
+static void tcg_out_ext8u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     /* movzbl */
     tcg_debug_assert(src < 4 || TCG_TARGET_REG_BITS == 64);
@@ -2673,9 +2673,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     OP_32_64(ext16s):
         tcg_out_ext16s(s, a0, a1, rexw);
         break;
-    OP_32_64(ext8u):
-        tcg_out_ext8u(s, a0, a1);
-        break;
     OP_32_64(ext16u):
         tcg_out_ext16u(s, a0, a1);
         break;
@@ -2840,6 +2837,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a96f655c44..a206b9cfc5 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1246,11 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext8u_i32:
-    case INDEX_op_ext8u_i64:
-        tcg_out_ext8u(s, a0, a1);
-        break;
-
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
         tcg_out_ext16s(s, a0, a1);
@@ -1624,6 +1619,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 8fc9d02bd5..5a712e3da5 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -558,6 +558,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     tcg_out_opc_reg(s, OPC_SEB, rd, TCG_REG_ZERO, rs);
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xff);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1099,7 +1104,7 @@ static int tcg_out_call_iarg_reg8(TCGContext *s, int i, TCGReg arg)
     if (i < ARRAY_SIZE(tcg_target_call_iarg_regs)) {
         tmp = tcg_target_call_iarg_regs[i];
     }
-    tcg_out_opc_imm(s, OPC_ANDI, tmp, arg, 0xff);
+    tcg_out_ext8u(s, tmp, arg);
     return tcg_out_call_iarg_reg(s, i, tmp);
 }
 
@@ -2423,6 +2428,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 573067e535..ec8e5a1a8a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -780,6 +780,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
     tcg_out32(s, EXTSB | RA(dst) | RS(src));
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg dst, TCGReg src)
+{
+    tcg_out32(s, ANDI | SAI(src, dst, 0xff));
+}
+
 static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
@@ -3123,6 +3128,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:   /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 04b27f6887..d9b08014ce 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1597,11 +1597,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext8u_i32:
-    case INDEX_op_ext8u_i64:
-        tcg_out_ext8u(s, a0, a1);
-        break;
-
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
         tcg_out_ext16u(s, a0, a1);
@@ -1648,6 +1643,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 1232ccb122..338a91c591 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1097,7 +1097,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LGBR, dest, src);
 }
 
-static void tgen_ext8u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+static void tcg_out_ext8u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LLGCR, dest, src);
 }
@@ -1153,7 +1153,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         return;
     }
     if ((val & valid) == 0xff) {
-        tgen_ext8u(s, TCG_TYPE_I64, dest, dest);
+        tcg_out_ext8u(s, dest, dest);
         return;
     }
     if ((val & valid) == 0xffff) {
@@ -1806,7 +1806,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     switch (opc & MO_SIZE) {
     case MO_UB:
-        tgen_ext8u(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
+        tcg_out_ext8u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UW:
         tgen_ext16u(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
@@ -2236,9 +2236,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i32:
         tgen_ext16s(s, TCG_TYPE_I32, args[0], args[1]);
         break;
-    case INDEX_op_ext8u_i32:
-        tgen_ext8u(s, TCG_TYPE_I32, args[0], args[1]);
-        break;
     case INDEX_op_ext16u_i32:
         tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
         break;
@@ -2541,9 +2538,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
         tgen_ext32s(s, args[0], args[1]);
         break;
-    case INDEX_op_ext8u_i64:
-        tgen_ext8u(s, TCG_TYPE_I64, args[0], args[1]);
-        break;
     case INDEX_op_ext16u_i64:
         tgen_ext16u(s, TCG_TYPE_I64, args[0], args[1]);
         break;
@@ -2640,6 +2634,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 7952cfc4da..4792b04b54 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -501,6 +501,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     g_assert_not_reached();
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_arithi(s, rd, rs, 0xff, ARITH_AND);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -883,7 +888,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
      */
     switch (op & MO_SIZE) {
     case MO_8:
-        tcg_out_arithi(s, r, r, 0xff, ARITH_AND);
+        tcg_out_ext8u(s, r, r);
         break;
     case MO_16:
         tcg_out_arithi(s, r, r, 16, SHIFT_SLL);
@@ -1707,6 +1712,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 029508e308..e946d9165e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -575,6 +575,17 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_debug_assert(TCG_TARGET_HAS_ext8u_i64);
+        tcg_out_op_rr(s, INDEX_op_ext8u_i64, rd, rs);
+    } else {
+        tcg_debug_assert(TCG_TARGET_HAS_ext8u_i32);
+        tcg_out_op_rr(s, INDEX_op_ext8u_i32, rd, rs);
+    }
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -733,7 +744,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_32_64(ext8u)    /* Optional (TCG_TARGET_HAS_ext8u_*). */
     CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
     CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
     CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
@@ -814,6 +824,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8s_i64:
+    case INDEX_op_ext8u_i32:
+    case INDEX_op_ext8u_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


