Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C674DBE28
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:22:07 +0100 (CET)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiaJ-0001FO-6J
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:22:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKp-0001BG-0s
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:03 -0400
Received: from [2607:f8b0:4864:20::102a] (port=45917
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKn-0002GH-94
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:02 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so4465014pjl.4
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62d8othJIfgAKm86Avncs/clZTnNTHcuD30Oj5z4NnM=;
 b=R9UV28LxjftClDxlNhGQsPEZ1qef9s1ohMZ4HCNwKFoXiPPaGyXzvaxRK2duSQAcjQ
 FEzJ1Gc7hhX6IWdSs5ps2fOPxlzGXZPAuoCZI88h/mbcKuqd141Fx3VkNPf/8B+a+wMO
 DydTWIJ7mckcAczTTEbX6k6c9xUhgpEdtvK1QpbM5+YrBu6lKo76xfu9OK/Zz6HElBBb
 PtkrlvuFEvRoJda8yCo12OedtDYUj0T/WnNDf5TH/idZ+wBHc4vDUZfeq8vHypvJyTMk
 JwF7JDurQmrp1YaQNHz/HfZ9nF4V9YekPeN1hXm8RkVN/aZOGljXcAsr/Wxs84NvxSjJ
 XT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62d8othJIfgAKm86Avncs/clZTnNTHcuD30Oj5z4NnM=;
 b=DpWzNsqYzIDCSV1Ul/tkA87PKCEdlxk84LBol/fpZ0na2zq1gIHWcp3PEGy8QeAF5N
 mQoxmxLAiT7BdlvrE3hsTd1XQqLebtuYIxocxUNRFZN4RF40jbXEBuucwZfFGte6+uzw
 KIPjTpk3RdZCY/Z4wSLHmJG95I4M5jQA/mNpAR5hSKDtkBmfpvQPlG3+pGWh1IuVaB7+
 kCvzK2LERKajJ+SpljKWSuWDsw/Aj4UaopeD8oXEwvIGhTeKUyUvG439iE/5vNAr6rA4
 SlHV1RToFeHjKOBydhxuzRvqs7871XXbbaq9128nMrfEz5tY7GPYNBLoaAWgMgpXv1Z4
 bQ8w==
X-Gm-Message-State: AOAM5317e118EfQtCqAxMkvxL8Mg94xmvFKaQ4TsxL/55akOVz2cM6yz
 51M12OpEUwA8ldcaEkhNvcRNxDW11oYdGw==
X-Google-Smtp-Source: ABdhPJxmIQtD44+ZY33lGh3ei+qgZw0YBNiA5iyTpwPD1VFqK/k7uiSEzleTB3/Lgk8LG8q5E5/hBA==
X-Received: by 2002:a17:90b:314d:b0:1bf:acde:16e5 with SMTP id
 ip13-20020a17090b314d00b001bfacde16e5mr3284867pjb.165.1647493559985; 
 Wed, 16 Mar 2022 22:05:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 20/51] target/nios2: Create EXCP_SEMIHOST for
 semi-hosting
Date: Wed, 16 Mar 2022 22:05:07 -0700
Message-Id: <20220317050538.924111-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Decode 'break 1' during translation, rather than doing
it again during exception processing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/helper.c    | 14 ++++++--------
 target/nios2/translate.c | 17 ++++++++++++++++-
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 555972fe6b..d003af5afc 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -156,6 +156,7 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 
 /* Exceptions */
 #define EXCP_BREAK    0x1000
+#define EXCP_SEMIHOST 0x1001
 #define EXCP_RESET    0
 #define EXCP_PRESET   1
 #define EXCP_IRQ      2
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 52a49f7ead..eeff032379 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -172,14 +172,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     case EXCP_BREAK:
         qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
-        /* The semihosting instruction is "break 1".  */
-        if (semihosting_enabled() &&
-            cpu_ldl_code(env, env->pc) == 0x003da07a)  {
-            qemu_log_mask(CPU_LOG_INT, "Entering semihosting\n");
-            env->pc += 4;
-            do_nios2_semihosting(env);
-            break;
-        }
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_BSTATUS] = env->ctrl[CR_STATUS];
@@ -196,6 +188,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->pc = cpu->exception_addr;
         break;
 
+    case EXCP_SEMIHOST:
+        qemu_log_mask(CPU_LOG_INT, "BREAK semihosting at pc=%x\n", env->pc);
+        env->pc += 4;
+        do_nios2_semihosting(env);
+        break;
+
     default:
         cpu_abort(cs, "unhandled exception type=%d\n",
                   cs->exception_index);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 459e30b338..cfad110186 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -33,6 +33,7 @@
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 #include "exec/gen-icount.h"
+#include "semihosting/semihost.h"
 
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
@@ -686,6 +687,20 @@ static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
     t_gen_helper_raise_exception(dc, EXCP_TRAP);
 }
 
+static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+#ifndef CONFIG_USER_ONLY
+    /* The semihosting instruction is "break 1".  */
+    R_TYPE(instr, code);
+    if (semihosting_enabled() && instr.imm5 == 1) {
+        t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
+        return;
+    }
+#endif
+
+    t_gen_helper_raise_exception(dc, EXCP_BREAK);
+}
+
 static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(eret),                                /* eret */
@@ -739,7 +754,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION(add),                                 /* add */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_ILLEGAL(),
-    INSTRUCTION_FLG(gen_excp, EXCP_BREAK),            /* break */
+    INSTRUCTION(gen_break),                           /* break */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(nop),                                 /* nop */
     INSTRUCTION_ILLEGAL(),
-- 
2.25.1


