Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197406593CF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:24:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sM-0003of-UI; Thu, 29 Dec 2022 19:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rW-00039F-Us
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rQ-0002jd-7G
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:00 -0500
Received: by mail-pj1-x1030.google.com with SMTP id ge16so17131479pjb.5
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zIJdev9f6FqNrYV6nh9URYnonADnNgl0AKCoCziF+c=;
 b=IXf3xApUCcIj7OFpCd39io3RX1q+6/ydzTFZJR6RwDH+Ir+eW4UCMIXLidcLCk5hMx
 PqhNK71HvyvKeFvqm9aheVUC24M3YYXgMrkhMFF2Um8jlr5Bf2i554a9cafgK9VNsA5b
 kpZjFzCM+47pKA0p6ZAFiBS0Q20AXi/MuEPMUhdrAUxnN+DXJ4IDkr2Pc9tyiZJl+3kF
 EemrNOZW6RwmhAZvDFnCba8/1MiMGbvVmGZB/3nMmiHPeAMsbwjYMJoCoCDwTMOaOtLm
 ov36xdNMPSEYOTR75hGeA643ANL+inc3A4/A3EH85uXrSTE1ZBPVE75ztoftaFG6kpCI
 Tj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zIJdev9f6FqNrYV6nh9URYnonADnNgl0AKCoCziF+c=;
 b=7Nrr8X1YFmWeSOVuLx+iSHXSq347Pxo6im5KiqMAsCP+5h8rWTAii4qbAseCWU8dM1
 eylPcYzTk/4N0tMvHfrfZU8tDhC7yuze63XxvkY7U54M2wVd3OX/rZDUrdzWWCXpxsi8
 BV5adjAif+gh4kDj57NhuwgifzgvI6iWY17M0uX8aCxhuQYNPSKp7lxJaHyqpne2E6Pw
 hXeYUAmg6DSQStXQ6cQYMbciePPyCCqDSmJla3bSCdkYpv040wrz/1LrKanh9vckdrdJ
 AsuRX0kOBxfkhUZi7dQjnCwL8LvjCvmJ1k6sEzHxVIOvvcRDaO3ElQW+iS9ZsYPq5rsa
 8wNQ==
X-Gm-Message-State: AFqh2kplQlWCdm7DOUJAv5WlmENpcYBcYTzsK7Qc3O6nE8JhibNxqGzE
 pNXWQmgAqc9dsRCBZoLvrnNFaEyEJgGMmD4n
X-Google-Smtp-Source: AMrXdXuci454aNR/yfFaa/9/NSMR0hxOf+M0/MD2DHcTe1oEHAsb/jHeOY0CmFAb812vxlai5Vj98g==
X-Received: by 2002:a17:902:b493:b0:191:1fbf:cd4b with SMTP id
 y19-20020a170902b49300b001911fbfcd4bmr29047327plr.38.1672358569722; 
 Thu, 29 Dec 2022 16:02:49 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 29/47] tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with
 TCG_TARGET_CALL_ARG_I64
Date: Thu, 29 Dec 2022 16:02:03 -0800
Message-Id: <20221230000221.2764875-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
index 23e2063667..3f77fcf5b3 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -166,6 +166,7 @@ extern uint64_t s390_facilities[3];
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
+#define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
 
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
index 02b2103daf..e4a6689bda 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1542,9 +1542,11 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
index 9e34df94ba..c2e6bc3296 100644
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


