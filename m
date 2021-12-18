Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C50479C60
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:45:53 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfeS-0003Qi-Es
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:45:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbd-0000U1-OE
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:57 -0500
Received: from [2607:f8b0:4864:20::633] (port=37441
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbc-0003SI-6v
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:57 -0500
Received: by mail-pl1-x633.google.com with SMTP id n8so4775159plf.4
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5nbr21I+MTpD5QHgKHZh+UJGGRu3TEX+Zp9LU/tNFEk=;
 b=gZ9SMoPM/J2tnNp+jOVseWDsZQBe5wrvOG7wLIWn7JZzff1u0y6/l9rakad2DoLsRN
 2GYcpGmHuW2M3ByfZT2/R9LCw3xNCG6IFv42Re768Qfnufv3gel4Lpnr/yKNrUMwO0MC
 zrB2vg8cub8w0vKneBV7/uWk9oqLJYSZQBsKeVfeCVI6xvNrfdHkEehn/v3DPpXOa0/X
 9rVcc3Jiq63/90c5rywibrnEKzquKHWfWWG+gLSmKcqj7J35Mz/inYZuDXxey0z1Pwgt
 8ABMB44UT4jRrGe1BGhWvwK2SeKdaPhrZZvbo+OZHDG6ggoXWq7fxsc+LAQIPYySOMAs
 MlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nbr21I+MTpD5QHgKHZh+UJGGRu3TEX+Zp9LU/tNFEk=;
 b=ZVn7SOvVyIpcQOGt9C6/PdPOd9fSM1+kKhblnKYez3LgZlZDdw3Un6+/tIlcqJad/1
 i4HVblrTtoAeLTrFkJrCbtdhh04omS7z2S1p+xuk4qyzsL1HiEqFFNhBlpCyyzykKO8L
 N3/FhqmXrFKYC43rBU55Cm46Q6oHc5fbLFNaAHTeM1SWRQrin9W4PFXGfl03gAMXH3OG
 k45gF+m5U5tpMpLuIPIM3ijy+PQEtE4GZbBO8za87ke4FbY9UwCNUv36wgI8sx0GwJcG
 mIVmX0MZFGCL4JFiw7YVcmzW/BH+fluPp130g/fXhagrzfd7sZ/iqWiPxaGj28dkNoAj
 NNZw==
X-Gm-Message-State: AOAM5318apiQS8+ArwhoLvvdBH8VzcgRblDtOZfr5uZY+GeOEy9xbTcv
 FnyBAsnXIQWzU51TLyQm7+p26Sic2dyr5g==
X-Google-Smtp-Source: ABdhPJytuq77fdC/BDu7MpdnyvsxdFg2EBMZKkq/8CuvBC2ZYigExC1aMCOiZhHYnSkG0ICh0b6tIQ==
X-Received: by 2002:a17:90b:4f4e:: with SMTP id
 pj14mr18819688pjb.61.1639856575016; 
 Sat, 18 Dec 2021 11:42:55 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/20] tcg/i386: Detect AVX512
Date: Sat, 18 Dec 2021 11:42:35 -0800
Message-Id: <20211218194250.247633-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

There are some operation sizes in some subsets of AVX512 that
are missing from previous iterations of AVX.  Detect them.

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
index 64c1013182..12d098ad6c 100644
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
index 84b109bb84..e266f937d6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -170,6 +170,10 @@ bool have_bmi1;
 bool have_popcnt;
 bool have_avx1;
 bool have_avx2;
+bool have_avx512bw;
+bool have_avx512dq;
+bool have_avx512vbmi2;
+bool have_avx512vl;
 bool have_movbe;
 
 #ifdef CONFIG_CPUID_H
@@ -3746,12 +3750,12 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef CONFIG_CPUID_H
-    unsigned a, b, c, d, b7 = 0;
+    unsigned a, b, c, d, b7 = 0, c7 = 0;
     int max = __get_cpuid_max(0, 0);
 
     if (max >= 7) {
         /* BMI1 is available on AMD Piledriver and Intel Haswell CPUs.  */
-        __cpuid_count(7, 0, a, b7, c, d);
+        __cpuid_count(7, 0, a, b7, c7, d);
         have_bmi1 = (b7 & bit_BMI) != 0;
         have_bmi2 = (b7 & bit_BMI2) != 0;
     }
@@ -3781,6 +3785,22 @@ static void tcg_target_init(TCGContext *s)
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


