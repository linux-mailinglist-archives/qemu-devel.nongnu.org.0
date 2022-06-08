Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49878542155
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:42:57 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoT1-0003TU-LM
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyoNT-0000fh-G3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:37:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyoNE-0004cu-4o
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:37:11 -0400
Received: by mail-pl1-x635.google.com with SMTP id h1so16679305plf.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gw3n5rkKreQm9gaPqnkkqV9cQuORrGSaBukz3VwVbu8=;
 b=WcFrwDDJIv21OUvC2saeB5b0yar4Nkyr9unf9hGB9JGeTCuKFKQCRUvJ2uwOrQ12mT
 0vzdtvKKmDAvK14OXHDuEYHtXwX7tAjbj3MEXCF/e64diYShKUejkqUlkro6ReCXmeIV
 uCDj7xGHo9CaE4ASnC69v/Ydc1FaFGDHTbpM+RSOvabLzwBPzQgIQZ0mwgKn6wMehA8X
 ck1EcPF1XHfztJTztuWSORiysB0nGVKopE8auu0yEoczPZL7caRWPxe2q1PwDgReKi87
 JGsq0qKKLJL1ZipsUi15HHuugzT6CcFAcpbV19u8YA/G4jPP8C6TWDSpF/I9FOa8UieB
 iI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gw3n5rkKreQm9gaPqnkkqV9cQuORrGSaBukz3VwVbu8=;
 b=7e8LSiD98H0qaJxVW0YATRR1VhcdsebsL0JpFsX+yNR7t9ZPvY681OEpaTP9v402jX
 u9njjWnpkuqB7rPr07fREEbDQVrr5v3asvgk/sQK6ps8TQFKY0PYmJ2bjnsrGc17iSuf
 V3BtTyDaShwuSszC7q+XXUr/gHw77nXLF/+NNpaA/DGvP+N0BL+bvrzq+vclATfWNLqy
 ncxOV0pr3BEhA8Awdx2eFO2VUPURNzrrq7Fg97me1896W8NvC1soMveYpwQUOKkxmUg0
 2denDnc/lD44c58OnebmxzS9bXi6hCXhD8cp+Nza6BdUimVkDsrc4bVK8RI0uIxPsxoE
 w3aw==
X-Gm-Message-State: AOAM530udv5ccWtJAknK2BtM+yWqOJgRd4w92yLLzoREQfDz0IpSJfsF
 +NlDHFdFk3OfR8nmf9I1E85UI2jykfUgag==
X-Google-Smtp-Source: ABdhPJzz/t7IevIsj6bFKdptnn6pWK3ElvBz1DaWq+57YEtWDfTwphg0z3Z0sFwWJZwjwZsQdMwpZw==
X-Received: by 2002:a17:90a:fb93:b0:1e8:a809:af4d with SMTP id
 cp19-20020a17090afb9300b001e8a809af4dmr6627562pjb.7.1654666612413; 
 Tue, 07 Jun 2022 22:36:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a1709028c8600b001636c0b98a7sm13507703plo.226.2022.06.07.22.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:36:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: jcmvbkbc@gmail.com
Subject: [PATCH v4 1/2] target/xtensa: Use an exception for semihosting
Date: Tue,  7 Jun 2022 22:36:49 -0700
Message-Id: <20220608053650.811947-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608053650.811947-1-richard.henderson@linaro.org>
References: <20220608053650.811947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


