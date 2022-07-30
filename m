Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8F5857F2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 04:20:41 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHc5n-0001Dn-7R
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 22:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHc42-0007kl-21
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 22:18:50 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHc3z-00059v-Vs
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 22:18:49 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w7so6016957ply.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 19:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDAEcUVEaruQzkftBq+yBlNlckh2s7j28um9NsHYXpE=;
 b=fUqGuw8I59QsY59tnhhTDCYJOhSrxuai+T2fZNsKZLYLkQ3h20xqqCBumhQhfQNLS6
 UgtQ/Y3neXvPdLgifTh8rYapfWSHCKbfP3P91ZHCba9rg+jTh5jUqCo8hvjsac+fKjuH
 zJz5fVr9rC0k9wcokazq5ZCXEFt728wU8iZLbkxT3Nd6KKo8ps7xOYPqIQuoil6Z5MOt
 i5TpV3Nxjlug4UF93Ry5mDV6rQckRLZ1O2mMpx7G1e5Z1z1w2EkWoLUJODfH5x6WXePb
 wpQ/amhjJPgFwSdFTjTzzAdHlwuJJSNfkRLviqcx0n0uPXx7DeWduCmuxgVvUtarJw/9
 /LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KDAEcUVEaruQzkftBq+yBlNlckh2s7j28um9NsHYXpE=;
 b=Mpje3lfV1Mb1eMDthTtgv0a059Hgu3t69LSDyEoOHFG5rqt2D83sKHcZ+rygF+EPSa
 lgpJza5NK/20Lnm3exQ/MQY4ubtkb3oxEPNLx7S8xVWBYTAeZ08oNuchiCOyl76Hbe+G
 RkXwFL/lKcxeEAnyTIpPrvbc9M4c4vc+G5t5UrrTmqL2m2mwH5+p+Pr7PApvW/O/JWv0
 2L4+TobXA4351B59fJEU6PEtpwoTAYfdqm4gPiy2A0PWMZWS5gFrzb3uJ8N49TeScrSH
 2zCbF7KPQJpgHnCrJC4OVglme3Ivkbz3i4kARmdp2efV87Okdn0qRfZfRTkrNS3uZq4f
 bFOw==
X-Gm-Message-State: ACgBeo2WGM6kdTeKv/7DK5eEpU7v+tZrBjK5gj+mVo5N4ZOuMLu8zRC0
 A8tYsJenwJUaCwMtStZnVKQxdU3jzY9yRQ==
X-Google-Smtp-Source: AA6agR7SjrsQMJPnyD83//tl7TG+iZ3WhLzFyB/Ce8jbHvfYlZRxRbvBuTa1Lw9yleuBB2b8YrqRaA==
X-Received: by 2002:a17:90b:3c8c:b0:1f2:205c:2480 with SMTP id
 pv12-20020a17090b3c8c00b001f2205c2480mr7926448pjb.54.1659147526117; 
 Fri, 29 Jul 2022 19:18:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 x22-20020aa79416000000b0052c02d8c65asm3548292pfo.123.2022.07.29.19.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 19:18:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH] target/mips: Advance pc after semihosting exception
Date: Fri, 29 Jul 2022 19:18:44 -0700
Message-Id: <20220730021844.124503-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Delay generating the exception until after we know the
insn length, and record that length in env->error_code.

Fixes: 8ec7e3c53d4 ("target/mips: Use an exception for semihosting")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1126
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.h               |  4 ++++
 target/mips/tcg/sysemu/tlb_helper.c       |  1 +
 target/mips/tcg/translate.c               | 10 +++++-----
 target/mips/tcg/micromips_translate.c.inc |  6 +++---
 target/mips/tcg/mips16e_translate.c.inc   |  2 +-
 target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
 6 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 55053226ae..69f85841d2 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -51,6 +51,10 @@ typedef struct DisasContext {
     int gi;
 } DisasContext;
 
