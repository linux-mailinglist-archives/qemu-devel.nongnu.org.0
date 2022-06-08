Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44434542138
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:23:06 +0200 (CEST)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyo9p-0000bn-Cr
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6j-0006qG-AM
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:53 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6f-000226-LS
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:52 -0400
Received: by mail-pg1-x530.google.com with SMTP id c14so17866213pgu.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4FYTiyxhI0mE5fcTHb/1MDqV87uaAoIyMIlxrvf02Y=;
 b=uSPQluXp+bqLxAzJsPx+cQUOrlPNwijh5Xx7LVIyLivApw/KFTRSut8SQ2tp0GLEe9
 tPEa4T578KGHNb8aE9hoyI0Q4zOMoLeJAM6cYLQ/mB6jymPW50+blIsf4wsjrSOBTI8s
 Kn/Uw86bJCBIEXJuOPDrZdAzdvhfnfmYqPLihfmJdxXxVAfROP2Re6FoOusUtrI6yBAc
 P6ftvf/TGitxUJtF1EUSPH5ZtQWoUvqCjUIT05hZvi4I2HK+DZ8bA0TFcJnpkR0y4ZhX
 JCd0WJY2G3w++SqwrHXw+ElAyGlhEcCrEYHxOM7ReQJK7/Wc5kcENzZIW2XDy68H6/ia
 I5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4FYTiyxhI0mE5fcTHb/1MDqV87uaAoIyMIlxrvf02Y=;
 b=sWkLsJc0QKdg3f/SLOu2cB4/uvrPRgsjYDeXjlXJxYmbd0MLR/F+U/LqZm5tqid0xg
 tpnydze/3MN3Ml3PqjSeptfxSdHaAoG4Z4PHgSePjIF9+PgTP4XLNxKPPIe30WqqH2Hk
 2oSbWqP9fiUIovlXgtY3+AOMheSCsairGPE7L4KGkKHrw7rW1CmubfhhdXJwwW1ea8qN
 TWHn2v71hAL4vzCEZkad05uPOsnj2EeIk8lk0/zJwHy4Nf2GiSdG8+Bu13WRsSoiCLH+
 CitAW5ACsvNepBDwYDKWhzRxaBJvXEc3ONFaFNuIbC0yl7QWW+ampZHFymgJF71M+7B9
 I3Xw==
X-Gm-Message-State: AOAM532ToHniMxvqyQTvzrj+EA+q2P75vbzSqD10t5UzrdaybiVnQYqE
 bdOjjw8xcEs6ebnU04RxQpa31KD92B7Akg==
X-Google-Smtp-Source: ABdhPJy1IyKOetUInrg30H/U8yDHHgMbUnlUoQeANvmRithz6rW2C+uLUlz037Fxza3MU6HZ3JB3kQ==
X-Received: by 2002:a63:91c2:0:b0:3fc:bcef:5681 with SMTP id
 l185-20020a6391c2000000b003fcbcef5681mr29306415pge.236.1654665587965; 
 Tue, 07 Jun 2022 22:19:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 01/11] target/mips: Use an exception for semihosting
Date: Tue,  7 Jun 2022 22:19:35 -0700
Message-Id: <20220608051945.802339-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 5335ac10a3..f56a5a95c4 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1251,8 +1251,9 @@ enum {
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
index 6de5b66650..e554b3adcc 100644
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
index 916cece4d2..5b0e4683a7 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3691,7 +3691,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
             case NM_SDBBP:
                 if (is_uhi(extract32(ctx->opcode, 0, 19))) {
-                    gen_helper_do_semihosting(cpu_env);
+                    generate_exception_end(ctx, EXCP_SEMIHOST);
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
                         gen_reserved_instruction(ctx);
@@ -4609,7 +4609,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
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


