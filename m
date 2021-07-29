Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF593DA2BB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:01:32 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94jD-0002Qn-IZ
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941b-0001Oz-2X
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-0001U9-6s
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:26 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so3744906wms.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1vyQ0Oi0tEEGDv6NXEcKRepnjPjEniiaL2/Am2D+bJo=;
 b=akpBwRVPr3gGW5KI3ngUEkfu4smdkEL3E56ASLfC4ANOOyWmmv+6IZvd5xqz7ZDi1u
 knLbCE/eqgYHwpYk1vQibjDPeiTbcFq3OB8aAwO01q3PEs1qiemIwh+tuDJQWJUdYco7
 QKIEqta69hcIGoLy6TgIWZnUs5oDWES/yyXr1B7mcZldHyW66ydkZDYJP888FDBrYoHE
 RfUuOpz66YFRfhM30/1jMCH6l/R33YmTEslDUStaNKOdaQ2tnHl8iT9Jc/lfN2Qyq4Vk
 +eXJzRa72jmXD04xUje1FQo9vpzSSTVNGwi6NPijFKRhziQT4gF3YkEw/Gb0l8Qibdye
 64YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vyQ0Oi0tEEGDv6NXEcKRepnjPjEniiaL2/Am2D+bJo=;
 b=P7pXuR54d0XrIlxU2299d9tXjC0mmafNlmh+Eo9qmXTR4//TaWcaIxGWydN4ZG8XR+
 uROqB3KFgc6y0JsJJ0AQYF1p6VQ+CLEOBQ94N48KXwjEmBYm2dfpykhcQoLyQ3EIaaRo
 EqVgaUuZeEujYR0yobzq8jMzcbmiysNDxbVEG8bugr0TLUZTzPKjVTZCQLFN3lZ1Fe9u
 1VWvdEY3ILrIYK76t7zWPzoVIL483uCEEVU1ND6L+SHvOzEUfL+01MXNOx1Xwhx/WE6X
 PxiLtrFa9d6D1u1V0ZCvJPZZRUEcUzvbS0x54Xfps9W+WbSDt24uefzY84Vo7XTZPOQ3
 3wxQ==
X-Gm-Message-State: AOAM533tdoYVRHM26twK9TX0hIy3aC7tFI/czSCxK2SGEGzJ80idP1zo
 wKVd5G8JS0lXS2CW6mZjd5KgoUopzVUatg==
X-Google-Smtp-Source: ABdhPJw02pAAMb4OSUZ7drK//EFV5/af67FRBEL/3O/kDOLEL8cERk1xgRIDw0zANzGCKDunCsHMUg==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr4273639wmj.91.1627557355681; 
 Thu, 29 Jul 2021 04:15:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 49/53] target/arm: Implement MVE VCVT between fp and
 integer
Date: Thu, 29 Jul 2021 12:15:08 +0100
Message-Id: <20210729111512.16541-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE "VCVT (between floating-point and integer)" insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve.decode      |  7 +++++++
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d9fcc42d36d..9a40ff9f43c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -790,3 +790,10 @@ VCVT_UF_fixed     1111 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt
 
 VCVT_FS_fixed     1110 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
 VCVT_FU_fixed     1111 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
+
+# VCVT between floating point and integer (halfprec and single);
+# VCVT_<from><to>, S = signed int, U = unsigned int, F = float
+VCVT_SF           1111 1111 1 . 11 .. 11 ... 0 011 00 1 . 0 ... 0 @1op
+VCVT_UF           1111 1111 1 . 11 .. 11 ... 0 011 01 1 . 0 ... 0 @1op
+VCVT_FS           1111 1111 1 . 11 .. 11 ... 0 011 10 1 . 0 ... 0 @1op
+VCVT_FU           1111 1111 1 . 11 .. 11 ... 0 011 11 1 . 0 ... 0 @1op
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9269dbc3324..351033af1ec 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -543,6 +543,38 @@ DO_1OP(VQNEG, vqneg)
 DO_1OP(VMAXA, vmaxa)
 DO_1OP(VMINA, vmina)
 
+/*
+ * For simple float/int conversions we use the fixed-point
+ * conversion helpers with a zero shift count
+ */
+#define DO_VCVT(INSN, HFN, SFN)                                         \
+    static void gen_##INSN##h(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_##HFN(env, qd, qm, tcg_constant_i32(0));         \
+    }                                                                   \
+    static void gen_##INSN##s(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_##SFN(env, qd, qm, tcg_constant_i32(0));         \
+    }                                                                   \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)               \
+    {                                                                   \
+        static MVEGenOneOpFn * const fns[] = {                          \
+            NULL,                                                       \
+            gen_##INSN##h,                                              \
+            gen_##INSN##s,                                              \
+            NULL,                                                       \
+        };                                                              \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                         \
+            return false;                                               \
+        }                                                               \
+        return do_1op(s, a, fns[a->size]);                              \
+    }
+
+DO_VCVT(VCVT_SF, vcvt_sh, vcvt_sf)
+DO_VCVT(VCVT_UF, vcvt_uh, vcvt_uf)
+DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
+DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1


