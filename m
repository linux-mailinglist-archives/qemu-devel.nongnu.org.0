Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D776060C1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:58:42 +0200 (CEST)
Received: from localhost ([::1]:58868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV7A-00076W-5j
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:57:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV6Y-0000GN-Or
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7x-0005Qi-JG
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7g-00013M-Bv
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:19 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p6-20020a17090a748600b002103d1ef63aso2825662pjk.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rc5eKaPoq15S3q+CyuaJRWW7YVkSg/Gi4+WBpExbrwE=;
 b=xyw7pEW2/xFt1SZalICvUAxcKzyIPzvJSHj/LXznwGJCTOfFv1ZzOPDeF4n1kAhFRb
 vGjRdG3C2uG7wMz1EX8MBM7mkWMTC+M3bjQxADWO8idlQvq3+hXXcpAEgektKfN7+TkP
 QTDt4LlaRa8jDYCiHvWVlKRw9WOSG6gy9wRB97Pyv7Nst5kQexKGjOgx6tulNDJXzAv9
 GDrHWjGW5WnSmM52Kxrt5X+aGGutsXJyHxB5osdbuHqDIU3Xgo9siPitAs55sWr2/OBm
 MgoxSV4RgqcXiP4hhaw55wxCsTrXKj0SQ6I9eeds0P+dcBaET/ldfsUV2FCOpnGW9HGW
 FoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rc5eKaPoq15S3q+CyuaJRWW7YVkSg/Gi4+WBpExbrwE=;
 b=S63jl6hKZ2UKUZ0M1+VyyxHxok4EY+jJuc5bPaboAwcJ0KI/5ccF43r+Cz9FYkWk2T
 OwdIjJyQ2f1RUCVe7Xpe7uE1ivWoFrYEfyJHEPJ3GDbuez7esvloq4RBbqGfMXf1i467
 TYm2XuuP7maE9NWW4zBRwCRerWJHcWVWiS4Waa61ODS2PD33MOiyYJxyTBpaTWlz0Ghv
 wMUGWIrOo5M4VZ12FflnhYzAsPK0WQ43J7OORXJwd40CW5n9bPulxz55zUXHQeiPP75K
 py5YaldULP6mta110RjfHcR4qsARZQvglstMgGrryideFNyd6wR8cvwpHNATvcNpXCue
 hy0A==
X-Gm-Message-State: ACrzQf1JMz8Bu6zEU36CW2lhcTrZMZynUgx0X70mKfqrGU0la3jRPBXC
 qecmTU1XX5Rs5vnqZE0hUU7NN93nMAkw9kKy
X-Google-Smtp-Source: AMsMyM4LEvONgaau+hW/sPLYUMBYi00JxR8g9AzSlxHpgj/sJCrQ51Wz3sXvmFk8wmxp8mDAzLPAhA==
X-Received: by 2002:a17:902:c946:b0:183:4bdf:9478 with SMTP id
 i6-20020a170902c94600b001834bdf9478mr13140792pla.139.1666266841336; 
 Thu, 20 Oct 2022 04:54:01 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/31] tcg: Replace TCG_TARGET_EXTEND_ARGS with
 TCG_TARGET_CALL_ARG_I32
