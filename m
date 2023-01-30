Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9965681D72
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:54:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc2I-00037o-NC; Mon, 30 Jan 2023 16:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc28-0002sh-Vq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:49 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc27-0005kV-6G
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:48 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so4587500pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziBn/5+saVd4auHCBHIgshaqj52WwpIAD7oymg6iFS8=;
 b=OvZwQ4utzR6wtc3CZec2Ac6Xz/EluV4w7fRP49d5nDnruuZGXvkx5ShSoy+KHrUPgX
 LZaivajKyq5XCRdPNvhCGdx2j2BuI8A0vFdo7QQZ8lVrkTeXxt2Z5CbI/B/BfsPOiHh9
 BO6AxQCOs6p5lvmeIR7i07yP8xbS9DeMsgjLQ/6AOYXhOuXV6Hty2OF5a/PaCIQu9Xjf
 xXs7b1vGg2IrOASNgwYLNEsVvnO2YRd8IUr4gewGs4SGEvY+RwNeb4mwSSMKKEZquba4
 yvkxm2MAujKUR9u3/f7GUcEAR+Q9rk5IMqfoBRb2xGuNDSQnTOx5s9SdGTxgTYbm23qZ
 ocsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ziBn/5+saVd4auHCBHIgshaqj52WwpIAD7oymg6iFS8=;
 b=ZgyfV0PFK3ggSvsetKBL3K2eWr1dSOag1U8c19ckV/DsihTKWbkOiVRUEiM9wazk1t
 nlWDyVwWiavfJ7Pl+8ibCiUNeRTDX4GkH9/ytfGsL66egLR4Ka0ZJTwneT1G0tVuUjbB
 vF1S9ENUoOz16/H4p9jGWXbjpiEbVNfM9zJ05tJYsjTqMwZRYrhZeGc3b9s+hYiUWR3y
 6pVXxi1cQPkuDrmxOFU6lcQXvPYXdFZaXSTuPNIDgCbVEJ8PQEJZMBLskjJPsE4NUEGQ
 7ge15ORUQnLAvQ9Q5oYExtL8hZwsQPj1UUWserJ8cT/eTW7R5iJ7H6kqAB+Cpf6PIfZP
 gwRQ==
X-Gm-Message-State: AO0yUKVnIaALH+sSg/E9A8s35oC9mb5fFcjP5Wfbv/pZYjnFZY2yYJVA
 5f0eeHwPJxrtCH1U/T0kXtnCWR4oKqJ3gRx8
X-Google-Smtp-Source: AK7set87k1krp5YWXPPQc6hE2aOBf6uajz277JpFBf/MhRbXKx9Ent9JWn9DufZag+F6K7XeyHxLdw==
X-Received: by 2002:a05:6a20:7f91:b0:bc:a257:5b2a with SMTP id
 d17-20020a056a207f9100b000bca2575b2amr11362080pzj.31.1675115385949; 
 Mon, 30 Jan 2023 13:49:45 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v6 35/36] target/i386: Inline cmpxchg8b
Date: Mon, 30 Jan 2023 11:48:43 -1000
Message-Id: <20230130214844.1158612-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
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


