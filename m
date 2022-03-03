Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B854CC7AC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:13:52 +0100 (CET)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPslj-0007Ye-63
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYJ-0005aB-N9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:59 -0500
Received: from [2607:f8b0:4864:20::52e] (port=36454
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYI-00043Z-24
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:59 -0500
Received: by mail-pg1-x52e.google.com with SMTP id t14so5754676pgr.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4ztDzPr5E6ml7W6Zmqb62vg4iAy99rspvKuLZXH7gY=;
 b=lXv6R6s9FVr3Vzx4dG71l6RYx/ozvMjnKMPBptQXtrY5xpsX4S1ImzIYJCfFNbDuPN
 SIMyBK8Yrgt/xCQxD+I65/ovIyJBIUt2o7wh0qHeGwGJPAtv2BxkJd3MbtU6uQqW8ADT
 dQepGFHdrj9tgs82FxwdTQVKy/IhUT5BGqFTnpA5x+ohTl257wy2jF1SFvssicE75fpV
 HYpVYHC3SPgYbKeAnn0s5FoCh5pdUTdQnhwm2fR7kvFA1RyMJ8igFjg/i6/ZAN8Z+Nqw
 +42plp7rn+OG4/bYWzF0RVYV1zzGLbJkwlPvQPBjMC3VkJ1Y9G3fNYzYkr7398pF3W68
 uesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4ztDzPr5E6ml7W6Zmqb62vg4iAy99rspvKuLZXH7gY=;
 b=4nikkzyXk97zI1iaRh1VOVA5zI7+sMyVJuwBIr1ea5bRFDvCy3xUrqXj1ozXyMgfTZ
 +0TdAsdPIxUWqEeaDSzRLjEiI6T6WkFrZCVwFxXQFdhGN/7AO/k4cd+3HCm5/2j1xcnh
 9wtJHMoeM9uunAazWpy8DFP9xDhlfcj5zomjWkYqkJaRcAPmWgsqmwnYt4bq7cr+NSrv
 tr1KCCba5FKJmkFCVbLHl5BOo25Wz5yj3fWIkcZUrsJFhZw1xCNBj5kbGJNz2kpjU5bN
 8M/bmIj2iQkUxzv+wuZDphUbWW7TDeKnLjq7+PvNbx/diI/QsmwDWHYYTHcB4N7BHvUd
 ujXQ==
X-Gm-Message-State: AOAM532o2anANEVlcanAgs+mng+MNCduZdXbeOafooE7vSKoq3MNlOgO
 MXZldc13msFMGT75mPC08Z4uAdc8kXsDMA==
X-Google-Smtp-Source: ABdhPJy8AzxxpIa7qXIJN+vporUVCR2uS4VCTr+fP71TIXCdlbKgRTuh0ExSPmBw3N+rspmrRBfQqg==
X-Received: by 2002:a63:be0e:0:b0:363:e0be:613f with SMTP id
 l14-20020a63be0e000000b00363e0be613fmr31423896pgf.448.1646341196809; 
 Thu, 03 Mar 2022 12:59:56 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] tcg/i386: Detect AVX512
Date: Thu,  3 Mar 2022 10:59:20 -1000
Message-Id: <20220303205944.469445-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some operation sizes in some subsets of AVX512 that
are missing from previous iterations of AVX.  Detect them.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/cpuid.h      | 20 +++++++++++++++++---
 tcg/i386/tcg-target.h     |  4 ++++
 tcg/i386/tcg-target.c.inc | 24 ++++++++++++++++++++++--
 3 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
index 09fc245b91..7adb12d320 100644
--- a/include/qemu/cpuid.h
+++ b/include/qemu/cpuid.h
@@ -45,12 +45,26 @@
 #ifndef bit_AVX2
 #define bit_AVX2        (1 << 5)
 #endif
-#ifndef bit_AVX512F
-#define bit_AVX512F        (1 << 16)
-#endif
 #ifndef bit_BMI2
 #define bit_BMI2        (1 << 8)
 #endif
+#ifndef bit_AVX512F
+#define bit_AVX512F     (1 << 16)
+#endif
+#ifndef bit_AVX512DQ
+#define bit_AVX512DQ    (1 << 17)
+#endif
+#ifndef bit_AVX512BW
+#define bit_AVX512BW    (1 << 30)
+#endif
+#ifndef bit_AVX512VL
+#define bit_AVX512VL    (1u << 31)
+#endif
+
+/* Leaf 7, %ecx */
+#ifndef bit_AVX512VBMI2
+#define bit_AVX512VBMI2 (1 << 6)
+#endif
 
 /* Leaf 0x80000001, %ecx */
 #ifndef bit_LZCNT
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index ecd0fa6e05..79af353860 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -103,6 +103,10 @@ extern bool have_bmi1;
 extern bool have_popcnt;
 extern bool have_avx1;
 extern bool have_avx2;
+extern bool have_avx512bw;
+extern bool have_avx512dq;
+extern bool have_avx512vbmi2;
+extern bool have_avx512vl;
 extern bool have_movbe;
 
 /* optional instructions */
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index faa15eecab..7516be5d5f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -171,6 +171,10 @@ bool have_bmi1;
 bool have_popcnt;
 bool have_avx1;
 bool have_avx2;
+bool have_avx512bw;
+bool have_avx512dq;
+bool have_avx512vbmi2;
+bool have_avx512vl;
 bool have_movbe;
 
 #ifdef CONFIG_CPUID_H
@@ -3839,12 +3843,12 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef CONFIG_CPUID_H
-    unsigned a, b, c, d, b7 = 0;
+    unsigned a, b, c, d, b7 = 0, c7 = 0;
     unsigned max = __get_cpuid_max(0, 0);
 
     if (max >= 7) {
         /* BMI1 is available on AMD Piledriver and Intel Haswell CPUs.  */
-        __cpuid_count(7, 0, a, b7, c, d);
+        __cpuid_count(7, 0, a, b7, c7, d);
         have_bmi1 = (b7 & bit_BMI) != 0;
         have_bmi2 = (b7 & bit_BMI2) != 0;
     }
@@ -3874,6 +3878,22 @@ static void tcg_target_init(TCGContext *s)
             if ((xcrl & 6) == 6) {
                 have_avx1 = (c & bit_AVX) != 0;
                 have_avx2 = (b7 & bit_AVX2) != 0;
+
+                /*
+                 * There are interesting instructions in AVX512, so long
+                 * as we have AVX512VL, which indicates support for EVEX
+                 * on sizes smaller than 512 bits.  We are required to
+                 * check that OPMASK and all extended ZMM state are enabled
+                 * even if we're not using them -- the insns will fault.
+                 */
+                if ((xcrl & 0xe0) == 0xe0
+                    && (b7 & bit_AVX512F)
+                    && (b7 & bit_AVX512VL)) {
+                    have_avx512vl = true;
+                    have_avx512bw = (b7 & bit_AVX512BW) != 0;
+                    have_avx512dq = (b7 & bit_AVX512DQ) != 0;
+                    have_avx512vbmi2 = (c7 & bit_AVX512VBMI2) != 0;
+                }
             }
         }
     }
-- 
2.25.1


