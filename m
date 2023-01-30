Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FF681D38
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1Z-0001xD-6Y; Mon, 30 Jan 2023 16:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1X-0001wv-JV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:11 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1V-0005d3-Mc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:11 -0500
Received: by mail-pl1-x636.google.com with SMTP id h9so4498746plf.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6SvEHx78kS2KADmPPjCHAzl8COWQD557fy1pkfTl6o=;
 b=QpPz7oZ/o/gob8ZVYqdSmCFGJNoQCugVqTvtUmSGz7bnTINCBdarRniEaZelWiwFgY
 xRoLUST3W6GiEtZwBqQUaUx2Gf0ZFrCufz4NaP04D7x3jszid61r4K9npJZfez5y04Po
 SLJY0O2PZVT44YPRP7K//2Qahmck4zht4mHNbKXEdgE04sxuzOsAKQhz3YYyjp6qWVj8
 Xk67yZiiPTU+qyjlSm0thHPbQqDeG2tPaM2GkAQeYaPL33xuORB7HuAFFo+3WUYZhSCo
 C3TDgkbfKKw0Kze1fV9Rj6VJWja2xhi5ogWUrtpI6sAu6H/Sn6R4ujJV6j+kZCTDpOhk
 o4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6SvEHx78kS2KADmPPjCHAzl8COWQD557fy1pkfTl6o=;
 b=5qIrnVvSJ3DUSBdD/tgU7dWDCGvxt4W4ZabuSwHUo7zT1GZwJbh7r+1wzABTcb00Qm
 CL8UvSIWXx2dWhLHj32+xlordM5avha7B9rigP8yUKAim+heghtQHtUZfv2njBVPu/E4
 O3rJ4r9B3pElRmcMnFPiDNcnYAlQJH+FyYBKJJP2ZEBIAwZqn2Hi4Dy4RZyFMUrFX/II
 OZrfgc0GogUHlVsRHChg9qhrttC5tnK0BOKKLTqDWrz4o1H+5NHx6zZ4wvL54pA+gKwZ
 RtshKYzA4kdPE/wxNmeQzxHPwRYte4WaKMo6+alAcJbXpn18WrcNLXjhYFpmBcNDk9k3
 YH5g==
X-Gm-Message-State: AO0yUKVbe1gI7Iv1jzoJT4xKJsd1usJEyVKNQTKzg8KdwFUcxILc5dEs
 dwal4V83ajB4igdaLwlfJ2KjQ1Cm/haNu/sJ
X-Google-Smtp-Source: AK7set9fas0YE1YuGht8kUVrcjNR1TvvlNOgoT8Wx9oTAxgdmlAjXwfUL7Ga9Q9mttIZYCTjK6HrHw==
X-Received: by 2002:a17:90a:1988:b0:22c:6b5b:8509 with SMTP id
 8-20020a17090a198800b0022c6b5b8509mr10643798pji.16.1675115348243; 
 Mon, 30 Jan 2023 13:49:08 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v6 12/36] tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Mon, 30 Jan 2023 11:48:20 -1000
Message-Id: <20230130214844.1158612-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
index 5792d72e08..0a4ad99a12 100644
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


