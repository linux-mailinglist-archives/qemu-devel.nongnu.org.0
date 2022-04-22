Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BA50BEBF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:34:30 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxAr-0005iZ-Rd
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXK-0001oc-OY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:38 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXJ-0007LX-0N
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:38 -0400
Received: by mail-pf1-x42d.google.com with SMTP id w16so2092062pfj.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGG1SeKnuAT2QHCjae7Ts/IpHjmxbOVPlNo/xG2utBk=;
 b=qUL4PHVKlqreIu+XbMad15hxLNnu9c8guTSdIyU6GEOg2pc/hMBzrKTkmJ3YYvVHLi
 uXqeiXMhX9iZuSrMhc/NztiZzyKKEAL1QQifoPVpd17WQ25SL6leFar6OdGhfIA2sIZq
 67fDBHZsfMv2V5SqoCS5/RFYAxzoofFuTBRF3XRNN5IlNe114O/A0X8bABUMYsHQpE6o
 YBbVmbHUN+miDaqkJuP0esl0Ui45XQRZUI6a7Rl1SwnD8wkuEsK5RexczhSjwa81X02z
 K8tSNS8moAva4EbNg50RrvpIAvKK+ZosUu3skwm6i92JS1PmLJPIE4BV2/arQyulWe4a
 vIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JGG1SeKnuAT2QHCjae7Ts/IpHjmxbOVPlNo/xG2utBk=;
 b=ti9Ebrbo/3fvLu2T/FEOQU/YunldPC7FuA2U6SzPhh7H0pHWislgnCIiU/USC/HSod
 ZL5XyhO6J2I8gw2jjwfrB2SL0VOvCRVQ+uSPQPdaxGYtg/PaXkDdxjZRFc4ibcexSGto
 atNpbdRnoBI2MIcKYQMo/veU3K2jjMhJxuMSdqseiFaiB1E1L4OS7LbleOq4Y7227AK+
 xpK1I+bftIQsrBMKZXYuqC9m5I8Mr4Lf6zuG2RCtIdGPUkm1AqTPwhnfVdpgToVb79MI
 U68599I51LUqnDot/fAvRC1bZ4r1tEKsVtVqk5zYykDA9favJ5gSxSA1oM5NrE2XjkYF
 3zvw==
X-Gm-Message-State: AOAM531XQ4YTZ4VGGKc8j8TmzaYMIO/eT6NyjICadoOo+LVUVl/rActy
 UrdepHePPrm97/AB9i8XNdlUrd5LuXuKkzr8
X-Google-Smtp-Source: ABdhPJzczfV6H/lL+r+4i4hs4afyKOZlkozUjBw2Q2c84uo0Kx7T57SrnKbOqHHI7gxxxnuRVkQOeQ==
X-Received: by 2002:a05:6a00:1895:b0:50a:6a91:e833 with SMTP id
 x21-20020a056a00189500b0050a6a91e833mr5956810pfh.26.1650646415694; 
 Fri, 22 Apr 2022 09:53:35 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 31/68] target/nios2: Create EXCP_SEMIHOST for semi-hosting
Date: Fri, 22 Apr 2022 09:52:01 -0700
Message-Id: <20220422165238.1971496-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Decode 'break 1' during translation, rather than doing
it again during exception processing.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-32-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/helper.c    | 14 ++++++--------
 target/nios2/translate.c | 17 ++++++++++++++++-
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 65bcc5fc0e..01cead5502 100644
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
index a56aaaea18..1d17c0379f 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -152,14 +152,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
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
@@ -176,6 +168,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
index 4191db1342..97e531529f 100644
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
2.34.1


