Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCE698AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTI-0003VD-9z; Wed, 15 Feb 2023 21:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTE-0003T0-OP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:04 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTC-0005ka-Np
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:04 -0500
Received: by mail-pf1-x441.google.com with SMTP id bw10so617576pfb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QP+/EHiQKRHx1fO7mLC4dIgIU6Ym3+F7e4Wu/m2d1pQ=;
 b=i9OR7AVN0KsuyYPTZnRm2cIoFPcpmpTQ70AER6hKsFGo0Wf5neh+dR2swaZpa/MS6I
 VF44WqvDjWH7WEqTSSckMhYb45hn7QWePMMZvgegfRk1k15lrFtPPQMfzrvGL8WXF+nc
 KYyaWzcedxnDyFnHKMPcl1Nnd2xSZDkS80tpAyoQN/PfzYGjA4J5I7rqYRv/FngxMPnc
 bw/7pKnplqjDEYDN57hhbh+SL5+hbo0DDtIuqZ0w2jdfLg9oLwyOpJcfTOqN/cVyCsOL
 7WJ9zf+d2OEgkMy81RlooJu/YfQ12HRefCAKI0gdnQktX51p9p6gI+A6/dI1cwwsvQZk
 Xtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QP+/EHiQKRHx1fO7mLC4dIgIU6Ym3+F7e4Wu/m2d1pQ=;
 b=SvFwiZiD0RImmk/Zn5BWUxUmpD86NEjIs+DZU/ofFF4UCyTPwsSlkHd+ei0mvQc/6U
 FnL28TM+L9LEiXjB0W5MI8BXvK8kyQdRK28iyAFaEK6Evrk4/kC6rn3cScPXU5MlShFo
 gL8WA+gXLYUr/Pgiz7NgOndiZTyuhU8SY/a4CyrI8hzPkq8OvilkRpEszBUlAF2DpfvT
 baQQvJjqxH6eEG9mKsEoiCaMwsV4PU0+HrKWMHNUtINAnRmspT+QXyNBSJ3xLUDWcGGd
 /YrYhy4PEcfQab8xDtgrG1q2GTcwNh5mW89g4v0qZxM82ZYbX37tdoi+DTuPCHh4EEof
 nwQw==
X-Gm-Message-State: AO0yUKUwvRHjwhHLyTgnQ++r6rkHUh2gZIVU/V7orpFiF2wzf7rMEX5J
 I8WyJxzylaETouqUqVSkUVrTJwYlMSUrKiP55oZOnQ==
X-Google-Smtp-Source: AK7set/OJ2559IdK8XefOD2/IBi9BYSQ8d6E0yv1dT5cN+sOCMucCewBJ5MHprYKSXlIClIzlD9c4Q==
X-Received: by 2002:aa7:8428:0:b0:5a8:bbac:1cf2 with SMTP id
 q8-20020aa78428000000b005a8bbac1cf2mr3574334pfn.1.1676516281304; 
 Wed, 15 Feb 2023 18:58:01 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/30] tcg/i386: Add have_atomic16
Date: Wed, 15 Feb 2023 16:57:23 -1000
Message-Id: <20230216025739.1211680-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
index 29dba3fa1c..977650263b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -185,6 +185,7 @@ bool have_avx512dq;
 bool have_avx512vbmi2;
 bool have_avx512vl;
 bool have_movbe;
+bool have_atomic16;
 
 #ifdef CONFIG_CPUID_H
 static bool have_bmi2;
@@ -4173,6 +4174,32 @@ static void tcg_target_init(TCGContext *s)
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


