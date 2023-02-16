Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD95698AD6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:01:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUT3-0003O7-9m; Wed, 15 Feb 2023 21:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSy-0003NW-3o
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:48 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSv-0005QM-TJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:47 -0500
Received: by mail-pg1-x531.google.com with SMTP id b22so422391pgw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffWg6mEljAFhezdHqYZAazycsN64dtuZ/7E8yDlKLu8=;
 b=DI74/wz0Tf9uWZmcF8woYJJtLuWBhJkyj83QwIAyTzeFqGzB7xLD2OsIlPNB5EE6ng
 es+uHGsfCXTBkdNXXo1t+wvpALwTqlrjm3n7PunCntWuyqYTx5L8ovqIjVn1hvmXithg
 M/YlmqyN9vRLcErZKsVzCxZecydRnA4WKJvsgiTHPdP7UBg5FKFlPwL+wFLFXV35VrWv
 giY7N6ZvSRidS+WiJHel4xbjvw4jNflTEtNDJYHIv7KP7A5MpcX9iz8yuc1xmLsmfjAy
 30UVXXj0rY0OrCTtK4GxNP+vsrga3m3PhaLOaB9a59Hg1w+o8MTk276XCDhASc0EWfLv
 dSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffWg6mEljAFhezdHqYZAazycsN64dtuZ/7E8yDlKLu8=;
 b=2panj78p01Kl8+kmian9Dnq0+a81ZPoF8IuLx1MVXaknea1pnHuItJDArU6NZGU0+N
 kyqr7Fa9M6/MaWyt5poPndMk9OiwdokyHAULqBwGnsNoqqDaLOBQxf6G7yj2uOkUi3FN
 GSkz4uGiFt8wwUiP0k+6VkSAJdcQrJBL9Cz1l73Qxq/Q1MyjAJpD8WmbZsdc7jc9QEoJ
 riJmJNok4SijamfqsKIathAjbbtc7aiNg6YK+oBQIGtqU35rs+sKeKRUVZVj0BNLxW8O
 RE00OybrmKlq06sp6O/u2lhFGIFVod1fCfAjcBR8uQCdJHJ8+n4Mpg+nJj0YtXsjMReP
 gkFQ==
X-Gm-Message-State: AO0yUKWH2jH5PmW89/M+mE9Gg85PLufzQ0ADu764oVYu2B9CKRDX1jx4
 C4Ep2sUG/inLNOPtv4KK/500YfVWTSeicTla2oQ=
X-Google-Smtp-Source: AK7set8OOuVi14yd6/dF9VF2RX+b0YxVMz3ZXzEinyoG7kwtC6QSOlvdt1PTGTzLJFqT0cWH2QzAjw==
X-Received: by 2002:aa7:9987:0:b0:593:da8:6f34 with SMTP id
 k7-20020aa79987000000b005930da86f34mr3742143pfh.5.1676516264054; 
 Wed, 15 Feb 2023 18:57:44 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/30] include/qemu/cpuid: Introduce xgetbv_low
Date: Wed, 15 Feb 2023 16:57:10 -1000
Message-Id: <20230216025739.1211680-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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


