Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C1626757
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 07:12:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjju-0005wd-4n; Sat, 12 Nov 2022 01:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjjs-0005w9-KL
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:11:36 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjjq-0000vP-LU
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:11:36 -0500
Received: by mail-pj1-x102b.google.com with SMTP id k5so6115860pjo.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 22:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/7O54PCNI/+Ud3c/QazP1KtLg4dCRFKQ+DyhJHT2MI=;
 b=ZfVhTHufE7jxiVf53yn1fH9khDK0tkhJYm8jj7Ajvl7uZCEBhbqdaOi+uY2XDacSro
 owVWFEkUioqnHylhcOyVOPDPTQQ/xfB69vWr59JkxRF95GAPS/8GZWw6BioFXCgVkMh6
 lZYIYf+kK7EDXuu8vDZJH6+AimsBjx/ICP0lySRmsDZ3CoIHXg4zIS16hh+Sm0FOBaVO
 a+t3KejKkpuEwZpYD1T5RAkKQcQVed6tmP4xTWlRKRDdw6zAYZGqUJBJFQVmF92W3QPS
 mUxgg4n1zHrrGjA4PRwHGDJ9YZ+q4PO+mtO7fbhOvV+7kaUFzgkWo+eT1pKLdQmUaNVn
 r9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/7O54PCNI/+Ud3c/QazP1KtLg4dCRFKQ+DyhJHT2MI=;
 b=NN5b0/nzdXfMk7PblH74c7eILLIl+pSLGh/exWJ+gWADU+dsYaZqcKzkNVdoa3gUPh
 /GLoAz6TfAhs478NMFTCcD/p/QK+/1bGthQujII5dKSGLxfNCL5vz9jnizXXqnVw1gzu
 aZJTdZGSAIov7cEU3jhQYDg97IKM3t8+j3GBHEESGVY/4HUvl2IgF892QNMDuiTlFff/
 O3SUBT+rXfdzBN08wenbk+FPqWC8zyyTaIrnk79aRPQFwuxDZZKJjOBFvnlgxpKbbxPf
 CDRrBoFIOnkuLwYLDL1Rjq6wiLN2SsovdySakvexBaR7hP3A0TsjZMCDJt3wHOcMttNg
 TqXw==
X-Gm-Message-State: ANoB5pl2UsR1jOxbPjeWmX6MchZ7bgJ2pdejSfiU++vx1QHMAE/fqTIm
 TV3NIhyhOik9XHhQbQ9GDrOjzDOdbGDp/8EG
X-Google-Smtp-Source: AA0mqf5bxUdtb99oUeUwuRsbMboDB2Z5+t9SutWlnR8A5W2LYkq6hWN2/9qSpS7WacyZbAXVnkHVMA==
X-Received: by 2002:a17:902:b492:b0:186:a97d:6bc8 with SMTP id
 y18-20020a170902b49200b00186a97d6bc8mr5678149plr.101.1668233493271; 
 Fri, 11 Nov 2022 22:11:33 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 nm13-20020a17090b19cd00b0020087d7e778sm5790163pjb.37.2022.11.11.22.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 22:11:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au,
	danielhb413@gmail.com,
	qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 1/1] target/ppc: Use tcg_gen_atomic_cmpxchg_i128 for
 STQCX
Date: Sat, 12 Nov 2022 16:11:22 +1000
Message-Id: <20221112061122.2720163-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112061122.2720163-1-richard.henderson@linaro.org>
References: <20221112061122.2720163-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Note that the previous direct reference to reserve_val,

-   tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
-                                ? offsetof(CPUPPCState, reserve_val2)
-                                : offsetof(CPUPPCState, reserve_val)));

