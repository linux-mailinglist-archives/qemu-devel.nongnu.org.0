Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01E4DAA73
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:10:08 +0100 (CET)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMrH-0005hu-T4
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:10:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgQ-0002UE-MT
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:54 -0400
Received: from [2607:f8b0:4864:20::102d] (port=40636
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgO-0006Su-NO
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:54 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mv2-20020a17090b198200b001c65bae5744so428416pjb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pb8IOGOu4mKxNeiHFDXVhpl0044jfTtYIWIF2tDX6C4=;
 b=HKx2I766vKlV9VpBe7fFijoR9ZNAUiCzQmGUUlfp5Cuesy/M2qzsaczITf5G9GqgZ3
 pTrgFE3uxhxgbxymrfBgkot89bKvLU97X85efbXqgdi7W6d+qzWkn7gWFg8UnA8fYb+T
 4Xj8zU8Zi77gSPhDcwe0ckSY6R+GddelwItHWi2unQftnl+ukVknW6DQ1B7VVwv+EFIx
 4jcNWUyGz2VqBs+htXhxyE9tTKg21BjPqwL+zm2kmI9ianNAOPe9pR49GuH4pFt+ivWU
 v7F50p2TlymCgRuikV/AG1p9hHLyTaX4EfNUbDkJf6W+NevluglBykf+03fx0Hjbed15
 kOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pb8IOGOu4mKxNeiHFDXVhpl0044jfTtYIWIF2tDX6C4=;
 b=xzKLSV6uDDU8JOTfsyGbx6pJ1anf482DHYZiXgD6HNuvWtJdq6S6vFuDx0zX+vrPTd
 c7+6C7kLYqm9yvofNM+D630BlIEmHwWGZ60AxanH9sxx1tZfomRvz55VnI1usjwTWUvG
 xeVh6B0sCduObpQYMBwhzGQw9kTe4XS6GU6rgkbtLRlZoB+6LTtic4aO4T7fUjc5r3wX
 LodPYpHdbof4lcHCN8WMldKmf4hQCBrwWN1Rykp9y4ZFSeTMvxxBCVc+4hMqzXNFkwne
 W4DbctmaxMkCfHZtkbCEbQ7xGoYWLh+1y3MB1fpOeIXE+yi5tjz3KKyiPWNDSnUvVfwt
 yOWw==
X-Gm-Message-State: AOAM532dGPc9LA9Hq0/Mf8FjsY3HzsfOnUfzFgvBP3ljPXoytrp3ghFj
 ErLWuLwxg4ErObs3K/7HUa7aXEARM/F83w==
X-Google-Smtp-Source: ABdhPJwv70pgHUr10wHF475FLZtmMzq4N5ACKVH8OdCSYi593YlDoW9W+EdiF3laG6nNhxzlRpxlIg==
X-Received: by 2002:a17:902:8691:b0:153:6f49:1a23 with SMTP id
 g17-20020a170902869100b001536f491a23mr13741204plo.9.1647410331406; 
 Tue, 15 Mar 2022 22:58:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/17] target/m68k: Implement TRAPcc
Date: Tue, 15 Mar 2022 22:58:33 -0700
Message-Id: <20220316055840.727571-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h          |  2 ++
 linux-user/m68k/cpu_loop.c |  1 +
 target/m68k/cpu.c          |  1 +
 target/m68k/op_helper.c    |  6 +----
 target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 5469d5dace..1901a35256 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -533,6 +533,8 @@ enum m68k_features {
     M68K_FEATURE_MOVEC,
     /* Unaligned data accesses (680[2346]0) */
     M68K_FEATURE_UNALIGNED_DATA,
+    /* TRAPcc insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_TRAPCC,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 9b9aabccc6..828dac5e50 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -49,6 +49,7 @@ void cpu_loop(CPUM68KState *env)
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
+        case EXCP_TRAPCC:
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
             break;
         case EXCP_DIV0:
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c7aeb7da9c..5f778773d1 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -162,6 +162,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CHK2);
     m68k_set_feature(env, M68K_FEATURE_MSP);
     m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
+    m68k_set_feature(env, M68K_FEATURE_TRAPCC);
 }
 
 /*
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 6aebf9d737..0de4743d01 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -399,14 +399,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
-    case EXCP_TRAPCC:
-        /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
-        break;
-
     case EXCP_CHK:
     case EXCP_DIV0:
     case EXCP_TRACE:
+    case EXCP_TRAPCC:
         do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
         break;
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0bfc1a8ddf..e15b317ddf 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4879,6 +4879,54 @@ DISAS_INSN(trap)
     gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
 }
 
+static void do_trapcc(DisasContext *s, DisasCompare *c)
+{
+    if (c->tcond != TCG_COND_NEVER) {
+        TCGLabel *over = NULL;
+
+        update_cc_op(s);
+
+        if (c->tcond != TCG_COND_ALWAYS) {
+            /* Jump over if !c. */
+            over = gen_new_label();
+            tcg_gen_brcond_i32(tcg_invert_cond(c->tcond), c->v1, c->v2, over);
+        }
+
+        tcg_gen_movi_i32(QREG_PC, s->pc);
+        gen_raise_exception_format2(s, EXCP_TRAPCC, s->base.pc_next);
+
+        if (over != NULL) {
+            gen_set_label(over);
+            s->base.is_jmp = DISAS_NEXT;
+        }
+    }
+    free_cond(c);
+}
+
+DISAS_INSN(trapcc)
+{
+    DisasCompare c;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* trapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* trapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* trapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    gen_cc_cond(&c, s, extract32(insn, 8, 4));
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6050,6 +6098,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(trapcc,    50f8, f0f8, TRAPCC);
     INSN(tpf,       51f8, fff8, CF_ISA_A);
 
     /* Branch instructions.  */
-- 
2.25.1


