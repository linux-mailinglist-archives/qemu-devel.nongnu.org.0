Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4855B896A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:47:16 +0200 (CEST)
Received: from localhost ([::1]:45746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSjT-0001JV-2t
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMM-00085K-PR
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMK-0000bQ-Mh
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso11509325wmr.3
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PXOhY/GLE5ushsuwq2usxIkhOBcQf53LWE9OWb978Zw=;
 b=v6z0wlGt0YEhK/ryaJgZNhWUPE3Ocs6fb53TvoXRubDYNLxIVvsYj1pHyLoBQTbtFq
 8gVtPfxfKt6PCBcDDUhP+Lc87Vz/17S+y45OoekKns9afN6DdzyMHfOHo0XaPGH9SvlD
 3jWFoQKJkJ2z80Rw3TDEAyVB5tHu2A5JNIKRh9RN0YgWjsPx59CByE/Wm6kNJ+4Zxmwt
 g53955GOAwLKHcyaxQAh1+5XWA8vL39tjISXYt0WQsu1SxOkTIau57REBST/aX4yc4M4
 Ll8HiM8ldyWXm28fJ2g8D12x+hMpSeIuBqiHNv0SRblZmmXjA2bqYjwUJW+jgd5+/oN6
 Ysww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PXOhY/GLE5ushsuwq2usxIkhOBcQf53LWE9OWb978Zw=;
 b=7bBv+I7cFXLl/SAufUpXCB0RlWXR/g5hu9xxYNGd5XcAZYg3fhgFzCH002y6x+fVT4
 eTJTgBiD5swBZKFhek9P+oQXvY3AtSZegkQ1K52pMFqV9H5dZx8SkpCAe5/i2ZfPe93o
 fmNedy+YR2QCstB77jiTUeg8+rdnlWcsxzRUZDuPfHetWeubkVdr29ganda0oQ9nS/Qk
 xYH0xIfBXkWw3wUDz7kxyg91PSrCEcSne4CZ1XCVPrMBGJeGj/KUh2parUzM0h0s/vk+
 b3Wk/xIa6ueCk2wALtRL4bhuPPK1Rq2rOPWaKAgHLuMKPpywGyT7/Zrzaf+z+z6izcWX
 GS4Q==
X-Gm-Message-State: ACgBeo2xOhRsaeQrTRb1X5zuiLGed22bkE1qzhuiuXl5Qc6RyEoQVE2y
 ShavSBs58FKfPx5DazK/7V9mPdpsp2VItEqs
X-Google-Smtp-Source: AA6agR4cvwsqKxb6d+fbxqWzOARFxHnu2CutyxO/m5flDCQMa8RFPaZJV2uU0o4PeC2S0fhg/sNLRA==
X-Received: by 2002:a1c:7905:0:b0:3b3:3fa9:4c3a with SMTP id
 l5-20020a1c7905000000b003b33fa94c3amr3211504wme.55.1663161797762; 
 Wed, 14 Sep 2022 06:23:17 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/11] target/mips: Honour -semihosting-config userspace=on
Date: Wed, 14 Sep 2022 14:23:05 +0100
Message-Id: <20220914132308.118495-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

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
Message-Id: <20220822141230.3658237-5-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c               | 9 +++++----
 target/mips/tcg/micromips_translate.c.inc | 6 +++---
 target/mips/tcg/mips16e_translate.c.inc   | 2 +-
 target/mips/tcg/nanomips_translate.c.inc  | 4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 0d936e2648..c3f92ea652 100644
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
index b2c696f891..632895cc9e 100644
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
index 7568933e23..918b15d55c 100644
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
index b3aff22c18..812c111e3c 100644
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
2.34.1


