Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D668AB43
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUZ-0005RF-Uu; Sat, 04 Feb 2023 11:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUW-0005QE-Nh
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:16 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUU-0002cG-VI
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:16 -0500
Received: by mail-pl1-x636.google.com with SMTP id h15so793267plk.12
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMCyfXnssKmfr0p7SViF6VSjOE8T0VxFt6AN0VqMZ2U=;
 b=yJXHsi47R/2Kcx5UfKh4Wqf5rUNmy7b9h2cRgmRqJMdvO1QQsiQbu2woDREn/1bonn
 AR9tPw/BtHYXtzpr0t/B3jpAWCjpGh0PdyrT3Y2TTPwlVomzrmbSI/YSyG038zBwpIHt
 KWEPW707wXmXnjSz/CRLTSmOw4/G4GUoxmi88cyngb59wXBcG5b+e7tjbpspC06fjqUV
 AhUkPzL92r/GtgWlF9geT/WQ6/sg58kosTTxO7+kTC8gAMzFP+ND8NknY6r1PENqDZ/Y
 2RlaeH+jZNvKXPGIfTiSSa2r3UL7y1GwG7BaJBk0l0JHffJH2zf9iwVRw2QEDAp3iOvx
 N1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMCyfXnssKmfr0p7SViF6VSjOE8T0VxFt6AN0VqMZ2U=;
 b=dcLpODSQH+Cqg8dVYpQU6BEqOzhnvcKKOBOih/Bmsa1wT3XmpRNEIFasZUJ/idVnz4
 +aPwRnw+yB3OBjTXKhkWOfaeLqjKMEkywnIC4s3WTejAAGtNxkO5cw8vVAAWm2E7/OWy
 4EjZ/7+QMsWNq4/deEE6wtZrXkQmdT7A1tLHRRy4mxHsrOZJIkPNS7rsl4Xq3DMGQfBo
 k2nO+IM6Q5/VXAa6gIcXGLt17xXHu40GL5scP4iss/8sf1AomCzjzmErJn1fJc/rTORb
 2E6fJZ2aEn1UEl/UOBCLbf9/oZZBQdq0YtKo38fLRqbx6T3TrEmwCT3xaWXxBPxy+05f
 FjgA==
X-Gm-Message-State: AO0yUKUXRiUf05JDu2rxOQgY0Gz4IyKVQpLAgm01Vt7BCDVqMaXBSGpN
 elFEcaTLhVZCHW/EO5ETReHxxOrbltmYQmGS
X-Google-Smtp-Source: AK7set+e2YWo6juCwpgMijtUzzBai2CsHXaP4U1CtQ8ib1e1MuHyjJ89hTRyG5ETVWW8pZLFR9ihTg==
X-Received: by 2002:a17:903:188:b0:198:f289:cf86 with SMTP id
 z8-20020a170903018800b00198f289cf86mr2710993plg.37.1675528453087; 
 Sat, 04 Feb 2023 08:34:13 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:34:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 38/40] target/i386: Inline cmpxchg8b
Date: Sat,  4 Feb 2023 06:33:08 -1000
Message-Id: <20230204163310.815536-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Use tcg_gen_atomic_cmpxchg_i64 for the atomic case,
and tcg_gen_nonatomic_cmpxchg_i64 otherwise.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h         |  2 --
 target/i386/tcg/mem_helper.c | 57 ------------------------------------
 target/i386/tcg/translate.c  | 54 ++++++++++++++++++++++++++++++----
 3 files changed, 49 insertions(+), 64 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index b7de5429ef..2df8049f91 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -66,8 +66,6 @@ DEF_HELPER_1(rsm, void, env)
 #endif /* !CONFIG_USER_ONLY */
 
 DEF_HELPER_2(into, void, env, int)
-DEF_HELPER_2(cmpxchg8b_unlocked, void, env, tl)
-DEF_HELPER_2(cmpxchg8b, void, env, tl)
 #ifdef TARGET_X86_64
 DEF_HELPER_2(cmpxchg16b_unlocked, void, env, tl)
 DEF_HELPER_2(cmpxchg16b, void, env, tl)
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index e3cdafd2d4..814786bb87 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -27,63 +27,6 @@
 #include "tcg/tcg.h"
 #include "helper-tcg.h"
 
