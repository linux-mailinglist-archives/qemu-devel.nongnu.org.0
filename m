Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB31CB2D2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 17:30:11 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX4wz-0007Ty-DT
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 11:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4lR-0006Bd-Cp
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:18:14 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX4lO-0003Am-Rf
 for qemu-devel@nongnu.org; Fri, 08 May 2020 11:18:12 -0400
Received: by mail-pj1-x1041.google.com with SMTP id ms17so4381282pjb.0
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tXAuw+O0nKjEkY6i1LmjeSafeFA055NiORJ15tNu8k=;
 b=iH1nWt5nRge8qPK3A0Oyp7iz2IF+VDqyFZlnapdftB2yTfJ19LuCH3++N/wOzcP10T
 LC7+AfG7AVUsndtS49T14e7Z3fp4RZ6yaFuzxzAbnM4gcjQ3ZVPcwAzNkGYrNVZZd4Dc
 K5FAkIOmdkmkhkvUiHCerGKIEhTbQUes9+Nz8Mb+7fex8ihoOKPHvLAiIwFWdQWpGv0K
 EW3g6iRdJPGEzbkxY9svTF3G1K2Lqc8hyUNoOdtjRNZtdPYwe+KQGg2v1iXrnH5Nzrh8
 W1qqRGZR7XlRtk9VZEMtDFaeIUEj/JPoCgXbCxXuVddeVHpIluo+nyvc+7AJpxUJG9yD
 DGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tXAuw+O0nKjEkY6i1LmjeSafeFA055NiORJ15tNu8k=;
 b=HxEEzqCnK6lqBIZlHNNsfoHa0UDgNPaQHQ4KdO+LG3J0a5tDtldmb8V5x+nTxoKTD0
 WYaCUtIMplNms0HXSxy0p4OYY9/7peBUVZ1kNKs+GhSNxqFLKDlkOo5OElwaycUOYtJ5
 Oguk9ESCPmkABIHqM5934N2N+8os9ThoETz8YBWdu0qr3kmqZqcE3zYTTlmyZpmdE3AM
 UM+OyQ6+3N/q98A+eYw4cBkyixcswfEYcajUTeiCVvaTv4wHx3EYb8wYQBV1A/5SnX9R
 2X2KZ//WkPh7Q2ufZe/Rd9RgA83++X3lDNKDeg+TapCFp252QMzqJ/HhqGW+CEEdHy2S
 wLAw==
X-Gm-Message-State: AGi0PubsD8kdODQ7Ts/oI9zJ1ImYtkVcK9G/DH66KIVmjNQE26X4gc5g
 wh8oZMw6ILK87/Y3EcypNTmaabB5pDo=
X-Google-Smtp-Source: APiQypLdJcnh+v1ttR28t5NhRWO0GP6cOPSuaiublJJcPECqYpORMOOSKolroETX7B8yuk79UiqWPQ==
X-Received: by 2002:a17:902:9a83:: with SMTP id
 w3mr2795444plp.53.1588951089022; 
 Fri, 08 May 2020 08:18:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b5sm2125933pfb.190.2020.05.08.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 08:18:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/19] tcg: Increase tcg_out_dupi_vec immediate to int64_t
Date: Fri,  8 May 2020 08:17:44 -0700
Message-Id: <20200508151747.6166-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508151747.6166-1-richard.henderson@linaro.org>
References: <20200508151747.6166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we don't store more than tcg_target_long in TCGTemp,
we shouldn't be limited to that for code generation.  We will
be able to use this for INDEX_op_dup2_vec with 2 constants.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.inc.c |  2 +-
 tcg/i386/tcg-target.inc.c    | 20 ++++++++++++--------
 tcg/ppc/tcg-target.inc.c     | 15 ++++++++-------
 tcg/tcg.c                    |  4 ++--
 4 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index a7b1d36494..82b409ca7d 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -857,7 +857,7 @@ static void tcg_out_logicali(TCGContext *s, AArch64Insn insn, TCGType ext,
 }
 
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg rd, tcg_target_long v64)
+                             TCGReg rd, int64_t v64)
 {
     bool q = type == TCG_TYPE_V128;
     int cmode, imm8, i;
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 4118071dd9..5e73e5d02b 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -945,7 +945,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
 }
 
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg ret, tcg_target_long arg)
+                             TCGReg ret, int64_t arg)
 {
     int vex_l = (type == TCG_TYPE_V256 ? P_VEXL : 0);
 
@@ -958,7 +958,14 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         return;
     }
 
-    if (TCG_TARGET_REG_BITS == 64) {
+    if (TCG_TARGET_REG_BITS == 32 && arg == dup_const(MO_32, arg)) {
+        if (have_avx2) {
+            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTW + vex_l, ret);
+        } else {
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+        }
+        new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
+    } else {
         if (type == TCG_TYPE_V64) {
             tcg_out_vex_modrm_pool(s, OPC_MOVQ_VqWq, ret);
         } else if (have_avx2) {
@@ -966,14 +973,11 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         } else {
             tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret);
         }
-        new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
-    } else {
-        if (have_avx2) {
-            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTW + vex_l, ret);
+        if (TCG_TARGET_REG_BITS == 64) {
+            new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+            new_pool_l2(s, R_386_32, s->code_ptr - 4, 0, arg, arg >> 32);
         }
-        new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
     }
 }
 
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 7111da34dd..3f9690418f 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -913,7 +913,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 }
 
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long val)
+                             int64_t val)
 {
     uint32_t load_insn;
     int rel, low;
@@ -921,20 +921,20 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
 
     low = (int8_t)val;
     if (low >= -16 && low < 16) {
-        if (val == (tcg_target_long)dup_const(MO_8, low)) {
+        if (val == dup_const(MO_8, low)) {
             tcg_out32(s, VSPLTISB | VRT(ret) | ((val & 31) << 16));
             return;
         }
-        if (val == (tcg_target_long)dup_const(MO_16, low)) {
+        if (val == dup_const(MO_16, low)) {
             tcg_out32(s, VSPLTISH | VRT(ret) | ((val & 31) << 16));
             return;
         }
-        if (val == (tcg_target_long)dup_const(MO_32, low)) {
+        if (val == dup_const(MO_32, low)) {
             tcg_out32(s, VSPLTISW | VRT(ret) | ((val & 31) << 16));
             return;
         }
     }
-    if (have_isa_3_00 && val == (tcg_target_long)dup_const(MO_8, val)) {
+    if (have_isa_3_00 && val == dup_const(MO_8, val)) {
         tcg_out32(s, XXSPLTIB | VRT(ret) | ((val & 0xff) << 11));
         return;
     }
@@ -956,14 +956,15 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, TCGReg ret,
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
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a84a9d3d63..18ebcc98f6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -117,7 +117,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg dst, TCGReg base, intptr_t offset);
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                             TCGReg dst, tcg_target_long arg);
+                             TCGReg dst, int64_t arg);
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc, unsigned vecl,
                            unsigned vece, const TCGArg *args,
                            const int *const_args);
@@ -133,7 +133,7 @@ static inline bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
     g_assert_not_reached();
 }
 static inline void tcg_out_dupi_vec(TCGContext *s, TCGType type,
-                                    TCGReg dst, tcg_target_long arg)
+                                    TCGReg dst, int64_t arg)
 {
     g_assert_not_reached();
 }
-- 
2.20.1


