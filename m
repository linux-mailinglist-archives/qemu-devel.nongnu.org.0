Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBC588542
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 03:05:12 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ2ox-00035F-Co
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 21:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJ2jH-00078v-UW
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 20:59:19 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJ2jF-0008Tr-4N
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 20:59:19 -0400
Received: by mail-pf1-x42e.google.com with SMTP id u133so8439184pfc.10
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 17:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3Vk+8L5ct4r9P4DpeGXi6LT6Ln4UWmzrljauRCzD0E=;
 b=G1P0W71FD7J3c0IGkqjPj2bVg6/7LrZBnwknIMKHp6Pz39DXjY4xXGTgg+wQiaOVSy
 wkO9KRp3LjF7osJDDLxPdhuvU+/BJTNtZ2s9dbNuRnYtp7NvTno7gfFxSM21CDxgsNh5
 qVT3Y2qFCYOmSVGjV06HMovv2/hTIJV3CEbjIcy6zbKL+tff0eRCb55C0rcrnFuTzdv1
 BmbB0pYeKdIjDSCV2GSZlVpAfQigfNRpbmPAen9UXKRJzeU8SO7JElo92ye0BFG+PlOw
 8oYrkNX0t72nMYjcnAh7yAs8THFbcvCxooJpOTQDe065XZh3SN0nh3pDRpjwVEwaiaHb
 uBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3Vk+8L5ct4r9P4DpeGXi6LT6Ln4UWmzrljauRCzD0E=;
 b=6Uy51qtxG10SCCA7HyyIbz2MBBuGOBRXPpvqUcV8udNJKoXLdSLIu1wyJzczT9yWPj
 USCWqz68+E20+sCjjpxWsLb1AkXZBTqyucCYRprXS1B83eePB3WygfXxt5RUQKEf+qHf
 HB59QzAOgnQtNnkixOwWWMGBLarosQ1EEAjDT3gx30it0Y91oJOxjp1Vz0xYmCMaehgz
 PxlfIZhiI51X5PyR5wXGdBqXuyymwnowVUtKiJVfrNRk8doIHlU24GV/AdwPL8Zj7vo4
 V+0SOyzugcI+nXQBl6y0HyZjvCcuXtOjAR+tyggL2oKkuUGEUD6ouzXxJBgtnYGU65/o
 +7cQ==
X-Gm-Message-State: ACgBeo2fU3Zd4wZNeQqwrR6GKAVdXLY083SYykieGeb2x0FV7gjLjJzn
 7HVG96sxP8DWZBF+lRKAeAt58Hbg83wwV5wF
X-Google-Smtp-Source: AA6agR5WkhFHa6xbEcOr+XyXiKH/2Fprln11n3d74ELg5M1CvBWuiaYFy/DxvlfUNxjwESK6hM2Yyg==
X-Received: by 2002:aa7:96d5:0:b0:52e:e2a:9c79 with SMTP id
 h21-20020aa796d5000000b0052e0e2a9c79mr2409453pfq.55.1659488355612; 
 Tue, 02 Aug 2022 17:59:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:5d51:f79f:db32:93ed])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a17090aa59000b001f303d149casm142698pjq.50.2022.08.02.17.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 17:59:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 1/1] target/mips: Advance pc after semihosting exception
Date: Tue,  2 Aug 2022 17:59:12 -0700
Message-Id: <20220803005912.1593116-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803005912.1593116-1-richard.henderson@linaro.org>
References: <20220803005912.1593116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


