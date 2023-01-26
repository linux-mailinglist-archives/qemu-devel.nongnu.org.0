Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B827267C3FB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2v-0000W7-SC; Wed, 25 Jan 2023 23:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2s-0000U1-0u
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:30 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2p-0004Xg-36
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:29 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso3548220pjs.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wjq7xXevU0mmvHUtmHWv2FofdJ4SksIwuVkJSWY5CU=;
 b=DXLBHfKVoFtECPDLg8hnNmvXIIatwduJN9Kr0uybHJ+LbRP3XhVUiJpyUDLz9CS23x
 yjgEfU6FPQR+ohVj1ozXrHpTdU7ot6MSwA3enbGqUH7p80a8I65QVgcwkbQFN/qoe7mi
 THDRIwWnmQ0+xMEfUnGDhYweXL2TA/KNEuL03lS0AK9LUD9qQXhWhUhJePwxb230n6J6
 oexB2KWYEmxAVH3bEaHLu3Ikov6dmC/7kHCJAWEazVcQhCx7qW6gJkRw5mj3SkpFJIB9
 T2HfwkpCiIf73brb2UC9Fsy0TBjLyMLttjYb/09w1QS4RyEB+hE1Wv3ZhJImOzpDozua
 86VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wjq7xXevU0mmvHUtmHWv2FofdJ4SksIwuVkJSWY5CU=;
 b=oKK/6KOLdcaTNI+i7PdMiut0sLwAZN3aMaxtlYpIk7Zp+dCsOYGuOKxEx4iCPKiR5B
 N4L1iivmSkkXLryhByfAeQFwxoSh5DUr9Wk8cPF/iyeRaGj+Btm9LJjvLEOZT1kRGdCW
 /7hWtNBiiHiruGIhTjkrqHxg1OaPA2FVA4wi2I3pw7h5o6xl2NyOCK0CB1USGP0B/lYq
 El2dScCmiGydER4kVS+S52AEsBMTtnjfFPMGaFyUrIupAt6no5QS+yERokr+mT8fsuGx
 wd/RFsNjFJ+37ZFY4qS5DXObzdwI1PA9CGuWnmln491mt45WP5fVKvF0goxeKTd+anuq
 EBIQ==
X-Gm-Message-State: AFqh2kqpgCs9GiBo9vH/iDdGwcq7GBKHajTaIgxPF2IzQI+SefnvQIcN
 ACHBEnPyyYMeom1qAab6XJxNmPbNfVJe7u5bZ3E=
X-Google-Smtp-Source: AMrXdXuGD73y22UhzEOx3kJLKOn06jZXzIn6wEx0h8dOtkXBxWNKLTuwkLp51ggLQhQLD3Wy8Ldl6Q==
X-Received: by 2002:a17:90a:6545:b0:229:9b0a:360e with SMTP id
 f5-20020a17090a654500b002299b0a360emr37043993pjs.12.1674707965833; 
 Wed, 25 Jan 2023 20:39:25 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 36/36] target/i386: Inline cmpxchg16b
Date: Wed, 25 Jan 2023 18:38:24 -1000
Message-Id: <20230126043824.54819-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Use tcg_gen_atomic_cmpxchg_i128 for the atomic case,
and tcg_gen_qemu_ld/st_i128 otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
---
 target/i386/helper.h         |  4 ---
 target/i386/tcg/mem_helper.c | 69 ------------------------------------
 target/i386/tcg/translate.c  | 44 ++++++++++++++++++++---
 3 files changed, 39 insertions(+), 78 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 2df8049f91..e627a93107 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -66,10 +66,6 @@ DEF_HELPER_1(rsm, void, env)
 #endif /* !CONFIG_USER_ONLY */
 
 DEF_HELPER_2(into, void, env, int)
