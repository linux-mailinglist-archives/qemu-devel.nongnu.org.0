Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894966EE8A9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:52:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOQT-0002js-4n; Tue, 25 Apr 2023 15:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQQ-0002bp-BI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:06 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQG-0004el-RF
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:06 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ec86aeeb5cso6649870e87.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451235; x=1685043235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLKGPSGMAiW9EHCX31qD8RhUBJV5TJE49TIwgfGSsuA=;
 b=einTuaOsm7dfzZ/MwApYiBc8Jm6AHLdre3p8Ty7vOshFFbnpXocgYREVeAoHMvdGzU
 +mOCMBw4avFiMuJH3mcmFni+YX1C2pD24yDwyJQstEPno8Um1FOj1RcyBqbQ/Uxl3lHN
 lsg9Jv8bWWVyRtoC83JecswVEK78U2leQRx00iAt4cmJl8hL/agjcK0BADAlfPFc36dE
 e+hW4gQ4Xgu7wXe8K2GUyUMstLDgSWRXuZB79flxipNT8EE3hTC1ySGECcQOV7s7jObN
 nym8SCyk3m7Rnxu89F8ZoFvolzv3MJULCiTn9+5rBF5+w4d5s2jwKySw/5y7vuTABitE
 /D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451235; x=1685043235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLKGPSGMAiW9EHCX31qD8RhUBJV5TJE49TIwgfGSsuA=;
 b=MZmyIFOfg947qXoKf3kPQTBJ+Xvn7Uh+3zomY3zpHWBGK+OSeZlywMFldBSFXM8bfB
 rjWygNGSOmn6uIHZCHPwmNP5a0FNRX5NE+EX+Ng3dkiU0xl7x2Sk0wQ4Sbr3z7vXmpfq
 AZ2kRGPRhdfhHQFKxQLWc5cp3nxznOyq1s0Mx2QTiPiUT4s/wBeNPy6n7mzJe7Udp/ca
 Vwbpg7ec+CaVk0aag9SAut70wYVA/0ogjUQcAIbspZx3hNwFKyIoWeodV1vA6twwv22h
 K+NUWnVkXDDvIN+s0I356+xJhAqed1TkS4AuWVoth8+zwM5RkCiH/OIMZaK4Rvfj/vQh
 6b3Q==
X-Gm-Message-State: AAQBX9fSWxU74p5BbEkB/e8Fgoi1Gf2rIXjX6fu4THi0CPq7jufPy6z+
 BaVH4F9eHybjqCjBNiB7WfesgfgGOrlQezvEytmQuA==
X-Google-Smtp-Source: AKy350bgkk9IaWvHWTXFQrC/KIkFWEm7FWdMb+5sg3Cab5lg5R5/7CoY1l6O5LeY0vQsJ/FudrlY4A==
X-Received: by 2002:ac2:5939:0:b0:4d1:3d1d:4914 with SMTP id
 v25-20020ac25939000000b004d13d1d4914mr4921505lfi.33.1682451235111; 
 Tue, 25 Apr 2023 12:33:55 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 14/57] tcg/i386: Add have_atomic16
Date: Tue, 25 Apr 2023 20:31:03 +0100
Message-Id: <20230425193146.2106111-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
The new variable will also be used in generated code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/cpuid.h      | 18 ++++++++++++++++++
 tcg/i386/tcg-target.h     |  1 +
 tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
index 1451e8ef2f..35325f1995 100644
--- a/include/qemu/cpuid.h
+++ b/include/qemu/cpuid.h
@@ -71,6 +71,24 @@
 #define bit_LZCNT       (1 << 5)
 #endif
 
+/*
+ * Signatures for different CPU implementations as returned from Leaf 0.
+ */
+
+#ifndef signature_INTEL_ecx
+/* "Genu" "ineI" "ntel" */
+#define signature_INTEL_ebx     0x756e6547
+#define signature_INTEL_edx     0x49656e69
+#define signature_INTEL_ecx     0x6c65746e
+#endif
+
+#ifndef signature_AMD_ecx
+/* "Auth" "enti" "cAMD" */
+#define signature_AMD_ebx       0x68747541
+#define signature_AMD_edx       0x69746e65
+#define signature_AMD_ecx       0x444d4163
+#endif
+
 static inline unsigned xgetbv_low(unsigned c)
 {
     unsigned a, d;
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index d4f2a6f8c2..0421776cb8 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -120,6 +120,7 @@ extern bool have_avx512dq;
 extern bool have_avx512vbmi2;
 extern bool have_avx512vl;
 extern bool have_movbe;
+extern bool have_atomic16;
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div2_i32         1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b5bb4bf45d..696c656f3b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -185,6 +185,7 @@ bool have_avx512dq;
 bool have_avx512vbmi2;
 bool have_avx512vl;
 bool have_movbe;
+bool have_atomic16;
 
 #ifdef CONFIG_CPUID_H
 static bool have_bmi2;
@@ -4026,6 +4027,32 @@ static void tcg_target_init(TCGContext *s)
                     have_avx512dq = (b7 & bit_AVX512DQ) != 0;
                     have_avx512vbmi2 = (c7 & bit_AVX512VBMI2) != 0;
                 }
+
+                /*
+                 * The Intel SDM has added:
+                 *   Processors that enumerate support for Intel® AVX
+                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit 28])
+                 *   guarantee that the 16-byte memory operations performed
+                 *   by the following instructions will always be carried
+                 *   out atomically:
+                 *   - MOVAPD, MOVAPS, and MOVDQA.
+                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
+                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
+                 *     with EVEX.128 and k0 (masking disabled).
+                 * Note that these instructions require the linear addresses
+                 * of their memory operands to be 16-byte aligned.
+                 *
+                 * AMD has provided an even stronger guarantee that processors
+                 * with AVX provide 16-byte atomicity for all cachable,
+                 * naturally aligned single loads and stores, e.g. MOVDQU.
+                 *
+                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
+                 */
+                if (have_avx1) {
+                    __cpuid(0, a, b, c, d);
+                    have_atomic16 = (c == signature_INTEL_ecx ||
+                                     c == signature_AMD_ecx);
+                }
             }
         }
     }
-- 
2.34.1