-void helper_cmpxchg8b_unlocked(CPUX86State *env, target_ulong a0)
-{
-    uintptr_t ra = GETPC();
-    uint64_t oldv, cmpv, newv;
-    int eflags;
-
-    eflags = cpu_cc_compute_all(env, CC_OP);
-
-    cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
-    newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
-
-    oldv = cpu_ldq_data_ra(env, a0, ra);
-    newv = (cmpv == oldv ? newv : oldv);
-    /* always do the store */
-    cpu_stq_data_ra(env, a0, newv, ra);
-
-    if (oldv == cmpv) {
-        eflags |= CC_Z;
-    } else {
-        env->regs[R_EAX] = (uint32_t)oldv;
-        env->regs[R_EDX] = (uint32_t)(oldv >> 32);
-        eflags &= ~CC_Z;
-    }
-    CC_SRC = eflags;
-}
-
-void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
-{
-#ifdef CONFIG_ATOMIC64
-    uint64_t oldv, cmpv, newv;
-    int eflags;
-
-    eflags = cpu_cc_compute_all(env, CC_OP);
-
-    cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
-    newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
-
-    {
-        uintptr_t ra = GETPC();
-        int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TEUQ, mem_idx);
-        oldv = cpu_atomic_cmpxchgq_le_mmu(env, a0, cmpv, newv, oi, ra);
-    }
-
-    if (oldv == cmpv) {
-        eflags |= CC_Z;
-    } else {
-        env->regs[R_EAX] = (uint32_t)oldv;
-        env->regs[R_EDX] = (uint32_t)(oldv >> 32);
-        eflags &= ~CC_Z;
-    }
-    CC_SRC = eflags;
-#else
-    cpu_loop_exit_atomic(env_cpu(env), GETPC());
-#endif /* CONFIG_ATOMIC64 */
-}
-
 #ifdef TARGET_X86_64
 void helper_cmpxchg16b_unlocked(CPUX86State *env, target_ulong a0)
 {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a82131d635..b542b084a6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2995,15 +2995,59 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
 
 static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
 {
+    TCGv_i64 cmp, val, old;
+    TCGv Z;
+
     gen_lea_modrm(env, s, modrm);
 
-    if ((s->prefix & PREFIX_LOCK) &&
-        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_helper_cmpxchg8b(cpu_env, s->A0);
+    cmp = tcg_temp_new_i64();
+    val = tcg_temp_new_i64();
+    old = tcg_temp_new_i64();
+
+    /* Construct the comparison values from the register pair. */
+    tcg_gen_concat_tl_i64(cmp, cpu_regs[R_EAX], cpu_regs[R_EDX]);
+    tcg_gen_concat_tl_i64(val, cpu_regs[R_EBX], cpu_regs[R_ECX]);
+
+    /* Only require atomic with LOCK; non-parallel handled in generator. */
+    if (s->prefix & PREFIX_LOCK) {
+        tcg_gen_atomic_cmpxchg_i64(old, s->A0, cmp, val, s->mem_index, MO_TEUQ);
     } else {
-        gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
+        tcg_gen_nonatomic_cmpxchg_i64(old, s->A0, cmp, val,
+                                      s->mem_index, MO_TEUQ);
     }
-    set_cc_op(s, CC_OP_EFLAGS);
+    tcg_temp_free_i64(val);
+
+    /* Set tmp0 to match the required value of Z. */
+    tcg_gen_setcond_i64(TCG_COND_EQ, cmp, old, cmp);
+    Z = tcg_temp_new();
+    tcg_gen_trunc_i64_tl(Z, cmp);
+    tcg_temp_free_i64(cmp);
+
+    /*
+     * Extract the result values for the register pair.
+     * For 32-bit, we may do this unconditionally, because on success (Z=1),
+     * the old value matches the previous value in EDX:EAX.  For x86_64,
+     * the store must be conditional, because we must leave the source
+     * registers unchanged on success, and zero-extend the writeback
+     * on failure (Z=0).
+     */
+    if (TARGET_LONG_BITS == 32) {
+        tcg_gen_extr_i64_tl(cpu_regs[R_EAX], cpu_regs[R_EDX], old);
+    } else {
+        TCGv zero = tcg_constant_tl(0);
+
+        tcg_gen_extr_i64_tl(s->T0, s->T1, old);
+        tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], Z, zero,
+                           s->T0, cpu_regs[R_EAX]);
+        tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EDX], Z, zero,
+                           s->T1, cpu_regs[R_EDX]);
+    }
+    tcg_temp_free_i64(old);
+
+    /* Update Z. */
+    gen_compute_eflags(s);
+    tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, Z, ctz32(CC_Z), 1);
+    tcg_temp_free(Z);
 }
 
 #ifdef TARGET_X86_64
-- 
2.34.1


