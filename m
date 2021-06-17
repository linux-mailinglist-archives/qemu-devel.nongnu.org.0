Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B783AB3E4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:43:59 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrNG-0004wi-2g
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxQ-0002hd-TM
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxE-0007Iq-1v
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id m18so6547624wrv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DK63qHUdamQfZ9Kuk+du74sjhjzQZRelyRedPluwcC0=;
 b=bkyem/9BUqtpYPJTBabGgaiwlT85aZ4rfNtJZTICOoYhSFjXzO7X9BWNH3yaHhi7vE
 PmZC+T7Mjw4fYzGEDt7kuodNEiCxqUSyhQoQY4neRCDExssH+Bh1vvLvJcJt5ewe0bql
 /0fwtSvm8toP9kUs/RkgRiWknYpmAfLmNMyalXrVZtASMLHFzCW1pDVZR5PsUHSRpRij
 vuZSo23Y0fs5LyJvXSVcpRe+tJYL5vCR63P5EX1vaMfdNuunw4lFdvlYjvDo/S6Ep54T
 uNlgioiUajHNtMxIUTihiAhP6xtIBINymyRRiio4j3LyHNNtpcRuPxfehT/cLfE3+Kpx
 /a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DK63qHUdamQfZ9Kuk+du74sjhjzQZRelyRedPluwcC0=;
 b=IAbvD2e8GBLGyf7TgvZ+EqNyY65f1cZ7mMm1bFwWbHgMhQgLvUfwYGbq8x2ZpwlNaA
 cqNkFke/QuIa2JriZVKLcSLPHpqa6n8XBZA/XtHBKfm0vI4SanRbg3rweGhdcU8HCJDD
 PUKwEFBewKbznSdF/NngG9Yj8CUe7tEF8z+vJvoHkt3TGvtpLwIn5RbY6CVLYgSS/uih
 QkB5oS1EWsTEzVtiFUdo6OPbccEa0TlRaRjp3kX7Ghkvc6uTHesme0zEKjMu7gQzGHqd
 qCDn2CX9Y7uEbYnzOvLE9RN9/6isGswmDfE8crZO2eXU7jyUjBWD23WCXjFf5sDKBDhY
 01WQ==
X-Gm-Message-State: AOAM533vbGhwxKL2hJlMYsloq6RucPK4/8NixLS9+m8Zz7mrWV6SK9GG
 wz1A7QW+ffpL4r8XETvO0PerobSzMhZO5g==
X-Google-Smtp-Source: ABdhPJzBabf7GFAk29OjC6ojYHk5mM9ireikXWahwtkSoIM6pQCcFoG2opfcq5kLLFXv7TbYLWTPYA==
X-Received: by 2002:adf:b354:: with SMTP id k20mr5191759wrd.136.1623932222786; 
 Thu, 17 Jun 2021 05:17:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:17:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 41/44] target/arm: Implement MVE VCADD
Date: Thu, 17 Jun 2021 13:16:25 +0100
Message-Id: <20210617121628.20116-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VCADD insn, which performs a complex add with
rotate.  Note that the size=0b11 encoding is VSBC.

The architecture grants some leeway for the "destination and Vm
source overlap" case for the size MO_32 case, but we choose not to
make use of it, instead always calculating all 16 bytes worth of
results before setting the destination register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  9 +++++++--
 target/arm/mve_helper.c    | 29 +++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  7 +++++++
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 459c8eebdd6..b8ad3df9cc8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -251,6 +251,14 @@ DEF_HELPER_FLAGS_4(mve_vadci, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vsbc, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vsbci, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vcadd90b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd90w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 79915f45d71..afe60078649 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -161,9 +161,14 @@ VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
 VADC             1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
-VSBC             1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
 VADCI            1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
-VSBCI            1111 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+
+{
+  VSBC           1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
+  VSBCI          1111 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+  VCADD90        1111 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VCADD270       1111 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+}
 
 # Vector miscellaneous
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4e84066e2cf..e06b2bcea79 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -604,6 +604,35 @@ void HELPER(mve_vsbci)(CPUARMState *env, void *vd, void *vn, void *vm)
     do_vadc(env, vd, vn, vm, -1, 1, true);
 }
 
+#define DO_VCADD(OP, ESIZE, TYPE, FN0, FN1)                             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE r[16 / ESIZE];                                             \
+        /* Calculate all results first to avoid overwriting inputs */   \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            if (!(e & 1)) {                                             \
+                r[e] = FN0(n[H##ESIZE(e)], m[H##ESIZE(e + 1)]);         \
+            } else {                                                    \
+                r[e] = FN1(n[H##ESIZE(e)], m[H##ESIZE(e - 1)]);         \
+            }                                                           \
+        }                                                               \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], r[e], mask);                     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCADD_ALL(OP, FN0, FN1)              \
+    DO_VCADD(OP##b, 1, int8_t, FN0, FN1)        \
+    DO_VCADD(OP##h, 2, int16_t, FN0, FN1)       \
+    DO_VCADD(OP##w, 4, int32_t, FN0, FN1)
+
+DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
+DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f8cc6080c9e..b164907426c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -420,6 +420,13 @@ DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 DO_2OP(VRHADD_S, vrhadds)
 DO_2OP(VRHADD_U, vrhaddu)
+/*
+ * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
+ * so we can reuse the DO_2OP macro. (Our implementation calculates the
+ * "expected" results in this case.)
+ */
+DO_2OP(VCADD90, vcadd90)
+DO_2OP(VCADD270, vcadd270)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


