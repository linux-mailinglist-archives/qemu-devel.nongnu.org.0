Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7C2F572A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:19:22 +0100 (CET)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsEL-00058m-CJ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCC-0003JS-AR
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:08 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCA-0003O2-4u
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:08 -0500
Received: by mail-pj1-x102e.google.com with SMTP id w1so3916413pjc.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igVFuD7tCOBdGtqW4y6U7yVjBtZG8cMMEC6HvvNAy3M=;
 b=lndZMeWwdYWUu7K77yv017nxvg1DKl+FxmeULOgmLK+MckEd9faAso3mArbATenfFc
 68TRcPOBHq7g+VZ2dGSSGdiSKWLbjnjhn6mx2z0jBa3wxAeYoGKXmweLAThfQC1MOuir
 jvZSBmHxZaW1VGoCujq+WVxFFxT0Dyf5WHPislZHMd3+hUxsdFzdB1NXDNUjgWhGhvul
 TlT7tpi4IICqYAS4g/WvWIU1O6zX7Q5/1bDS44EFx6f6PGtUkKftxPzlJ9AfnxoiBn2T
 ijrmVvdpXPB9fSC3ErX5ZSo66lzaEwqVXFDOSUs8Lx2AleMvtnqhXUPisEklXuXL6hLu
 XQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igVFuD7tCOBdGtqW4y6U7yVjBtZG8cMMEC6HvvNAy3M=;
 b=ko2WG7czzcU7KgpsOJbMuNZtgkT8EdbyZBCi4wORnb71okhlve4H41jgO8C92hk4wU
 LynDdLOVcysBymAqX//zX/qdsGL3swpqQ+zikT6SWhQbrQSgeyk7R6Hjo2gYYdvOqv8v
 uVA6/ZHNbgY73QUP4rbWrZYvjDK82Grs5bNfNUdwMY1OMKlQgThUHkWAnaC3oioKNJ2p
 X2YJTpgVXibsYaZ0dH4D+BzcAB6+HtryG3Fjj6oOr5PP0Ti3wvVaPA/iJAbg/xJUbaiz
 JDB3MV+bKsB0VrYvAFHg0VmncS3fGQw/IQGaKy9vnqNABKo5Yj2sByn8btrN5DE74Xjg
 CGUw==
X-Gm-Message-State: AOAM532ma+IidvkCSn/ynL9Yf3u+CP2H/vP+iLENkSrLDdI7qYUMB+2I
 MCPADfiHlx7Tmp7x5rt/9HKQGEzTjTGY1A==
X-Google-Smtp-Source: ABdhPJyalgUiWoZdfISEi2uxr1gbjh655XoWo7EU8wy5NfLbUaN9qDKiaQWGoUyKeHZKCl1JNuvzrg==
X-Received: by 2002:a17:902:8d8d:b029:dc:4609:58a9 with SMTP id
 v13-20020a1709028d8db02900dc460958a9mr5392848plo.27.1610590621345; 
 Wed, 13 Jan 2021 18:17:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/24] tcg: Increase tcg_out_dupi_vec immediate to int64_t
Date: Wed, 13 Jan 2021 16:16:32 -1000
Message-Id: <20210114021654.647242-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org
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
index ded3c928e3..c73128208c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -117,8 +117,8 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
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
@@ -133,8 +133,8 @@ static inline bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
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
@@ -3390,7 +3390,28 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
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
index a2a588e3aa..be6d3ea2a8 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -857,14 +857,14 @@ static void tcg_out_logicali(TCGContext *s, AArch64Insn insn, TCGType ext,
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
@@ -891,7 +891,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
      * cannot find an expansion there's no point checking a larger
      * width because we already know by replication it cannot match.
      */
-    if (v64 == dup_const(MO_16, v64)) {
+    if (vece == MO_16) {
         uint16_t v16 = v64;
 
         if (is_shimm16(v16, &cmode, &imm8)) {
@@ -910,7 +910,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         tcg_out_insn(s, 3606, MOVI, q, rd, 0, 0x8, v16 & 0xff);
         tcg_out_insn(s, 3606, ORR, q, rd, 0, 0xa, v16 >> 8);
         return;
-    } else if (v64 == dup_const(MO_32, v64)) {
+    } else if (vece == MO_32) {
         uint32_t v32 = v64;
         uint32_t n32 = ~v32;
 
@@ -2435,7 +2435,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                         tcg_out_insn_3617(s, insn, is_q, vece, a0, a1);
                         break;
                     }
-                    tcg_out_dupi_vec(s, type, TCG_VEC_TMP, 0);
+                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
                     a2 = TCG_VEC_TMP;
                 }
                 insn = cmp_insn[cond];
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 35554fd1e8..9f81e11773 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -942,8 +942,8 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
     return true;
 }
 
-static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg ret, tcg_target_long arg)
+static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
+                             TCGReg ret, int64_t arg)
 {
     int vex_l = (type == TCG_TYPE_V256 ? P_VEXL : 0);
 
@@ -956,7 +956,14 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
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
@@ -964,14 +971,11 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
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
index a3f1bd41cd..d00ec20203 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -912,31 +912,41 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
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
@@ -956,14 +966,15 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
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


