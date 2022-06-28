Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4EE55BEE3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:58:05 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Ai-0003r8-8K
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jy-0002Wt-66
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:30 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jw-0000aS-7i
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:29 -0400
Received: by mail-pg1-x533.google.com with SMTP id z14so11125743pgh.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zI9/tIpkmxJGD6rfujxQ9XUlmWHuHJ+RJ3gAxf5iixM=;
 b=vanwxbLFKRpsdet/imh7WUq/fQYzriL9H8R3L0p0K0SIx5uUWZ4rarptLnT7yYLNFS
 7hK6sZBfbLtKvUoVQ3FC/d62MERN32l0HDurJtb+jjAb9ad148yuPYIacTquM7X6L3Wh
 yCPRcMYDlf1x1qtkwzu3P3HITIDGQffe0nwU+3JnIJenhtUyYjNoMSwCF3S0qsBoariW
 5OSgUtfy3j7IxB+NNSzKKNEi35jei4J7GRzFJjOTHrKp22Lva9Hy6zfMpc6roeN4cZPI
 0vK5SQxR4NrzP7ovGsb8HMsjLG3qOORN+cVs7cnvYs3xHWIIMA9k6A0HunAvLS+VYJ7T
 BKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zI9/tIpkmxJGD6rfujxQ9XUlmWHuHJ+RJ3gAxf5iixM=;
 b=CRJhKaCkJEfBUJ0CYrU4HHstB8B8oXJHeTYEuogzNY5PqQ/71J5b0kfhju5kvkMsnR
 D28e+t86tMfkSQZ+FLQmpYUqZvoPdTnX3A6vAGyGUbw3kpvmlsOtlnfGiPZ3xvaA6CbX
 +/D+nvzrxT9t2BKOLTJCaZPqX68dN2w0SgZQOhu+SmHvjhjp8NisQyKqx+8O1ckOr4TO
 hBtnyi84ovaqDu15N7Ev/P+2XH33SKzYl2rnm+cu+09xPvRfJS6GFle/roOVhklv6gKZ
 fAE5QcnxDjdFPqXbAktCWPJTslqBeal4mFJNuskTZuUuAbz1J6Mn4upL8hRcj1CA2Vrw
 L/9Q==
X-Gm-Message-State: AJIora/9lSGtNfOrMX1JwDxwtXscmfjda1w78OY/KK4dDFTrbsvWIQYH
 z1t0n4WT3LpWUEOKUBzKLWSQnLUGHuaaCw==
X-Google-Smtp-Source: AGRyM1vXCGLj9vosTyg8tcjNct16tVuds38Cahw1Uoy7BunaFAIC1woWYpueOLllqP8wMlIpywvGmQ==
X-Received: by 2002:a62:1444:0:b0:525:254d:14ce with SMTP id
 65-20020a621444000000b00525254d14cemr1613861pfu.58.1656392366915; 
 Mon, 27 Jun 2022 21:59:26 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 56/60] target/mips: Use an exception for semihosting
Date: Tue, 28 Jun 2022 10:23:59 +0530
Message-Id: <20220628045403.508716-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu.h                         |  3 ++-
 target/mips/tcg/tcg-internal.h            |  2 ++
 target/mips/tcg/sysemu_helper.h.inc       |  2 --
 target/mips/tcg/exception.c               |  1 +
 target/mips/tcg/sysemu/mips-semi.c        |  4 ++--
 target/mips/tcg/sysemu/tlb_helper.c       |  4 ++++
 target/mips/tcg/translate.c               | 12 ++----------
 target/mips/tcg/micromips_translate.c.inc |  6 +++---
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
 10 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 42efa989e4..0a085643a3 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1252,8 +1252,9 @@ enum {
     EXCP_MSAFPE,
     EXCP_TLBXI,
     EXCP_TLBRI,
+    EXCP_SEMIHOST,
 
-    EXCP_LAST = EXCP_TLBRI,
+    EXCP_LAST = EXCP_SEMIHOST,
 };
 
 /*
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 993720b00c..1d27fa2ff9 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -62,6 +62,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 
+void mips_semihosting(CPUMIPSState *env);
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif
diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
index 4353a966f9..af585b5d9c 100644
--- a/target/mips/tcg/sysemu_helper.h.inc
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -9,8 +9,6 @@
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
 
-DEF_HELPER_1(do_semihosting, void, env)
-
 /* CP0 helpers */
 DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
 DEF_HELPER_1(mfc0_mvpconf0, tl, env)
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 0b21e0872b..2bd77a61de 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -125,6 +125,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_TLBRI] = "TLB read-inhibit",
     [EXCP_MSADIS] = "MSA disabled",
     [EXCP_MSAFPE] = "MSA floating point",
