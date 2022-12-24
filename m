Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10B655C02
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:16:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP0-0002iz-Sg; Sat, 24 Dec 2022 18:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOo-0002Q3-3l
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:56 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOl-0006GT-Vh
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:53 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so8001218pjm.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOnun1gj2MJ7bcEZ/RrytneSuuImjXAZrtV+jstCUNA=;
 b=kCXoFVORgdO7M1aK713svJr+4aj+zxFcfuOyAU2t2VIKYmm+1CsoA9FnxYyIBsu4jH
 qMNIpcwiXhxmut6fHn2ax4p1zRDdH0qyUkgaUZlgrthsriY9l0x0mZUlNB4sUtKPhTqL
 EosS0uJk3ur6IhbTch9o2ks7fmb5hgBWb/rGgb9weEO9FHTkg3ZwE82vp2QYLfrr+Beu
 OgJn+Z/x/o10d3rtWDquJWLyf2cGf55hbCnM2GbluSt5RK7+y7rCoU1GsMo43nj0bp3O
 eu2Q4U8vitSBPQwot9Y/EhYaHA28s4fgsd9u8UANGxrnf9uqz24lVZBuyUb07CgsN7h5
 Ck7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOnun1gj2MJ7bcEZ/RrytneSuuImjXAZrtV+jstCUNA=;
 b=A2ol8qbrLLOngMBuD8ayOCO0NpgvU6BR2Iq8C3El1CjDzVOxZqnQjtL8rlhcuJfIKz
 iHPR87qhPNv0YX7+InxZG0sqAUpNNhQwOE3nD0rCTBUCoq/noquljHN9L+HVfJsCK5Cz
 ZGDF6QxmQXqWPfhVhCtZVXDNhzKwkiGOLeYrPOtdFo1/vAQhJu85X/Pkl4xV1RRS9kLn
 MFk3PL8L9/y9+LragYwZ9aYqmcZKWcaBC0XjvcaUyy60wEeq/pkhh31pIlV9h4wx/T0s
 /qnALRbtVdF5QuG2jt5U7sB0FIwTahc4hXyIum/UGDvggmcBf9Xw7GUPB7ZzbBEGJDJk
 a6cA==
X-Gm-Message-State: AFqh2krll9B8AsGXeX+4TmvHXpXXeeOxE34AAkoO8H3QBU73cYXAwRvs
 Tk/HYL2cr9cpd5HZOVAC1gkW8maBeSrFG3f9
X-Google-Smtp-Source: AMrXdXushKzAqITpqRazBdfiDttaXnv7g0ihtgqhbfPdWPtZ+HtBhkl1GDj5oGAs6QsoltZTRAOQLA==
X-Received: by 2002:a17:902:b58e:b0:191:24a:63e3 with SMTP id
 a14-20020a170902b58e00b00191024a63e3mr14393665pls.50.1671926270757; 
 Sat, 24 Dec 2022 15:57:50 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 30/43] tcg: Replace TCG_TARGET_EXTEND_ARGS with
 TCG_TARGET_CALL_ARG_I32
Date: Sat, 24 Dec 2022 15:57:07 -0800
Message-Id: <20221224235720.842093-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index 3f77fcf5b3..22d70d431b 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -166,9 +166,9 @@ extern uint64_t s390_facilities[3];
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
+#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
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
index 3ca25f7a28..4c397cb0fa 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1494,24 +1494,24 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
 
@@ -1572,16 +1572,16 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
index c2e6bc3296..38ee9974cd 100644
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


