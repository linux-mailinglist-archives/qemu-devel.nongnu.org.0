Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5761625556
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP6B-0001A0-8x; Fri, 11 Nov 2022 03:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5g-00014a-TM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:45 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otP5e-0002FT-SN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:08:44 -0500
Received: by mail-pl1-x634.google.com with SMTP id l2so3645767pld.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2HywVdqdCx85ro+4/M1KDfKsqTmYrTPjM+YxYywiSA=;
 b=srHB2UoC6P21BncPfMvsjbUL3hdbeyCouxkJMD2SgGJmSngV/RC/0eaC7rkcwdocW9
 pKaEKo7/6q4sPND/J42fBlgCmmdAQ6yahu6up7yqniVo85gXEE9fXlqWlcd7qrjC+5IG
 TphSnqvHvlSZMbGAFJGXYlPbTmiF7FDaSd7gL3r5rnhM2xo9/7hKeWqVdOLCa9q47oga
 nCfU+de1sDDsz+0QlXcBICumHfx3hzG2So61wtnNHrEAnxeIkDGhx7eXePGbKqPDuveY
 YBtpgts3E6k1BypO2dw//VbrrV1iZp+3qKbBAXU8JQXQxcsNtNkVqe1h70cbXv//OGyP
 rjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2HywVdqdCx85ro+4/M1KDfKsqTmYrTPjM+YxYywiSA=;
 b=bpdo56vSgDo2bvcEwHo6E9aictQEXQxqPCpmhgo2+ml7fafSMXbGtFthmznPK2aXZf
 ofkIK94e1mBb7BqSXZOfJOqN613cczPO5Lq5FWI5gZtSpomKFHXjcATBj6tZILx2IKHd
 0GbHaNQP46eOs+vqFufaSiocxUlJHsCgVOC0PUarQZxqDNz0HUTbkIyBxOVItqQxDqzv
 itIUZS0sLhx9kSuo4HTQvTmU7M4GesscxOF55VejPFcVUytcoLi4BPSzrWn+tgEhXckn
 ZzBiswcFMSfskpnJEyXcZCPi92WI6AM4NnrQ7DFK4A+7AXriInXwguv94OGtafHKzLLR
 EwYw==
X-Gm-Message-State: ANoB5pl9wLx1UI+eDTLoiB6pvnchE90KqV/pKKnKzLwnrR4zaM3SmRZ1
 New5V+Bx4aR4l1wR52410Rj7riUZfXdScLau
X-Google-Smtp-Source: AA0mqf7V6QG/684AEGXg5NZh7XGVm47FZfjvX9FjuFaKsWQI7FvRJCxVtXkZqHzaouHRp9T8MjGg5Q==
X-Received: by 2002:a17:90a:6d8f:b0:214:2ee7:3dc with SMTP id
 a15-20020a17090a6d8f00b002142ee703dcmr725552pjk.105.1668154121248; 
 Fri, 11 Nov 2022 00:08:41 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b00186a2dd3ffdsm1046341plj.15.2022.11.11.00.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:08:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, david@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v2 05/13] target/s390x: Use a single return for
 helper_divs64/u64
Date: Fri, 11 Nov 2022 18:08:12 +1000
Message-Id: <20221111080820.2132412-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111080820.2132412-1-richard.henderson@linaro.org>
References: <20221111080820.2132412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index 97a9668eef..29986557ed 100644
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
index 9c2ea15c8d..36613bb20b 100644
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