-#ifdef TARGET_X86_64
-DEF_HELPER_2(cmpxchg16b_unlocked, void, env, tl)
-DEF_HELPER_2(cmpxchg16b, void, env, tl)
-#endif
 DEF_HELPER_FLAGS_1(single_step, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(rechecking_single_step, void, env)
 DEF_HELPER_1(cpuid, void, env)
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 814786bb87..3ef84e90d9 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -27,75 +27,6 @@
 #include "tcg/tcg.h"
 #include "helper-tcg.h"
 
-#ifdef TARGET_X86_64
-void helper_cmpxchg16b_unlocked(CPUX86State *env, target_ulong a0)
-{
-    uintptr_t ra = GETPC();
-    Int128 oldv, cmpv, newv;
-    uint64_t o0, o1;
-    int eflags;
-    bool success;
-
-    if ((a0 & 0xf) != 0) {
-        raise_exception_ra(env, EXCP0D_GPF, GETPC());
-    }
-    eflags = cpu_cc_compute_all(env, CC_OP);
-
-    cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
-    newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
-
-    o0 = cpu_ldq_data_ra(env, a0 + 0, ra);
-    o1 = cpu_ldq_data_ra(env, a0 + 8, ra);
-
-    oldv = int128_make128(o0, o1);
-    success = int128_eq(oldv, cmpv);
-    if (!success) {
-        newv = oldv;
-    }
-
-    cpu_stq_data_ra(env, a0 + 0, int128_getlo(newv), ra);
-    cpu_stq_data_ra(env, a0 + 8, int128_gethi(newv), ra);
-
-    if (success) {
-        eflags |= CC_Z;
-    } else {
-        env->regs[R_EAX] = int128_getlo(oldv);
-        env->regs[R_EDX] = int128_gethi(oldv);
-        eflags &= ~CC_Z;
-    }
-    CC_SRC = eflags;
-}
-
-void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
-{
-    uintptr_t ra = GETPC();
-
-    if ((a0 & 0xf) != 0) {
-        raise_exception_ra(env, EXCP0D_GPF, ra);
-    } else if (HAVE_CMPXCHG128) {
-        int eflags = cpu_cc_compute_all(env, CC_OP);
-
-        Int128 cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
-        Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
-
-        int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
-        Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
-
-        if (int128_eq(oldv, cmpv)) {
-            eflags |= CC_Z;
-        } else {
-            env->regs[R_EAX] = int128_getlo(oldv);
-            env->regs[R_EDX] = int128_gethi(oldv);
-            eflags &= ~CC_Z;
-        }
-        CC_SRC = eflags;
-    } else {
-        cpu_loop_exit_atomic(env_cpu(env), ra);
-    }
-}
-#endif
-
 void helper_boundw(CPUX86State *env, target_ulong a0, int v)
 {
     int low, high;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b542b084a6..9d9392b009 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3053,15 +3053,49 @@ static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
 #ifdef TARGET_X86_64
 static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
 {
+    MemOp mop = MO_TE | MO_128 | MO_ALIGN;
+    TCGv_i64 t0, t1;
+    TCGv_i128 cmp, val;
+
     gen_lea_modrm(env, s, modrm);
 
-    if ((s->prefix & PREFIX_LOCK) &&
-        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_helper_cmpxchg16b(cpu_env, s->A0);
+    cmp = tcg_temp_new_i128();
+    val = tcg_temp_new_i128();
+    tcg_gen_concat_i64_i128(cmp, cpu_regs[R_EAX], cpu_regs[R_EDX]);
+    tcg_gen_concat_i64_i128(val, cpu_regs[R_EBX], cpu_regs[R_ECX]);
+
+    /* Only require atomic with LOCK; non-parallel handled in generator. */
+    if (s->prefix & PREFIX_LOCK) {
+        tcg_gen_atomic_cmpxchg_i128(val, s->A0, cmp, val, s->mem_index, mop);
     } else {
-        gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+        tcg_gen_nonatomic_cmpxchg_i128(val, s->A0, cmp, val, s->mem_index, mop);
     }
-    set_cc_op(s, CC_OP_EFLAGS);
+
+    tcg_gen_extr_i128_i64(s->T0, s->T1, val);
+    tcg_temp_free_i128(cmp);
+    tcg_temp_free_i128(val);
+
+    /* Determine success after the fact. */
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    tcg_gen_xor_i64(t0, s->T0, cpu_regs[R_EAX]);
+    tcg_gen_xor_i64(t1, s->T1, cpu_regs[R_EDX]);
+    tcg_gen_or_i64(t0, t0, t1);
+    tcg_temp_free_i64(t1);
+
+    /* Update Z. */
+    gen_compute_eflags(s);
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t0, t0, 0);
+    tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, t0, ctz32(CC_Z), 1);
+    tcg_temp_free_i64(t0);
+
+    /*
+     * Extract the result values for the register pair.  We may do this
+     * unconditionally, because on success (Z=1), the old value matches
+     * the previous value in RDX:RAX.
+     */
+    tcg_gen_mov_i64(cpu_regs[R_EAX], s->T0);
+    tcg_gen_mov_i64(cpu_regs[R_EDX], s->T1);
 }
 #endif
 
-- 
2.34.1


