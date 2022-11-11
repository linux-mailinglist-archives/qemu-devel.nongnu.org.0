Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2426254BC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:57:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfs-0006by-6h; Fri, 11 Nov 2022 02:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfc-0006EC-Sx
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:49 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfa-0008Fc-Ry
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:48 -0500
Received: by mail-pg1-x52f.google.com with SMTP id e129so3790774pgc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6oOaMB/UTSXeF5QPT6/5LHPWXpkLpJtHXDzu2XZxCtc=;
 b=Zl//JQVlqoUv7GGmKg6zPMPGBfZpS4T47TeF7YMqFcY6rlmRA042k73g7kj7uDkgd0
 3LvWcR4FpQQ837Xg8IfvvTyQhLG8GsFmVxKPWoObyuSq9p69F2huVE3LbhbP7nSfSCsd
 ju8kDLa+Bk9vJMgYCzThjRWg6rB6FiycpxjMOurHEiOJO79rEwMILNL0/ncbiKC0CzAz
 STheaP0JGh0FjYHi42aNmomqPoqs3A4dBF3WMijsUBaQ6SwRlfUgfo1D7gWHv1RbSlM8
 RxQoRAGby19vzPk5yv7/fkiQS7PFyC0IBOPb8sRKJIqdlzd2LzNLyrjPfbG6TXQTrHbs
 zCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6oOaMB/UTSXeF5QPT6/5LHPWXpkLpJtHXDzu2XZxCtc=;
 b=Yt31kmqJ1mbanxd2fzt9iRzpc89eYUkJpbZJN6Ruy28JrC0v8+xcq3Z+7XfOXpyQ+N
 WJGr4ansxG8MqeFzJH3xNeifejYpa6DtaPy68Wxxq09m7LIYW5Tc3AMVbHnKxH0RkgRr
 D0NScYSTiWgfDiN3p/Kgz/I2kmPtTqHwDOKP81UlHU/xICZS+9PLyYyjDef15bTT9OSj
 nYDt90xenGkcPXWUeCHnKDWB46JUhS3aW6o6RgenxEX10Zzry1gS1sTgvKGOOHiWK9RE
 PDmg+L5r1O273Qvpygu7x7Uv65vuIiwaYxh3RooD5il/9oOCHc0ivviYFbgumXuRSbPu
 mCrg==
X-Gm-Message-State: ANoB5plwkGF198LV6TkxAbtZKriu/P0EODXi/iJ7k42UAu75b43bOAGP
 YY+N66VWKVtA2RJv1W5xii3KBIrio3/iryp9
X-Google-Smtp-Source: AA0mqf525iLX/T2djMwWl1gIVRyw9KoOc64B3nZxZMYxYFJb4DwkkVhRwZSAFQbLEnDIBYKVScCObw==
X-Received: by 2002:a63:3157:0:b0:473:ef9c:e1e5 with SMTP id
 x84-20020a633157000000b00473ef9ce1e5mr632479pgx.241.1668152505447; 
 Thu, 10 Nov 2022 23:41:45 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 16/45] tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with
 TCG_TARGET_CALL_ARG_I64
Date: Fri, 11 Nov 2022 17:40:32 +1000
Message-Id: <20221111074101.2069454-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

For 32-bit hosts when TCG_TARGET_CALL_ALIGN_ARGS was set, use
TCG_CALL_ARG_EVEN.  For 64-bit hosts, TCG_TARGET_CALL_ALIGN_ARGS
was silently ignored, so always use TCG_CALL_ARG_NORMAL.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.h         |  2 +-
 tcg/i386/tcg-target.h        |  1 +
 tcg/loongarch64/tcg-target.h |  2 +-
 tcg/mips/tcg-target.h        |  3 ++-
 tcg/riscv/tcg-target.h       |  6 +++++-
 tcg/s390x/tcg-target.h       |  1 +
 tcg/sparc64/tcg-target.h     |  1 +
 tcg/tci/tcg-target.h         |  5 +++++
 tcg/tcg.c                    |  6 ++++--
 tcg/ppc/tcg-target.c.inc     | 21 ++++++++-------------
 11 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index e145d50fef..d9dd777caa 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -51,8 +51,8 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
