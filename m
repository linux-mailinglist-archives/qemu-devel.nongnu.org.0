Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A46F4299
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:22:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3n-0000hO-94; Tue, 02 May 2023 07:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3i-0000g2-0g
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3f-0003H3-IQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so163912935e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026432; x=1685618432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gu7vxvZ5ut7SntMoC4haOf2WVE2SH+RaE9TYSeOj0k4=;
 b=Edcss+wKC/p7Cp4jc4VCicz/kRWA01li9rtoSwMVEeBfueCuslzWtH4uk5tfXfgXcv
 gIx4r3fR4r3Mdw9Iwj1ZAFmzWHESppHYdzfKhE4LPmRmzQ14FoFoPtyHUxzt9/goj5NU
 csvtL6oKX9ofdXd4DV19rs0xynqwjaR7E96dZadASjfvdAUuvWB3GOpQpYuDkh9sHRD1
 nn96jEwMvQcKyNfQEv63hXqCyCXSu2Y0Jwlc3m7PQk2FkL5TeUaHQ6D7wQ0pPH6TeURF
 fy/7TGAcm5TgG5PlZvIY5JP4jPqxxiUgpyaYulfxudgCxOC5oi3vH6obJlRZmahRQBgM
 l9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026432; x=1685618432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gu7vxvZ5ut7SntMoC4haOf2WVE2SH+RaE9TYSeOj0k4=;
 b=T9ng7DZd3l+6TomImyRZoQSqWwT2kHW9NzrTiCpqK62yo7BwqB8B5LCmv7PdVCCEYm
 ClPfi4t3oh9MShNwxkgal32uIs8hWbHmdYYns9TvoB4zJKoCpKMN16RgLSh9Zg8l6vxJ
 cGJzayaGpbSv2nPEXGU6TU5gg0wMFYUH9eyYo2+d5EDAW9ZKMLroAm+veJ/1H59gAzXl
 kLzrtMYfp74e5FBiZ4TU4JMDHODDDhBUytHem/1ad36rOKBil/R5L+nhBEHhoT2nD1Vl
 SyLjkTRBt78BnrPB2bCaovzwJ4FYJN1bzAT+3aAEiwqc2CfzT2oLsq6/wisSPoLw2YDv
 urxA==
X-Gm-Message-State: AC+VfDwjJheN2XilwQY+e2+9lTBPQFq6SANJPgKHMjD9LaSWJ3u1yqEF
 UMEpp5bpGic1yDE+yLSTRhjkPiAzihu5WB8Www9YBg==
X-Google-Smtp-Source: ACHHUZ7xVyo/Ue7mKWEq/YaU2gRlKg9biOYXjuYwC4sOpSiNXLMA9c5cs39Wc/vUK7ooQazXgT3LjA==
X-Received: by 2002:a05:600c:2198:b0:3f2:5be3:cd6b with SMTP id
 e24-20020a05600c219800b003f25be3cd6bmr11749145wme.3.1683026431938; 
 Tue, 02 May 2023 04:20:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/12] tcg: Introduce tcg_out_movext2
Date: Tue,  2 May 2023 12:20:23 +0100
Message-Id: <20230502112023.776823-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

This is common code in most qemu_{ld,st} slow paths, moving two
registers when there may be overlap between sources and destinations.
At present, this is only used by 32-bit hosts for 64-bit data,
but will shortly be used for more than that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 69 ++++++++++++++++++++++++++++++++++++---
 tcg/arm/tcg-target.c.inc  | 44 ++++++++++---------------
 tcg/i386/tcg-target.c.inc | 19 +++++------
 3 files changed, 90 insertions(+), 42 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fde5ccc57c..cfd3262a4a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -115,8 +115,7 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
-static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
-    __attribute__((unused));
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
@@ -354,6 +353,14 @@ void tcg_raise_tb_overflow(TCGContext *s)
     siglongjmp(s->jmp_trans, -2);
 }
 
+typedef struct TCGMovExtend {
+    TCGReg dst;
+    TCGReg src;
+    TCGType dst_type;
+    TCGType src_type;
+    MemOp src_ext;
+} TCGMovExtend;
+
 /**
  * tcg_out_movext -- move and extend
  * @s: tcg context
@@ -365,9 +372,8 @@ void tcg_raise_tb_overflow(TCGContext *s)
  *
  * Move or extend @src into @dst, depending on @src_ext and the types.
  */