was incorrect because all references should have gone through
cpu_reserve_val.  Create a cpu_reserve_val2 tcg temp to fix this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h     |   2 -
 target/ppc/mem_helper.c |  44 -----------------
 target/ppc/translate.c  | 102 ++++++++++++++++++----------------------
 3 files changed, 47 insertions(+), 101 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8dd22a35e4..0beaca5c7a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -818,6 +818,4 @@ DEF_HELPER_FLAGS_5(stq_le_parallel, TCG_CALL_NO_WG,
                    void, env, tl, i64, i64, i32)
 DEF_HELPER_FLAGS_5(stq_be_parallel, TCG_CALL_NO_WG,
                    void, env, tl, i64, i64, i32)
-DEF_HELPER_5(stqcx_le_parallel, i32, env, tl, i64, i64, i32)
-DEF_HELPER_5(stqcx_be_parallel, i32, env, tl, i64, i64, i32)
 #endif
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index d1163f316c..1578887a8f 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -413,50 +413,6 @@ void helper_stq_be_parallel(CPUPPCState *env, target_ulong addr,
     val = int128_make128(lo, hi);
     cpu_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
 }
-
-uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr,
-                                  uint64_t new_lo, uint64_t new_hi,
-                                  uint32_t opidx)
-{
-    bool success = false;
-
-    /* We will have raised EXCP_ATOMIC from the translator.  */
-    assert(HAVE_CMPXCHG128);
-
-    if (likely(addr == env->reserve_addr)) {
-        Int128 oldv, cmpv, newv;
-
-        cmpv = int128_make128(env->reserve_val2, env->reserve_val);
-        newv = int128_make128(new_lo, new_hi);
-        oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv,
-                                          opidx, GETPC());
-        success = int128_eq(oldv, cmpv);
-    }
-    env->reserve_addr = -1;
-    return env->so + success * CRF_EQ_BIT;
-}
-
-uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
-                                  uint64_t new_lo, uint64_t new_hi,
-                                  uint32_t opidx)
-{
-    bool success = false;
-
-    /* We will have raised EXCP_ATOMIC from the translator.  */
-    assert(HAVE_CMPXCHG128);
-
-    if (likely(addr == env->reserve_addr)) {
-        Int128 oldv, cmpv, newv;
-
-        cmpv = int128_make128(env->reserve_val2, env->reserve_val);
-        newv = int128_make128(new_lo, new_hi);
-        oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv,
-                                          opidx, GETPC());
-        success = int128_eq(oldv, cmpv);
-    }
-    env->reserve_addr = -1;
-    return env->so + success * CRF_EQ_BIT;
-}
 #endif
 
 /*****************************************************************************/
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 19c1d17cb0..85f95a9045 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -72,6 +72,7 @@ static TCGv cpu_cfar;
 static TCGv cpu_xer, cpu_so, cpu_ov, cpu_ca, cpu_ov32, cpu_ca32;
 static TCGv cpu_reserve;
 static TCGv cpu_reserve_val;
+static TCGv cpu_reserve_val2;
 static TCGv cpu_fpscr;
 static TCGv_i32 cpu_access_type;
 
@@ -141,8 +142,11 @@ void ppc_translate_init(void)
                                      offsetof(CPUPPCState, reserve_addr),
                                      "reserve_addr");
     cpu_reserve_val = tcg_global_mem_new(cpu_env,
-                                     offsetof(CPUPPCState, reserve_val),
-                                     "reserve_val");
+                                         offsetof(CPUPPCState, reserve_val),
+                                         "reserve_val");
+    cpu_reserve_val2 = tcg_global_mem_new(cpu_env,
+                                          offsetof(CPUPPCState, reserve_val2),
+                                          "reserve_val2");
 
     cpu_fpscr = tcg_global_mem_new(cpu_env,
                                    offsetof(CPUPPCState, fpscr), "fpscr");