-#define TCG_TARGET_CALL_ALIGN_ARGS      1
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 56c1ac4586..09dd0550aa 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -88,8 +88,8 @@ extern bool use_neon_instructions;
 
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
-#define TCG_TARGET_CALL_ALIGN_ARGS	1
 #define TCG_TARGET_CALL_STACK_OFFSET	0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
 
 /* optional instructions */
 #define TCG_TARGET_HAS_ext8s_i32        1
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 00fcbe297d..42628a2791 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -98,6 +98,7 @@ typedef enum {
 #else
 #define TCG_TARGET_CALL_STACK_OFFSET 0
 #endif
+#define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 
 extern bool have_bmi1;
 extern bool have_popcnt;
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index a659c8d6fd..19d4c07170 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -92,8 +92,8 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
-#define TCG_TARGET_CALL_ALIGN_ARGS      1
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 7669213175..bb7312aed4 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -83,10 +83,11 @@ typedef enum {
 #define TCG_TARGET_STACK_ALIGN        16
 #if _MIPS_SIM == _ABIO32
 # define TCG_TARGET_CALL_STACK_OFFSET 16
+# define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_EVEN
 #else
 # define TCG_TARGET_CALL_STACK_OFFSET 0
+# define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 #endif
-#define TCG_TARGET_CALL_ALIGN_ARGS    1
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 11c9b3e4f4..2ab4b8d04a 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -81,8 +81,12 @@ typedef enum {
 /* used for function call generation */
 #define TCG_REG_CALL_STACK              TCG_REG_SP
 #define TCG_TARGET_STACK_ALIGN          16
-#define TCG_TARGET_CALL_ALIGN_ARGS      1
 #define TCG_TARGET_CALL_STACK_OFFSET    0
+#if TCG_TARGET_REG_BITS == 32
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
+#else
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#endif
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 23e2063667..7e86791ff6 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -166,6 +166,7 @@ extern uint64_t s390_facilities[3];
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_RET_NORMAL
 
 #define TCG_TARGET_EXTEND_ARGS 1
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 8655acdbe5..44ac164b31 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -72,6 +72,7 @@ typedef enum {
 #define TCG_TARGET_STACK_ALIGN          16
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
 #define TCG_TARGET_EXTEND_ARGS 1
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
 #if defined(__VIS__) && __VIS__ >= 0x300
 #define use_vis3_instructions  1
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index ceb36c4f7a..e11c293906 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -158,6 +158,11 @@ typedef enum {
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
+#if TCG_TARGET_REG_BITS == 32
+# define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
+#else
+# define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
+#endif
 
 #define HAVE_TCG_QEMU_TB_EXEC
 #define TCG_TARGET_NEED_POOL_LABELS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ec03bd3d6a..a23c5af1b7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1541,9 +1541,11 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
          * for passing off to ffi_call.
          */
         want_align = true;
-#elif defined(TCG_TARGET_CALL_ALIGN_ARGS)
+#else
         /* Some targets want aligned 64 bit args */
-        want_align = is_64bit;
+        if (is_64bit) {
+            want_align = TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN;
+        }
 #endif
 
         if (TCG_TARGET_REG_BITS < 64 && want_align && (real_args & 1)) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e3dba47697..d1d6a40c6c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -45,7 +45,9 @@
 #endif 
 
 #ifdef _CALL_SYSV
-# define TCG_TARGET_CALL_ALIGN_ARGS   1
+# define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_EVEN
+#else
+# define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
 #endif
 
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
@@ -2202,9 +2204,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     lo = lb->addrlo_reg;
     hi = lb->addrhi_reg;
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-        arg |= 1;
-#endif
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
     } else {
@@ -2250,9 +2250,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     lo = lb->addrlo_reg;
     hi = lb->addrhi_reg;
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-        arg |= 1;
-#endif
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
         tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
     } else {
@@ -2266,9 +2264,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     if (TCG_TARGET_REG_BITS == 32) {
         switch (s_bits) {
         case MO_64:
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-            arg |= 1;
-#endif
+            arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
             tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
             /* FALLTHRU */
         case MO_32:
@@ -2324,9 +2320,8 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         TCGReg arg = TCG_REG_R4;
-#ifdef TCG_TARGET_CALL_ALIGN_ARGS
-        arg |= 1;
-#endif
+
+        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
         if (l->addrlo_reg != arg) {
             tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
             tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-- 
2.34.1


