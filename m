Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B666AB3BF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:41:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyu7-0004Wq-UZ; Sun, 05 Mar 2023 19:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytb-0004Ot-Gb
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:07 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytZ-0006ZS-7l
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:07 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so8530286pla.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffWg6mEljAFhezdHqYZAazycsN64dtuZ/7E8yDlKLu8=;
 b=vab1gcLxBi5sG0Vim+bTE00g7u2tiq8YVEOykRJzyVszXZONCne9iAUHFZlvpprBwr
 GVmArI8SwfiUtHw0FmqTNccsgiHQA884Ougj1yVJphmx7paDKtDrnVbeStGJWX0o7os7
 dPpbaKU/cZbQ6QFvVaeR4iyz6NV8zfoNEhhsc+7xlZHOOSJboWAkB2v76aLyRdLDtImt
 JFgmZLRbVxdJSqe1j5iJDW/teYJep6rYl72m7ayzWIDH1Dy0/DwqcRQNVWn1TJ23Po5v
 Y9kQec6fAcRFx1Q08ZwBmVCTiXE+jL9SmxIzOlYOeXui+zzdktGK3sPbR+5H2ferwC3r
 53KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffWg6mEljAFhezdHqYZAazycsN64dtuZ/7E8yDlKLu8=;
 b=Vxsx6dfh5O3EuOlhf4dzi3fl1yfQyPXAYpGNXzyP1EXecX7BKduVZfL8Zyfxn3d0cF
 IJVYZoLxDo8MS1XemZC2WAiTa8tRasG79JGfRHIOZGhngtxKModbwLLMEOnUvuDFEEi3
 5asz+gAA1XMsgvpBv4oMi7TtpaxrQd1elLCFmBtblhUI1GyQ1KqjFP4PE3DDe3xzQZye
 n5lJJcndr8JyRAV23M1iW7iXDbv9UBFs3pNbjVcjkppRobAq25banl8TQV4McJ+gEb11
 w/gnkYE7tvipfbAZBKSPZUEDV932u3SGgXkWdJogaWYeTHOecPZQPUzXkTL+2h1YOrNJ
 SFgg==
X-Gm-Message-State: AO0yUKWLm2Eii7dpkKu8gcMdYh38VCouP4EhfViYz45oDu2MlchDIUic
 J3H2RcVhwSQRsnPrAwNTFTGtEVYYni0liHelfTJQHQ==
X-Google-Smtp-Source: AK7set9GrlhEfXtdHhtpc+PrkrKktbiSS/xCyTavxprjTsBb2lxvWW0KOv+G7Xf+pcsfoU1jjbPWBA==
X-Received: by 2002:a17:90b:4c43:b0:237:5db6:22be with SMTP id
 np3-20020a17090b4c4300b002375db622bemr9219485pjb.49.1678063203890; 
 Sun, 05 Mar 2023 16:40:03 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/84] include/qemu/cpuid: Introduce xgetbv_low
Date: Sun,  5 Mar 2023 16:38:39 -0800
Message-Id: <20230306003954.1866998-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Replace the two uses of asm to expand xgetbv with an inline function.
Since one of the two has been using the mnemonic, assume that the
comment about "older versions of the assember" is obsolete, as even
that is 4 years old.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/cpuid.h      |  7 +++++++
 util/bufferiszero.c       |  3 +--
 tcg/i386/tcg-target.c.inc | 11 ++++-------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
index 7adb12d320..1451e8ef2f 100644
--- a/include/qemu/cpuid.h
+++ b/include/qemu/cpuid.h
@@ -71,4 +71,11 @@
 #define bit_LZCNT       (1 << 5)
 #endif
 
+static inline unsigned xgetbv_low(unsigned c)
+{
+    unsigned a, d;
+    asm("xgetbv" : "=a"(a), "=d"(d) : "c"(c));
+    return a;
+}
+
 #endif /* QEMU_CPUID_H */
diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index 1790ded7d4..1886bc5ba4 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -258,8 +258,7 @@ static void __attribute__((constructor)) init_cpuid_cache(void)
 
         /* We must check that AVX is not just available, but usable.  */
         if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >= 7) {
-            int bv;
-            __asm("xgetbv" : "=a"(bv), "=d"(d) : "c"(0));
+            unsigned bv = xgetbv_low(0);
             __cpuid_count(7, 0, a, b, c, d);
             if ((bv & 0x6) == 0x6 && (b & bit_AVX2)) {
                 cache |= CACHE_AVX2;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 883ced8168..028ece62a0 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -4156,12 +4156,9 @@ static void tcg_target_init(TCGContext *s)
         /* There are a number of things we must check before we can be
            sure of not hitting invalid opcode.  */
         if (c & bit_OSXSAVE) {
-            unsigned xcrl, xcrh;
-            /* The xgetbv instruction is not available to older versions of
-             * the assembler, so we encode the instruction manually.
-             */
-            asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (0));
-            if ((xcrl & 6) == 6) {
+            unsigned bv = xgetbv_low(0);
+
+            if ((bv & 6) == 6) {
                 have_avx1 = (c & bit_AVX) != 0;
                 have_avx2 = (b7 & bit_AVX2) != 0;
 
@@ -4172,7 +4169,7 @@ static void tcg_target_init(TCGContext *s)
                  * check that OPMASK and all extended ZMM state are enabled
                  * even if we're not using them -- the insns will fault.
                  */
-                if ((xcrl & 0xe0) == 0xe0
+                if ((bv & 0xe0) == 0xe0
                     && (b7 & bit_AVX512F)
                     && (b7 & bit_AVX512VL)) {
                     have_avx512vl = true;
-- 
2.34.1


