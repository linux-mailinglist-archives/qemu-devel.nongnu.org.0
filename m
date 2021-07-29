Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D867D3DA232
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:33:37 +0200 (CEST)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94IC-00032r-TP
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941D-00016A-Ut
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940r-0001I0-3b
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso3780845wmp.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NHW+bio5vpc+hqjWMB9d8Ta5DNoBT2v+EDTK/IAK+GE=;
 b=neICDKsbjAiZZ5i88PHoB5uLbiyLNHjBH8qkIlAmva+dkuTma8uBS5had0moPgY3XA
 jfSq4KAvORMBmsenLQTF4X5n1bo+0syizaVB46hfZ7wYQ1ZbXIfM1nH1jeLpX0gGSQrG
 8l5KHNmUp8olrtb6mCGmfTKp93csRKIklUHi67Vn/rlc/9kp0jRNt0G5fC1XGbV+rXP4
 SXlERfE2Po5YC/HUFctDY4yjMv8pUgso87Z0v7nBc8seaLVuOHOUWnF+Spvw2dt9CGJ1
 czGyiH2q6ZqxcqUYMQ368FF23o4jIqv84Tc5/TRH6hRLMrgiPp9clV7KT4UrDx+HH0XO
 9P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHW+bio5vpc+hqjWMB9d8Ta5DNoBT2v+EDTK/IAK+GE=;
 b=moQY6VSHi/4qw9Hze5IHFYLayY7Xh3Ewfh4cv5MSCSmM8e8JNimUvhwDv3Y7c4u5m7
 XD7Dxm1yCP/FP5xG3PK2Iu16d9HJugXmrU3VaV4Aycnh52xYdjLki7E3vTnSsAzqWB+z
 iRgB5w8XrJXl8VsP54fCwA6OZylfpzbEEAereuem6ATE8lXuQIQb3PIg4l+jrs5zThg6
 5w5tEUcG7O939170xtGe4T2+i06um1SJ/EDyNtf6iTm3fkfgVfxfmwBX6JTh5w5be6TL
 126USDyiGx4sLYki712PMaZT44mcLWzZ8AczfPfXuqDQrKJsPrqbJtNcURmkQqa08mVb
 eFUw==
X-Gm-Message-State: AOAM533dcOA2cEOn0Fi8Cb+CBImL1aZxrv2DOmhZWxSckbiGwmhRAtws
 pjF2Oe1T6ohLFQRBhRG7/9AyGQ==
X-Google-Smtp-Source: ABdhPJyStbAieGWJt+AuOohVvxuZS3qE1VgdH9RIOsOrOYdAe+E9jf0JgaMVGs8gvX5rV0JYy2WWSQ==
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr4173622wmd.161.1627557338830; 
 Thu, 29 Jul 2021 04:15:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 29/53] target/arm: Implement MVE VMAXA, VMINA
Date: Thu, 29 Jul 2021 12:14:48 +0100
Message-Id: <20210729111512.16541-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMAXA and VMINA insns, which take the absolute
value of the signed elements in the input vector and then accumulate
the unsigned max or min into the destination vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f9345bfafc7..651020aaad8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -84,6 +84,14 @@ DEF_HELPER_FLAGS_3(mve_vqnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vqnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vqnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vmaxab, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmaxah, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmaxaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vminab, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vminah, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vminaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a05b882f9d9..0955ed0cc22 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -156,6 +156,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VQMOVUNB       111 0 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
   VQMOVN_BS      111 0 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
 
+  VMAXA          111 0 1110 0 . 11 .. 11 ... 0 1110 1 0 . 0 ... 1 @1op
+
   VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -176,6 +178,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VQMOVUNT       111 0 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
   VQMOVN_TS      111 0 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
 
+  VMINA          111 0 1110 0 . 11 .. 11 ... 1 1110 1 0 . 0 ... 1 @1op
+
   VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 6539012ddd8..d326205cbf0 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2237,3 +2237,29 @@ DO_1OP_SAT(vqabsw, 4, int32_t, DO_VQABS_W)
 DO_1OP_SAT(vqnegb, 1, int8_t, DO_VQNEG_B)
 DO_1OP_SAT(vqnegh, 2, int16_t, DO_VQNEG_H)
 DO_1OP_SAT(vqnegw, 4, int32_t, DO_VQNEG_W)
+
+/*
+ * VMAXA, VMINA: vd is unsigned; vm is signed, and we take its
+ * absolute value; we then do an unsigned comparison.
+ */
+#define DO_VMAXMINA(OP, ESIZE, STYPE, UTYPE, FN)                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        UTYPE *d = vd;                                                  \
+        STYPE *m = vm;                                                  \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            UTYPE r = DO_ABS(m[H##ESIZE(e)]);                           \
+            r = FN(d[H##ESIZE(e)], r);                                  \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VMAXMINA(vmaxab, 1, int8_t, uint8_t, DO_MAX)
+DO_VMAXMINA(vmaxah, 2, int16_t, uint16_t, DO_MAX)
+DO_VMAXMINA(vmaxaw, 4, int32_t, uint32_t, DO_MAX)
+DO_VMAXMINA(vminab, 1, int8_t, uint8_t, DO_MIN)
+DO_VMAXMINA(vminah, 2, int16_t, uint16_t, DO_MIN)
+DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f2213ec8cde..02c26987a2d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -277,6 +277,8 @@ DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
 DO_1OP(VQABS, vqabs)
 DO_1OP(VQNEG, vqneg)
+DO_1OP(VMAXA, vmaxa)
+DO_1OP(VMINA, vmina)
 
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
-- 
2.20.1


