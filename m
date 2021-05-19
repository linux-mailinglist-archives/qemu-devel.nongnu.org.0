Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C317389622
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:03:39 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRTm-0004hu-AB
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyo-0004Q5-TB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:38 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyc-0005nx-Td
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:38 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so1434580otk.5
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qBVkg2/s0WgFvJDY/rKl/W0YYbprSAUr+98hK52eZk=;
 b=vz78j+w/IL1+HjEvY9ouRdoIv10NeFODy13gj3iVfyTlsTPhATQe59KhKw/UWaCjhO
 dCccOwEJXZMiBAuZWMLIkuwPj4hVq6FtKOGZf4vAvd9ZY5HqTZ1HFkefleqWeXgmAkFr
 hWrWMGLH/YNHtiuC/4P30V3qFEryfDGdN/QzKxPaDbA0+IrgZ0IB0vBE/mg4yyfuSSgU
 mxYf/22E1yD600e8O2LVlp1dXwE5+zxfRswVlYxzVGczr6pb6GcowuYR04L+I8qVgjxX
 IXlhvfGsmcmM4lmybwx6X3WOeAzUiK7TJzGD/VDf235HjOBUZDoEdznD8iwAgj1h8IjG
 Qszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qBVkg2/s0WgFvJDY/rKl/W0YYbprSAUr+98hK52eZk=;
 b=JX5xLTraEuSFyJYiUjqJldPQgGKv4nI/EbpggZJjCPOMnv6xqhKbbvtox4xhWUfUhR
 nbJV68GcA2L/VMoSZ21bay6RPNeHEcdlGq7svOZe8Qu9q0J5xvE2udFLnfilwiuFXQxx
 vCcPmahbPau4CE6+e9md0FhopePLn3l3QAJ5kaba5ROkOvNarS50vDrYPUx+3luHyzB3
 ZNr1xQYx2dESF6ChW4dCcJ5vv/PKiXY+HXNc1xJYXrEBdWy5UQiZvt9jiJ0vYhOQHXiV
 N6EaiWR8QjoKPhqQ1zWBrTDQ8OQ3sKlm5rdwJY9vU8Y0jbOYHH+kGcIpF4bQOzQkp/DM
 9TBA==
X-Gm-Message-State: AOAM533XGt3gC5xeuXGJXTVHNcpvAKNlW/FfTIzY01EWqOzOmpSy21Gc
 cug8yPFiKpnAZVlfMAeHLP3h2Rzdr8yUG0gA
X-Google-Smtp-Source: ABdhPJyjd+xTEn4ZcPY7RB9eVVOVovkJpxDKuLi9zuMakePmmouu2+iblVuaL/GCfBJx/0gswR+jDw==
X-Received: by 2002:a05:6830:248d:: with SMTP id
 u13mr629342ots.121.1621449085706; 
 Wed, 19 May 2021 11:31:25 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/50] target/i386: Mark some helpers as noreturn
Date: Wed, 19 May 2021 13:30:34 -0500
Message-Id: <20210519183050.875453-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any helper that always raises an exception or interrupt,
or simply exits to the main loop, can be so marked.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-35-richard.henderson@linaro.org>
---
 target/i386/helper.h          | 18 +++++++++---------
 target/i386/tcg/bpt_helper.c  |  2 +-
 target/i386/tcg/excp_helper.c | 18 ++++++++++--------
 target/i386/tcg/misc_helper.c | 14 +++++++-------
 target/i386/tcg/translate.c   |  3 ++-
 5 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index d0f7f07c6c..f794d1c7c7 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -60,14 +60,14 @@ DEF_HELPER_2(sysexit, void, env, int)
 DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 #endif
