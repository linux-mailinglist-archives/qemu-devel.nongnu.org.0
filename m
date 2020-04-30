Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB001C04E1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 20:33:50 +0200 (CEST)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUE0L-0004Wv-3C
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 14:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeS-0002G9-CW
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdv-0001Ih-KI
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:11:12 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdv-0001Hl-3c
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:10:39 -0400
Received: by mail-wm1-x344.google.com with SMTP id r26so3081839wmh.0
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+LfsWU+1Yby3pwqmNZERr3r8EY6rerTNDvwO7ihyqeA=;
 b=Qqo2bP2ZNANMSIcYsPLVm2XdJMJlTbIe95tu3AumClelKNpijaAdwvr401XSQ3dqdx
 yNnh5lXKt1vNq5rhEucadFxIZSbfh7r/y4jMlCQwyfAZl5vFlYgFYTm4Ped08lpE8cn0
 lVlEvPaqVos0hcFDCa/atNO5ZRE/Xn5I734nJH02zuepoOJnRQ7Y+PCcnHBDO84S8zoe
 09npfmCfXH9Dvl7VuKycLXcxiWbsdnY6bIaZaKT14oWXwUg9w7d4Fz+mGn5ssORJPJmr
 fNINYZKSGLlPO0tNEHuQcpGGaX90GPjXPaCC0eU7Y7uzsekWAZWVmseekJwUzsQ5UzXS
 XLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+LfsWU+1Yby3pwqmNZERr3r8EY6rerTNDvwO7ihyqeA=;
 b=UtJI36wpiGyTwu1JcymIbV0AHLrpD2HoZmKEEXwXIkCMoJZ9+Vyrqd7c2BvoMeWUzY
 Z89DS/2CoHlNCxszUgGo+5H9NdEpf4dHuc1j7FA8c+tuo4pX4l0SvKKPsqJz6YgG9JMp
 6HQ8ZU7F/hG7h3ATI1OZEp6Oy7uVCQWNT+9wcYwloTJwnwf3k5M2zJcVy5lg5sNzkeNH
 YQLnSUsQ8TF02HS6Ybvo7d/GEh93ZkH5wJB/dM7KL+H5wZ9uVSm+IsRLBslvPU+14pbI
 gnbef99Q90IyokTnDo7UnyYisLux6UTnPRq64dJUJ3VwqT9p6gPyLzg2hTeSdJHg2n+E
 MV6Q==
X-Gm-Message-State: AGi0PuYHzXy8Ci5vXdo/9wd1ZULbVU2sVju7QxWco86dSvuu77fDieF5
 qs8bHtLJrLtvrQAxFpPxkrmGjQ==
X-Google-Smtp-Source: APiQypJW9LW3lSdKZRGzpDopd61tX4BGI9P8mQXV8KakCrqV4ATR5uDF4etQp51xQ1ylF2oRZgc53A==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr4523836wmf.175.1588270236868; 
 Thu, 30 Apr 2020 11:10:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/36] target/arm: Convert Neon VHADD 3-reg-same insns
Date: Thu, 30 Apr 2020 19:09:51 +0100
Message-Id: <20200430181003.21682-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the Neon VHADD insns in the 3-reg-same group to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 62 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          |  4 +--
 target/arm/neon-dp.decode       |  2 ++
 3 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index bc5afb368e3..7a602d76566 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -970,3 +970,65 @@ DO_3SAME_64_ENV(VQSHL_S64, gen_helper_neon_qshl_s64)
 DO_3SAME_64_ENV(VQSHL_U64, gen_helper_neon_qshl_u64)
 DO_3SAME_64_ENV(VQRSHL_S64, gen_helper_neon_qrshl_s64)
 DO_3SAME_64_ENV(VQRSHL_U64, gen_helper_neon_qrshl_u64)
+
+static bool do_3same_32(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
+{
+    /* Operations handled elementwise 32 bits at a time */
+    TCGv_i32 tmp, tmp2;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        tmp = neon_load_reg(a->vn, pass);
+        tmp2 = neon_load_reg(a->vm, pass);
+        fn(tmp, tmp, tmp2);
+        tcg_temp_free_i32(tmp2);
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    return true;
+}
+
+#define DO_3SAME_32(INSN, func)                                         \
+    static bool trans_##INSN##_S_3s(DisasContext *s, arg_3same *a)      \
+    {                                                                   \
+        static NeonGenTwoOpFn * const fns[] = {                         \
+            gen_helper_neon_##func##_s8,                                \
+            gen_helper_neon_##func##_s16,                               \
+            gen_helper_neon_##func##_s32,                               \
+        };                                                              \
+        if (a->size > 2) {                                              \
+            return false;                                               \
+        }                                                               \
+        return do_3same_32(s, a, fns[a->size]);                         \
+    }                                                                   \
+    static bool trans_##INSN##_U_3s(DisasContext *s, arg_3same *a)      \
+    {                                                                   \
+        static NeonGenTwoOpFn * const fns[] = {                         \
+            gen_helper_neon_##func##_u8,                                \
+            gen_helper_neon_##func##_u16,                               \
+            gen_helper_neon_##func##_u32,                               \
+        };                                                              \
+        if (a->size > 2) {                                              \
+            return false;                                               \
+        }                                                               \
+        return do_3same_32(s, a, fns[a->size]);                         \
+    }
+
+DO_3SAME_32(VHADD, hadd)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fb64eb3a800..67616fc218a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4786,6 +4786,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VML:
         case NEON_3R_VSHL:
         case NEON_3R_SHA:
+        case NEON_3R_VHADD:
             /* Already handled by decodetree */
             return 1;
         }
@@ -4866,9 +4867,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VHADD:
-            GEN_NEON_INTEGER_OP(hadd);
-            break;
         case NEON_3R_VRHADD:
             GEN_NEON_INTEGER_OP(rhadd);
             break;
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index a4932e550ed..055004df4e8 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -42,6 +42,8 @@
 @3same           .... ... . . . size:2 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
+VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
 VQADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 1 .... @3same
 
-- 
2.20.1


