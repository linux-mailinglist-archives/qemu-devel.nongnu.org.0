Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6E607291
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:40:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnZT-0003V3-IZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:40:03 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHm-0003Kz-99
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHQ-0003ET-23
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:20 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHN-0005nk-Mo
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:19 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i3so1778293pfc.11
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=agyTV2jCK/77n3/Q34HNtG1TiDyGgsf/EB88ers/CYk=;
 b=U29KHWl+r540B7yvK5UZVx2rV+GDA4jacqhmS29SUP/FUo/X6Yzu5fkFWhObQqZX9d
 gvvHnu4wizIrdeyEKivbd5H17J1dSnTGND+Szfrllw1DJo6BWJwBWD/96ztdjKetrJMO
 nolz4hFMAmk4N2wVYyWnMWd0hhni28ebTI+5Fggw6CsHG3qfvXuhOE9TIk0h1SBu13Q2
 BvrB1RubbfFs1IuybA8XPQwE/l6Xhj6cO1soAQcOH7TNT46v3n6CRcya36QNknzBBgEY
 edtAX36S1WJ8xYpTBIvPonMp0yNpn+kIDOW8fDMacn55Qu5gcEFTmk5yBIO/9I8AuMEy
 j3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agyTV2jCK/77n3/Q34HNtG1TiDyGgsf/EB88ers/CYk=;
 b=m+bjsQKF4hhq1o/7Pio6SAba+2ymNptvug1NanJOWzTO5bqOo8/vb8onhL/mTcGERN
 OMjgf/MD3bX3yJt4EBES/TorrYeVmMYIGeHjX7mNt10lVIuNGcp+naljil+gyRQtmo5s
 tbs70IPp5gA97L/YDYNCaNC5NdvMUzKFpT8/alBZKAiyGgKK5zaFhKR5qn4zwEUAZql9
 +3qb32C7yRKqnmDEVQAmo3BFkbA3CAe5fNtxFQqyJQ6/CpK9EpnogAjAbea9nbOs6Uml
 nN6BxOakfluzStM7aNWQBWYKcPTXhIRY3mqNDYCWi1RvjmRMhmvIRWVi74hIEaUCpTRg
 AUww==
X-Gm-Message-State: ACrzQf0an/HcuO3padhNVrssBGwGceR2I3nzv2eAX0o+Cw4E5l93W1Fp
 wxedFJF1VmWDE56SiN6BVyiaOnbScYvBMDnW
X-Google-Smtp-Source: AMsMyM4fMaFqUKg9P2Engrnvd+F9tyeoO+Rg//V53D/eOOJT2g/l42vWMho4UyT2awJD84yHrktxWQ==
X-Received: by 2002:a63:1041:0:b0:46e:c6eb:22ee with SMTP id
 1-20020a631041000000b0046ec6eb22eemr216662pgq.442.1666336634737; 
 Fri, 21 Oct 2022 00:17:14 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/36] tcg: Replace TCG_TARGET_EXTEND_ARGS with
 TCG_TARGET_CALL_ARG_I32
Date: Fri, 21 Oct 2022 17:15:31 +1000
Message-Id: <20221021071549.2398137-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
index 9abff104bf..d4960c62b5 100644
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


