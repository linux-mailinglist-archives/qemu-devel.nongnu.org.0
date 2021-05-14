Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C1380D88
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:43:45 +0200 (CEST)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZyZ-0002Cu-2f
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWD-0006Fy-8d
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:25 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW4-00077m-Ob
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:24 -0400
Received: by mail-qt1-x82e.google.com with SMTP id t7so22456452qtn.3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HSNX7xQILR37B9fhGWqudnd4f+kNvZWmQhUc/otRf8=;
 b=Nh275nfx9XNR8Gej5nPqKn4QvwcKoQTyOeBZQCcDhqa2W97KrmiRolYWJWyLHw2aeB
 1jlGMKiispHuauhUa4cXU3TE7GrVmHJVS9e3onWp8i1CWNTA/M6qrq4pYoqiGE1AhOWK
 uhcXCB10NV3dtua+rmE6aMPTq8Y6ADrXNmDJbK4ZoTfdESmksPnQWDB17gucb0Vv7DH4
 NCT3hvoZaHuUo0ynRHOZV1tFRUdTdb0V2uqtY9I0oRBmg//tndV9ifsTuf6xiNZd7+Ez
 t/TOXVSdCsfHwPwqZT+E6EJSm7MKxmnjCyse9WCKRUWZ2+IEmJ/ouHjn7woNXiKfhGSJ
 s81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HSNX7xQILR37B9fhGWqudnd4f+kNvZWmQhUc/otRf8=;
 b=FNYzC9tSqQ+bEksBtPNIpy9WfckSKi2HZfouHZ2Sj9D2A0JAvlYg3RBJtPoBjhAM8Q
 OgMglGYYrknk7ezDj9Rh7WKFuYi1OxHLB8LPrhJdNpTdM9aRO0sGz4bxsDR8YptqUqZd
 tk35YSE+6P6TcClIQW1XfeVg3olFDUFsKux9LxfzUu4wPUY4CWi96Cfc3jitfHJ5nwna
 DFf/Wv+w9Jp30I+8819ASVZR4v+cWll+M7Xu2QVWK8VvbtrI3ab3onA0sOOpB/F6K4e4
 U73nUhcJDVq6o/TOiKNXCUOAOV5PhKXghvqXTGQLZgAl4QVopQkPj1ST0Tjy8ehGThki
 eOdw==
X-Gm-Message-State: AOAM533BcTD5t3/tfjIRuKRVNnIoeQozllytFX2dY1+xMm9smwpVP0Xm
 NuO2cewV6/K126QBe+7FjFKFulNdtHwqWGJ9aXc=
X-Google-Smtp-Source: ABdhPJx2Uuf9XwXHmvtzRck8a43GQmdhzaGzofXiBBxXEZd3SfQOehv0qs1xTGql5lb6EVyMOWq0Bg==
X-Received: by 2002:a05:622a:138b:: with SMTP id
 o11mr42417657qtk.170.1621005255330; 
 Fri, 14 May 2021 08:14:15 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/50] target/i386: Mark some helpers as noreturn
Date: Fri, 14 May 2021 10:13:26 -0500
Message-Id: <20210514151342.384376-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
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
index 9af0d6f2b5..8419aaa62c 100644
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


