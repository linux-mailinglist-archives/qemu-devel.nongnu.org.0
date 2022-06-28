Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523555C0CC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:52:51 +0200 (CEST)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69ly-0000E7-2j
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69ck-00081s-Pz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:43:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69ci-0007jz-OI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:43:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x20so5219986plx.6
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gw3n5rkKreQm9gaPqnkkqV9cQuORrGSaBukz3VwVbu8=;
 b=FpVLv2HVjs//nngDVQ5eo4pHUwOxE7gBBEVPSAj/4a8qY+6nHJmY70bogXq4WL5I3j
 V94MZebL3u10XQRASxxeIIcIbz+H34ZOkJiprWbhtPV+3e6SHnZQHKi4lgP078r95gRk
 B2r588BJ49wZJuu2EFMyPse0VU3m+MjHFI0FjJ5kh35ABCil3fH/N1a1JPqhg0jABwx4
 E80Bt68s/fMCAyJ7vAv4T9MX1Eeqkv86IU9xIOlGwurctqmVgEUN/pe7p+xiMQshKuOR
 iidNqgIaMXja768SEsJlgIg2J7JohHrDgZEpmtcRHtoWSS6BItVtgNvJSSwMNyXMMSAl
 xujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gw3n5rkKreQm9gaPqnkkqV9cQuORrGSaBukz3VwVbu8=;
 b=MVDBw0aYLDvzWVoogjflTWX5TMZDAVnUMveO7W0bZrLEt63EwGtu5BxU/8YWfrwZ4i
 wU0lb24V8+v0P6NJbGL1iUOJzcVYpx7gkAZVXwmN0WIlhnondcWQJFcZF3TtxB0nKm9Y
 zSQv6MJlkPHNggmHoMa6XNHWmqangzjS4nw68cwKgvse8wvWd6BpBoo4vvpluv14p7z5
 aAFLlHQz+49UjQoSDYmR4X+BZWaK7nVK8cfv49F2+GpLDYH3gj81o4M/9c5lgW19Qpqg
 PxjhrTAZHqaGlNUQO/zV/f0frXh1gYUQabpS6SmuWbbSgANsgTB/78xEoF88oIim7sCp
 IYNQ==
X-Gm-Message-State: AJIora9VcYebmlqv2nA0a6A8DSKEaIG9V6tCPEnISvZfvZhdOmSGQEzY
 zE7Cs3q1wmsVO23jMh/60igDwEuSEErGVA==
X-Google-Smtp-Source: AGRyM1um3UvjeEK4Y5jDtkW4ykeeSzuIkYHf+kUvw+W8arKgRfchOYqft0VRl3e2unWXpqu6PV90EQ==
X-Received: by 2002:a17:903:11c9:b0:16b:8293:c599 with SMTP id
 q9-20020a17090311c900b0016b8293c599mr4475718plh.136.1656416595270; 
 Tue, 28 Jun 2022 04:43:15 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 bf3-20020a170902b90300b0015f2b3bc97asm9106026plb.13.2022.06.28.04.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:43:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: jcmvbkbc@gmail.com
Subject: [PATCH v5 1/2] target/xtensa: Use an exception for semihosting
Date: Tue, 28 Jun 2022 17:13:06 +0530
Message-Id: <20220628114307.697943-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628114307.697943-1-richard.henderson@linaro.org>
References: <20220628114307.697943-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Within do_interrupt, we hold the iothread lock, which
is required for Chardev access for the console, and for
the round trip for use_gdb_syscalls().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h         | 2 ++
 target/xtensa/helper.h      | 3 ---
 target/xtensa/exc_helper.c  | 4 ++++
 target/xtensa/translate.c   | 3 ++-
 target/xtensa/xtensa-semi.c | 3 +--
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 579adcb769..ea66895e7f 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -260,6 +260,7 @@ enum {
     EXC_USER,
     EXC_DOUBLE,
     EXC_DEBUG,
+    EXC_SEMIHOST,
     EXC_MAX
 };
 
@@ -576,6 +577,7 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+void xtensa_semihosting(CPUXtensaState *env);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/xtensa/helper.h b/target/xtensa/helper.h
index ae938ceedb..531679cd86 100644
--- a/target/xtensa/helper.h
+++ b/target/xtensa/helper.h
@@ -11,9 +11,6 @@ DEF_HELPER_2(retw, void, env, i32)
 DEF_HELPER_3(window_check, noreturn, env, i32, i32)
 DEF_HELPER_1(restore_owb, void, env)
 DEF_HELPER_2(movsp, void, env, i32)
-#ifndef CONFIG_USER_ONLY
-DEF_HELPER_1(simcall, void, env)
-#endif
 
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(waiti, void, env, i32, i32)
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index d4823a65cd..d54a518875 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -219,6 +219,10 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
 
     switch (cs->exception_index) {
+    case EXC_SEMIHOST:
+        xtensa_semihosting(env);
+        return;
+
     case EXC_WINDOW_OVERFLOW4:
     case EXC_WINDOW_UNDERFLOW4:
     case EXC_WINDOW_OVERFLOW8:
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 70e11eeb45..b65c8b8428 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2377,7 +2377,8 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     if (semihosting_enabled()) {
-        gen_helper_simcall(cpu_env);
+        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next);
+        gen_exception(dc, EXC_SEMIHOST);
     }
 #endif
 }
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index fa21b7e11f..5375f106fc 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -28,7 +28,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "chardev/char-fe.h"
-#include "exec/helper-proto.h"
 #include "semihosting/semihost.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
@@ -188,7 +187,7 @@ void xtensa_sim_open_console(Chardev *chr)
     sim_console = &console;
 }
 
-void HELPER(simcall)(CPUXtensaState *env)
+void xtensa_semihosting(CPUXtensaState *env)
 {
     CPUState *cs = env_cpu(env);
     uint32_t *regs = env->regs;
-- 
2.34.1


