Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69468AB48
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU2-00057I-Ca; Sat, 04 Feb 2023 11:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTv-00051z-AG
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:40 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTt-0002XU-Gl
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o16-20020a17090ad25000b00230759a8c06so4650742pjw.2
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkRK+fflG5wa7KbWsSQf8KDjCmGoH8pSrYeZXgPP9Ts=;
 b=KnW+qrGNZoE0LTLivFLLJX9ON2vWBTHsD71QzoPojhzz4VNGo+5jaAXcZdx7jThomg
 CROK4UAbaTK2fy/dtWYKlMfXh9tF+/38cvpAV2wn5JSy+Zfd0A7Y9Nc6chlnWBvXyd2X
 gL7zOt41Km8LCubaKCXoIusldHk9lNmSHlsK3ZoqXAPPk3Jpzsq1ngrvGzqgQMfAAP/r
 ChzNd9l74RGHN5djXfD27VRJtlpmVZ/kysWPbZlUYR8kDbJvGK9PW9fXjM4VHy82hkT3
 qy/Uz2sf7yDWn9MfAPbQ1DppZW3Uo7IVTEw4pxpYZANkglpN/X2xWSe9455W40Ia7Umk
 nUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkRK+fflG5wa7KbWsSQf8KDjCmGoH8pSrYeZXgPP9Ts=;
 b=ecnwMtZjBvbFlZqrfB7S/FY8ITBnAdxrUs6Qyz1PPg8JgnnIxWOGJ4j8eCg6JNH2LL
 RpypnLR6+k1FtxPYY3Booz9Et5+h6s+UpOFaEUoH83H4QZJ7WbSXwDKVeqNq0qTRajBD
 sCQggF4YLri2AUALsqolsiIs+X2KY3/hnedvdLA+eieWRkH6dkTF1q9QSOUe0Sy7x/L+
 kAv1loo+cF9JZV+TMVMQPhyE3TNQqWzqASgC1fWrxSgaeH21DPIZAwBMpiZkqOrE0C8X
 ozTzA0vbzgMs9RNbRnXNUaIYpaB4z6SST/esdXd3OS6/OyQN2HOvpe9ATEwjy1MvcZ/S
 T9CQ==
X-Gm-Message-State: AO0yUKXq1PSV/G8IAA9gly65tSAWwHUaS6xIqWj5hIJnk94MSzMKA/d/
 jc9Y8Fxq+sA5PlVHVd6VTeKbigRASyYv5vdg
X-Google-Smtp-Source: AK7set+2X8XF+AX/zdp9esx7ohREoftEPwCH+V7xvZ4yAFrIboJuhIJeNOfBftBwf3uhFja9m726tw==
X-Received: by 2002:a17:902:e801:b0:196:e68:2e1d with SMTP id
 u1-20020a170902e80100b001960e682e1dmr8918416plg.59.1675528415958; 
 Sat, 04 Feb 2023 08:33:35 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 14/40] tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Sat,  4 Feb 2023 06:32:44 -1000
Message-Id: <20230204163310.815536-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Fill in the parameters for the host ABI for Int128 for
those backends which require no extra modification.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     | 2 ++
 tcg/arm/tcg-target.h         | 2 ++
 tcg/loongarch64/tcg-target.h | 2 ++
 tcg/mips/tcg-target.h        | 2 ++
 tcg/riscv/tcg-target.h       | 3 +++
 tcg/s390x/tcg-target.h       | 2 ++
 tcg/sparc64/tcg-target.h     | 2 ++
 tcg/tcg.c                    | 6 +++---
 tcg/ppc/tcg-target.c.inc     | 3 +++
 9 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 8d244292aa..c0b0f614ba 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -54,6 +54,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 91b8954804..def2a189e6 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -91,6 +91,8 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_CALL_STACK_OFFSET	0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
 /* optional instructions */
 #define TCG_TARGET_HAS_ext8s_i32        1
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 8b151e7f6f..17b8193aa5 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -92,6 +92,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      1
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 7bc8e15293..68b11e4d48 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -89,6 +89,8 @@ typedef enum {
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
 #endif
 #define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128      TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_RET_I128      TCG_CALL_RET_NORMAL
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 1337bc1f1e..0deb33701f 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -85,9 +85,12 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #if TCG_TARGET_REG_BITS == 32
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
 #else
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
 #endif
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 /* optional instructions */
 #define TCG_TARGET_HAS_movcond_i32      0
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index e597e47e60..a05b473117 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -169,6 +169,8 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_BY_REF
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 1d6a5c8b07..ffe22b1d21 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -73,6 +73,8 @@ typedef enum {
 #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
 #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
 #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
 #if defined(__VIS__) && __VIS__ >= 0x300
 #define use_vis3_instructions  1
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 865ed5ea0f..163913c95f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -765,8 +765,8 @@ static void init_call_layout(TCGHelperInfo *info)
         break;
     case dh_typecode_i128:
         info->nr_out = 128 / TCG_TARGET_REG_BITS;
-        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
-        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        info->out_kind = TCG_TARGET_CALL_RET_I128;
+        switch (TCG_TARGET_CALL_RET_I128) {
         case TCG_CALL_RET_NORMAL:
             /* Query the last register now to trigger any assert early. */
             tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
@@ -854,7 +854,7 @@ static void init_call_layout(TCGHelperInfo *info)
             break;
 
         case TCG_TYPE_I128:
-            switch (/* TODO */ TCG_CALL_ARG_NORMAL) {
+            switch (TCG_TARGET_CALL_ARG_I128) {
             case TCG_CALL_ARG_EVEN:
                 layout_arg_even(&cum);
                 /* fall through */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index f3fec14118..afadf9a1e3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -54,6 +54,9 @@
 #else
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
 #endif
+/* Note sysv arg alignment applies only to 2-word types, not more. */
+#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
+#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
 
 /* For some memory operations, we need a scratch that isn't R0.  For the AIX
    calling convention, we can re-use the TOC register since we'll be reloading
-- 
2.34.1


