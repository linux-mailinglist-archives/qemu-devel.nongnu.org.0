Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFF6267DF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 08:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otlNv-0006At-SH; Sat, 12 Nov 2022 02:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otlNs-0006AD-Kd
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:57:01 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otlNq-0008CC-RZ
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:57:00 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso9615583pjc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 23:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAuzr1+zL/74qkOPgnHR21GwFVmTlAsrzfx9yY4tIMY=;
 b=bHhkkPYeoZJbnO5gb8nT7s0BfBl8uQ7xpv2TxK34SYOeaHIut5K8rEfOoi1Di93exb
 TsPk85N3ZssaQkLFv7qbjLOlxfglWXMRnbKOO5Qc2uAuDLgJHVtuGpAjlXsOWoxe3+Sy
 0F9T9nRkn2cCQIgQl5ngdepG7xHuGuWp+Fm1VVdmRxF5iU4s+a0OP+r6RlSQIVcwUOal
 oy5paApT3F/6fVINAZGtYNEyhaHPk+CRfd6Cl68gtW0Gb+TBrxfMgvvkNvHQbTm5CARV
 amEIWW8z/kpTc0JBxl1uzwD32iRAWndmE5mVDr+s2q0D2YAd1uiY8c5js5rHVcue0UQp
 padQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tAuzr1+zL/74qkOPgnHR21GwFVmTlAsrzfx9yY4tIMY=;
 b=OZ0083YVSJQ65YK8QHy9KdlQ4u7+2k0oNgaAnlY/zBygZkbyPEOZVtDXxPePPNzMLp
 6UHS0moW94FFMuGWqkl5+zB6ub4OALwqVLbiUy3ebNZQS2ym2/ASRk1gcFFMIPXHtX3X
 NK4cTCMkJ3BBdy4juu2m5L07bh0yTDsP3ZbKfj9sU4hTB5u8yWfmUdzzXp8cVXkiAGaJ
 zMArlYfd/m5d9uTPCLdZv+4Ezva+RXyGAXdEqvZIVppHwKxk4j9z/WAZD1BmNPFNNAq0
 AAtWbGV6WT72g+WnN5cPEbC6v6L/qQemwY8Mz97c270DRh4gg17oeUudn9Jc6HJIeyhW
 J8Jw==
X-Gm-Message-State: ANoB5pn3dbGz+fWIb4uxuiYM1lgvv9MpUxW0yFfXOVCp9NcXBQqk6KPl
 srXH1cen5EybFkNydpTvA6LIoYD0MBcRGccE
X-Google-Smtp-Source: AA0mqf7KwE2FZxd7w2cN4k7tbfNVWSyojYFSzOV3ayt4kA5QL29SeN4q49bLHciBiMrcVnL24VDD8g==
X-Received: by 2002:a17:90a:4544:b0:212:bfc3:3271 with SMTP id
 r4-20020a17090a454400b00212bfc33271mr5395061pjm.99.1668239817356; 
 Fri, 11 Nov 2022 23:56:57 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a17090a71c800b00213d08fa459sm2743062pjs.17.2022.11.11.23.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 23:56:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH for-8.0 2/3] target/i386: Inline cmpxchg8b
Date: Sat, 12 Nov 2022 17:56:44 +1000
Message-Id: <20221112075645.2850679-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112075645.2850679-1-richard.henderson@linaro.org>
References: <20221112075645.2850679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index 1175540a2c..a134d63946 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2976,15 +2976,59 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
 
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


