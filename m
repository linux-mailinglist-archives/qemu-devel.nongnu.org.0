Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11302DD35E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:58:20 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpujT-0000Yt-VU
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudr-0003MS-6Q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:31 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:43316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudi-0004sj-9K
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:29 -0500
Received: by mail-oo1-xc30.google.com with SMTP id y14so3556280oom.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BN996J7U0Obk/NuvmIQte+lnV+dtpzifIKeaJMGxzjc=;
 b=V8wi757A5rskuW5UZt0yB7bo6xdougTB9cxPfNPVLWkKGRkF7w5f5r6VG0HJE2YE4r
 or6oB/vKhmJfnaeqBmcE6Izdrwq8ikwToWjj3/QN1PnOzw9e2YxDJu+mQAW4hIY3T2Mn
 kldCLwvBy4FDC9gZJTWBHMZ3uO4gY556jtwqZhfbsqtzSPmnVL/zr9lbJanPdO/ylcAz
 uUzc1VGPRbnToL2FZk+KwlJNWOYwo3GhTc+pREf2D4Znqa+wFujmHEZj/IqsxnK4AyU4
 RH7pU5NKxX/IKgegGF7p8ulknJ/YtoiIeQq6kAFVQFAh8EUGm5AjtrFHOVWZ5q9FBntQ
 4q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BN996J7U0Obk/NuvmIQte+lnV+dtpzifIKeaJMGxzjc=;
 b=uKo6qSZvjfFW1NlK+OyoxY1rwkjx5MDSnN2sWBjBvlvqdCmjmNiRuAxrw9h0loTV8c
 SMnbCQ6UL00eX+Ya3D1vpYLJ4oJuN28XTL38UB5dHz4Z8MknNpq60y4CAGKv3DfJLZ/+
 scIJuMCxxBA9W/vz33/0JMzn21knEYqXaJKt4K1c337JOALLDt8AuarKBrYo1nCQUv87
 Sh2mfv/VEGaAbriErHjJ3aJ6n2Yt3LM7Ptl3J2wEHAxWLhlgkvyTp+4tGqk2qAUnKUP3
 8tKxBpYRa58tAjuApaf+17F0BF82ccZoIRVQGqy8qEeiPKzpsrH2sipwqenT4xC5EwSJ
 3hdw==
X-Gm-Message-State: AOAM5304sE0osAG+LAD/5wdKWz6lVJEtI1+EM8Ms21pzN3BZy1fUcK5R
 ji6HbsrKL1NSrcuOVmYbadBm/My6XmMiQgeI
X-Google-Smtp-Source: ABdhPJzN+897bN9bpYkVNAxA9m+rO8RkcVLwdOlH8kRd4JbKkvT0hIv6e1lfIEKxH2uzuLcMjBck8Q==
X-Received: by 2002:a4a:ca14:: with SMTP id w20mr28888403ooq.11.1608216739351; 
 Thu, 17 Dec 2020 06:52:19 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/23] tcg: Increase tcg_out_dupi_vec immediate to int64_t
Date: Thu, 17 Dec 2020 08:51:54 -0600
Message-Id: <20201217145215.534637-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we don't store more than tcg_target_long in TCGTemp,
we shouldn't be limited to that for code generation.  We will
be able to use this for INDEX_op_dup2_vec with 2 constants.

Also pass along the minimal vece that may be said to apply
to the constant.  This allows some simplification in the
various backends.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                    | 31 +++++++++++++++++++++++++-----
 tcg/aarch64/tcg-target.c.inc | 12 ++++++------
 tcg/i386/tcg-target.c.inc    | 22 ++++++++++++---------
 tcg/ppc/tcg-target.c.inc     | 37 +++++++++++++++++++++++-------------
 4 files changed, 69 insertions(+), 33 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ef55c23c20..2326e61b51 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -116,8 +116,8 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg dst, TCGReg src);
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, TCGReg base, intptr_t offset);
-static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg dst, tcg_target_long arg);
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg dst, int64_t arg);
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
                            unsigned vece, const TCGArg *args,
                            const int *const_args);
@@ -132,8 +132,8 @@ static inline bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
 {
     g_assert_not_reached();
 }
-static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                                    TCGReg dst, tcg_target_long arg)
+static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                                    TCGReg dst, int64_t arg)
 {
     g_assert_not_reached();
 }
@@ -3336,7 +3336,28 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
         if (ts->type <= TCG_TYPE_I64) {
             tcg_out_movi(s, ts->type, reg, ts->val);
         } else {
-            tcg_out_dupi_vec(s, ts->type, reg, ts->val);
+            uint64_t val = ts->val;
+            MemOp vece = MO_64;
+
+            /*
+             * Find the minimal vector element that matches the constant.
+             * The targets will, in general, have to do this search anyway,
+             * do this generically.
+             */
+            if (TCG_TARGET_REG_BITS == 32) {
+                val = dup_const(MO_32, val);
+                vece = MO_32;
+            }
+            if (val == dup_const(MO_8, val)) {
+                vece = MO_8;
+            } else if (val == dup_const(MO_16, val)) {
+                vece = MO_16;
+            } else if (TCG_TARGET_REG_BITS == 64 &&
+                       val == dup_const(MO_32, val)) {
+                vece = MO_32;
+            }
+
+            tcg_out_dupi_vec(s, ts->type, vece, reg, ts->val);
         }
         ts->mem_coherent = 0;
         break;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 695f53b125..56056be74b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -853,14 +853,14 @@ static void tcg_out_logicali(TCGContext *s, AArch64Insn insn, TCGType ext,
     tcg_out_insn_3404(s, insn, ext, rd, rn, ext, r, c);
 }
 
