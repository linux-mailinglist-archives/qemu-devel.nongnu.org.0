Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775968AB3D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:35:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUa-0005RW-JF; Sat, 04 Feb 2023 11:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUY-0005Qq-Fu
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:18 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUV-0002Zi-GZ
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:17 -0500
Received: by mail-pl1-x62e.google.com with SMTP id m2so8170157plg.4
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/mQXKGoZSeezy+fD0L3eFiruW/hZ0so4pkDJy4zkyE=;
 b=V4cCtOcJKVp7hmEjwHWzCB2X99uj3GR8F1kdoLWmediRB1D9T7Vc+6hwp9WXdyVE9F
 XEeiivLBRPVXcNybAvOiT/A6uRCvdV1wslhsW7QPZWsCh5AMuRRI3NubA4ESzMA8XcEH
 N+r4CqYeo6KzLJtx8CeY3kNm90po91oFEjxWO5zv5gV3AmVd3vcaccgdwabJDeprgol4
 PH8rIMdtE9tLd8xUKpn46KM4KoYM4di2+Xh6oyVLmq5Pejes+VzP1lfzK8xlY6p/7ZpH
 0gpnmLztzo9mUkIFIGs8qaGILYtGKLFVei6rsPiPcWj79t/3xeDwn5eXvqgYIbZRK5v9
 2e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/mQXKGoZSeezy+fD0L3eFiruW/hZ0so4pkDJy4zkyE=;
 b=07mg6f0kFiP+XKd1aeUiYeV7KziB3Lb6BGovUAW3eCmXrnCwC0FBAM9KZQ9DM08lmc
 GURZKXG7Ai8WNOb2QZWGqTue8+HGWaxfhU2PaDZqIH6iC9lcs3Yvpp+5gr45zebzX1ms
 n9aTOvskzFjQTHmZ1uDAjPMVMNehm/XHNO7ecvB+kz+hBusqhIhakCm2dNY6Jdif0duV
 vqdKEli8vuNMBnAC452UAhs26IcjhobgB3gYC0Fhn464JjK8y1PpT/qkyDUojA9paB5g
 6iLEdK0OEbZhFqy8KWceMhU6xdKAPzNWitC+4xRGgYTjcxsZ1zqNVwciGr2Hj0HAgPo7
 J6dQ==
X-Gm-Message-State: AO0yUKUUe+5tXGNrW8Difx5X3XwQT7Uzlt8fbqkzzVjwUKW8vosBJnzO
 6Ex7z8RxO3WrvIxFarULO1ZJMEweJqhK59mH
X-Google-Smtp-Source: AK7set8bf1knY0EH3pqqJiffGwr3gXU6JI+5ccgxzSayNstJBnmV7atRnOk/7tN9RTEFZRwyXQbewQ==
X-Received: by 2002:a17:902:ce92:b0:198:ec2c:d4e6 with SMTP id
 f18-20020a170902ce9200b00198ec2cd4e6mr5144679plg.38.1675528454647; 
 Sat, 04 Feb 2023 08:34:14 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:34:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/40] target/i386: Inline cmpxchg16b
Date: Sat,  4 Feb 2023 06:33:09 -1000
Message-Id: <20230204163310.815536-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