-static void __attribute__((unused))
-tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
-               TCGType src_type, MemOp src_ext, TCGReg src)
+static void tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
+                           TCGType src_type, MemOp src_ext, TCGReg src)
 {
     switch (src_ext) {
     case MO_UB:
@@ -417,6 +423,59 @@ tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
     }
 }
 
+/* Minor variations on a theme, using a structure. */
+static void tcg_out_movext1_new_src(TCGContext *s, const TCGMovExtend *i,
+                                    TCGReg src)
+{
+    tcg_out_movext(s, i->dst_type, i->dst, i->src_type, i->src_ext, src);
+}
+
+static void tcg_out_movext1(TCGContext *s, const TCGMovExtend *i)
+{
+    tcg_out_movext1_new_src(s, i, i->src);
+}
+
+/**
+ * tcg_out_movext2 -- move and extend two pair
+ * @s: tcg context
+ * @i1: first move description
+ * @i2: second move description
+ * @scratch: temporary register, or -1 for none
+ *
+ * As tcg_out_movext, for both @i1 and @i2, caring for overlap
+ * between the sources and destinations.
+ */
+
+static void __attribute__((unused))
+tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
+                const TCGMovExtend *i2, int scratch)
+{
+    TCGReg src1 = i1->src;
+    TCGReg src2 = i2->src;
+
+    if (i1->dst != src2) {
+        tcg_out_movext1(s, i1);
+        tcg_out_movext1(s, i2);
+        return;
+    }
+    if (i2->dst == src1) {
+        TCGType src1_type = i1->src_type;
+        TCGType src2_type = i2->src_type;
+
+        if (tcg_out_xchg(s, MAX(src1_type, src2_type), src1, src2)) {
+            /* The data is now in the correct registers, now extend. */
+            src1 = i2->src;
+            src2 = i1->src;
+        } else {
+            tcg_debug_assert(scratch >= 0);
+            tcg_out_mov(s, src1_type, scratch, src1);
+            src1 = scratch;
+        }
+    }
+    tcg_out_movext1_new_src(s, i2, src2);
+    tcg_out_movext1_new_src(s, i1, src1);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8d769ca0a2..83c818a58b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1545,7 +1545,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
+    TCGReg argreg;
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
@@ -1565,22 +1565,16 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     /* Use the canonical unsigned helpers and minimize icache usage. */
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
 
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
     if ((opc & MO_SIZE) == MO_64) {
-        if (datalo != TCG_REG_R1) {
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-        } else if (datahi != TCG_REG_R0) {
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-        } else {
-            tcg_out_mov_reg(s, COND_AL, TCG_REG_TMP, TCG_REG_R0);
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_TMP);
-        }
+        TCGMovExtend ext[2] = {
+            { .dst = lb->datalo_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_R0, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = lb->datahi_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_R1, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
     } else {
-        tcg_out_movext(s, TCG_TYPE_I32, datalo,
+        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
                        TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
     }
 
@@ -1663,17 +1657,15 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
     if (TARGET_LONG_BITS == 64) {
         /* 64-bit target address is aligned into R2:R3. */
-        if (l->addrhi_reg != TCG_REG_R2) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
-        } else if (l->addrlo_reg != TCG_REG_R3) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, TCG_REG_R2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, TCG_REG_R3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, TCG_REG_R1);
-        }
+        TCGMovExtend ext[2] = {
+            { .dst = TCG_REG_R2, .dst_type = TCG_TYPE_I32,
+              .src = l->addrlo_reg,
+              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = TCG_REG_R3, .dst_type = TCG_TYPE_I32,
+              .src = l->addrhi_reg,
+              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
     } else {
         tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c8e2bf537f..caf91a3151 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1914,7 +1914,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
-    TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1951,18 +1950,16 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-    data_reg = l->datalo_reg;
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        if (data_reg == TCG_REG_EDX) {
-            /* xchg %edx, %eax */
-            tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
-        }
+        TCGMovExtend ext[2] = {
+            { .dst = l->datalo_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_EAX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = l->datahi_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_EDX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], -1);
     } else {
-        tcg_out_movext(s, l->type, data_reg,
+        tcg_out_movext(s, l->type, l->datalo_reg,
                        TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
     }
 
-- 
2.34.1


