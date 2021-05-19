Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274138961D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:03:28 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRTb-0004aj-8x
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1f-0002iB-K4
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:35 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:44657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1d-0007OE-Op
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:35 -0400
Received: by mail-oi1-x22e.google.com with SMTP id d21so13972394oic.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MxaVFDhOR/2P7mRJMj9Ww3Gxrm+V2fvm6YpN2MZVwIE=;
 b=WIqlYSoaWmrH4nFkAtEJPo/VcDqFVEAACacHxoRClLekcEfh/SDXX1vhJZFRtd6Wxv
 N5G7O96AJ/H4HkLshGpCav5Awoe03ngwkeIerm89RwchYgdxrRPpFTMoNfTOkAneYnZo
 8514O7MQcVSL6wYpcdbyLieJqWmaoad+O8O4Hg5+raqUNQdZKhbwteexxyjoihCRAlOQ
 hjIQ7BFdNMD+q4Ft0f3W0pu3jxzyAi6MeVGgKLWRrkuLgrstHwSRjnf5bqGG1/+GxJ67
 02VoY+uT8AT076VuV+t4M1Uw3vP5zG5WHBSu4wdrVmz0Hw48k+N1S7fxUIBeiBoNY17q
 Qkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MxaVFDhOR/2P7mRJMj9Ww3Gxrm+V2fvm6YpN2MZVwIE=;
 b=GAcm0yAggkqEzaZ4z7Xy/1hQGHeC3id7aHlB6DtzxA9GZmBWdimRtlfXkL830O3rng
 7gmf5cQBRm+vNHYzlFqI9Abu4+BU63cNQFajOrm8hfW0Gypq9a0S8c3XV1ZFfiqsRR+z
 uWcxCOiTbH4e9XbzPVe36kuNHlWffXzfMqoSo6q4LhZSj255RUsfU2MCyb7MgvGIvyyL
 FgDm00clGXOC0aUVCo1TQ8l0tH2ctM3AYc564WvE1kEe0C6/UQIafYeV1KdK4suOHm/W
 j5cVe1c6QIhcSXrobzZpDcx9a7/jUXSrevkd5QQ/FNkcVEvx7vyZKNAbyuvk6iy+kE5T
 0aNQ==
X-Gm-Message-State: AOAM5331rWDrEFiF+suxHldV2Jy031p/z1aEWwcexvFTeeMttUUIfRPG
 etIFkk1H449b/BpRemT4+riOGdZHyD81ApIE
X-Google-Smtp-Source: ABdhPJxvpTbGnoU4d8jvFdv2ANFdVnNV1mmJZlv8et4/N7vKJ02GwVMvZMsNVBOS0NZDwHF6n8j6Dg==
X-Received: by 2002:aca:aa12:: with SMTP id t18mr547947oie.16.1621449272775;
 Wed, 19 May 2021 11:34:32 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/50] target/i386: Pass env to do_pause and do_hlt
Date: Wed, 19 May 2021 13:30:40 -0500
Message-Id: <20210519183050.875453-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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

Having the callers upcast to X86CPU is a waste, since we
don't need it.  We even have to recover env in do_hlt.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-41-richard.henderson@linaro.org>
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


