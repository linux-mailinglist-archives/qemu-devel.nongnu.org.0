Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A37327584
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:14:37 +0100 (CET)
Received: from localhost ([::1]:54874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGWCq-0003CZ-4z
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQK-0006X1-Ps
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:28 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQJ-00081U-4R
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:28 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e9so10494567pjj.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+JUyBjkTS0UwwOaXD6FMEo6z2JEb+NRx/8D4N91CKuI=;
 b=gS92BZqZpv8FCTHgF945XbCi0fH2L9DoKaIJjUPceeI816AvbtlRSVGvccwDM8bwZZ
 j7tDFxBDJX0L9MH48GsBGUrpqPwIHqH+l9wmANk0nva4OEAKHMGH+5l3Ld0K4EXczT2r
 k/RxCLd8+TIT1eITiRCUX+hD2kLyFPlJL5yx1/OBmtQHYiK6sMID3QpgoR5vZSfKkxM5
 1srXaXuLpSgekK7DbLC9gdog4GJf748Ci4P74uBmNOosF1RYw2xr5nMxsfIjNUbOBLYH
 F/lYkcfVkCTc+/p3QCboQZy66Wrq2YQlPO4XIAPFMVFvOVKrKg2uCv9ayGdDsoixHLfl
 ZsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+JUyBjkTS0UwwOaXD6FMEo6z2JEb+NRx/8D4N91CKuI=;
 b=cDBN1+gG1Ni/wdKR6BYxEUwncLWBJ0HU2tHgXrYTuUx91u4WERwuhld/MgW7MPHS59
 oGFVqqHtf5Z6gB2a9pXqu24SuaERA/Yj90RefYJAypFC8FZTZfzXddG/J25fVyaTHfQ6
 lJgeRWqf4heZW3ibp0B20ZqivWc0YCiH/Agr9bwfEHgsXlsBglOUvf/58sMb7ZnG61mO
 l+G46okVucWeFd2HBOmqkJLoQFlLoXtp2UIAaGwBsUYr7Xhj3eER3uZfI/58nkzKHzWI
 DQ5alEGAZ5jwqc9gfv5II+OyFJ8PLWDncN0WBWfTB0LwqiCjYZVBVKXyHgXGI9ZG5qhq
 1q8g==
X-Gm-Message-State: AOAM531xitsSpnVFU3i4ASeBKVFATKAKo5SYHd5w5pgPOrLTlXHDNRbJ
 BUl9ryORgfZ2P+oDL0EC0eEa+Qzpa13rxA==
X-Google-Smtp-Source: ABdhPJxQo3Bw9HV7p6vQHoHrv5U/JUFx9KCkrMF9yxynTUEm1sUTQi4AA6DPT9WhnpobCro8GSFYUA==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id
 gt18mr6469378pjb.210.1614554665846; 
 Sun, 28 Feb 2021 15:24:25 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/50] target/i386: Pass env to do_pause and do_hlt
Date: Sun, 28 Feb 2021 15:23:11 -0800
Message-Id: <20210228232321.322053-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Having the callers upcast to X86CPU is a waste, since we
don't need it.  We even have to recover env in do_hlt.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/misc_helper.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index b0d3c61f13..20bf4771e7 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -100,19 +100,18 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
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
@@ -122,12 +121,10 @@ static QEMU_NORETURN void do_hlt(X86CPU *cpu)
 
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
@@ -142,7 +139,6 @@ void helper_monitor(CPUX86State *env, target_ulong ptr)
 void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
-    X86CPU *cpu = env_archcpu(env);
 
     if ((uint32_t)env->regs[R_ECX] != 0) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
@@ -152,20 +148,18 @@ void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
 
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