@@ -3979,78 +3983,66 @@ static void gen_lqarx(DisasContext *ctx)
 /* stqcx. */
 static void gen_stqcx_(DisasContext *ctx)
 {
+    TCGLabel *lab_fail, *lab_over;
     int rs = rS(ctx->opcode);
-    TCGv EA, hi, lo;
+    TCGv EA, t0, t1;
+    TCGv_i128 cmp, val;
 
     if (unlikely(rs & 1)) {
         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
         return;
     }
 
+    lab_fail = gen_new_label();
+    lab_over = gen_new_label();
+
     gen_set_access_type(ctx, ACCESS_RES);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
 
+    tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
+    tcg_temp_free(EA);
+
+    cmp = tcg_temp_new_i128();
+    val = tcg_temp_new_i128();
+
+    tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2, cpu_reserve_val);
+
     /* Note that the low part is always in RS+1, even in LE mode.  */
-    lo = cpu_gpr[rs + 1];
-    hi = cpu_gpr[rs];
+    tcg_gen_concat_i64_i128(val, cpu_gpr[rs + 1], cpu_gpr[rs]);
 
-    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
-        if (HAVE_CMPXCHG128) {
-            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
-            if (ctx->le_mode) {
-                gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
-                                             EA, lo, hi, oi);
-            } else {
-                gen_helper_stqcx_be_parallel(cpu_crf[0], cpu_env,
-                                             EA, lo, hi, oi);
-            }
-            tcg_temp_free_i32(oi);
-        } else {
-            /* Restart with exclusive lock.  */
-            gen_helper_exit_atomic(cpu_env);
-            ctx->base.is_jmp = DISAS_NORETURN;
-        }
-        tcg_temp_free(EA);
-    } else {
-        TCGLabel *lab_fail = gen_new_label();
-        TCGLabel *lab_over = gen_new_label();
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+    tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val, ctx->mem_idx,
+                                DEF_MEMOP(MO_128 | MO_ALIGN));
+    tcg_temp_free_i128(cmp);
 
-        tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
-        tcg_temp_free(EA);
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    tcg_gen_extr_i128_i64(t1, t0, val);
+    tcg_temp_free_i128(val);
 
-        gen_qemu_ld64_i64(ctx, t0, cpu_reserve);
-        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
-                                     ? offsetof(CPUPPCState, reserve_val2)
-                                     : offsetof(CPUPPCState, reserve_val)));
-        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
+    tcg_gen_xor_tl(t1, t1, cpu_reserve_val2);
+    tcg_gen_xor_tl(t0, t0, cpu_reserve_val);
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_temp_free(t1);
 
-        tcg_gen_addi_i64(t0, cpu_reserve, 8);
-        gen_qemu_ld64_i64(ctx, t0, t0);
-        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
-                                     ? offsetof(CPUPPCState, reserve_val)
-                                     : offsetof(CPUPPCState, reserve_val2)));
-        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, 0);
+    tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);
+    tcg_gen_or_tl(t0, t0, cpu_so);
+    tcg_gen_trunc_tl_i32(cpu_crf[0], t0);
+    tcg_temp_free(t0);
 
-        /* Success */
-        gen_qemu_st64_i64(ctx, ctx->le_mode ? lo : hi, cpu_reserve);
-        tcg_gen_addi_i64(t0, cpu_reserve, 8);
-        gen_qemu_st64_i64(ctx, ctx->le_mode ? hi : lo, t0);
+    tcg_gen_br(lab_over);
+    gen_set_label(lab_fail);
 
-        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
-        tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], CRF_EQ);
-        tcg_gen_br(lab_over);
+    /*
+     * Address mismatch implies failure.  But we still need to provide
+     * the memory barrier semantics of the instruction.
+     */
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+    tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
 
-        gen_set_label(lab_fail);
-        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
-
-        gen_set_label(lab_over);
-        tcg_gen_movi_tl(cpu_reserve, -1);
-        tcg_temp_free_i64(t0);
-        tcg_temp_free_i64(t1);
-    }
+    gen_set_label(lab_over);
+    tcg_gen_movi_tl(cpu_reserve, -1);
 }
 #endif /* defined(TARGET_PPC64) */
 
-- 
2.34.1