+#define DISAS_STOP       DISAS_TARGET_0
+#define DISAS_EXIT       DISAS_TARGET_1
+#define DISAS_SEMIHOST   DISAS_TARGET_2
+
 /* MIPS major opcodes */
 #define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
 
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 57ffad2902..9d16859c0a 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -1056,6 +1056,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
     case EXCP_SEMIHOST:
         cs->exception_index = EXCP_NONE;
         mips_semihosting(env);
+        env->active_tc.PC += env->error_code;
         return;
     case EXCP_DSS:
         env->CP0_Debug |= 1 << CP0DB_DSS;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 1f6a779808..de1511baaf 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1213,9 +1213,6 @@ TCGv_i64 fpu_f64[32];
 
 #include "exec/gen-icount.h"
 
-#define DISAS_STOP       DISAS_TARGET_0
-#define DISAS_EXIT       DISAS_TARGET_1
-
 static const char regnames_HI[][4] = {
     "HI0", "HI1", "HI2", "HI3",
 };
@@ -13902,7 +13899,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         break;
     case R6_OPC_SDBBP:
         if (is_uhi(extract32(ctx->opcode, 6, 20))) {
-            generate_exception_end(ctx, EXCP_SEMIHOST);
+            ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             if (ctx->hflags & MIPS_HFLAG_SBRI) {
                 gen_reserved_instruction(ctx);
@@ -14314,7 +14311,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_SDBBP:
         if (is_uhi(extract32(ctx->opcode, 6, 20))) {
-            generate_exception_end(ctx, EXCP_SEMIHOST);
+            ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             /*
              * XXX: not clear which exception should be raised
@@ -16098,6 +16095,9 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (is_slot) {
         gen_branch(ctx, insn_bytes);
     }
+    if (ctx->base.is_jmp == DISAS_SEMIHOST) {
+        generate_exception_err(ctx, EXCP_SEMIHOST, insn_bytes);
+    }
     ctx->base.pc_next += insn_bytes;
 
     if (ctx->base.is_jmp != DISAS_NEXT) {
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index 274caf2c3c..b2c696f891 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -826,7 +826,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         break;
     case SDBBP16:
         if (is_uhi(extract32(ctx->opcode, 0, 4))) {
-            generate_exception_end(ctx, EXCP_SEMIHOST);
+            ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             /*
              * XXX: not clear which exception should be raised
@@ -942,7 +942,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
         case R6_SDBBP16:
             /* SDBBP16 */
             if (is_uhi(extract32(ctx->opcode, 6, 4))) {
-                generate_exception_end(ctx, EXCP_SEMIHOST);
+                ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
                     generate_exception(ctx, EXCP_RI);
@@ -1311,7 +1311,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             break;
         case SDBBP:
             if (is_uhi(extract32(ctx->opcode, 16, 10))) {
-                generate_exception_end(ctx, EXCP_SEMIHOST);
+                ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 check_insn(ctx, ISA_MIPS_R1);
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 0a3ba252e4..7568933e23 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -952,7 +952,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
             break;
         case RR_SDBBP:
             if (is_uhi(extract32(ctx->opcode, 5, 6))) {
-                generate_exception_end(ctx, EXCP_SEMIHOST);
+                ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 /*
                  * XXX: not clear which exception should be raised
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index ecb0ebed57..b3aff22c18 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3695,7 +3695,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
             case NM_SDBBP:
                 if (is_uhi(extract32(ctx->opcode, 0, 19))) {
-                    generate_exception_end(ctx, EXCP_SEMIHOST);
+                    ctx->base.is_jmp = DISAS_SEMIHOST;
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
                         gen_reserved_instruction(ctx);
@@ -4634,7 +4634,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
                 break;
             case NM_SDBBP16:
                 if (is_uhi(extract32(ctx->opcode, 0, 3))) {
-                    generate_exception_end(ctx, EXCP_SEMIHOST);
+                    ctx->base.is_jmp = DISAS_SEMIHOST;
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
                         gen_reserved_instruction(ctx);
-- 
2.34.1


