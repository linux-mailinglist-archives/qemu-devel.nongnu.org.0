Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D4380D9B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:52:31 +0200 (CEST)
Received: from localhost ([::1]:60154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha74-0000bJ-Hz
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ6-0003JJ-N2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:24 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ4-0000Co-RR
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:24 -0400
Received: by mail-qt1-x832.google.com with SMTP id f8so18264845qth.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JxgXRwC3DPI+6mt093LWUSFLNKSWuwiSEOIYntw4KwM=;
 b=SmIwXFNvb2R3E2Zx+mrboG+BzCziQz5FmVG0iQoaQTwAKi0+WUAE+CfxJcoe4C+iZX
 c1X7aC56H4PlRjhICu4jK2qA9TypTC4vJuoG8i7uSYKIC+GboKIxatAWi+V4DkW1xD5K
 IDLbU2u5I4KKPFTOzDXFflKL6sCxpy+gfFXvXOSLfOlBe9vRlpRgYOPTKmuFvZ7gI0hz
 md9YWCCzt6CL17CUl2H5E7OAIVaH0eamY0xihLbY+ZjmhnCohisJYUmD7L/4AUj41r7X
 BLI3GISYpUC6GUF0Tu6PbioQRKHmUOWzC++754O0rCsjbp/UoLufGNqcqgrNy7qMYYk4
 hZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JxgXRwC3DPI+6mt093LWUSFLNKSWuwiSEOIYntw4KwM=;
 b=f2EkM7AMH8+FZHrfkn8v1BB2u1MyhO7u/Uu4/BwVhlh6CVu7PnaljZm/Wt+ZWP7FjI
 RD6w+0YuxcncXVXxyXsL7H5K3zd02LQTPHzebQeZOFEzAbE4z/uWJpJQ4cEjHbPrXOZc
 sA/SHn6jh+WO2Va1hQQDPhOY5Iup2aAHjjuH3cCd01mvQWjopmE+9TXbB08H0ihBWbZg
 o2G6FETUMaIR/aw/cxuTbj4wqomzsugqmH77/N06rtkk0zZZq7uhzTkIGwfy3P3JYEgo
 0Bd/up5vTg57Gj9tEa2tKv2/Frwk3GixiF1H7dLFjnMooLnSboZdkbkk45pRJ6z+Ij7S
 Ot4Q==
X-Gm-Message-State: AOAM532hHiDCqnQgEy96PI7k/Wq+zr7TMVcRWKSDOas3ufgrDAo5brvs
 YexLNWCsnjQLmJwfnOeOhKvpvjNEqFwB4FTDH98=
X-Google-Smtp-Source: ABdhPJz3hcRqza57VypF2mOvk5vSgiVcKIqAoUM9iyywucTaVVMBs39HhiHxF7MmajW1ykupo5HSnA==
X-Received: by 2002:a05:622a:164a:: with SMTP id
 y10mr4486525qtj.97.1621005441835; 
 Fri, 14 May 2021 08:17:21 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 40/50] target/i386: Pass env to do_pause and do_hlt
Date: Fri, 14 May 2021 10:13:32 -0500
Message-Id: <20210514151342.384376-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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

Having the callers upcast to X86CPU is a waste, since we
don't need it.  We even have to recover env in do_hlt.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/misc_helper.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 931dbd9db0..23287b330e 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -101,19 +101,18 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-static QEMU_NORETURN void do_pause(X86CPU *cpu)
+static void QEMU_NORETURN do_pause(CPUX86State *env)
 {
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
 
     /* Just let another CPU run.  */
     cs->exception_index = EXCP_INTERRUPT;
     cpu_loop_exit(cs);
 }
 
-static QEMU_NORETURN void do_hlt(X86CPU *cpu)
+static void QEMU_NORETURN do_hlt(CPUX86State *env)
 {
-    CPUState *cs = CPU(cpu);
-    CPUX86State *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
 
     env->hflags &= ~HF_INHIBIT_IRQ_MASK; /* needed if sti is just before */
     cs->halted = 1;
@@ -123,12 +122,10 @@ static QEMU_NORETURN void do_hlt(X86CPU *cpu)
 
 void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
 {
-    X86CPU *cpu = env_archcpu(env);
-
     cpu_svm_check_intercept_param(env, SVM_EXIT_HLT, 0, GETPC());
     env->eip += next_eip_addend;
 
-    do_hlt(cpu);
+    do_hlt(env);
 }
 
 void helper_monitor(CPUX86State *env, target_ulong ptr)
@@ -143,7 +140,6 @@ void helper_monitor(CPUX86State *env, target_ulong ptr)
 void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
-    X86CPU *cpu = env_archcpu(env);
 
     if ((uint32_t)env->regs[R_ECX] != 0) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
@@ -153,20 +149,18 @@ void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
 
     /* XXX: not complete but not completely erroneous */
     if (cs->cpu_index != 0 || CPU_NEXT(cs) != NULL) {
-        do_pause(cpu);
+        do_pause(env);
     } else {
-        do_hlt(cpu);
+        do_hlt(env);
     }
 }
 
 void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
 {
-    X86CPU *cpu = env_archcpu(env);
-
     cpu_svm_check_intercept_param(env, SVM_EXIT_PAUSE, 0, GETPC());
     env->eip += next_eip_addend;
 
-    do_pause(cpu);
+    do_pause(env);
 }
 
 void QEMU_NORETURN helper_debug(CPUX86State *env)
-- 
2.25.1


