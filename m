Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B325A67C3FE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2r-0000T7-8u; Wed, 25 Jan 2023 23:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2Z-0000I0-Pl
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:15 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2W-0004Ub-Cj
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:10 -0500
Received: by mail-pj1-x1033.google.com with SMTP id 88so525120pjo.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zggxelJn7xEGVyzBGDuJjR27fAkYzw0xoPZGZDzp+DI=;
 b=u18Ci3Dg+MPW2Ol3pYCUCicusd+tHqhXDotc60fPmFT5O7ORYUslzBmZ96oY8sPvOa
 24ykFOMVrpFEDzrAB+nTi05bJQts6xOY+drJ0uFKQw9lmY6qtjYEstQZQ9xXa01TVyXH
 s+NNksGPqq2ilHIk7le2H+vXRGqbk09PUYycqd+4m5vCd37xBCHi8Og33gWOGNuNhGrn
 Y6EdHV4d+h77g42+gKZTnXDYAV9iWyhNRNznz4+CQzz0eYZfoLRnpEuBV2CdU/Bs83xY
 wTtUVOtRY3W1fEk3ElkNXhCzlTf+1D/xAYKlXTAH8clSCcWiKjO3LjXSoDBbfHdiDdde
 K58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zggxelJn7xEGVyzBGDuJjR27fAkYzw0xoPZGZDzp+DI=;
 b=BokbyGokGb2UM28UXxgxMokv+FxjclzdCM+oxh4W5ProWkV0719Ci4TQncr1EhzixJ
 kq/VA4WBVAqEuIW6lWuuVZ6nK2lRUYhsRM/yUJj84imURBoP81jlIeYxngQAqmskk/b+
 w1hYcIaBTVCRgJhl1xisSv3l4uDMiUXAHgVChfgGtZjHRBEyUsYEZNYjUjNCTi5SDf24
 rnpswBQC5+4gzLzzyPyUnyW81Je08A8ANbnUI243thnjl2OO2XXFSqwgjzY44JU4hN5r
 AiIgjm+xN23lXtGz4Paki/5QnOa2khJSYFnlUp2qH+9m1TSZFu8lj1L9d716JXPvV30M
 FOSw==
X-Gm-Message-State: AO0yUKWpLXif9fNTuJLOQAMln9yVSxQwVydJwSAmUX5jhkcGHI6MG11A
 y6kLK66h4sEulaq1WxRTy/Incv0mvNP0JATvYVo=
X-Google-Smtp-Source: AK7set+lB/+09tDuJQWew3+lU2xyONBuKOBx61hJ3I29+L5m/Zgv48Yy3BRBqO5Gs2X0WtnQEbtyyg==
X-Received: by 2002:a17:90b:33c6:b0:22c:665:6ee with SMTP id
 lk6-20020a17090b33c600b0022c066506eemr5323749pjb.31.1674707946964; 
 Wed, 25 Jan 2023 20:39:06 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 25/36] target/s390x: Use a single return for
 helper_divs64/u64
Date: Wed, 25 Jan 2023 18:38:13 -1000
Message-Id: <20230126043824.54819-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Pack the quotient and remainder into a single Int128.
Use the divu128 primitive to remove the cpu_abort on
32-bit hosts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Extended div test case to cover these insns.
---
 target/s390x/helper.h         |  4 ++--
 target/s390x/tcg/int_helper.c | 38 +++++++++--------------------------
 target/s390x/tcg/translate.c  | 14 +++++++++----
 tests/tcg/s390x/div.c         | 35 ++++++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index bc828d976b..593f3c8bee 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -12,8 +12,8 @@ DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
 DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
-DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
+DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
 DEF_HELPER_4(clst, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 7260583cf2..eb8e6dd1b5 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -76,46 +76,26 @@ uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 }
 
 /* 64/64 -> 64 signed division */
-int64_t HELPER(divs64)(CPUS390XState *env, int64_t a, int64_t b)
+Int128 HELPER(divs64)(CPUS390XState *env, int64_t a, int64_t b)
 {
     /* Catch divide by zero, and non-representable quotient (MIN / -1).  */
     if (b == 0 || (b == -1 && a == (1ll << 63))) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
-    env->retxl = a % b;
-    return a / b;
+    return int128_make128(a / b, a % b);
 }
 
 /* 128 -> 64/64 unsigned division */
-uint64_t HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al,
-                        uint64_t b)
+Int128 HELPER(divu64)(CPUS390XState *env, uint64_t ah, uint64_t al, uint64_t b)
 {
-    uint64_t ret;
-    /* Signal divide by zero.  */
-    if (b == 0) {
-        tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
-    }
-    if (ah == 0) {
-        /* 64 -> 64/64 case */
-        env->retxl = al % b;
-        ret = al / b;
-    } else {
-        /* ??? Move i386 idivq helper to host-utils.  */
-#ifdef CONFIG_INT128
-        __uint128_t a = ((__uint128_t)ah << 64) | al;
-        __uint128_t q = a / b;
-        env->retxl = a % b;
-        ret = q;
-        if (ret != q) {
-            tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
+    if (b != 0) {
+        uint64_t r = divu128(&al, &ah, b);
+        if (ah == 0) {
+            return int128_make128(al, r);
         }
-#else
-        /* 32-bit hosts would need special wrapper functionality - just abort if
-           we encounter such a case; it's very unlikely anyways. */
-        cpu_abort(env_cpu(env), "128 -> 64/64 division not implemented\n");
-#endif
     }
-    return ret;
+    /* divide by zero or overflow */
+    tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
 }
 
 uint64_t HELPER(cvd)(int32_t reg)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 169f7ee1b2..6953b81de7 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2409,15 +2409,21 @@ static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs64(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs64(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    TCGv_i128 t = tcg_temp_new_i128();
+
+    gen_helper_divs64(t, cpu_env, o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, t);
+    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu64(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu64(o->out2, cpu_env, o->out, o->out2, o->in2);
-    return_low128(o->out);
+    TCGv_i128 t = tcg_temp_new_i128();
+
+    gen_helper_divu64(t, cpu_env, o->out, o->out2, o->in2);
+    tcg_gen_extr_i128_i64(o->out2, o->out, t);
+    tcg_temp_free_i128(t);
     return DISAS_NEXT;
 }
 
diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
index 5807295614..6ad9900e08 100644
--- a/tests/tcg/s390x/div.c
+++ b/tests/tcg/s390x/div.c
@@ -33,8 +33,43 @@ static void test_dlr(void)
     assert(r == 1);
 }
 
+static void test_dsgr(void)
+{
+    register int64_t r0 asm("r0") = -1;
+    register int64_t r1 asm("r1") = -4241;
+    int64_t b = 101, q, r;
+
+    asm("dsgr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlgr(void)
+{
+    register uint64_t r0 asm("r0") = 0;
+    register uint64_t r1 asm("r1") = 4243;
+    uint64_t b = 101, q, r;
+
+    asm("dlgr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
 int main(void)
 {
     test_dr();
     test_dlr();
+    test_dsgr();
+    test_dlgr();
+    return 0;
 }
-- 
2.34.1