+    [EXCP_SEMIHOST] = "Semihosting",
 };
 
 const char *mips_exception_name(int32_t exception)
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 6d6296e709..ac12c802a3 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -20,10 +20,10 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/log.h"
-#include "exec/helper-proto.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
+#include "internal.h"
 
 typedef enum UHIOp {
     UHI_exit = 1,
@@ -238,7 +238,7 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
         unlock_user(p, gpr, 0);                 \
     } while (0)
 
-void helper_do_semihosting(CPUMIPSState *env)
+void mips_semihosting(CPUMIPSState *env)
 {
     target_ulong *gpr = env->active_tc.gpr;
     const UHIOp op = gpr[25];
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 73254d1929..57ffad2902 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -1053,6 +1053,10 @@ void mips_cpu_do_interrupt(CPUState *cs)
     }
     offset = 0x180;
     switch (cs->exception_index) {
+    case EXCP_SEMIHOST:
+        cs->exception_index = EXCP_NONE;
+        mips_semihosting(env);
+        return;
     case EXCP_DSS:
         env->CP0_Debug |= 1 << CP0DB_DSS;
         /*
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5f460fb687..d9d7692765 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12094,14 +12094,6 @@ static inline bool is_uhi(int sdbbp_code)
 #endif
 }
 
-#ifdef CONFIG_USER_ONLY
-/* The above should dead-code away any calls to this..*/
-static inline void gen_helper_do_semihosting(void *env)
-{
-    g_assert_not_reached();
-}
-#endif
-
 void gen_ldxs(DisasContext *ctx, int base, int index, int rd)
 {
     TCGv t0 = tcg_temp_new();
@@ -13910,7 +13902,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         break;
     case R6_OPC_SDBBP:
         if (is_uhi(extract32(ctx->opcode, 6, 20))) {
-            gen_helper_do_semihosting(cpu_env);
+            generate_exception_end(ctx, EXCP_SEMIHOST);
         } else {
             if (ctx->hflags & MIPS_HFLAG_SBRI) {
                 gen_reserved_instruction(ctx);
@@ -14322,7 +14314,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_SDBBP:
         if (is_uhi(extract32(ctx->opcode, 6, 20))) {
-            gen_helper_do_semihosting(cpu_env);
+            generate_exception_end(ctx, EXCP_SEMIHOST);
         } else {
             /*
              * XXX: not clear which exception should be raised
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index fc6ede75b8..274caf2c3c 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -826,7 +826,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         break;
     case SDBBP16:
         if (is_uhi(extract32(ctx->opcode, 0, 4))) {
-            gen_helper_do_semihosting(cpu_env);
+            generate_exception_end(ctx, EXCP_SEMIHOST);
         } else {
             /*
              * XXX: not clear which exception should be raised
@@ -942,7 +942,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
         case R6_SDBBP16:
             /* SDBBP16 */
             if (is_uhi(extract32(ctx->opcode, 6, 4))) {
-                gen_helper_do_semihosting(cpu_env);
+                generate_exception_end(ctx, EXCP_SEMIHOST);
             } else {
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
                     generate_exception(ctx, EXCP_RI);
@@ -1311,7 +1311,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             break;
         case SDBBP:
             if (is_uhi(extract32(ctx->opcode, 16, 10))) {
-                gen_helper_do_semihosting(cpu_env);
+                generate_exception_end(ctx, EXCP_SEMIHOST);
             } else {
                 check_insn(ctx, ISA_MIPS_R1);
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index f57e0a5f2a..0a3ba252e4 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -952,7 +952,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
             break;
         case RR_SDBBP:
             if (is_uhi(extract32(ctx->opcode, 5, 6))) {
-                gen_helper_do_semihosting(cpu_env);
+                generate_exception_end(ctx, EXCP_SEMIHOST);
             } else {
                 /*
                  * XXX: not clear which exception should be raised
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index c0ba2bf1b1..ecb0ebed57 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3695,7 +3695,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
             case NM_SDBBP:
                 if (is_uhi(extract32(ctx->opcode, 0, 19))) {
-                    gen_helper_do_semihosting(cpu_env);
+                    generate_exception_end(ctx, EXCP_SEMIHOST);
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
                         gen_reserved_instruction(ctx);
@@ -4634,7 +4634,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
                 break;
             case NM_SDBBP16:
                 if (is_uhi(extract32(ctx->opcode, 0, 3))) {
-                    gen_helper_do_semihosting(cpu_env);
+                    generate_exception_end(ctx, EXCP_SEMIHOST);
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
                         gen_reserved_instruction(ctx);
-- 
2.34.1