-DEF_HELPER_2(hlt, void, env, int)
-DEF_HELPER_2(monitor, void, env, tl)
-DEF_HELPER_2(mwait, void, env, int)
-DEF_HELPER_2(pause, void, env, int)
-DEF_HELPER_1(debug, void, env)
+DEF_HELPER_FLAGS_2(hlt, TCG_CALL_NO_WG, noreturn, env, int)
+DEF_HELPER_FLAGS_2(monitor, TCG_CALL_NO_WG, void, env, tl)
+DEF_HELPER_FLAGS_2(mwait, TCG_CALL_NO_WG, noreturn, env, int)
+DEF_HELPER_FLAGS_2(pause, TCG_CALL_NO_WG, noreturn, env, int)
+DEF_HELPER_FLAGS_1(debug, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(reset_rf, void, env)
-DEF_HELPER_3(raise_interrupt, void, env, int, int)
-DEF_HELPER_2(raise_exception, void, env, int)
+DEF_HELPER_FLAGS_3(raise_interrupt, TCG_CALL_NO_WG, noreturn, env, int, int)
+DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
 DEF_HELPER_1(cli, void, env)
 DEF_HELPER_1(sti, void, env)
 DEF_HELPER_1(clac, void, env)
@@ -86,12 +86,12 @@ DEF_HELPER_2(cmpxchg8b, void, env, tl)
 DEF_HELPER_2(cmpxchg16b_unlocked, void, env, tl)
 DEF_HELPER_2(cmpxchg16b, void, env, tl)
 #endif
-DEF_HELPER_1(single_step, void, env)
+DEF_HELPER_FLAGS_1(single_step, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(rechecking_single_step, void, env)
 DEF_HELPER_1(cpuid, void, env)
 DEF_HELPER_1(rdtsc, void, env)
 DEF_HELPER_1(rdtscp, void, env)
-DEF_HELPER_1(rdpmc, void, env)
+DEF_HELPER_FLAGS_1(rdpmc, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(rdmsr, void, env)
 DEF_HELPER_1(wrmsr, void, env)
 
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
index fb2a65ac9c..83cd89581e 100644
--- a/target/i386/tcg/bpt_helper.c
+++ b/target/i386/tcg/bpt_helper.c
@@ -22,7 +22,7 @@
 #include "exec/helper-proto.h"
 #include "helper-tcg.h"
 
-void helper_single_step(CPUX86State *env)
+void QEMU_NORETURN helper_single_step(CPUX86State *env)
 {
 #ifndef CONFIG_USER_ONLY
     check_hw_breakpoints(env, true);
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index 0183f3932e..bdae887d0a 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -25,12 +25,13 @@
 #include "exec/helper-proto.h"
 #include "helper-tcg.h"
 
-void helper_raise_interrupt(CPUX86State *env, int intno, int next_eip_addend)
+void QEMU_NORETURN helper_raise_interrupt(CPUX86State *env, int intno,
+                                          int next_eip_addend)
 {
     raise_interrupt(env, intno, 1, 0, next_eip_addend);
 }
 
-void helper_raise_exception(CPUX86State *env, int exception_index)
+void QEMU_NORETURN helper_raise_exception(CPUX86State *env, int exception_index)
 {
     raise_exception(env, exception_index);
 }
@@ -116,24 +117,25 @@ void QEMU_NORETURN raise_interrupt(CPUX86State *env, int intno, int is_int,
     raise_interrupt2(env, intno, is_int, error_code, next_eip_addend, 0);
 }
 
-void raise_exception_err(CPUX86State *env, int exception_index,
-                         int error_code)
+void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_index,
+                                       int error_code)
 {
     raise_interrupt2(env, exception_index, 0, error_code, 0, 0);
 }
 
-void raise_exception_err_ra(CPUX86State *env, int exception_index,
-                            int error_code, uintptr_t retaddr)
+void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_index,
+                                          int error_code, uintptr_t retaddr)
 {
     raise_interrupt2(env, exception_index, 0, error_code, 0, retaddr);
 }
 
-void raise_exception(CPUX86State *env, int exception_index)
+void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index)
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, 0);
 }
 
-void raise_exception_ra(CPUX86State *env, int exception_index, uintptr_t retaddr)
+void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_index,
+                                      uintptr_t retaddr)
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index a30379283e..0e9a4f0bfc 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -96,7 +96,7 @@ void helper_rdtscp(CPUX86State *env)
     env->regs[R_ECX] = (uint32_t)(env->tsc_aux);
 }
 
-void helper_rdpmc(CPUX86State *env)
+void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
 {
     if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
         ((env->hflags & HF_CPL_MASK) != 0)) {
@@ -109,7 +109,7 @@ void helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-static void do_pause(X86CPU *cpu)
+static QEMU_NORETURN void do_pause(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
 
@@ -118,7 +118,7 @@ static void do_pause(X86CPU *cpu)
     cpu_loop_exit(cs);
 }
 
-static void do_hlt(X86CPU *cpu)
+static QEMU_NORETURN void do_hlt(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     CPUX86State *env = &cpu->env;
@@ -129,7 +129,7 @@ static void do_hlt(X86CPU *cpu)
     cpu_loop_exit(cs);
 }
 
-void helper_hlt(CPUX86State *env, int next_eip_addend)
+void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
 {
     X86CPU *cpu = env_archcpu(env);
 
@@ -148,7 +148,7 @@ void helper_monitor(CPUX86State *env, target_ulong ptr)
     cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0, GETPC());
 }
 
-void helper_mwait(CPUX86State *env, int next_eip_addend)
+void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
     X86CPU *cpu = env_archcpu(env);
@@ -167,7 +167,7 @@ void helper_mwait(CPUX86State *env, int next_eip_addend)
     }
 }
 
-void helper_pause(CPUX86State *env, int next_eip_addend)
+void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
 {
     X86CPU *cpu = env_archcpu(env);
 
@@ -177,7 +177,7 @@ void helper_pause(CPUX86State *env, int next_eip_addend)
     do_pause(cpu);
 }
 
-void helper_debug(CPUX86State *env)
+void QEMU_NORETURN helper_debug(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b2a997fb30..c1d4d58c61 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7282,6 +7282,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_cc_op(s);
         gen_jmp_im(s, pc_start - s->cs_base);
         gen_helper_rdpmc(cpu_env);
+        s->base.is_jmp = DISAS_NORETURN;
         break;
     case 0x134: /* sysenter */
         /* For Intel SYSENTER is valid on 64-bit */
@@ -7443,7 +7444,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
-            gen_eob(s);
+            s->base.is_jmp = DISAS_NORETURN;
             break;
 
         case 0xca: /* clac */
-- 
2.25.1