-static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg rd, tcg_target_long v64)
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg rd, int64_t v64)
 {
     bool q = type == TCG_TYPE_V128;
     int cmode, imm8, i;
 
     /* Test all bytes equal first.  */
-    if (v64 == dup_const(MO_8, v64)) {
+    if (vece == MO_8) {
         imm8 = (uint8_t)v64;
         tcg_out_insn(s, 3606, MOVI, q, rd, 0, 0xe, imm8);
         return;
@@ -887,7 +887,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
      * cannot find an expansion there's no point checking a larger
      * width because we already know by replication it cannot match.
      */
-    if (v64 == dup_const(MO_16, v64)) {
+    if (vece == MO_16) {
         uint16_t v16 = v64;
 
         if (is_shimm16(v16, &cmode, &imm8)) {
@@ -906,7 +906,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         tcg_out_insn(s, 3606, MOVI, q, rd, 0, 0x8, v16 & 0xff);
         tcg_out_insn(s, 3606, ORR, q, rd, 0, 0xa, v16 >> 8);
         return;
-    } else if (v64 == dup_const(MO_32, v64)) {
+    } else if (vece == MO_32) {
         uint32_t v32 = v64;
         uint32_t n32 = ~v32;
 
@@ -2430,7 +2430,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                         tcg_out_insn_3617(s, insn, is_q, vece, a0, a1);
                         break;
                     }
-                    tcg_out_dupi_vec(s, type, TCG_VEC_TMP, 0);
+                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
                     a2 = TCG_VEC_TMP;
                 }
                 insn = cmp_insn[cond];
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index e2852cbb09..6b7cbaa47a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -933,8 +933,8 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
     return true;
 }
 
-static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg ret, tcg_target_long arg)
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg ret, int64_t arg)
 {
     int vex_l = (type == TCG_TYPE_V256 ? P_VEXL : 0);
 
@@ -947,7 +947,14 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         return;
     }
 
-    if (TCG_TARGET_REG_BITS == 64) {
+    if (TCG_TARGET_REG_BITS == 32 && vece < MO_64) {
+        if (have_avx2) {
+            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret);
+        } else {
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+        }
+        new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
+    } else {
         if (type == TCG_TYPE_V64) {
             tcg_out_vex_modrm_pool(s, OPC_MOVQ_VqWq, ret);
         } else if (have_avx2) {
@@ -955,14 +962,11 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         } else {
             tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret);
         }
-        new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
-    } else {
-        if (have_avx2) {
-            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret);
+        if (TCG_TARGET_REG_BITS == 64) {
+            new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+            new_pool_l2(s, R_386_32, s->code_ptr - 4, 0, arg, arg >> 32);
         }
-        new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
     }
 }
 
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index df18d694f3..2428faeabd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -908,31 +908,41 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
-static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long val)
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg ret, int64_t val)
 {
     uint32_t load_insn;
     int rel, low;
     intptr_t add;
 
-    low = (int8_t)val;
-    if (low >= -16 && low < 16) {
-        if (val == (tcg_target_long)dup_const(MO_8, low)) {
+    switch (vece) {
+    case MO_8:
+        low = (int8_t)val;
+        if (low >= -16 && low < 16) {
             tcg_out32(s, VSPLTISB | VRT(ret) | ((val & 31) << 16));
             return;
         }
-        if (val == (tcg_target_long)dup_const(MO_16, low)) {
+        if (have_isa_3_00) {
+            tcg_out32(s, XXSPLTIB | VRT(ret) | ((val & 0xff) << 11));
+            return;
+        }
+        break;
+
+    case MO_16:
+        low = (int16_t)val;
+        if (low >= -16 && low < 16) {
             tcg_out32(s, VSPLTISH | VRT(ret) | ((val & 31) << 16));
             return;
         }
-        if (val == (tcg_target_long)dup_const(MO_32, low)) {
+        break;
+
+    case MO_32:
+        low = (int32_t)val;
+        if (low >= -16 && low < 16) {
             tcg_out32(s, VSPLTISW | VRT(ret) | ((val & 31) << 16));
             return;
         }
-    }
-    if (have_isa_3_00 && val == (tcg_target_long)dup_const(MO_8, val)) {
-        tcg_out32(s, XXSPLTIB | VRT(ret) | ((val & 0xff) << 11));
-        return;
+        break;
     }
 
     /*
@@ -952,14 +962,15 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
         if (TCG_TARGET_REG_BITS == 64) {
             new_pool_label(s, val, rel, s->code_ptr, add);
         } else {
-            new_pool_l2(s, rel, s->code_ptr, add, val, val);
+            new_pool_l2(s, rel, s->code_ptr, add, val >> 32, val);
         }
     } else {
         load_insn = LVX | VRT(ret) | RB(TCG_REG_TMP1);
         if (TCG_TARGET_REG_BITS == 64) {
             new_pool_l2(s, rel, s->code_ptr, add, val, val);
         } else {
-            new_pool_l4(s, rel, s->code_ptr, add, val, val, val, val);
+            new_pool_l4(s, rel, s->code_ptr, add,
+                        val >> 32, val, val >> 32, val);
         }
     }
 
-- 
2.25.1


