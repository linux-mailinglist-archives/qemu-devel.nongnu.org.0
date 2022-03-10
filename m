Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB64D465A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:58:29 +0100 (CET)
Received: from localhost ([::1]:43338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHR5-0003FX-R9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxT-0005fI-Jb
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:51 -0500
Received: from [2607:f8b0:4864:20::102f] (port=34508
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxR-0007yn-UL
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:51 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so6092114pjd.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62d8othJIfgAKm86Avncs/clZTnNTHcuD30Oj5z4NnM=;
 b=Js6I3+tl4MgfPZk/1FQAe90hI3aIBtY49Q94ebm322DRaLmAJ9Ksyvtr7dURWTgy1P
 ARrvEyba6AnWjQYuBuvyUzJISjkldJE+69zTgZxCX7bbmlGTwo+XVGhEtL89OJ2stAU2
 7fp6u5vcAzDSBG0Uv6aBjSlamlT0BqBxWJGH2vImsMfbqKzVOp6s/2Js7u5OBzk4wlBO
 tf9Nqqs3wkCK75/xHbfK9sr8ec7+ZJBUwVXfBVmMDM9ZQS2/Kcb7UJIZaQ4+an0j1DYD
 wTjPl3pUeyBS8bWTalptZPBFtF2Attf2deUY28E8Wrp9g5zId1C0TcEaerCnd9R9hrVj
 +z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62d8othJIfgAKm86Avncs/clZTnNTHcuD30Oj5z4NnM=;
 b=0t5SB9rqR+9n8DeFJc8ODFm11ZcPeekge2UXgPcLeV4kMLfcvwuWEVShRmtrodQRen
 mUzfepf1fWUNY0msKxaO/Hjk185E0UslC7vPODt/PhHrkCA/DMhjNdh53bxZyLNjXacE
 sQ7W6QY66fspZHohqFx/d4+ATFoPcK5nh+9Zr5hNRDIu8NmbEGz91GZbzmSCaISPiJS5
 BQU3q8FFueNUtBEbAK63TBtGIXAHzEcE+VHobFyJTSwit3entJOflC+mvXLJE0dR/kcL
 nYWHw9BOzwdcTg6p9FN98XhzlgG0Dje1lmc64A8mlNj4hUnUvBmTYvscu8j0gzTpZ6sb
 DDpw==
X-Gm-Message-State: AOAM531uuOBK4KNelF9A6EZsBcRFVFIk8ZaUU6aZeD6awhIvDcd6XWA6
 9kW/WlStRI+DifkAl4rihadz2hYq/37o7g==
X-Google-Smtp-Source: ABdhPJxfyUGewrisVsG08Wua8yFmDrqGeaGDBtenTYIPePJZmMC4pJraq7UWX3/tiz3Tthn2Wzza9w==
X-Received: by 2002:a17:902:c40a:b0:151:a792:71f2 with SMTP id
 k10-20020a170902c40a00b00151a79271f2mr4631360plk.36.1646911668699; 
 Thu, 10 Mar 2022 03:27:48 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/48] target/nios2: Create EXCP_SEMIHOST for semi-hosting
Date: Thu, 10 Mar 2022 03:26:57 -0800
Message-Id: <20220310112725.570053-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
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


