Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7D62F1D3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:51:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxys-0007KC-US; Fri, 18 Nov 2022 04:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxyc-000768-CA
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:06 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxya-0001yU-OW
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:02 -0500
Received: by mail-pl1-x636.google.com with SMTP id w23so4081102ply.12
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m/CUiseesWXfy8ONw/IKq3y2jtfhBMrDZnaeFnHh+EA=;
 b=cjh/Hx87JI2qBBTJFpWd6RW1YdLczPKK0Z5x3b2HhaOOGeojQtzNyujUjiOQfJqtcl
 emIBWCfRI3KcPqKLf9ZXUMzasGEUzlIwcSHp0WDQA0Ti8MoIMNY6hPcG4R9hSzngPA41
 77ziaxPfUG5aAClDDQ5q1/YskGUIZBToXDMWKze5cjmpHQkZPg+uy97AMze8MuSy2JVK
 ESQSxMGi/MSI7uvmhhBmQxON/TmN+Bksw+qJLFamoLid2VSA4JA9KuPLWHk5yAElVNiN
 TNApMTDebrJLHk3GkyizZsqXboihv2Rzt56D0njAM2rzmrfrqFzrjjfpCjO8ifL7k49i
 5y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/CUiseesWXfy8ONw/IKq3y2jtfhBMrDZnaeFnHh+EA=;
 b=cAesMA8nrJ3nG+y/mThia9KagQ+m7ZK/tAFc7lkgwXZxe9+1ynAn3gk4go8EeUEywd
 B9g7H9p3HJb80PA454Dm3rYBk3rzt1vp4xS7bosP97C1wx6mxLK8ErYR5Tsi2UkdMupU
 DxtuTF24aM7h6gX0A+p1P9ctxp2bbNhWMObVAL5oB6Lsj0g9XUmT3TC+c133HrcfZmdY
 OprjGW1jWXV1NGQftB2+LwGwuHZuD/Q7VuplkcGogBvthQzInAew1d6MhjWxz4voYYVg
 LYks31ss6ohryKByYZDsKIfjUeRWwgk4JAO0KC1KgJsbZFis3RtYrIKcmTJZxRrTAd6b
 rSJA==
X-Gm-Message-State: ANoB5pn13E8ei7gldqbTsHiuG0GDREsuNrX1U5tTZ73WS8HeuUoWEl9U
 p3vdwAuZ6saX9+Yqi/Un/gikrN1NHfnNMQ==
X-Google-Smtp-Source: AA0mqf4hGZpZ7fiLTaI3fOv4Zpf9lucHFl6AlBmOYQgULab8NwG/lBWCS/tdDcYpkeH61mKsxtzxFA==
X-Received: by 2002:a17:90a:d145:b0:213:f465:14e7 with SMTP id
 t5-20020a17090ad14500b00213f46514e7mr6976294pjw.194.1668764879000; 
 Fri, 18 Nov 2022 01:47:59 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.47.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:47:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 01/29] include/qemu/cpuid: Introduce xgetbv_low
Date: Fri, 18 Nov 2022 01:47:26 -0800
Message-Id: <20221118094754.242910-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Replace the two uses of asm to expand xgetbv with an inline function.
Since one of the two has been using the mnemonic, assume that the
comment about "older versions of the assember" is obsolete, as even
that is 4 years old.

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
index ec3cd4ca15..b0660d484d 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -287,8 +287,7 @@ static void __attribute__((constructor)) init_cpuid_cache(void)
 
         /* We must check that AVX is not just available, but usable.  */
         if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >= 7) {
-            int bv;
-            __asm("xgetbv" : "=a"(bv), "=d"(d) : "c"(0));
+            unsigned bv = xgetbv_low(0);
             __cpuid_count(7, 0, a, b, c, d);
             if ((bv & 0x6) == 0x6 && (b & bit_AVX2)) {
                 cache |= CACHE_AVX2;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c96b5a6f43..1361960156 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -4148,12 +4148,9 @@ static void tcg_target_init(TCGContext *s)
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
 
@@ -4164,7 +4161,7 @@ static void tcg_target_init(TCGContext *s)
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


