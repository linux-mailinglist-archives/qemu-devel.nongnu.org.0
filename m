Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850832755E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:51:40 +0100 (CET)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVqd-0003F4-2Q
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQM-0006b9-He
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:30 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQK-00082B-Bo
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:30 -0500
Received: by mail-pl1-x631.google.com with SMTP id g20so8775706plo.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nFM7mvFhUXE7Fg3oMPfO4xBFJLP9Mt7B9tvDexHBR0=;
 b=p6wYkpOUEiQcwZBfLF2/Wh0H06s8bT0jSUOswYH5H9q/fshKkZDdk0nQWmHQnBUi5w
 CFn8MnvbiCngeGKdMScNXmdlx0S4HZThLzz6yMKrvGSfAdGS6ETEo7uw1/vf50TAQXS4
 TR/c/qpszGzBzh7ChUiqwvfAqXB5JCOfSSzmb4GZeTDOS1Kj6pOaedHXXhTlrRXB6GJx
 Z96/bAunEzLMMcSX91b1oisyu++os2tMmv7D7Qb6eAJU3cZz/WuLvaqpBtIfaSd/7xcp
 v4RHCJneoKAPvuaN50FklPHuQ7KIRoPN5eJmFIpBqdLHfuCZFzPn5QqMQj2JiUB/fqe3
 DQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nFM7mvFhUXE7Fg3oMPfO4xBFJLP9Mt7B9tvDexHBR0=;
 b=RuEiDzgXYlIJS26jwXYkL6PrsWyi23rGu48Sgzrlu7N5uq8IjY03LbpcwKvH8IALCz
 CVITqhleLKclHsLdqcfJO/lOn5L6rRb7lNoKkzncVIkyQZJAxDtzZfMl9sYPDmPrgeuR
 CViTucGBSXTRFXp1dgjnFJWXaEPjKV3pXRteCwu9tDvA30XXTaO4NURpkv/WC10ZDfN4
 VoObqHAh7LTlxAYzRuo1yLQM3iP5JcP7Nv44d3FD6pf7k47P36F1onB9Ra/Kj4oo6KEF
 an+ak3L/CLQH2eoaYWIE+nYBnIzeTfapmiAmeZCZ3AD/VDB3YWtYHtAzPyK6D6YnTWht
 dMHw==
X-Gm-Message-State: AOAM53178dVOQJG+K1DCqQ1gwabFgCbHMdBfIUkVP/maHpYdx4+OGcCB
 PgS/JwhJhawXjsN6U6BkvbnuP/GEjx/8aw==
X-Google-Smtp-Source: ABdhPJwhIHMikooVxOXybogxB4/C87I9PXNtGoPXDzoNgjAM3p4THLaWCouN5M+vx/JLnnWecnU1Hw==
X-Received: by 2002:a17:90a:7c0c:: with SMTP id
 v12mr14095219pjf.63.1614554667155; 
 Sun, 28 Feb 2021 15:24:27 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 42/50] target/i386: Unify invlpg, invlpga
Date: Sun, 28 Feb 2021 15:23:13 -0800
Message-Id: <20210228232321.322053-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a single helper, flush_page, to do the work.
Use gen_svm_check_intercept.
Perform the zero-extension for invlpga inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h                 |  3 +--
 target/i386/tcg/sysemu/misc_helper.c |  7 ++-----
 target/i386/tcg/sysemu/svm_helper.c  | 18 ------------------
 target/i386/tcg/translate.c          | 20 ++++++++++++--------
 4 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ab72eba52a..0264fba335 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -110,8 +110,7 @@ DEF_HELPER_2(vmload, void, env, int)
 DEF_HELPER_2(vmsave, void, env, int)
 DEF_HELPER_1(stgi, void, env)
 DEF_HELPER_1(clgi, void, env)
-DEF_HELPER_2(invlpga, void, env, int)
-DEF_HELPER_2(invlpg, void, env, tl)
+DEF_HELPER_FLAGS_2(flush_page, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(hlt, TCG_CALL_NO_WG, noreturn, env, int)
 DEF_HELPER_FLAGS_2(monitor, TCG_CALL_NO_WG, void, env, tl)
 DEF_HELPER_FLAGS_2(mwait, TCG_CALL_NO_WG, noreturn, env, int)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 1d8b651212..b7146092f1 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -435,12 +435,9 @@ void helper_rdmsr(CPUX86State *env)
     env->regs[R_EDX] = (uint32_t)(val >> 32);
 }
 
-void helper_invlpg(CPUX86State *env, target_ulong addr)
+void helper_flush_page(CPUX86State *env, target_ulong addr)
 {
-    X86CPU *cpu = env_archcpu(env);
-
-    cpu_svm_check_intercept_param(env, SVM_EXIT_INVLPG, 0, GETPC());
-    tlb_flush_page(CPU(cpu), addr);
+    tlb_flush_page(env_cpu(env), addr);
 }
 
 static void QEMU_NORETURN do_hlt(CPUX86State *env)
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 86a0b3c4be..a8a671aa33 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -423,24 +423,6 @@ void helper_clgi(CPUX86State *env)
     env->hflags2 &= ~HF2_GIF_MASK;
 }
 
-void helper_invlpga(CPUX86State *env, int aflag)
-{
-    X86CPU *cpu = env_archcpu(env);
-    target_ulong addr;
-
-    cpu_svm_check_intercept_param(env, SVM_EXIT_INVLPGA, 0, GETPC());
-
-    if (aflag == 2) {
-        addr = env->regs[R_EAX];
-    } else {
-        addr = (uint32_t)env->regs[R_EAX];
-    }
-
-    /* XXX: could use the ASID to see if it is needed to do the
-       flush */
-    tlb_flush_page(CPU(cpu), addr);
-}
-
 void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
                                    uint64_t param, uintptr_t retaddr)
 {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index aa6a8c4813..9d2171aa3a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -194,9 +194,8 @@ typedef struct DisasContext {
 
 #ifdef CONFIG_USER_ONLY
 STUB_HELPER(clgi, TCGv_env env)
+STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
 STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
-STUB_HELPER(invlpga, TCGv_env env, TCGv_i32 aflag)
-STUB_HELPER(invlpg, TCGv_env env, TCGv addr)
 STUB_HELPER(monitor, TCGv_env env, TCGv addr)
 STUB_HELPER(mwait, TCGv_env env, TCGv_i32 pc_ofs)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
@@ -7586,9 +7585,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
-            gen_helper_invlpga(cpu_env, tcg_const_i32(s->aflag - 1));
+            gen_svm_check_intercept(s, SVM_EXIT_INVLPGA);
+            if (s->aflag == MO_64) {
+                tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
+            } else {
+                tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
+            }
+            gen_helper_flush_page(cpu_env, s->A0);
+            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_eob(s);
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
@@ -7676,10 +7681,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             if (!check_cpl0(s)) {
                 break;
             }
-            gen_update_cc_op(s);
-            gen_jmp_im(s, pc_start - s->cs_base);
+            gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
-            gen_helper_invlpg(cpu_env, s->A0);
+            gen_helper_flush_page(cpu_env, s->A0);
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob(s);
             break;
-- 
2.25.1


