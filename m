Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D168AB3C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUF-0005DT-7w; Sat, 04 Feb 2023 11:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUE-0005D4-0z
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:58 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUC-0002UX-E7
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so10049029pjq.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/flZifrbzQQQmxJpuLpAQCV8xYiiduPjwGp5rxcesSA=;
 b=kR94lW+76cU7hGZTu+qb45Iep4H+Kfr1EZsiERz1WoM8EjpBX5iAruRKsNUbrV8Jc3
 UZpo19ebrIdpUXwhavAmAwT/5FMXmWHYnZN39w8lK0ep8SB33mFfDCjr3wstqr72ESAw
 BgNvgL6l4EGf5PcIHlmYYEbH9Z5XmjtXpqY131wuROh9tSqltRPK6m9k6bxUfMC6Lqm/
 T9rDTO6p04ZORjcSKegl/w2is3cTAGNmlwThvmL24bdK2aj3uJH9ZWya1hF/aGz65egB
 qudEZ7g087oOFtwrpmlcji8mzkm8tXD9uIcHiutgnNdKd1hkn5BVlePAcBACHdFgdWHv
 /zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/flZifrbzQQQmxJpuLpAQCV8xYiiduPjwGp5rxcesSA=;
 b=LxTlxopEyiTX8NVrfwfbwBgnw05aCmJxV4W0cypbFpxSK/J2IlElVKx44CnNuLhCNn
 RLyCmP/CEmKgzz6YfUrgJdD+TLI83UasvYvWXO9AD7+LUS1h2Qbm6ogk95cny0udx+GF
 8UDTBWXV/zwmJk3Yq/nplfLjuCtyvwp6duw9YMG/WzrF3Pa5OOge+R+0K1yIkvsE2uYR
 K5a0bvyPf+ErPfP0/P0ltNdxptPgvihzc9+6oLZqFUDlWrS9N1U1E/8aXBBa3l6fAm4c
 0zpdEbEpqwL5gQkoY0gqbN7LZ9qHFVroRWh+eN0Zj+Bm8mGYjAbu7rxQ94Va+5JTEu1R
 gjpA==
X-Gm-Message-State: AO0yUKXfsye+lmfZBeqvYAPmZkBMCDI7JGz99ePFLi3NKOOjVY8sWU8m
 r0/0HQFj3B+IcOTl39FWSxsV0nCNBG7q7/w4
X-Google-Smtp-Source: AK7set+85m2HZTSiN0gMyD0wqiUO7zeo5dV/g7vNhg+RvLaXnDDulJfL1NIJM/Yxoya2EGbvZR37ng==
X-Received: by 2002:a17:902:d4cc:b0:194:d1ee:954 with SMTP id
 o12-20020a170902d4cc00b00194d1ee0954mr8266657plg.7.1675528435610; 
 Sat, 04 Feb 2023 08:33:55 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 27/40] target/s390x: Use a single return for helper_divs32/u32
Date: Sat,  4 Feb 2023 06:32:57 -1000
Message-Id: <20230204163310.815536-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Pack the quotient and remainder into a single uint64_t.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix operand ordering; use tcg_extr32_i64.
---
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/int_helper.c | 26 +++++++++++++-------------
 target/s390x/tcg/translate.c  |  8 ++++----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 93923ca153..bc828d976b 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -10,7 +10,7 @@ DEF_HELPER_FLAGS_4(clc, TCG_CALL_NO_WG, i32, env, i32, i64, i64)
 DEF_HELPER_3(mvcl, i32, env, i32, i32)
 DEF_HELPER_3(clcl, i32, env, i32, i32)
 DEF_HELPER_FLAGS_4(clm, TCG_CALL_NO_WG, i32, env, i32, i32, i64)
-DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, s64, env, s64, s64)
+DEF_HELPER_FLAGS_3(divs32, TCG_CALL_NO_WG, i64, env, s64, s64)
 DEF_HELPER_FLAGS_3(divu32, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, s64, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 954542388a..7260583cf2 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -34,45 +34,45 @@
 #endif
 
 /* 64/32 -> 32 signed division */
-int64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
+uint64_t HELPER(divs32)(CPUS390XState *env, int64_t a, int64_t b64)
 {
-    int32_t ret, b = b64;
-    int64_t q;
+    int32_t b = b64;
+    int64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (int32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/32 -> 32 unsigned division */
 uint64_t HELPER(divu32)(CPUS390XState *env, uint64_t a, uint64_t b64)
 {
-    uint32_t ret, b = b64;
-    uint64_t q;
+    uint32_t b = b64;
+    uint64_t q, r;
 
     if (b == 0) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    ret = q = a / b;
-    env->retxl = a % b;
+    q = a / b;
+    r = a % b;
 
     /* Catch non-representable quotient.  */
-    if (ret != q) {
+    if (q != (uint32_t)q) {
         tcg_s390_program_interrupt(env, PGM_FIXPT_DIVIDE, GETPC());
     }
 
-    return ret;
+    return deposit64(q, 32, 32, r);
 }
 
 /* 64/64 -> 64 signed division */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a339b277e9..169f7ee1b2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2395,15 +2395,15 @@ static DisasJumpType op_diag(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_divs32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divs32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divs32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_divu32(DisasContext *s, DisasOps *o)
 {
-    gen_helper_divu32(o->out2, cpu_env, o->in1, o->in2);
-    return_low128(o->out);
+    gen_helper_divu32(o->out, cpu_env, o->in1, o->in2);
+    tcg_gen_extr32_i64(o->out2, o->out, o->out);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


