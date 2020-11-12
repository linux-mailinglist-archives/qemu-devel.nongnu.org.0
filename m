Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629372B125E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:03:34 +0100 (CET)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLcr-0003nX-Dl
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLbD-0002BW-9x; Thu, 12 Nov 2020 18:01:51 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1kdLbB-0004xI-7P; Thu, 12 Nov 2020 18:01:50 -0500
Received: by mail-wm1-x342.google.com with SMTP id 10so6612728wml.2;
 Thu, 12 Nov 2020 15:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4K3U1NewmUjwvna+a3l1Z82sMILfAkInSo7TJ3mQ3Sw=;
 b=X4aTG0C0Wm4L6468/siPA727Y8orFI467aByF3Y5+aku50FsrwF8vBEwUM3zRWUXUw
 dKDdFHewGjdwRI0T7IAPDQlUIbd5yVuF6sKaol2Rjr3exwZfWwA2E5xkaCgGCey4vhrz
 GpQ2yjcKg/rWvxDkASLyiZM+oMGkIB46c3+djUzkbUVy8wSBGeUfO7nQrqQdjPUk23+b
 Wc6L8PL3FxPQubJTktnMSarQ3yf5e2BQrtAJR3rFlIauahxU8ZO5i2+WXBJrHUAaZraO
 yFBXRTSyVUZyUPx+rw/NMpDhSvwHESR4FZyg8YszvKy/hTi5vUAguddUUPo6OaOs2Mni
 ODsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4K3U1NewmUjwvna+a3l1Z82sMILfAkInSo7TJ3mQ3Sw=;
 b=XeFiil+a537BqiXpd1xvs8xEaWoGVj0K64ljsY0rmP2ChsjeloecWpMdL7hpfnDIgT
 128e8s/+BGjVEXnrlvHk3CAGAHphHDRtOYLl+1HxbVc289WCN5TKl6OWZSQHpdKFtROf
 244W9htu6O8BCogOG5BhMWeLm26ek7q96MuWOu/1KQ43B3UVwOlOGwrPrBxnnN8XlW55
 jpYbZ79rhTeumIuZd8fWJj81GDbS9YHz+m6LHrjwztVqHhtbtlABQjKtigYRgouS5KWO
 6rxY9c7Ry7bw6UIvm16wYwtBxyDEYu6n1Ypbw74oDFvv52BWT6J1Xpz00tRiqkoMqz/P
 Np3Q==
X-Gm-Message-State: AOAM533DxBmEkKKWivixkR0u0ntZA3g5Jrx5lYxgvEzKtI4JkxLHG/3K
 vw9CuHf+Qcg0b1hC21BrOnPU5GxEAz5N9A==
X-Google-Smtp-Source: ABdhPJwt2vsVyh+W0T808cZjEJ7RsKa16adVlGcFhRddDJC5qaJ56Fmxd9TrKShjNWGtnWyvEcyaRg==
X-Received: by 2002:a1c:e006:: with SMTP id x6mr98365wmg.107.1605222094485;
 Thu, 12 Nov 2020 15:01:34 -0800 (PST)
Received: from localhost.localdomain ([151.33.227.77])
 by smtp.gmail.com with ESMTPSA id v16sm8326184wml.33.2020.11.12.15.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 15:01:33 -0800 (PST)
From: LemonBoy <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] ppc/translate: Fix unordered f64/f128 comparisons
Date: Fri, 13 Nov 2020 00:01:27 +0100
Message-Id: <20201112230130.65262-2-thatlemon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201112230130.65262-1-thatlemon@gmail.com>
References: <20201112230130.65262-1-thatlemon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=thatlemon@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: LemonBoy <thatlemon@gmail.com>, richard.henderson@linaro.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the PowerISA v3.1 reference, Table 68 "Actions for xscmpudp
- Part 1: Compare Unordered", whenever one of the two operands is a NaN
the SO bit is set while the other three bits are cleared.

Apply the same change to xscmpuqp.

The respective ordered counterparts are unaffected.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9b8c8b70b6..b07ff66375 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2479,13 +2479,11 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
     if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||        \
         float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {        \
         vxsnan_flag = true;                                              \
-        cc = CRF_SO;                                                     \
         if (fpscr_ve == 0 && ordered) {                                  \
             vxvc_flag = true;                                            \
         }                                                                \
     } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
                float64_is_quiet_nan(xb->VsrD(0), &env->fp_status)) {     \
-        cc = CRF_SO;                                                     \
         if (ordered) {                                                   \
             vxvc_flag = true;                                            \
         }                                                                \
@@ -2497,12 +2495,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                      \
         float_invalid_op_vxvc(env, 0, GETPC());                          \
     }                                                                    \
                                                                          \
-    if (float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {         \
+    switch (float64_compare(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) {\
+    case float_relation_less:                                            \
         cc |= CRF_LT;                                                    \
-    } else if (!float64_le(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) { \
-        cc |= CRF_GT;                                                    \
-    } else {                                                             \
+        break;                                                           \
+    case float_relation_equal:                                           \
         cc |= CRF_EQ;                                                    \
+        break;                                                           \
+    case float_relation_greater:                                         \
+        cc |= CRF_GT;                                                    \
+        break;                                                           \
+    case float_relation_unordered:                                       \
+        cc |= CRF_SO;                                                    \
+        break;                                                           \
     }                                                                    \
                                                                          \
     env->fpscr &= ~FP_FPCC;                                              \
@@ -2545,12 +2550,19 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
         float_invalid_op_vxvc(env, 0, GETPC());                         \
     }                                                                   \
                                                                         \
-    if (float128_lt(xa->f128, xb->f128, &env->fp_status)) {             \
+    switch (float128_compare(xa->f128, xb->f128, &env->fp_status)) {    \
+    case float_relation_less:                                           \
         cc |= CRF_LT;                                                   \
-    } else if (!float128_le(xa->f128, xb->f128, &env->fp_status)) {     \
-        cc |= CRF_GT;                                                   \
-    } else {                                                            \
+        break;                                                          \
+    case float_relation_equal:                                          \
         cc |= CRF_EQ;                                                   \
+        break;                                                          \
+    case float_relation_greater:                                        \
+        cc |= CRF_GT;                                                   \
+        break;                                                          \
+    case float_relation_unordered:                                      \
+        cc |= CRF_SO;                                                   \
+        break;                                                          \
     }                                                                   \
                                                                         \
     env->fpscr &= ~FP_FPCC;                                             \
-- 
2.27.0


