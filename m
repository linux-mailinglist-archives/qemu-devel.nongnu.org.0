Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8C38962B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:07:08 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRX9-0001Wz-KM
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1i-0002rA-0L
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:38 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1f-0007P1-Vm
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:37 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so4784928otg.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qedixzyYh5iaufNZBAKxPaR/qjTosX24RNXw6yX0DSU=;
 b=KQ9ITebUGUh4+9o4JBgxns0Q5NIWXY6FwRHGSNy0ggkeASd5R3NxAPpLG0rVcJHtJH
 iPRu7VEgL5AXT3KZZ4aubUBe+SfCbo/l3lfBTIal1C2tXldulUqAAF3IQgIPONdOuD1C
 XewMf6/1u4yk5m/i6tp7FnYk7zdJF2SojwU0w2tvhzS7M7rKE5cHjT1MEbT/WIaOc5Oq
 z7Vm2ipUaWKtySv58AvoYwA0cxIhC5NS+6BEK1GJ/oP2XOd2l3KZHNr1FBNDu4AmjD0O
 rK/wyxpSzlr/d3UpGKT7tEPhHv07mTp029HQrY8EA+YHDeHoaf+lNwWI/htNfHB1mPVN
 5PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qedixzyYh5iaufNZBAKxPaR/qjTosX24RNXw6yX0DSU=;
 b=bZVqyEIvSULlQ7eJ8DmQ9Yf39CaxbQt7iCFK462IJMCS+qw4lgQlkK00nrWfh5dgGL
 oH5m3rSQXvXY0yKsMKuxJXNdZvzn0+SItSX56WIhxdVBoHLr3VmfkCwKy+YzFbJlyDKm
 I6kXNKX/5zWQLhiCR3zZQe/RIl9+trpnwLwKc++FThn4tTAGBv095Bu4vBtKUw9oGzif
 W4TAz8tSLYsAbgCxhHVz5addXqD1sPEQY2Yxb6hKy1N2D36X5pkf+6jdfknRFyu/H87S
 4UZw9Cm/j98pi25NjI3Ne8jlcUpcwfaR9SMkNkqZXEN4uootbsNVdu3yQGbGb09sQOQO
 HnwA==
X-Gm-Message-State: AOAM530f7+CBD4f6wasgS0Hk0KT22KYnPgJzi4lVubwrejBawiWQAOIk
 EjFC7jTrQUtgj4bHb72PvDOu6jfASqfwdSqd
X-Google-Smtp-Source: ABdhPJw35eVhnA4vOmBue4peTRwLcSr+gOnLLx7aiFLWE/eN0Va86tUJIg4KFobXT4+MYoqd8jTWtw==
X-Received: by 2002:a9d:1918:: with SMTP id j24mr619519ota.329.1621449274636; 
 Wed, 19 May 2021 11:34:34 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/50] target/i386: Unify invlpg, invlpga
Date: Wed, 19 May 2021 13:30:42 -0500
Message-Id: <20210519183050.875453-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

Use a single helper, flush_page, to do the work.
Use gen_svm_check_intercept.
Perform the zero-extension for invlpga inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-43-richard.henderson@linaro.org>
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
index 803c39e2fb..0cef2f1a4c 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -439,12 +439,9 @@ void helper_rdmsr(CPUX86State *env)
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
index b431016e72..9d671297cf 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -412,24 +412,6 @@ void helper_clgi(CPUX86State *env)
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
index 39af147a87..eb11a75e86 100644
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
@@ -7592,9 +7591,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7682,10 +7687,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