Date: Thu, 20 Oct 2022 21:52:27 +1000
Message-Id: <20221020115242.2301066-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For 64-bit hosts that had TCG_TARGET_EXTEND_ARGS, set
TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EXTEND.
Otherwise, use TCG_CALL_ARG_NORMAL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  1 +
 tcg/arm/tcg-target.h         |  1 +
 tcg/i386/tcg-target.h        |  1 +
 tcg/loongarch64/tcg-target.h |  1 +
 tcg/mips/tcg-target.h        |  1 +
 tcg/riscv/tcg-target.h       |  1 +
 tcg/s390x/tcg-target.h       |  2 +-
 tcg/sparc64/tcg-target.h     |  2 +-
 tcg/tci/tcg-target.h         |  1 +
 tcg/tcg.c                    | 42 ++++++++++++++++++------------------
 tcg/ppc/tcg-target.c.inc     |  6 +++++-
 11 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index d9dd777caa..413a5410c5 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -52,6 +52,7 @@ typedef enum {
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 09dd0550aa..b7843d2d54 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -89,6 +89,7 @@ extern bool use_neon_instructions;
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	0
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
 
 /* optional instructions */
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 42628a2791..7edb7f1d9a 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -98,6 +98,7 @@ typedef enum {
 #else
 #define TCG_TARGET_CALL_STACK_OFFSET 0
 #endif
+#define TCG_TARGET_CALL_ARG_I32      TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 
 extern bool have_bmi1;
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 584cac3dc2..74fbb22dfd 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -89,6 +89,7 @@ typedef enum {
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index bb7312aed4..15721c3e42 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -88,6 +88,7 @@ typedef enum {
 # define TCG_TARGET_CALL_STACK_OFFSET 0
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 0b2171ebf0..6f3b142317 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -82,6 +82,7 @@ typedef enum {
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 7e86791ff6..db5665c375 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -166,9 +166,9 @@ extern uint64_t s390_facilities[3];
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_RET_NORMAL
 
-#define TCG_TARGET_EXTEND_ARGS 1
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 44ac164b31..0044ac8d78 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -71,7 +71,7 @@ typedef enum {
 #define TCG_TARGET_STACK_BIAS           2047
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
-#define TCG_TARGET_EXTEND_ARGS 1
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 #if defined(__VIS__) && __VIS__ >= 0x300
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index e11c293906..d6e0450ed8 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -158,6 +158,7 @@ typedef enum {
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #if TCG_TARGET_REG_BITS == 32
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
 #else
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 41052869cb..b83bb23281 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1493,24 +1493,24 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     }
 #endif
 
-#if defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
-    for (i = 0; i < nargs; ++i) {
-        int argtype = extract32(typemask, (i + 1) * 3, 3);
-        bool is_32bit = (argtype & ~1) == dh_typecode_i32;
-        bool is_signed = argtype & 1;
+    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
+        for (i = 0; i < nargs; ++i) {
+            int argtype = extract32(typemask, (i + 1) * 3, 3);
+            bool is_32bit = (argtype & ~1) == dh_typecode_i32;
+            bool is_signed = argtype & 1;
 
-        if (is_32bit) {
-            TCGv_i64 temp = tcg_temp_new_i64();
-            TCGv_i32 orig = temp_tcgv_i32(args[i]);
-            if (is_signed) {
-                tcg_gen_ext_i32_i64(temp, orig);
-            } else {
-                tcg_gen_extu_i32_i64(temp, orig);
+            if (is_32bit) {
+                TCGv_i64 temp = tcg_temp_new_i64();
+                TCGv_i32 orig = temp_tcgv_i32(args[i]);
+                if (is_signed) {
+                    tcg_gen_ext_i32_i64(temp, orig);
+                } else {
+                    tcg_gen_extu_i32_i64(temp, orig);
+                }
+                args[i] = tcgv_i64_temp(temp);
             }
-            args[i] = tcgv_i64_temp(temp);
         }
     }
-#endif /* TCG_TARGET_EXTEND_ARGS */
 
     op = tcg_emit_op(INDEX_op_call);
 
@@ -1571,16 +1571,16 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     tcg_debug_assert(TCGOP_CALLI(op) == real_args);
     tcg_debug_assert(pi <= ARRAY_SIZE(op->args));
 
-#if defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
-    for (i = 0; i < nargs; ++i) {
-        int argtype = extract32(typemask, (i + 1) * 3, 3);
-        bool is_32bit = (argtype & ~1) == dh_typecode_i32;
+    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
+        for (i = 0; i < nargs; ++i) {
+            int argtype = extract32(typemask, (i + 1) * 3, 3);
+            bool is_32bit = (argtype & ~1) == dh_typecode_i32;
 
-        if (is_32bit) {
-            tcg_temp_free_internal(args[i]);
+            if (is_32bit) {
+                tcg_temp_free_internal(args[i]);
+            }
         }
     }
-#endif /* TCG_TARGET_EXTEND_ARGS */
 }
 
 static void tcg_reg_alloc_start(TCGContext *s)
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index d1d6a40c6c..500b75a03a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -44,6 +44,11 @@
 # endif
 #endif 
 
+#if TCG_TARGET_REG_BITS == 64
+# define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_EXTEND
+#else
+# define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_NORMAL
+#endif
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_EVEN
 #else
@@ -2520,7 +2525,6 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 
 /* Parameters for function call generation, used in tcg.c.  */
 #define TCG_TARGET_STACK_ALIGN       16
-#define TCG_TARGET_EXTEND_ARGS       1
 
 #ifdef _CALL_AIX
 # define LINK_AREA_SIZE                (6 * SZR)
-- 
2.34.1


