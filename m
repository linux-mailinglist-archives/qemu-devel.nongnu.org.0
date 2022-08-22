Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED859C5BC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:07:43 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBps-00020t-VM
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ9lF-0002wa-6q
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:54:45 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ9lD-0005RY-E3
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:54:44 -0400
Received: by mail-lj1-x22c.google.com with SMTP id l19so7882153ljg.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ix5ZX0LyxSe0lq8009+k3P93c+marBxWgKkCfMS6XO4=;
 b=xqhSh/J3Amp77yha/WEPgppTr2wvu7XP+/4bmW5/gwS59Egc1iMpjHs5yd2/Ld/w5m
 tiG1aEIR1QCCmfdxX6keRnTd8nSY4BVJ8pd8TqUza4XGubOjSEAwgVKF2Szw3gUYy221
 y8xUFR5KRtOjCGfucQYsJ4nWMY3turIQNHTLl/WalI7DYEPtVpe7gTn+goXXs1yH3v28
 Pu13fbbOw4u/lXQP2zzNTgWlg4dqJ7f+SjZuREGv48W7KVV+c50PLGst/MB+mPMnr4fv
 98YZEQNiz1ZfEfSYUt6omnGhnAAoZvOrO1aHGqlTN0bCJiUpLbIYOGKwoU1ujBT3Z0jD
 phMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ix5ZX0LyxSe0lq8009+k3P93c+marBxWgKkCfMS6XO4=;
 b=y1R8qv5Es7MpSuQJi5OU1zS/RMYFt1P2qW8WdsgeyuoUhE66m/0zlhtQrPjAORunvg
 eqK4aY0S/9QsfTJtlZ+BoF/cYAp+dfcMqF9QDRXjVJMGFRcxuWLJwRh/lF9mNdZ6cO4Q
 BMrYyT1N2IzeB5ryc8Pxhsi5VBMvV36/x0XcGI6B3zvU40UUUT/MNZhM5NwBsKRChZTz
 UVsJjiAGA/3ujq1GaHSTcFPwKI5ft+09dTXi1eW6Ysu/NDPVG5qCI/gNgmNE9cK/dvnE
 Vw+ehHIsd1VV8jpFoBw4j3iPfx7vjEngICkIpKgUKOY5Vh9wU6xnaa06i2WU+6Y5JKeK
 KMZA==
X-Gm-Message-State: ACgBeo0ICVKzZMy5NVldgOXQHCPVtBtZB0hnzPdAbDlBaDnUTw6v7efv
 PTiL/kTX1/9wC0r0sUV/43w8A8DyMYWpyw==
X-Google-Smtp-Source: AA6agR6UK9CYRjLszL8RAgjPVk7Y0RdS71Gjr3bIgpITeVUWzLEJL8vgq6DrnVW5wy0ncYOldHuhbQ==
X-Received: by 2002:a5d:6b10:0:b0:21e:4bbd:e893 with SMTP id
 v16-20020a5d6b10000000b0021e4bbde893mr11085590wrw.613.1661177559213; 
 Mon, 22 Aug 2022 07:12:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 4/7] target/mips: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:27 +0100
Message-Id: <20220822141230.3658237-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

MIPS semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c               | 9 +++++----
 target/mips/tcg/micromips_translate.c.inc | 6 +++---
 target/mips/tcg/mips16e_translate.c.inc   | 2 +-
 target/mips/tcg/nanomips_translate.c.inc  | 4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index de1511baaf8..53886618ddd 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12082,12 +12082,13 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     tcg_temp_free_i32(t0);
 }
 
-static inline bool is_uhi(int sdbbp_code)
+static inline bool is_uhi(DisasContext *ctx, int sdbbp_code)
 {
 #ifdef CONFIG_USER_ONLY
     return false;
 #else
-    return semihosting_enabled() && sdbbp_code == 1;
+    bool is_user = (ctx->hflags & MIPS_HFLAG_KSU) == MIPS_HFLAG_UM;
+    return semihosting_enabled(is_user) && sdbbp_code == 1;
 #endif
 }
 
@@ -13898,7 +13899,7 @@ static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
         }
         break;
     case R6_OPC_SDBBP:
-        if (is_uhi(extract32(ctx->opcode, 6, 20))) {
+        if (is_uhi(ctx, extract32(ctx->opcode, 6, 20))) {
             ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             if (ctx->hflags & MIPS_HFLAG_SBRI) {
@@ -14310,7 +14311,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_cl(ctx, op1, rd, rs);
         break;
     case OPC_SDBBP:
-        if (is_uhi(extract32(ctx->opcode, 6, 20))) {
+        if (is_uhi(ctx, extract32(ctx->opcode, 6, 20))) {
             ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             /*
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index b2c696f8916..632895cc9ef 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -825,7 +825,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
         generate_exception_break(ctx, extract32(ctx->opcode, 0, 4));
         break;
     case SDBBP16:
-        if (is_uhi(extract32(ctx->opcode, 0, 4))) {
+        if (is_uhi(ctx, extract32(ctx->opcode, 0, 4))) {
             ctx->base.is_jmp = DISAS_SEMIHOST;
         } else {
             /*
@@ -941,7 +941,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
             break;
         case R6_SDBBP16:
             /* SDBBP16 */
-            if (is_uhi(extract32(ctx->opcode, 6, 4))) {
+            if (is_uhi(ctx, extract32(ctx->opcode, 6, 4))) {
                 ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
@@ -1310,7 +1310,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             generate_exception_end(ctx, EXCP_SYSCALL);
             break;
         case SDBBP:
-            if (is_uhi(extract32(ctx->opcode, 16, 10))) {
+            if (is_uhi(ctx, extract32(ctx->opcode, 16, 10))) {
                 ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 check_insn(ctx, ISA_MIPS_R1);
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 7568933e234..918b15d55ce 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -951,7 +951,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case RR_SDBBP:
-            if (is_uhi(extract32(ctx->opcode, 5, 6))) {
+            if (is_uhi(ctx, extract32(ctx->opcode, 5, 6))) {
                 ctx->base.is_jmp = DISAS_SEMIHOST;
             } else {
                 /*
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index b3aff22c189..812c111e3c3 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -3694,7 +3694,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                 generate_exception_end(ctx, EXCP_BREAK);
                 break;
             case NM_SDBBP:
-                if (is_uhi(extract32(ctx->opcode, 0, 19))) {
+                if (is_uhi(ctx, extract32(ctx->opcode, 0, 19))) {
                     ctx->base.is_jmp = DISAS_SEMIHOST;
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
@@ -4633,7 +4633,7 @@ static int decode_isa_nanomips(CPUMIPSState *env, DisasContext *ctx)
                 generate_exception_end(ctx, EXCP_BREAK);
                 break;
             case NM_SDBBP16:
-                if (is_uhi(extract32(ctx->opcode, 0, 3))) {
+                if (is_uhi(ctx, extract32(ctx->opcode, 0, 3))) {
                     ctx->base.is_jmp = DISAS_SEMIHOST;
                 } else {
                     if (ctx->hflags & MIPS_HFLAG_SBRI) {
-- 
2.25.1


