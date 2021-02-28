Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC81327575
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:06:27 +0100 (CET)
Received: from localhost ([::1]:42720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGW4w-0006Nx-Qu
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPv-0005pt-8c
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:03 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPl-0007mC-39
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: by mail-pg1-x536.google.com with SMTP id a4so10328273pgc.11
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IuseSFh6k9FJFcRfB/IONyFWdR+2//oyjUHwp8Nqzys=;
 b=LoOpO9qhtU3Ce5qeUkO7/o2xcPoyKOi+dN9P/FBlOAp/53ofXgTvhIEME2H31TBtNC
 Y69DrmWgJUDp6vhKCaYOBDooKW7HG0PT7whkiuXVcvvKSDna29vgQgtwB8gk9fr0E9hz
 OGoQihLliItIOMH4TwsZYzt2npNKHjJAxbQXAdZS0I4OisAdWIBmg2tIbjnEz47YaKc5
 YqSZyNTooBF/MHrnURKLYE0kRJnb9Cwyh1QjHkSbeW7kvvXCAkyxSsUeEYowiJD+tKPG
 5XGRBE8yu/MVuSS3zYB5uoY4VWeTWPHjJQDkULJHxDymase6o+FTksdwE0MsK/DuRLBK
 Fz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IuseSFh6k9FJFcRfB/IONyFWdR+2//oyjUHwp8Nqzys=;
 b=PnnH822G1MSdTdht0rrFFTEfPV+qduivOmDaVP3lVbQ1sKFYLZcAnq499QBBYyJ8hG
 8elvB98/C+iogSxOHr5G5qdMM0K/tu6P3CyOXZCGg6tbRQzio8Y7ZAkssfA+GlSssigV
 rQtV0Kya0b5q3ZqnwUCRoKAeeYshXJ/TLpk55/F9iziVNsovR0uUFzBKbysMMum7+ljO
 phZtzx0IjWp+081VI24KMpH/Mo9iuT4mtEVrT0a7jg/aZzMNRuxKG/a0oq+HrMp4GWBT
 IEzafnxd+LnKK7SkXqubS9YCyBwcO4YM3lmOgl0jcbB/ESP1EdfjnM+XYl9b2COHF0jr
 NfsA==
X-Gm-Message-State: AOAM530Ni2oGCE/KdApgFEd5SPIDMayY5aGS7TmqZG++UvNGcxPrSCqr
 KDsklyfvePNJDFCnnRLpeY3bpw/b5l6Zew==
X-Google-Smtp-Source: ABdhPJxcUYddRxUKxdN37dRiK/GzP0tRuK1MccraWWHRBM5KzQK2Hga6AFgwbEOYyj0Mpkl+zTYv2A==
X-Received: by 2002:a63:2321:: with SMTP id j33mr11370821pgj.120.1614554631439; 
 Sun, 28 Feb 2021 15:23:51 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/50] target/i386: Mark some helpers as noreturn
Date: Sun, 28 Feb 2021 15:23:05 -0800
Message-Id: <20210228232321.322053-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Any helper that always raises an exception or interrupt,
or simply exits to the main loop, can be so marked.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 82fb7037ac..1ca9ace3dc 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -96,7 +96,7 @@ void helper_rdtscp(CPUX86State *env)
     env->regs[R_ECX] = (uint32_t)(env->tsc_aux);
 }
 
-void helper_rdpmc(CPUX86State *env)
+void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
 {
     if ((env->cr[4] & CR4_PCE_MASK) && ((env->hflags & HF_CPL_MASK) != 0)) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
@@ -108,7 +108,7 @@ void helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-static void do_pause(X86CPU *cpu)
+static QEMU_NORETURN void do_pause(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
 
@@ -117,7 +117,7 @@ static void do_pause(X86CPU *cpu)
     cpu_loop_exit(cs);
 }
 
-static void do_hlt(X86CPU *cpu)
+static QEMU_NORETURN void do_hlt(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     CPUX86State *env = &cpu->env;
@@ -128,7 +128,7 @@ static void do_hlt(X86CPU *cpu)
     cpu_loop_exit(cs);
 }
 
-void helper_hlt(CPUX86State *env, int next_eip_addend)
+void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
 {
     X86CPU *cpu = env_archcpu(env);
 
@@ -147,7 +147,7 @@ void helper_monitor(CPUX86State *env, target_ulong ptr)
     cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0, GETPC());
 }
 
-void helper_mwait(CPUX86State *env, int next_eip_addend)
+void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
     X86CPU *cpu = env_archcpu(env);
@@ -166,7 +166,7 @@ void helper_mwait(CPUX86State *env, int next_eip_addend)
     }
 }
 
-void helper_pause(CPUX86State *env, int next_eip_addend)
+void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
 {
     X86CPU *cpu = env_archcpu(env);
 
@@ -176,7 +176,7 @@ void helper_pause(CPUX86State *env, int next_eip_addend)
     do_pause(cpu);
 }
 
-void helper_debug(CPUX86State *env)
+void QEMU_NORETURN helper_debug(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8c77c9cbe6..c2bc3c4b22 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7276,6 +7276,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_cc_op(s);
         gen_jmp_im(s, pc_start - s->cs_base);
         gen_helper_rdpmc(cpu_env);
+        s->base.is_jmp = DISAS_NORETURN;
         break;
     case 0x134: /* sysenter */
         /* For Intel SYSENTER is valid on 64-bit */
@@ -7437,7 +7438,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_cc_op(s);
             gen_jmp_im(s, pc_start - s->cs_base);
             gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
-            gen_eob(s);
+            s->base.is_jmp = DISAS_NORETURN;
             break;
 
         case 0xca: /* clac */
-- 
2.25.1


