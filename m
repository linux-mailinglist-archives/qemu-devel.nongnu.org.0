Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7231625514
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfr-0006bh-Py; Fri, 11 Nov 2022 02:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfk-0006OC-3P
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:57 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfd-0008He-Bg
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:51 -0500
Received: by mail-pj1-x1036.google.com with SMTP id k5so3768401pjo.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20PLRuYTKO3Drl843or1+TFvXCIkhFXtY1RhfnvDMn4=;
 b=Z5d+XCNe13fdezXz89C6PAvmYxygINZKy+eSH6a2IrFzyYX1DWOPE469NKitm0IJFS
 OiWVRfHY9WdA7EAhP2jDoyUHAI9rehdYjY0ZH0a/pQX+JVi7uavydCvRFoIQy1bjdTXc
 FJsXa1jj3VSneNQW+xG8PDNWFLGMSvr0rYRVB1aNUxWEJ2eYCGUH5AfeB5m0Pkin2/fE
 bCQ5Z/Hrr6V2dx7UsQw7B0Do61qZURw7zjU57qjvDIAqpGXk6qRn/LJNXIBnzbb6y1uI
 zUQpXvHTHCL4u5CvTavqv7ZBvB2Z+pOt75IQQVu+xZeRznHI9DM1vAMm0SmTOmfIaL7d
 /dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20PLRuYTKO3Drl843or1+TFvXCIkhFXtY1RhfnvDMn4=;
 b=AiGovyX9dp5tGQ0v8tVO9C6BH6JefDv8OhjFx0FO51BNg4gIfXUwENGssEGtSOGVx+
 dcqUOqiY5C1tXcg+kl4bOx3mdk5BkUhG8DVs2YxMzx0WIcVRJdwmsda7USSSh2h4AqKs
 utgv3d6Z8OVDlwXqDKR/XX3yS456eInEhl/YyLXUMcoG91AGqlIpQ0znKHY8I4MUGrF8
 0Hl+CrXgi2/N7m9qjeWnnHREFovSoAZ7Z+wTPzJ+AuGH1Hyb/MgdpyuBAfzWAkst97ue
 a8YnTvI2gpJIWrsL/qCQgrsShL5QsgKcU5fx00Oba3s+9eE4e1j0wm5u+zARhFER7v5q
 7+Ow==
X-Gm-Message-State: ANoB5pnZWsITgZNPRhhoghl86A+ahKdTstmtvEyOVdQeue32lOZcgBVx
 ZhZ5C9sXR7nqOXCmkLaeZie8Bk+pU1YEY71t
X-Google-Smtp-Source: AA0mqf4NtmVHcrbNoM4/AYMaUp0ER0OP0L5kdL/yjSa98TQFAtr/AgedAt6uXMovf1pWgTPgkXP/Vg==
X-Received: by 2002:a17:90b:d86:b0:213:5dd:f523 with SMTP id
 bg6-20020a17090b0d8600b0021305ddf523mr653566pjb.63.1668152508087; 
 Thu, 10 Nov 2022 23:41:48 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 17/45] tcg: Replace TCG_TARGET_EXTEND_ARGS with
 TCG_TARGET_CALL_ARG_I32
Date: Fri, 11 Nov 2022 17:40:33 +1000
Message-Id: <20221111074101.2069454-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For 64-bit hosts that had TCG_TARGET_EXTEND_ARGS, set
TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EXTEND.
Otherwise, use TCG_CALL_ARG_NORMAL.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index 19d4c07170..e5f7a1f09d 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -93,6 +93,7 @@ typedef enum {
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
index 2ab4b8d04a..232537ccea 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -82,6 +82,7 @@ typedef enum {
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #if TCG_TARGET_REG_BITS == 32
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
 #else
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
index a23c5af1b7..b43a5200ad 100644
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


